alter table tb_closet add column style_idx int unsigned not null;

alter table tb_closet add foreign key(style_idx) references tb_style(style_idx);

alter table tb_closet drop column upload_img;

alter table tb_closet change column uploaded_at added_at datetime default now();

select * from user_tb;

--select * from USER_TB;

select * from tb_cody where cody_idx=1002;

select * from tb_style where style_idx=363 ;

-- delete from tb_item where style_idx=676;

select * from tb_cody inner join tb_cody_favorite on tb_cody.cody_idx = tb_cody_favorite.cody_idx;

ALTER TABLE tb_item DROP FOREIGN KEY cody_idx;

ALTER TABLE tb_item ADD CONSTRAINT FOREIGN KEY (cody_idx) REFERENCES tb_cody(cody_idx) ON DELETE CASCADE;

ALTER TABLE tb_cody_favorite ADD CONSTRAINT FOREIGN KEY (cody_idx) REFERENCES tb_cody(cody_idx) ON DELETE CASCADE;

show full processlist;

kill 208964;
