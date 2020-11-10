Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7FF2ACF63
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 07:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731771AbgKJGHe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 01:07:34 -0500
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:11808
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728085AbgKJGHd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Nov 2020 01:07:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUF/DW1+C6pUa0D1XUr4D3XHlxQawe2qkGlOEiDd/Uj7igiVQbiTNpoYJS8hGn0klnjGkJY1TT8MEUySTNllrNLOXNkaibH+TEE63BLkpZb9uIM6zWBKpbeMqrRHxY/3jveCF1xRT7+EbrPwkI0tn5JSgVVxmpRG8OyTurFvKqheun7yL148ARMCFZRmqg5Kxa8m/Z6JEIgA2JEgis//4O/KYWWPsBHYfCwEc8ez2rbBwrfr7tP+uxawO22gGxDonOyecF2/3xLs1pdSWOImk5tFJK0ylKBZpLff4fkw+oXS4rpMtmDAVNVLPUPhuclBlfe0H5VUXJaIOFUR3aL2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3SxswPZ8PesU0iJBF3A0jaXcg8oF2On2vXP7NYCQLo=;
 b=kCpxNVNbd/YAMBIQ4jxVZnOmtAfnseAvpB4y0O7llNB8lfHilSTOSnXRbryKmiMz8uJ+S26oVAK5IHvUn8aXamIl4kP0LaTEP/a6Ez0c2vtHqXqt5wNUBwTsCmWvs2pQ2b0ZqOLJEhGQD8SqfKRtMP6+on3Ytywuyc1MnIFN47cWRTZQ44RhyOEucFkxvkT9Ha2nb2uufHv0anTCGb/WZiJHsHZMISRLemrQ2fVbJDZrl7qr8gsntBxyrAdtDO+AwqC4XhE5kCi1v1ADzq1E3wpGN3/AFVFgPwcI/k4ZLpH4F+00yoLooFeEiybH3zACWibLlPW6gxEWaWldF55U9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3SxswPZ8PesU0iJBF3A0jaXcg8oF2On2vXP7NYCQLo=;
 b=gxxuMUtws7+8Y+e0mK/ByB7v7uDjHzVduyxCh/vtx+k0olHkUxx+XGsk4bGfMEXeK5P26zrexYA1n5EEejIfpDlZg+0VsGRl3XqR2BNSJ0Hir7GGeqHRHAJUXAnAEl9RjSnrJACWKvXBi5au5ccFyKA8rotMlV3YsLWj8+nQUHQ=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB8PR04MB6699.eurprd04.prod.outlook.com (2603:10a6:10:3c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 06:07:28 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22%11]) with mapi id 15.20.3541.025; Tue, 10 Nov
 2020 06:07:28 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [v9 1/2] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [v9 1/2] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHWsPJxQCSwa049oUKJUXBWHq6O7KnA7A5g
Date:   Tue, 10 Nov 2020 06:07:27 +0000
Message-ID: <DB6PR0401MB2438F925B8A6DF5B8367A8F38FE90@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20201102082102.16508-1-biwen.li@oss.nxp.com>
In-Reply-To: <20201102082102.16508-1-biwen.li@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a2ebe6b-2e65-4911-a0c0-08d8853ee6d6
x-ms-traffictypediagnostic: DB8PR04MB6699:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB669924D52E7DF1BE05EED6A98FE90@DB8PR04MB6699.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:230;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EJAP2CMieOwRugn/udKRAt4l5WrEFEsDd06aAsbZRGlkcB7zfb0L1n6gRzrfRA+cIQEjHmLFbsEjcbDFh6pa6tHSftZmVVcUT9kr7givdRXCIUjWICUnOSRroP+trX/NR70Ir5kX2eC2kU5+fyiTZ54KUjRNnX/skeHtIzywKBLYOMypIzXZKF/w7A7z8VltiKCauAJXytjsDkWHQ12qWcVTvn1GE6fUx2wosVtXtRLnzh3Rhb6Z8EiHn8aiw8IyMJiDls7byLrmNrw1D23QZY8338GvzpcRTSlVgjF6IuK81n9vN80SSkbytiG7dgTNxKM43CnLktuMRnI8zp98qDARhYvfdbiY8vxQytN06dCBm/9ucMbQtwd3+k8wQPht
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(44832011)(2906002)(316002)(186003)(478600001)(110136005)(26005)(7696005)(86362001)(6506007)(55016002)(83380400001)(4326008)(66946007)(66556008)(5660300002)(52536014)(66446008)(66476007)(54906003)(33656002)(7416002)(8936002)(8676002)(71200400001)(64756008)(9686003)(76116006)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 48SJ89Ihnzh1g5OwTEvbrVPgcJy24m+5F5Q8HnwxxM9OTyPJgVwwMLmI8yWHUcfEzWiBFMwYQRaqYqwhdKHkEpejZl0WokR+Z+/6sAyNReniaNvIxdLIl6tFzgOAo15Q02XjjON+90iuWPlO+yDJs2jRuLtgJp3uMmflnv4n9cJi9q0Hxa1Du8DAtuvQqahs57ugVKvFOwE328SeG4Nkee2HNocG6CQNXnETupBQmCRH9WwXwag96M2e/qpxXcIBXJxYqwHcG1uoPG8AT4y6Q25wNzKWMugKMQNYG/6aonfawKmmkkP6VtCKtlsHl1kcfeJr+LT9XJxC0g4GwoAkJ4X6hPoqCS71JzvLHKf0uMvsKIpi0JxO3iGoCSpJuaXze/nyrvGl9RntSLuwvBIwoXv8t0ow/tW8fyQh3t+f1huMLlG3mFJ3SziZy/B4+eQ5Cv5Js3/9SuHVAXcuwWL6YowCJvrDhu8HguiJBY5tSiwNNgdTlQ9AsDnjilCjz9CAM51CWpfLkbmHAIt73kmRG/7HR89nLxUz9/1Hfj9zcuAL//dlMgdGJmSPETPoNCSJbsyTtG682SHMLqlDzlCeHF0yN+QC8TwB1DO49N6YbiAeLeHyAKIw5Rxzfcja4tAQqOX8H8w5VJ99t83zy+5Dkf8GPQfFdLP5VcWINwlLxmjWpJJWuFwg9QsT3ZUTGsKGD0gOQwMuH81SYNbLiTo/jbRctQgX2+ZthD2bM7k+9kUVqTbSWv0Ezf2WfgQaC4WMFDpU2JIJHEF/Zote6cwiWY2WjfhS8Bwc1lIklXm0ZI7lMBn+5Io9WVoXnZZ+VT36m8tTitIG68A9etoPORkyiYjK9HuSBzBpM5IJ78CwwlfkB8OYCtGWIGTsz7loMS6WmRaD1iQmfYEB+GaWypxS1A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2ebe6b-2e65-4911-a0c0-08d8853ee6d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 06:07:27.8607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XsM2Q3lgm5ItCI6m90On0JleIsPiA9NujKaRpfWQstsNOF6aPN4YHSIrWTa2igA2Xu4jDGu/xrYfl//uF/8w5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6699
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Oleksij, Wolfram,

Any comments?

Regards,
Biwen Li

> From: Biwen Li <biwen.li@nxp.com>
>=20
> The patch supports slave mode for imx I2C driver
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v9:
> 	- remove #ifdef after select I2C_SLAVE by default
>=20
> Change in v8:
> 	- fix build issue
>=20
> Change in v7:
> 	- support auto switch mode between master and slave
> 	- enable interrupt when idle in slave mode
> 	- remove #ifdef
>=20
> Change in v6:
> 	- delete robust logs and comments
> 	- not read status register again in master isr.
>=20
> Change in v5:
> 	- fix a bug that cannot determine in what mode(master mode or
> 	  slave mode)
>=20
> Change in v4:
> 	- add MACRO CONFIG_I2C_SLAVE to fix compilation issue
>=20
> Change in v3:
> 	- support layerscape and i.mx platform
>=20
> Change in v2:
> 	- remove MACRO CONFIG_I2C_SLAVE
>=20
>  drivers/i2c/busses/i2c-imx.c | 213
> ++++++++++++++++++++++++++++++++---
>  1 file changed, 199 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> c98529c76348..098e2c8a0fc7 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -17,6 +17,7 @@
>   *	Copyright (C) 2008 Darius Augulis <darius.augulis at teltonika.lt>
>   *
>   *	Copyright 2013 Freescale Semiconductor, Inc.
> + *	Copyright 2020 NXP
>   *
>   */
>=20
> @@ -72,6 +73,7 @@
>  #define IMX_I2C_I2CR	0x02	/* i2c control */
>  #define IMX_I2C_I2SR	0x03	/* i2c status */
>  #define IMX_I2C_I2DR	0x04	/* i2c transfer data */
> +#define IMX_I2C_IBIC	0x05    /* i2c transfer data */
>=20
>  #define IMX_I2C_REGSHIFT	2
>  #define VF610_I2C_REGSHIFT	0
> @@ -91,6 +93,7 @@
>  #define I2CR_MSTA	0x20
>  #define I2CR_IIEN	0x40
>  #define I2CR_IEN	0x80
> +#define IBIC_BIIE	0x80 // Bus idle interrupt enable
>=20
>  /* register bits different operating codes definition:
>   * 1) I2SR: Interrupt flags clear operation differ between SoCs:
> @@ -201,6 +204,7 @@ struct imx_i2c_struct {
>  	struct pinctrl_state *pinctrl_pins_gpio;
>=20
>  	struct imx_i2c_dma	*dma;
> +	struct i2c_client	*slave;
>  };
>=20
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata =3D { @@ -277,6 +281,=
14
> @@ static inline unsigned char imx_i2c_read_reg(struct imx_i2c_struct
> *i2c_imx,
>  	return readb(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));  }
>=20
> +/* Set up i2c controller register and i2c status register to default
> +value. */ static void i2c_imx_reset_regs(struct imx_i2c_struct
> +*i2c_imx) {
> +	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> +			i2c_imx, IMX_I2C_I2CR);
> +	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
> +IMX_I2C_I2SR); }
> +
>  /* Functions for DMA support */
>  static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  						dma_addr_t phy_addr)
> @@ -614,20 +626,188 @@ static void i2c_imx_stop(struct imx_i2c_struct
> *i2c_imx, bool atomic)
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);  }
>=20
> +/*
> + * Enable bus idle interrupts
> + * Note: IBIC register will be cleared after disabled i2c module.
> + */
> +static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx) {
> +	unsigned int temp;
> +
> +	temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_IBIC);
> +	temp |=3D IBIC_BIIE;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_IBIC); }
> +
> +static void i2c_imx_clr_if_bit(unsigned int status, struct
> +imx_i2c_struct *i2c_imx) {
> +	status &=3D ~I2SR_IIF;
> +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
> +
> +/* Clear arbitration lost bit */
> +static void i2c_imx_clr_al_bit(unsigned int status, struct
> +imx_i2c_struct *i2c_imx) {
> +	status &=3D ~I2SR_IAL;
> +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IAL);
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
> +
> +static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
> +				     unsigned int status, unsigned int ctl) {
> +	u8 value;
> +
> +	if (status & I2SR_IAL) { /* Arbitration lost */
> +		i2c_imx_clr_al_bit(status | I2SR_IIF, i2c_imx);
> +	} else if (status & I2SR_IAAS) { /* Addressed as a slave */
> +		if (status & I2SR_SRW) { /* Master wants to read from us*/
> +			dev_dbg(&i2c_imx->adapter.dev, "read requested");
> +			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED,
> &value);
> +
> +			/* Slave transmit */
> +			ctl |=3D I2CR_MTX;
> +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +			/* Send data */
> +			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> +		} else { /* Master wants to write to us */
> +			dev_dbg(&i2c_imx->adapter.dev, "write requested");
> +			i2c_slave_event(i2c_imx->slave,
> 	I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +			/* Slave receive */
> +			ctl &=3D ~I2CR_MTX;
> +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +			/* Dummy read */
> +			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +		}
> +	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
> +		if (status & I2SR_IBB) { /* No STOP signal detected */
> +			value =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +		} else { /* STOP signal is detected */
> +			dev_dbg(&i2c_imx->adapter.dev,
> +				"STOP signal detected");
> +			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
> +		}
> +	} else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
> +		ctl |=3D I2CR_MTX;
> +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +		i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_READ_PROCESSED,
> &value);
> +
> +		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> +	} else { /* Transmit mode received NAK */
> +		ctl &=3D ~I2CR_MTX;
> +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx) {
> +	int temp;
> +
> +	/* Resume */
> +	temp =3D pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> +	if (temp < 0) {
> +		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
> +		return temp;
> +	}
> +
> +	/* Set slave addr. */
> +	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx, IMX_I2C_IADR);
> +
> +	i2c_imx_reset_regs(i2c_imx);
> +
> +	/* Enable module */
> +	temp =3D i2c_imx->hwdata->i2cr_ien_opcode;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +	/* Enable interrupt from i2c module */
> +	temp |=3D I2CR_IIEN;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +	i2c_imx_enable_bus_idle(i2c_imx);
> +
> +	/* Wait controller to be stable */
> +	usleep_range(50, 150);
> +
> +	return 0;
> +}
> +
> +static int i2c_imx_reg_slave(struct i2c_client *client) {
> +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
> +		return -EINVAL;
> +
> +	if (i2c_imx->slave)
> +		return -EBUSY;
> +
> +	i2c_imx->slave =3D client;
> +
> +	ret =3D i2c_imx_slave_init(i2c_imx);
> +	if (ret < 0)
> +		dev_err(&i2c_imx->adapter.dev, "failed to switch to slave mode");
> +
> +	return ret;
> +}
> +
> +static int i2c_imx_unreg_slave(struct i2c_client *client) {
> +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
> +		return -EINVAL;
> +
> +	if (!i2c_imx->slave)
> +		return -EINVAL;
> +
> +	/* Reset slave address. */
> +	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> +
> +	i2c_imx_reset_regs(i2c_imx);
> +
> +	i2c_imx->slave =3D NULL;
> +
> +	/* Suspend */
> +	ret =3D pm_runtime_put_sync(i2c_imx->adapter.dev.parent);
> +	if (ret < 0)
> +		dev_err(&i2c_imx->adapter.dev, "failed to suspend i2c controller");
> +
> +	return ret;
> +}
> +
> +static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx,
> +unsigned int status) {
> +	/* Save status register */
> +	i2c_imx->i2csr =3D status | I2SR_IIF;
> +	wake_up(&i2c_imx->queue);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t i2c_imx_isr(int irq, void *dev_id)  {
>  	struct imx_i2c_struct *i2c_imx =3D dev_id;
> -	unsigned int temp;
> +	unsigned int ctl, status;
> +
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	ctl =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +
> +	if (status & I2SR_IIF) {
> +		i2c_imx_clr_if_bit(status, i2c_imx);
> +		if (IS_ENABLED(CONFIG_I2C_SLAVE) && i2c_imx->slave && !(ctl &
> I2CR_MSTA))
> +			return i2c_imx_slave_isr(i2c_imx, status, ctl);
>=20
> -	temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> -	if (temp & I2SR_IIF) {
> -		/* save status register */
> -		i2c_imx->i2csr =3D temp;
> -		temp &=3D ~I2SR_IIF;
> -		temp |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> -		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
> -		wake_up(&i2c_imx->queue);
> -		return IRQ_HANDLED;
> +		return i2c_imx_master_isr(i2c_imx, status);
>  	}
>=20
>  	return IRQ_NONE;
> @@ -999,6 +1179,12 @@ static int i2c_imx_xfer_common(struct i2c_adapter
> *adapter,
>  	dev_dbg(&i2c_imx->adapter.dev, "<%s> exit with: %s: %d\n", __func__,
>  		(result < 0) ? "error" : "success msg",
>  			(result < 0) ? result : num);
> +	/* After data is transferred, switch to slave mode(as a receiver) */
> +	if (IS_ENABLED(CONFIG_I2C_SLAVE) && i2c_imx->slave) {
> +		if (i2c_imx_slave_init(i2c_imx) < 0)
> +			dev_err(&i2c_imx->adapter.dev, "failed to switch to slave
> mode");
> +	}
> +
>  	return (result < 0) ? result : num;
>  }
>=20
> @@ -1112,6 +1298,8 @@ static const struct i2c_algorithm i2c_imx_algo =3D =
{
>  	.master_xfer =3D i2c_imx_xfer,
>  	.master_xfer_atomic =3D i2c_imx_xfer_atomic,
>  	.functionality =3D i2c_imx_func,
> +	.reg_slave	=3D i2c_imx_reg_slave,
> +	.unreg_slave	=3D i2c_imx_unreg_slave,
>  };
>=20
>  static int i2c_imx_probe(struct platform_device *pdev) @@ -1205,10
> +1393,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
>  	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
>=20
> -	/* Set up chip registers to defaults */
> -	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> -			i2c_imx, IMX_I2C_I2CR);
> -	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
> IMX_I2C_I2SR);
> +	i2c_imx_reset_regs(i2c_imx);
>=20
>  	/* Init optional bus recovery function */
>  	ret =3D i2c_imx_init_recovery_info(i2c_imx, pdev);
> --
> 2.17.1

