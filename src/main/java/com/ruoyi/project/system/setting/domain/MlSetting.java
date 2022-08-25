package com.ruoyi.project.system.setting.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * mlSeting对象 ml_setting
 * 
 * @author malu
 * @date 2022-08-17
 */
public class MlSetting extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 标题1 */
    @Excel(name = "标题1")
    private String biaoTi1;

    /** 标题2 */
    @Excel(name = "标题2")
    private String biaoTi2;

    /** 标题3 */
    @Excel(name = "标题3")
    private String biaoTi3;

    /** 文字1 */
    @Excel(name = "文字1")
    private String wenZi1;

    /** 文字2 */
    @Excel(name = "文字2")
    private String wenZi2;

    /** 文字3 */
    @Excel(name = "文字3")
    private String wenZi3;

    /** 文字4 */
    @Excel(name = "文字4")
    private String wenZi4;

    /** 文字5 */
    @Excel(name = "文字5")
    private String wenZi5;

    /** 文字6 */
    @Excel(name = "文字6")
    private String wenZi6;

    /** 文字7 */
    @Excel(name = "文字7")
    private String wenZi7;

    /** 文字8 */
    @Excel(name = "文字8")
    private String wenZi8;

    /** 按钮1 */
    @Excel(name = "按钮1")
    private String anNiu1;

    /** 按钮2 */
    @Excel(name = "按钮2")
    private String anNiu2;

    /** 按钮3 */
    @Excel(name = "按钮3")
    private String anNiu3;

    /** 弹框标题 */
    @Excel(name = "弹框标题")
    private String tanKuangBiaoTi;

    /** 弹框内容1 */
    @Excel(name = "弹框内容1")
    private String tanKuangNeiRong1;

    /** 弹框内容2 */
    @Excel(name = "弹框内容2")
    private String tanKuangNeiRong2;

    /** 弹框内容3 */
    @Excel(name = "弹框内容3")
    private String tanKuangNeiRong3;

    /** 弹框结束按钮 */
    @Excel(name = "弹框结束按钮")
    private String tanKuangJieSuAnNiu;

    /** 弹框跳转地址 */
    @Excel(name = "弹框跳转地址")
    private String tanKuangTiaoZhuan;

    private String name1;
    private String name2;
    private String name3;
    private String name4;
    private String name5;
    private String name6;

    private String wenZi9;

    private String wenZi10;

    private String wenZi11;



    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setBiaoTi1(String biaoTi1)
    {
        this.biaoTi1 = biaoTi1;
    }

    public String getBiaoTi1()
    {
        return biaoTi1;
    }
    public void setBiaoTi2(String biaoTi2)
    {
        this.biaoTi2 = biaoTi2;
    }

    public String getBiaoTi2()
    {
        return biaoTi2;
    }
    public void setBiaoTi3(String biaoTi3)
    {
        this.biaoTi3 = biaoTi3;
    }

    public String getBiaoTi3()
    {
        return biaoTi3;
    }
    public void setWenZi1(String wenZi1)
    {
        this.wenZi1 = wenZi1;
    }

    public String getWenZi1()
    {
        return wenZi1;
    }
    public void setWenZi2(String wenZi2)
    {
        this.wenZi2 = wenZi2;
    }

    public String getWenZi2()
    {
        return wenZi2;
    }
    public void setWenZi3(String wenZi3)
    {
        this.wenZi3 = wenZi3;
    }

    public String getWenZi3()
    {
        return wenZi3;
    }
    public void setWenZi4(String wenZi4)
    {
        this.wenZi4 = wenZi4;
    }

    public String getWenZi4()
    {
        return wenZi4;
    }
    public void setWenZi5(String wenZi5)
    {
        this.wenZi5 = wenZi5;
    }

    public String getWenZi5()
    {
        return wenZi5;
    }
    public void setWenZi6(String wenZi6)
    {
        this.wenZi6 = wenZi6;
    }

    public String getWenZi6()
    {
        return wenZi6;
    }
    public void setWenZi7(String wenZi7)
    {
        this.wenZi7 = wenZi7;
    }

    public String getWenZi7()
    {
        return wenZi7;
    }
    public void setWenZi8(String wenZi8)
    {
        this.wenZi8 = wenZi8;
    }

    public String getWenZi8()
    {
        return wenZi8;
    }
    public void setAnNiu1(String anNiu1)
    {
        this.anNiu1 = anNiu1;
    }

    public String getAnNiu1()
    {
        return anNiu1;
    }
    public void setAnNiu2(String anNiu2)
    {
        this.anNiu2 = anNiu2;
    }

    public String getAnNiu2()
    {
        return anNiu2;
    }
    public void setAnNiu3(String anNiu3)
    {
        this.anNiu3 = anNiu3;
    }

    public String getAnNiu3()
    {
        return anNiu3;
    }
    public void setTanKuangBiaoTi(String tanKuangBiaoTi)
    {
        this.tanKuangBiaoTi = tanKuangBiaoTi;
    }

    public String getTanKuangBiaoTi()
    {
        return tanKuangBiaoTi;
    }
    public void setTanKuangNeiRong1(String tanKuangNeiRong1)
    {
        this.tanKuangNeiRong1 = tanKuangNeiRong1;
    }

    public String getTanKuangNeiRong1()
    {
        return tanKuangNeiRong1;
    }
    public void setTanKuangNeiRong2(String tanKuangNeiRong2)
    {
        this.tanKuangNeiRong2 = tanKuangNeiRong2;
    }

    public String getTanKuangNeiRong2()
    {
        return tanKuangNeiRong2;
    }
    public void setTanKuangNeiRong3(String tanKuangNeiRong3)
    {
        this.tanKuangNeiRong3 = tanKuangNeiRong3;
    }

    public String getTanKuangNeiRong3()
    {
        return tanKuangNeiRong3;
    }
    public void setTanKuangJieSuAnNiu(String tanKuangJieSuAnNiu)
    {
        this.tanKuangJieSuAnNiu = tanKuangJieSuAnNiu;
    }

    public String getTanKuangJieSuAnNiu()
    {
        return tanKuangJieSuAnNiu;
    }
    public void setTanKuangTiaoZhuan(String tanKuangTiaoZhuan)
    {
        this.tanKuangTiaoZhuan = tanKuangTiaoZhuan;
    }

    public String getTanKuangTiaoZhuan()
    {
        return tanKuangTiaoZhuan;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }

    public String getName3() {
        return name3;
    }

    public void setName3(String name3) {
        this.name3 = name3;
    }

    public String getName4() {
        return name4;
    }

    public void setName4(String name4) {
        this.name4 = name4;
    }

    public String getName5() {
        return name5;
    }

    public void setName5(String name5) {
        this.name5 = name5;
    }

    public String getName6() {
        return name6;
    }

    public void setName6(String name6) {
        this.name6 = name6;
    }

    public String getWenZi9() {
        return wenZi9;
    }

    public void setWenZi9(String wenZi9) {
        this.wenZi9 = wenZi9;
    }

    public String getWenZi10() {
        return wenZi10;
    }

    public void setWenZi10(String wenZi10) {
        this.wenZi10 = wenZi10;
    }

    public String getWenZi11() {
        return wenZi11;
    }

    public void setWenZi11(String wenZi11) {
        this.wenZi11 = wenZi11;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("biaoTi1", getBiaoTi1())
            .append("biaoTi2", getBiaoTi2())
            .append("biaoTi3", getBiaoTi3())
            .append("wenZi1", getWenZi1())
            .append("wenZi2", getWenZi2())
            .append("wenZi3", getWenZi3())
            .append("wenZi4", getWenZi4())
            .append("wenZi5", getWenZi5())
            .append("wenZi6", getWenZi6())
            .append("wenZi7", getWenZi7())
            .append("wenZi8", getWenZi8())
            .append("anNiu1", getAnNiu1())
            .append("anNiu2", getAnNiu2())
            .append("anNiu3", getAnNiu3())
            .append("tanKuangBiaoTi", getTanKuangBiaoTi())
            .append("tanKuangNeiRong1", getTanKuangNeiRong1())
            .append("tanKuangNeiRong2", getTanKuangNeiRong2())
            .append("tanKuangNeiRong3", getTanKuangNeiRong3())
            .append("tanKuangJieSuAnNiu", getTanKuangJieSuAnNiu())
            .append("tanKuangTiaoZhuan", getTanKuangTiaoZhuan())
            .toString();
    }
}
