import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class RoleService {
  constructor(private prisma: PrismaService) {}

  async addRole() {
    try {
      const adminRole = await this.prisma.role.create({
        data: { roleName: 'admin' },
      });

      const userRole = await this.prisma.role.create({
        data: { roleName: 'user' },
      });

      return [adminRole, userRole]; // Trả về mảng chứa kết quả từ việc tạo
    } catch (error) {
      throw error;
    }
  }
}
