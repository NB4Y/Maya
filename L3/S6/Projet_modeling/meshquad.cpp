#include "meshquad.h"
#include "matrices.h"


void MeshQuad::clear()
{
    m_points.clear();
    m_quad_indices.clear();
    m_nb_ind_edges=0;
}

int MeshQuad::add_vertex(const Vec3& P)
{
    int result=m_nb_ind_edges;
    m_points.push_back(P);
    return result;
}


void MeshQuad::add_quad(int i1, int i2, int i3, int i4)
{
    m_quad_indices.push_back(i1);
    m_quad_indices.push_back(i2);
    m_quad_indices.push_back(i3);
    m_quad_indices.push_back(i4);
    m_nb_ind_edges+=4;
}

void MeshQuad::convert_quads_to_tris(const std::vector<int>& quads, std::vector<int>& tris)
{
	tris.clear();
	tris.reserve(3*quads.size()/2);
	// Pour chaque quad on genere 2 triangles
	// Attention a repecter l'orientation des triangles

    for (int i=0; i<quads.size();i+=4)
    {
        tris.push_back(quads[i]);
        tris.push_back(quads[i+1]);
        tris.push_back(quads[i+2]);
        tris.push_back(quads[i]);
        tris.push_back(quads[i+2]);
        tris.push_back(quads[i+3]);
    }
}

void MeshQuad::convert_quads_to_edges(const std::vector<int>& quads, std::vector<int>& edges)
{
    int e=0;
	edges.clear();
	edges.reserve(quads.size()); // ( *2 /2 !)
	// Pour chaque quad on genere 4 aretes, 1 arete = 2 indices.
	// Mais chaque arete est commune a 2 quads voisins !
	// Comment n'avoir qu'une seule fois chaque arete ?
    for (int i=0; i<quads.size();i+=4)
    {
        bool ok=true;
        for(int j=0; j<e && ok; j+=2)
        {
            if(((quads[i] == edges[j])&&(quads[i+1] == edges[j+1])) || ((quads[i] == edges[j+1])&&(quads[i+1] == edges[j])))
                ok=false;
        }
        if (ok)
        {
            edges[e]=quads[i];
            edges[e+1]=quads[i+1];
            e+=2;
        }
        ok=true;

        for(int j=0; j<e && ok; j+=2)
        {
            if(((quads[i+1] == edges[j])&&(quads[i+2] == edges[j+1])) || ((quads[i+1] == edges[j+1])&&(quads[i+2] == edges[j])))
                ok=false;
        }
        if (ok)
        {
            edges[e]=quads[i+1];
            edges[e+1]=quads[i+2];
            e+=2;
        }
        ok=true;

        for(int j=0; j<e && ok; j+=2)
        {
            if(((quads[i+2] == edges[j])&&(quads[i+3] == edges[j+1])) || ((quads[i+2] == edges[j+1])&&(quads[i+3] == edges[j])))
                ok=false;
        }
        if (ok)
        {
            edges[e]=quads[i+2];
            edges[e+1]=quads[i+3];
            e+=2;
        }
        ok=true;

        for(int j=0; j<e && ok; j+=2)
        {
            if(((quads[i+3] == edges[j])&&(quads[i] == edges[j+1])) || ((quads[i+3] == edges[j+1])&&(quads[i] == edges[j])))
                ok=false;
        }
        if (ok)
        {
            edges[e]=quads[i+3];
            edges[e+1]=quads[i];
            e+=2;
        }
        ok=true;
    }
}


void MeshQuad::bounding_sphere(Vec3& C, float& R)
{
	int minx=m_points[0].x;
	int maxx=m_points[0].x;
	int miny=m_points[0].y;
	int maxy=m_points[0].y;
	int minz=m_points[0].z;
	int minz=m_points[0].z;

	for (int i=1; i<m_points.size();i++)
	{
		if (m_points[i].x < minx)
			minx=m_points[i].x;
		if (m_points[i].x > maxx)
			maxx=m_points[i].x;
		if (m_points[i].y < miny)
			miny=m_points[i].y;
		if (m_points[i].y > maxy)
			maxy=m_points[i].y;
		if (m_points[i].z < minz)
			minz=m_points[i].z;
		if (m_points[i].z > maxz)
			maxz=m_points[i].z;
	}

	C= ( (maxx-minx/2), (maxy-miny/2), (maxz-minz/2));

	int maxdist= (maxx-minx)/2;
	if (maxdist < (maxy-miny)/2)
		maxdist= (maxy-miny)/2;
	if (maxdist < (maxz-minz)/2)
		maxdist= (maxz-minz)/2;

	R= maxdist;
}


void MeshQuad::create_cube()
{
	clear();
	// ajouter 8 sommets (-1 +1)
	add_vertex(new Vec3(1,1,1));0
	add_vertex(new Vec3(1,1,-1));1
	add_vertex(new Vec3(1,-1,-1));2
	add_vertex(new Vec3(1,-1,1));3
	add_vertex(new Vec3(-1,1,1));4
	add_vertex(new Vec3(-1,1,-1));5
	add_vertex(new Vec3(-1,-1,1));6
	add_vertex(new Vec3(-1,-1,-1));7

	// ajouter 6 faces (sens trigo)
	add_quad(3,2,1,0);
	add_quad(0,1,5,4);
	add_quad(1,2,7,5);
	add_quad(0,3,6,4);
	add_quad(7,6,3,2);
	add_quad(4,5,7,6);
	
	gl_update();
}

Vec3 MeshQuad::normal_of(const Vec3& A, const Vec3& B, const Vec3& C)
{
	// Attention a l'ordre des points !
	// le produit vectoriel n'est pas commutatif U ^ V = - V ^ U
	Vec3 AB = B-A;
	Vec3 AC = C-A;

	// ne pas oublier de normaliser le resultat.
	Vec3 N = glm::normalize(glm::cross(AB, AC));

	return N;
}

float area_of_quad(const Vec3& A, const Vec3& B, const Vec3& C, const Vec3& D)
{
	float AB = glm::length (B-A);
	float BC = glm::length (C-B);
	float CA = glm::length (A-C);
	float CD = glm::length (D-C);
	float DA = glm::length (A-D);

	//Aire Triangle ABC
	float P1=(AB+BC+CA)/2;
	float Aire1 = sqrt(P1*(P1-AB)*(P1-BC)*(P1-CA));


	//Aire Triangle ACD
	float P2=(DA+CD+CA)/2;
	float Aire2 = sqrt(P2*(P2-DA)*(P2-CD)*(P2-CA));

	//Somme des deux aires
	return (Aire1 + Aire2);
}

bool MeshQuad::is_points_in_quad(const Vec3& P, const Vec3& A, const Vec3& B, const Vec3& C, const Vec3& D)
{
	// On sait que P est dans le plan du quad.

	// P est-il au dessus des 4 plans contenant chacun la normale au quad et une arete AB/BC/CD/DA ?
	// si oui il est dans le quad

    return true;
}

bool MeshQuad::intersect_ray_quad(const Vec3& P, const Vec3& Dir, int q, Vec3& inter)
{
	// recuperation des indices de points
	// recuperation des points

	// calcul de l'equation du plan (N+d)

    // calcul de l'intersection rayon plan
	// I = P + alpha*Dir est dans le plan => calcul de alpha

	// alpha => calcul de I

	// I dans le quad ?

    return false;
}


int MeshQuad::intersected_closest(const Vec3& P, const Vec3& Dir)
{
	// on parcours tous les quads
	// on teste si il y a intersection avec le rayon
	// on garde le plus proche (de P)

	int inter = -1;

	return inter;
}


Mat4 MeshQuad::local_frame(int q)
{
	// Repere locale = Matrice de transfo avec
	// les trois premieres colones: X,Y,Z locaux
	// la derniere colonne l'origine du repere

	// ici Z = N et X = AB
	// Origine le centre de la face
	// longueur des axes : [AB]/2

	// recuperation des indices de points
	// recuperation des points

	// calcul de Z:N / X:AB -> Y

	// calcul du centre

	// calcul de la taille

	// calcul de la matrice

    return Mat4();
}

void MeshQuad::extrude_quad(int q)
{
	// recuperation des indices de points

	// recuperation des points

	// calcul de la normale

	// calcul de la hauteur

	// calcul et ajout des 4 nouveaux points

	// on remplace le quad initial par le quad du dessu

	// on ajoute les 4 quads des cotes

   gl_update();
}

void MeshQuad::transfo_quad(int q, const glm::mat4& tr)
{
	// recuperation des indices de points
	// recuperation des (references de) points

	// generation de la matrice de transfo globale:
	// indice utilisation de glm::inverse() et de local_frame

	// Application au 4 points du quad
}

void MeshQuad::decale_quad(int q, float d)
{

}

void MeshQuad::shrink_quad(int q, float s)
{

}

void MeshQuad::tourne_quad(int q, float a)
{

}





MeshQuad::MeshQuad():
	m_nb_ind_edges(0)
{}


void MeshQuad::gl_init()
{
	m_shader_flat = new ShaderProgramFlat();
	m_shader_color = new ShaderProgramColor();

	//VBO
	glGenBuffers(1, &m_vbo);

	//VAO
	glGenVertexArrays(1, &m_vao);
	glBindVertexArray(m_vao);
	glBindBuffer(GL_ARRAY_BUFFER, m_vbo);
	glEnableVertexAttribArray(m_shader_flat->idOfVertexAttribute);
	glVertexAttribPointer(m_shader_flat->idOfVertexAttribute, 3, GL_FLOAT, GL_FALSE, 0, 0);
	glBindVertexArray(0);

	glGenVertexArrays(1, &m_vao2);
	glBindVertexArray(m_vao2);
	glBindBuffer(GL_ARRAY_BUFFER, m_vbo);
	glEnableVertexAttribArray(m_shader_color->idOfVertexAttribute);
	glVertexAttribPointer(m_shader_color->idOfVertexAttribute, 3, GL_FLOAT, GL_FALSE, 0, 0);
	glBindVertexArray(0);

	//EBO indices
	glGenBuffers(1, &m_ebo);
	glGenBuffers(1, &m_ebo2);
}

void MeshQuad::gl_update()
{
	//VBO
	glBindBuffer(GL_ARRAY_BUFFER, m_vbo);
	glBufferData(GL_ARRAY_BUFFER, 3 * m_points.size() * sizeof(GLfloat), &(m_points[0][0]), GL_STATIC_DRAW);
	glBindBuffer(GL_ARRAY_BUFFER, 0);

	std::vector<int> tri_indices;
	convert_quads_to_tris(m_quad_indices,tri_indices);

	//EBO indices
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, m_ebo);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER,tri_indices.size() * sizeof(int), &(tri_indices[0]), GL_STATIC_DRAW);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

	std::vector<int> edge_indices;
	convert_quads_to_edges(m_quad_indices,edge_indices);
	m_nb_ind_edges = edge_indices.size();

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, m_ebo2);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER,m_nb_ind_edges * sizeof(int), &(edge_indices[0]), GL_STATIC_DRAW);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
}



void MeshQuad::set_matrices(const Mat4& view, const Mat4& projection)
{
	viewMatrix = view;
	projectionMatrix = projection;
}

void MeshQuad::draw(const Vec3& color)
{
	glEnable(GL_CULL_FACE);
	glEnable(GL_POLYGON_OFFSET_FILL);
	glPolygonOffset(1.0f, 1.0f);

	m_shader_flat->startUseProgram();
	m_shader_flat->sendViewMatrix(viewMatrix);
	m_shader_flat->sendProjectionMatrix(projectionMatrix);
	glUniform3fv(m_shader_flat->idOfColorUniform, 1, glm::value_ptr(color));
	glBindVertexArray(m_vao);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,m_ebo);
	glDrawElements(GL_TRIANGLES, 3*m_quad_indices.size()/2,GL_UNSIGNED_INT,0);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,0);
	glBindVertexArray(0);
	m_shader_flat->stopUseProgram();

	glDisable(GL_POLYGON_OFFSET_FILL);

	m_shader_color->startUseProgram();
	m_shader_color->sendViewMatrix(viewMatrix);
	m_shader_color->sendProjectionMatrix(projectionMatrix);
	glUniform3f(m_shader_color->idOfColorUniform, 0.0f,0.0f,0.0f);
	glBindVertexArray(m_vao2);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,m_ebo2);
	glDrawElements(GL_LINES, m_nb_ind_edges,GL_UNSIGNED_INT,0);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,0);
	glBindVertexArray(0);
	m_shader_color->stopUseProgram();
	glDisable(GL_CULL_FACE);
}

