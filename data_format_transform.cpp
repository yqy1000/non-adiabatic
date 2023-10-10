#include<iostream>
#include<math.h>
using namespace std;

int main() {
	int num = 0; //number of q-points
	cin >> num;
	double temp1 = 0, temp2 = 0, temp3 = 0;
	double qx = 0, qy = 0, qz = 0;
	double qx1 = 0, qy1 = 0, qz1 = 0;
	double q[500] = {}; //coordinate of q
	double freq[500][9] = {};  //phonon frequencies
	int i = 0, j = 0;
	//input
	//copy the context of the freq file
	for (i = 0; i < num; i++) { 
		cin >> qx >> qy >> qz;
		for (j = 0; j < 9; j++) {
			cin >> temp1 >> temp2 >> freq[i][j] >> temp3;
		}
		double temp = (qx-qx1)*(qx-qx1)+ (qy - qy1) * (qy - qy1)+ (qz - qz1) * (qz - qz1);
		if (i != 0)
			q[i] = sqrt(temp) + q[i - 1];
		else
			q[i] = sqrt(temp);
		qx1 = qx, qy1 = qy, qz1 = qz;
	}
	//output
	for (i = 0; i < num; i++) {
		cout << q[i];
		for (j = 0; j < 9; j++) {
			cout << " " << freq[i][j];
		}
		cout << endl;
	}
	return 0;
}