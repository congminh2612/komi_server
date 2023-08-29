import { Controller, Post } from '@nestjs/common';
import { RoleService } from './role.service';

@Controller('role')
export class RoleController {
  constructor(private readonly roleService: RoleService) {}

  @Post('/add')
  async add() {
    return await this.roleService.addRole();
  }
}
