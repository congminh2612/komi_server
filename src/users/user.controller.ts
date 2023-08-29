import { Controller, Delete, Get, Param, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { AuthGuard } from 'src/guard/auth.guard';
import { AdminAuthGuard } from 'src/guard/admin.guard';

@Controller('user')
export class UserController {
  constructor(private userService: UserService) {}

  @UseGuards(AuthGuard)
  @Get('/')
  async findAll() {
    return await this.userService.getAllUser();
  }
  @UseGuards(AdminAuthGuard)
  @Delete('delete/:id')
  async delete(@Param('id') id: string) {
    return await this.userService.deleteUser(id);
  }
}
