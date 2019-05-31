// all the kernels. all of them

float[][] sharpen = new float[][] { {0, -1, 0},
                                    {-1, 5, -1},
                                    {0, -1, 0} };

float[][] edgeEnhance = new float[][] { {0, 0, 0},
                                        {-1, 1, 0},
                                        {0, 0, 0} };

float[][] edgeDetect = new float[][] { {0, 1, 0},
                                       {1, -4, 1},
                                       {0, 1, 0} };

float[][] emboss = new float[][] { {-2, -1, 0},
                                   {-1, 1, 1},
                                   {0, 1, 2} };

float[][] sobelEdge = new float[][] { {-1, -2, -1},
                                      {0, 0, 0},
                                      {1, 2, 1} };
