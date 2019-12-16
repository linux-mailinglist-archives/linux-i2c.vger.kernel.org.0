Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D151207BE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 15:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfLPN5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 08:57:13 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:59926 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbfLPN5N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 08:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576504630; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W+6FWvfy4DCYdNXvWOb8dl37HhLH88Anxlx3K9JQ+AA=;
        b=u5JGSR7a5JvvS2+BZGD6t84AinGBl2UDHu8o2O3pUCcdcM+RYaFs+AA5GBHNL9ChlA9ADj
        jlOtnvZdoknYYB5qGVdLTCEtQH/pIarYTogdydXFHtjnoJ+1lFEbc9wkdAXynbWSlgJKWe
        JF1dPr2g69CiX7wFrFL2bvOFobl8BAg=
Date:   Mon, 16 Dec 2019 14:57:05 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/2] I2C: JZ4780: Add support for the X1000.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 2374286503@qq.com
Message-Id: <1576504625.3.4@crapouillou.net>
In-Reply-To: <1576490771-120353-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576490771-120353-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1576490771-120353-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Zhou,


Le lun., d=C3=A9c. 16, 2019 at 18:06, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yan=
jie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add support for probing i2c driver on the X1000 Soc from Ingenic.
> call the corresponding fifo parameter according to the device
> model obtained from the devicetree.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v1->v2:
>     Add code to check device_get_match_data(), if it return a NULL=20
> ptr,
>     then print an error message and return -ENODEV.
>=20
>  drivers/i2c/busses/i2c-jz4780.c | 155=20
> +++++++++++++++++++++++++++++-----------
>  1 file changed, 115 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-jz4780.c=20
> b/drivers/i2c/busses/i2c-jz4780.c
> index 25dcd73..f07a07c 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2006 - 2009 Ingenic Semiconductor Inc.
>   * Copyright (C) 2015 Imagination Technologies
> + * Copyright (C) 2019 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=20
> <zhouyanjie@wanyeetech.com>
>   */
>=20
>  #include <linux/bitops.h>
> @@ -17,6 +18,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> @@ -55,6 +57,7 @@
>  #define JZ4780_I2C_ACKGC	0x98
>  #define JZ4780_I2C_ENSTA	0x9C
>  #define JZ4780_I2C_SDAHD	0xD0
> +#define X1000_I2C_SDAHD		0x7C
>=20
>  #define JZ4780_I2C_CTRL_STPHLD		BIT(7)
>  #define JZ4780_I2C_CTRL_SLVDIS		BIT(6)
> @@ -73,6 +76,8 @@
>  #define JZ4780_I2C_STA_TFNF		BIT(1)
>  #define JZ4780_I2C_STA_ACT		BIT(0)
>=20
> +#define X1000_I2C_DC_STOP		BIT(9)
> +
>  static const char * const jz4780_i2c_abrt_src[] =3D {
>  	"ABRT_7B_ADDR_NOACK",
>  	"ABRT_10ADDR1_NOACK",
> @@ -130,18 +135,33 @@ static const char * const jz4780_i2c_abrt_src[]=20
> =3D {
>  #define JZ4780_I2CFLCNT_ADJUST(n)	(((n) - 1) < 8 ? 8 : ((n) - 1))
>=20
>  #define JZ4780_I2C_FIFO_LEN	16
> -#define TX_LEVEL		3
> -#define RX_LEVEL		(JZ4780_I2C_FIFO_LEN - TX_LEVEL - 1)
> +
> +#define X1000_I2C_FIFO_LEN	64
>=20
>  #define JZ4780_I2C_TIMEOUT	300
>=20
>  #define BUFSIZE 200
>=20
> +enum ingenic_i2c_version {
> +	ID_JZ4780,
> +	ID_X1000,
> +};
> +
> +/* ingenic_i2c_config: SoC specific config data. */
> +struct ingenic_i2c_config {
> +	enum ingenic_i2c_version version;
> +
> +	int fifosize;
> +	int tx_level;
> +	int rx_level;
> +};
> +
>  struct jz4780_i2c {
>  	void __iomem		*iomem;
>  	int			 irq;
>  	struct clk		*clk;
>  	struct i2c_adapter	 adap;
> +	const struct ingenic_i2c_config *cdata;
>=20
>  	/* lock to protect rbuf and wbuf between xfer_rd/wr and irq handler=20
> */
>  	spinlock_t		lock;
> @@ -340,11 +360,18 @@ static int jz4780_i2c_set_speed(struct=20
> jz4780_i2c *i2c)
>=20
>  	if (hold_time >=3D 0) {
>  		/*i2c hold time enable */
> -		hold_time |=3D JZ4780_I2C_SDAHD_HDENB;
> -		jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
> +		if (i2c->cdata->version >=3D ID_X1000)
> +			jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, hold_time);
> +		else {

If only one branch of a conditional statement is a single statement,=20
then you should use braces in both branches.

See:=20
https://www.kernel.org/doc/html/v4.10/process/coding-style.html#placing-bra=
ces-and-spaces


> +			hold_time |=3D JZ4780_I2C_SDAHD_HDENB;
> +			jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
> +		}
>  	} else {
>  		/* disable hold time */
> -		jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
> +		if (i2c->cdata->version >=3D ID_X1000)
> +			jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, 0);
> +		else
> +			jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
>  	}
>=20
>  	return 0;
> @@ -359,9 +386,11 @@ static int jz4780_i2c_cleanup(struct jz4780_i2c=20
> *i2c)
>  	spin_lock_irqsave(&i2c->lock, flags);
>=20
>  	/* can send stop now if need */
> -	tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> -	tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	if (i2c->cdata->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	/* disable all interrupts first */
>  	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0);
> @@ -399,11 +428,18 @@ static int jz4780_i2c_prepare(struct jz4780_i2c=20
> *i2c)
>  	return jz4780_i2c_enable(i2c);
>  }
>=20
> -static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c, int=20
> cmd_count)
> +static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c,
> +				       int cmd_count, int cmd_left)

Sorry to be pedantic ;) but this line is not properly indented. You=20
should indent with tab charaters (configure your IDE for one tab =3D=3D 4=20
spaces) as much as possible, then use spaces to align the first word.

With these two things fixed:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


>  {
>  	int i;
>=20
> -	for (i =3D 0; i < cmd_count; i++)
> +	for (i =3D 0; i < cmd_count - 1; i++)
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
> +
> +	if ((cmd_left =3D=3D 0) && (i2c->cdata->version >=3D ID_X1000))
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
> +				JZ4780_I2C_DC_READ | X1000_I2C_DC_STOP);
> +	else
>  		jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
>  }
>=20
> @@ -458,37 +494,44 @@ static irqreturn_t jz4780_i2c_irq(int irqno,=20
> void *dev_id)
>=20
>  		rd_left =3D i2c->rd_total_len - i2c->rd_data_xfered;
>=20
> -		if (rd_left <=3D JZ4780_I2C_FIFO_LEN)
> +		if (rd_left <=3D i2c->cdata->fifosize)
>  			jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, rd_left - 1);
>  	}
>=20
>  	if (intst & JZ4780_I2C_INTST_TXEMP) {
>  		if (i2c->is_write =3D=3D 0) {
>  			int cmd_left =3D i2c->rd_total_len - i2c->rd_cmd_xfered;
> -			int max_send =3D (JZ4780_I2C_FIFO_LEN - 1)
> +			int max_send =3D (i2c->cdata->fifosize - 1)
>  					 - (i2c->rd_cmd_xfered
>  					 - i2c->rd_data_xfered);
>  			int cmd_to_send =3D min(cmd_left, max_send);
>=20
>  			if (i2c->rd_cmd_xfered !=3D 0)
>  				cmd_to_send =3D min(cmd_to_send,
> -						  JZ4780_I2C_FIFO_LEN
> -						  - TX_LEVEL - 1);
> +						  i2c->cdata->fifosize
> +						  - i2c->cdata->tx_level - 1);
>=20
>  			if (cmd_to_send) {
> -				jz4780_i2c_send_rcmd(i2c, cmd_to_send);
>  				i2c->rd_cmd_xfered +=3D cmd_to_send;
> +				cmd_left =3D i2c->rd_total_len -
> +						i2c->rd_cmd_xfered;
> +				jz4780_i2c_send_rcmd(i2c,
> +						cmd_to_send, cmd_left);
> +
>  			}
>=20
> -			cmd_left =3D i2c->rd_total_len - i2c->rd_cmd_xfered;
>  			if (cmd_left =3D=3D 0) {
>  				intmsk =3D jz4780_i2c_readw(i2c, JZ4780_I2C_INTM);
>  				intmsk &=3D ~JZ4780_I2C_INTM_MTXEMP;
>  				jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, intmsk);
>=20
> -				tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> -				tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> -				jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +				if (i2c->cdata->version < ID_X1000) {
> +					tmp =3D jz4780_i2c_readw(i2c,
> +							JZ4780_I2C_CTRL);
> +					tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> +					jz4780_i2c_writew(i2c,
> +							JZ4780_I2C_CTRL, tmp);
> +				}
>  			}
>  		} else {
>  			unsigned short data;
> @@ -497,23 +540,26 @@ static irqreturn_t jz4780_i2c_irq(int irqno,=20
> void *dev_id)
>  			i2c_sta =3D jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>=20
>  			while ((i2c_sta & JZ4780_I2C_STA_TFNF) &&
> -			       (i2c->wt_len > 0)) {
> +					(i2c->wt_len > 0)) {
>  				i2c_sta =3D jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>  				data =3D *i2c->wbuf;
>  				data &=3D ~JZ4780_I2C_DC_READ;
> -				jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
> -						  data);
> +				if ((!i2c->stop_hold) && (i2c->cdata->version >=3D
> +						ID_X1000))
> +					data |=3D X1000_I2C_DC_STOP;
> +				jz4780_i2c_writew(i2c, JZ4780_I2C_DC, data);
>  				i2c->wbuf++;
>  				i2c->wt_len--;
>  			}
>=20
>  			if (i2c->wt_len =3D=3D 0) {
> -				if (!i2c->stop_hold) {
> +				if ((!i2c->stop_hold) && (i2c->cdata->version <
> +						ID_X1000)) {
>  					tmp =3D jz4780_i2c_readw(i2c,
> -							       JZ4780_I2C_CTRL);
> +							JZ4780_I2C_CTRL);
>  					tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> -					jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL,
> -							  tmp);
> +					jz4780_i2c_writew(i2c,
> +							JZ4780_I2C_CTRL, tmp);
>  				}
>=20
>  				jz4780_i2c_trans_done(i2c);
> @@ -567,20 +613,22 @@ static inline int jz4780_i2c_xfer_read(struct=20
> jz4780_i2c *i2c,
>  	i2c->rd_data_xfered =3D 0;
>  	i2c->rd_cmd_xfered =3D 0;
>=20
> -	if (len <=3D JZ4780_I2C_FIFO_LEN)
> +	if (len <=3D i2c->cdata->fifosize)
>  		jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, len - 1);
>  	else
> -		jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, RX_LEVEL);
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, i2c->cdata->rx_level);
>=20
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, TX_LEVEL);
> +	jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, i2c->cdata->tx_level);
>=20
>  	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM,
>  			  JZ4780_I2C_INTM_MRXFL | JZ4780_I2C_INTM_MTXEMP
>  			  | JZ4780_I2C_INTM_MTXABT | JZ4780_I2C_INTM_MRXOF);
>=20
> -	tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> -	tmp |=3D JZ4780_I2C_CTRL_STPHLD;
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	if (i2c->cdata->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp |=3D JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	spin_unlock_irqrestore(&i2c->lock, flags);
>=20
> @@ -626,14 +674,16 @@ static inline int jz4780_i2c_xfer_write(struct=20
> jz4780_i2c *i2c,
>  	i2c->wbuf =3D buf;
>  	i2c->wt_len =3D len;
>=20
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, TX_LEVEL);
> +	jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, i2c->cdata->tx_level);
>=20
>  	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, JZ4780_I2C_INTM_MTXEMP
>  					| JZ4780_I2C_INTM_MTXABT);
>=20
> -	tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> -	tmp |=3D JZ4780_I2C_CTRL_STPHLD;
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	if (i2c->cdata->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp |=3D JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	spin_unlock_irqrestore(&i2c->lock, flags);
>=20
> @@ -716,8 +766,25 @@ static const struct i2c_algorithm=20
> jz4780_i2c_algorithm =3D {
>  	.functionality	=3D jz4780_i2c_functionality,
>  };
>=20
> +static const struct ingenic_i2c_config jz4780_i2c_config =3D {
> +	.version =3D ID_JZ4780,
> +
> +	.fifosize =3D JZ4780_I2C_FIFO_LEN,
> +	.tx_level =3D JZ4780_I2C_FIFO_LEN / 2,
> +	.rx_level =3D JZ4780_I2C_FIFO_LEN / 2 - 1,
> +};
> +
> +static const struct ingenic_i2c_config x1000_i2c_config =3D {
> +	.version =3D ID_X1000,
> +
> +	.fifosize =3D X1000_I2C_FIFO_LEN,
> +	.tx_level =3D X1000_I2C_FIFO_LEN / 2,
> +	.rx_level =3D X1000_I2C_FIFO_LEN / 2 - 1,
> +};
> +
>  static const struct of_device_id jz4780_i2c_of_matches[] =3D {
> -	{ .compatible =3D "ingenic,jz4780-i2c", },
> +	{ .compatible =3D "ingenic,jz4780-i2c", .data =3D &jz4780_i2c_config },
> +	{ .compatible =3D "ingenic,x1000-i2c", .data =3D &x1000_i2c_config },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, jz4780_i2c_of_matches);
> @@ -734,6 +801,12 @@ static int jz4780_i2c_probe(struct=20
> platform_device *pdev)
>  	if (!i2c)
>  		return -ENOMEM;
>=20
> +	i2c->cdata =3D device_get_match_data(&pdev->dev);
> +	if (!i2c->cdata) {
> +		dev_err(&pdev->dev, "Error: No device match found\n");
> +		return -ENODEV;
> +	}
> +
>  	i2c->adap.owner		=3D THIS_MODULE;
>  	i2c->adap.algo		=3D &jz4780_i2c_algorithm;
>  	i2c->adap.algo_data	=3D i2c;
> @@ -777,9 +850,11 @@ static int jz4780_i2c_probe(struct=20
> platform_device *pdev)
>=20
>  	dev_info(&pdev->dev, "Bus frequency is %d KHz\n", i2c->speed);
>=20
> -	tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> -	tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	if (i2c->cdata->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0x0);
>=20
> --
> 2.7.4
>=20

=

