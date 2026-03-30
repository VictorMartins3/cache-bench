const MATRIX_SIZE: usize = 10000;

fn main() {
    let mut matrix = vec![vec![0i32; MATRIX_SIZE]; MATRIX_SIZE];

    for i in 0..MATRIX_SIZE {
        for j in 0..MATRIX_SIZE {
            matrix[i][j] = (i + j) as i32;
        }
    }

    let mut sum: u64 = 0;
    for i in 0..MATRIX_SIZE {
        for j in 0..MATRIX_SIZE {
            sum += matrix[i][j] as u64;
        }
    }

    println!("{}", sum);
}
