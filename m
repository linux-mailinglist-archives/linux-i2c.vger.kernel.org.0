Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A0811ECC2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 22:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfLMVVO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 16:21:14 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:49768 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbfLMVVO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 16:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576272071; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TQ5AXrcH+um/2+vonSocgmKbSIlI6GCcg4rpAcGP4ck=;
        b=SMe1PUaIUAw51SbqCvLyJJJpYX1cIA/FRB9b4tY/w1amTLZSHF7f5KDvrLxINCV8Yb81gq
        DLdTo7rEBXwy3Ss4QElEJwkoMnEbewWb099dKMaJf5JjC2WGH51aHc0FQ2XutT/N1h1DGM
        yHvt4bywa1LGDPz98YdHPsN4FTRSazc=
Date:   Fri, 13 Dec 2019 22:21:05 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] I2C: JZ4780: Add support for the X1000.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, paul.burton@mips.com,
        paulburton@kernel.org, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <1576272065.3.2@crapouillou.net>
In-Reply-To: <1576165850-20727-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576165850-20727-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1576165850-20727-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Zhou,


Le jeu., d=C3=A9c. 12, 2019 at 23:50, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yan=
jie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add support for probing i2c driver on the X1000 Soc from Ingenic.
> call the corresponding fifo parameter according to the device
> model obtained from the devicetree.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>  drivers/i2c/busses/i2c-jz4780.c | 159=20
> +++++++++++++++++++++++++++++-----------
>  1 file changed, 117 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-jz4780.c=20
> b/drivers/i2c/busses/i2c-jz4780.c
> index 25dcd73..3b21896 100644
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
> @@ -130,18 +135,32 @@ static const char * const jz4780_i2c_abrt_src[]=20
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
> +/** ingenic_i2c_config: SOC specific config data. */
> +struct ingenic_i2c_config {
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
> +	enum ingenic_i2c_version version;
> +	const struct ingenic_i2c_config *cdata;
>=20
>  	/* lock to protect rbuf and wbuf between xfer_rd/wr and irq handler=20
> */
>  	spinlock_t		lock;
> @@ -340,11 +359,18 @@ static int jz4780_i2c_set_speed(struct=20
> jz4780_i2c *i2c)
>=20
>  	if (hold_time >=3D 0) {
>  		/*i2c hold time enable */
> -		hold_time |=3D JZ4780_I2C_SDAHD_HDENB;
> -		jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
> +		if (i2c->version >=3D ID_X1000)
> +			jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, hold_time);
> +		else {
> +			hold_time |=3D JZ4780_I2C_SDAHD_HDENB;
> +			jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
> +		}
>  	} else {
>  		/* disable hold time */
> -		jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
> +		if (i2c->version >=3D ID_X1000)
> +			jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, 0);
> +		else
> +			jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
>  	}
>=20
>  	return 0;
> @@ -359,9 +385,11 @@ static int jz4780_i2c_cleanup(struct jz4780_i2c=20
> *i2c)
>  	spin_lock_irqsave(&i2c->lock, flags);
>=20
>  	/* can send stop now if need */
> -	tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> -	tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	if (i2c->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	/* disable all interrupts first */
>  	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0);
> @@ -399,11 +427,18 @@ static int jz4780_i2c_prepare(struct jz4780_i2c=20
> *i2c)
>  	return jz4780_i2c_enable(i2c);
>  }
>=20
> -static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c, int=20
> cmd_count)
> +static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c,
> +				       int cmd_count, int cmd_left)
>  {
>  	int i;
>=20
> -	for (i =3D 0; i < cmd_count; i++)
> +	for (i =3D 0; i < cmd_count - 1; i++)
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
> +
> +	if ((cmd_left =3D=3D 0) && (i2c->version >=3D ID_X1000))
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
> +				JZ4780_I2C_DC_READ | X1000_I2C_DC_STOP);
> +	else
>  		jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
>  }
>=20
> @@ -458,37 +493,40 @@ static irqreturn_t jz4780_i2c_irq(int irqno,=20
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
> +				cmd_left =3D i2c->rd_total_len - i2c->rd_cmd_xfered;
> +				jz4780_i2c_send_rcmd(i2c, cmd_to_send, cmd_left);
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
> +				if (i2c->version < ID_X1000) {
> +					tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +					tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> +					jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +				}
>  			}
>  		} else {
>  			unsigned short data;
> @@ -496,24 +534,22 @@ static irqreturn_t jz4780_i2c_irq(int irqno,=20
> void *dev_id)
>=20
>  			i2c_sta =3D jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>=20
> -			while ((i2c_sta & JZ4780_I2C_STA_TFNF) &&
> -			       (i2c->wt_len > 0)) {
> +			while ((i2c_sta & JZ4780_I2C_STA_TFNF) && (i2c->wt_len > 0)) {
>  				i2c_sta =3D jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>  				data =3D *i2c->wbuf;
>  				data &=3D ~JZ4780_I2C_DC_READ;
> -				jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
> -						  data);
> +				if ((!i2c->stop_hold) && (i2c->version >=3D ID_X1000))
> +					data |=3D X1000_I2C_DC_STOP;
> +				jz4780_i2c_writew(i2c, JZ4780_I2C_DC, data);
>  				i2c->wbuf++;
>  				i2c->wt_len--;
>  			}
>=20
>  			if (i2c->wt_len =3D=3D 0) {
> -				if (!i2c->stop_hold) {
> -					tmp =3D jz4780_i2c_readw(i2c,
> -							       JZ4780_I2C_CTRL);
> +				if ((!i2c->stop_hold) && (i2c->version < ID_X1000)) {
> +					tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>  					tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> -					jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL,
> -							  tmp);
> +					jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>  				}
>=20
>  				jz4780_i2c_trans_done(i2c);
> @@ -567,20 +603,22 @@ static inline int jz4780_i2c_xfer_read(struct=20
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
> +	if (i2c->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp |=3D JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	spin_unlock_irqrestore(&i2c->lock, flags);
>=20
> @@ -626,14 +664,16 @@ static inline int jz4780_i2c_xfer_write(struct=20
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
> +	if (i2c->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp |=3D JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	spin_unlock_irqrestore(&i2c->lock, flags);
>=20
> @@ -716,8 +756,21 @@ static const struct i2c_algorithm=20
> jz4780_i2c_algorithm =3D {
>  	.functionality	=3D jz4780_i2c_functionality,
>  };
>=20
> +static const struct ingenic_i2c_config jz4780_i2c_config =3D {
> +	.fifosize =3D JZ4780_I2C_FIFO_LEN,
> +	.tx_level =3D JZ4780_I2C_FIFO_LEN / 2,
> +	.rx_level =3D JZ4780_I2C_FIFO_LEN / 2 - 1,
> +};
> +
> +static const struct ingenic_i2c_config x1000_i2c_config =3D {
> +	.fifosize =3D X1000_I2C_FIFO_LEN,
> +	.tx_level =3D X1000_I2C_FIFO_LEN / 2,
> +	.rx_level =3D X1000_I2C_FIFO_LEN / 2 - 1,
> +};
> +
>  static const struct of_device_id jz4780_i2c_of_matches[] =3D {
> -	{ .compatible =3D "ingenic,jz4780-i2c", },
> +	{ .compatible =3D "ingenic,jz4780-i2c", .data =3D (void *) ID_JZ4780 },
> +	{ .compatible =3D "ingenic,x1000-i2c", .data =3D (void *) ID_X1000 },

I think in general you should pass pointers to your ingenic_i2c_config=20
structures directly in .data here, and have a "version" field in your=20
ingenic_i2c_config struct.


>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, jz4780_i2c_of_matches);
> @@ -729,11 +782,24 @@ static int jz4780_i2c_probe(struct=20
> platform_device *pdev)
>  	unsigned short tmp;
>  	struct resource *r;
>  	struct jz4780_i2c *i2c;
> +	const struct platform_device_id *id =3D platform_get_device_id(pdev);
> +	const struct of_device_id  *of_id =3D of_match_device(
> +			jz4780_i2c_of_matches, &pdev->dev);
>=20
>  	i2c =3D devm_kzalloc(&pdev->dev, sizeof(struct jz4780_i2c),=20
> GFP_KERNEL);
>  	if (!i2c)
>  		return -ENOMEM;
>=20
> +	if (of_id)
> +		i2c->version =3D (enum ingenic_i2c_version)of_id->data;
> +	else
> +		i2c->version =3D (enum ingenic_i2c_version)id->driver_data;
> +
> +	if (i2c->version >=3D ID_X1000)
> +		i2c->cdata =3D &x1000_i2c_config;
> +	else
> +		i2c->cdata =3D &jz4780_i2c_config;
> +

Then you can replace all these lines with:
i2c->cdata =3D device_get_match_data(dev);

And your checks on i2c->version become checks on i2c->cdata->version.


>  	i2c->adap.owner		=3D THIS_MODULE;
>  	i2c->adap.algo		=3D &jz4780_i2c_algorithm;
>  	i2c->adap.algo_data	=3D i2c;
> @@ -777,9 +843,11 @@ static int jz4780_i2c_probe(struct=20
> platform_device *pdev)
>=20
>  	dev_info(&pdev->dev, "Bus frequency is %d KHz\n", i2c->speed);
>=20
> -	tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> -	tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> -	jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	if (i2c->version < ID_X1000) {
> +		tmp =3D jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
> +		tmp &=3D ~JZ4780_I2C_CTRL_STPHLD;
> +		jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
> +	}
>=20
>  	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0x0);
>=20
> @@ -809,6 +877,12 @@ static int jz4780_i2c_remove(struct=20
> platform_device *pdev)
>  	return 0;
>  }
>=20
> +static const struct platform_device_id ingenic_i2c_ids[] =3D {
> +	{ "jz4780-i2c", ID_JZ4780 },
> +	{ "x1000-i2c", ID_X1000 },
> +	{},

I honestly think you can drop the platform ID table. It will never be=20
used.

Cheers,
-Paul

> +};
> +
>  static struct platform_driver jz4780_i2c_driver =3D {
>  	.probe		=3D jz4780_i2c_probe,
>  	.remove		=3D jz4780_i2c_remove,
> @@ -816,6 +890,7 @@ static struct platform_driver jz4780_i2c_driver =3D=20
> {
>  		.name	=3D "jz4780-i2c",
>  		.of_match_table =3D of_match_ptr(jz4780_i2c_of_matches),
>  	},
> +	.id_table =3D ingenic_i2c_ids,
>  };
>=20
>  module_platform_driver(jz4780_i2c_driver);
> --
> 2.7.4
>=20

=

