Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2900A10D381
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2019 10:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfK2Jzf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Nov 2019 04:55:35 -0500
Received: from mail-eopbgr40083.outbound.protection.outlook.com ([40.107.4.83]:12609
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725892AbfK2Jzf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Nov 2019 04:55:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vo6zpnK8RyaiTf/WRx9Ze7HEmhzmZILOkHWXwQ7djZ0LaYhccGmkSSN188jhT3lfikjYVEN8Vv8oA7BVWhOsm+NcZgGAvdV+x3No5MMpVD037BqtMdvnTrPRyiy8ZLiIf58+Y/3JT/KuDpg7MsO7veCsRsXL7zn6xQCWCpAPqWk1+R2Y9ovP8cZ6wGc+yRG+myyaDwjHcUo1C/VnHxk7jeQuQVfJtjEu9cLuV4bYe4ubNYOEoHXHik6li3ACNTn+Bclj71EikLN2WH3rP8dKy3H01ULbDdYCexGkC7N32/dx9Ty8NkZ6qzpLPQpEXwMnBgJ7+mv3vQfb5YMpaGbSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q839TWZbXeXpygjrt+666FP7V48Is2qDEWIo227lHw=;
 b=DrmeadpyJ7WeUtKiSBhrAU0W5ahIhyhTaJDOwLUsvRpYX+PUP0Ok7d4kB6nHBoOnXKj0vC1JiC1+jXCTN6LfPi6i7I6BAmii+LvQvfvz9y31Mag6Dg9GxPfu1tCzts6CFFa0tR+GGtekkHqzN62VDYLkr0QlBNJFyRen13gZPQFKjnXRL9GOnlWOV6BOWCadhiI+ZLXx2j/UhEWbv0MAuU/iP5TeyJpO6JDk8ehAndoK59Nfv8CLyRedNLXuQQHI4HOFUUu8ulwCbf72hTnOb2JJUFUSAo/XgnmxaquVVgfT3NT120cjBo5RS0tChzysrQGhBEKf4T7dkGG6IqLftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q839TWZbXeXpygjrt+666FP7V48Is2qDEWIo227lHw=;
 b=DTlKa6fSxM62qrBPRfwm9WKvmxHeXZEdpGqKRkBqhCDYLygiWSJ913LhlLWvp6Cho8P9mS0MV+9RcqvR7TP1nYOFVWS2HW6CZ74of5a0O0PJyD2Ar+/Fdzvc6/jbb8uwZOsvEcDkJo/wu2W4qDklKL/dki9izqHVS+I4B18CheE=
Received: from AM6PR04MB5016.eurprd04.prod.outlook.com (20.177.36.86) by
 AM6PR04MB4581.eurprd04.prod.outlook.com (20.176.243.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Fri, 29 Nov 2019 09:55:26 +0000
Received: from AM6PR04MB5016.eurprd04.prod.outlook.com
 ([fe80::7549:1f65:e06d:356d]) by AM6PR04MB5016.eurprd04.prod.outlook.com
 ([fe80::7549:1f65:e06d:356d%7]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 09:55:26 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Leo Li <leoyang.li@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>, Biwen Li <biwen.li@nxp.com>
Subject: RE: [v5] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [v5] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHVppQx3ub2UeJqLEWUL8Z8ZwqGaKeh5l4g
Date:   Fri, 29 Nov 2019 09:55:26 +0000
Message-ID: <AM6PR04MB5016FB583456A866AF7CAED6F3460@AM6PR04MB5016.eurprd04.prod.outlook.com>
References: <20191129090513.2150-1-biwen.li@nxp.com>
In-Reply-To: <20191129090513.2150-1-biwen.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoning.wang@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d81043dd-99d5-4f75-e6bd-08d774b24291
x-ms-traffictypediagnostic: AM6PR04MB4581:|AM6PR04MB4581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4581F7DD9CB18DF289616FACF3460@AM6PR04MB4581.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(13464003)(199004)(189003)(6506007)(14444005)(53546011)(26005)(52536014)(7736002)(25786009)(76176011)(74316002)(186003)(8936002)(86362001)(305945005)(229853002)(99286004)(81156014)(11346002)(316002)(256004)(102836004)(2501003)(446003)(81166006)(2201001)(8676002)(7696005)(6116002)(14454004)(54906003)(2906002)(6246003)(66476007)(110136005)(76116006)(66066001)(478600001)(66446008)(66556008)(66946007)(9686003)(5660300002)(55016002)(71200400001)(71190400001)(6436002)(64756008)(3846002)(4326008)(33656002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB4581;H:AM6PR04MB5016.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: of+AQci8DmgFA0fUfaZe7Ib7Zpvo2rb+fGrQXe6vlGwJ++DcgilSoEhgkxOcSAcgq1iLsPibaLEJgik25PucGFD/rjFmXnHXZVpmLu+Rj1foAHFqD5rmprbmLFhOpU/kHVX9QbSRqoKX+jGhQhzzY1KVPAkhv4R7ZQhmU2pEcPpD/bPvWxsEULl5Gett0QJsvUdFNmWItCBkz65BJAseGQwfKJZVZ3SqhH1osTUAtsHdqCqKCqEdfNQYnyDHvivV6qUSHct22ge2GACBJxR1s/CZHWZrpVP8m8NFBMtTCQouELMdvlUsQWqL/V+nlyr96+Czw1qudvVhXhpW+7mGKkSQHytPL1POPQdhy00xsK2BS28zWy6kQqrG9RMSmCP61kDOu/6GXUcWMd5IE2KqfktrKj39CufiZewkifOrS8YvMOybrREegkwPKfBQFuQu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81043dd-99d5-4f75-e6bd-08d774b24291
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 09:55:26.5063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBfKL5jsasMf1OGUjgwN8SkBaUQBjVU8fWOU7q2nzsTDoAA0lD54UlbJQ0YJclTuL8BkzmrYSTigflPQ6kPpaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4581
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> -----Original Message-----
> From: Biwen Li <biwen.li@nxp.com>
> Sent: Friday, November 29, 2019 17:05
> To: shawnguo@kernel.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; wsa@the-dreams.de; Leo Li <leoyang.li@nxp.com>;
> Aisheng Dong <aisheng.dong@nxp.com>; Clark Wang
> <xiaoning.wang@nxp.com>; o.rempel@pengutronix.de
> Cc: linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Laurentiu Tudor <laurentiu.tudor@nxp.com>;
> Jiafei Pan <jiafei.pan@nxp.com>; Xiaobo Xie <xiaobo.xie@nxp.com>; Biwen
> Li <biwen.li@nxp.com>
> Subject: [v5] i2c: imx: support slave mode for imx I2C driver
>=20
> The patch supports slave mode for imx I2C driver
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
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
>=20
>  drivers/i2c/busses/i2c-imx.c | 216
> ++++++++++++++++++++++++++++++++---
>  1 file changed, 198 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> a3b61336fe55..52f70de16900 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -203,6 +203,9 @@ struct imx_i2c_struct {
>  	struct pinctrl_state *pinctrl_pins_gpio;
>=20
>  	struct imx_i2c_dma	*dma;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	struct i2c_client	*slave;
> +#endif
>  };
>=20
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata =3D { @@ -279,6 +282,=
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
> @@ -588,23 +599,33 @@ static void i2c_imx_stop(struct imx_i2c_struct
> *i2c_imx)
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);  }
>=20
> -static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
> +/* Clear interrupt flag bit */
> +static void i2c_imx_clr_if_bit(unsigned int status, struct
> +imx_i2c_struct *i2c_imx)
>  {
> -	struct imx_i2c_struct *i2c_imx =3D dev_id;
> -	unsigned int temp;
> +	status &=3D ~I2SR_IIF;
> +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
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
> -	}
> +/* Clear arbitration lost bit */
> +static void i2c_imx_clr_al_bit(unsigned int status, struct
> +imx_i2c_struct *i2c_imx) {
> +	status &=3D ~I2SR_IAL;
> +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IAL);
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
>=20
> -	return IRQ_NONE;
> +static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx) {
> +	unsigned int status;
> +
> +	/* Save status register */
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	i2c_imx->i2csr =3D status | I2SR_IIF;
> +
> +	wake_up(&i2c_imx->queue);
> +
> +	return IRQ_HANDLED;
>  }

Hi Biwen,

We only use i2c_imx->i2csr for IIF judgement in i2c_imx_trx_complete(), can=
 we use this code:
static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx)
{
	i2c_imx->i2csr =3D I2SR_IIF;

	wake_up(&i2c_imx->queue);

	return IRQ_HANDLED;
}
Or even put these three lines to isr function directly?=20
i2c_imx_master_isr() is only called when if (status & I2SR_IIF) is true, so=
 no need to read register again here.

Regards,
Clark Wang


>=20
>  static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx, @@ -900,6
> +921,13 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
>=20
>  	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
>=20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (i2c_imx->slave) {
> +		dev_err(&i2c_imx->adapter.dev, "Please not do operations
> of master mode in slave mode");
> +		return -EBUSY;
> +	}
> +#endif
> +
>  	result =3D pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
>  	if (result < 0)
>  		goto out;
> @@ -1048,11 +1076,166 @@ static u32 i2c_imx_func(struct i2c_adapter
> *adapter)
>  		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
>  }
>=20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx) {
> +	int temp;
> +
> +	/* Resume */
> +	temp =3D pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> +	if (temp < 0) {
> +		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c
> controller");
> +		return temp;
> +	}
> +
> +	/* Set slave addr. */
> +	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx,
> IMX_I2C_IADR);
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
> +	/* Wait controller to be stable */
> +	usleep_range(50, 150);
> +	return 0;
> +}
> +
> +static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx) {
> +	unsigned int status, ctl;
> +	u8 value;
> +
> +	if (!i2c_imx->slave) {
> +		dev_err(&i2c_imx->adapter.dev, "cannot deal with slave
> irq,i2c_imx->slave is null");
> +		return IRQ_NONE;
> +	}
> +
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	ctl =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +	if (status & I2SR_IAL) { /* Arbitration lost */
> +		i2c_imx_clr_al_bit(status, i2c_imx);
> +	} else if (status & I2SR_IAAS) { /* Addressed as a slave */
> +		if (status & I2SR_SRW) { /* Master wants to read from us*/
> +			dev_dbg(&i2c_imx->adapter.dev, "read requested");
> +			i2c_slave_event(i2c_imx->slave,
> I2C_SLAVE_READ_REQUESTED, &value);
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
> +			if (status & I2SR_IBB) { /* No STOP signal detected */
> +				ctl &=3D ~I2CR_MTX;
> +				imx_i2c_write_reg(ctl, i2c_imx,
> IMX_I2C_I2CR);
> +
> +				value =3D imx_i2c_read_reg(i2c_imx,
> IMX_I2C_I2DR);
> +				i2c_slave_event(i2c_imx->slave,
> 	I2C_SLAVE_WRITE_RECEIVED, &value);
> +			} else { /* STOP signal is detected */
> +				dev_dbg(&i2c_imx->adapter.dev,
> +					"STOP signal detected");
> +				i2c_slave_event(i2c_imx->slave,
> I2C_SLAVE_STOP, &value);
> +			}
> +	} else if (!(status & I2SR_RXAK)) {	/* Transmit mode received
> ACK */
> +		ctl |=3D I2CR_MTX;
> +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +		i2c_slave_event(i2c_imx->slave,
> 	I2C_SLAVE_READ_PROCESSED, &value);
> +
> +		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> +	} else { /* Transmit mode received NAK */
> +		ctl &=3D ~I2CR_MTX;
> +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static int i2c_imx_reg_slave(struct i2c_client *client) {
> +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> +	int ret;
> +	if (i2c_imx->slave)
> +		return -EBUSY;
> +
> +	i2c_imx->slave =3D client;
> +
> +	ret =3D i2c_imx_slave_init(i2c_imx);
> +	if (ret < 0)
> +		dev_err(&i2c_imx->adapter.dev, "failed to switch to slave
> mode");
> +
> +	return ret;
> +}
> +
> +static int i2c_imx_unreg_slave(struct i2c_client *client) {
> +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> +	int ret;
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
> +		dev_err(&i2c_imx->adapter.dev, "failed to suspend i2c
> controller");
> +
> +	return ret;
> +}
> +#endif
> +
>  static const struct i2c_algorithm i2c_imx_algo =3D {
>  	.master_xfer	=3D i2c_imx_xfer,
>  	.functionality	=3D i2c_imx_func,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave	=3D i2c_imx_reg_slave,
> +	.unreg_slave	=3D i2c_imx_unreg_slave,
> +#endif
>  };
>=20
> +static irqreturn_t i2c_imx_isr(int irq, void *dev_id) {
> +	struct imx_i2c_struct *i2c_imx =3D dev_id;
> +	unsigned int status;
> +
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +
> +	if (status & I2SR_IIF) {
> +		i2c_imx_clr_if_bit(status, i2c_imx);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		if (i2c_imx->slave)
> +			return i2c_imx_slave_isr(i2c_imx);
> +#endif
> +		return i2c_imx_master_isr(i2c_imx);
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
>  static int i2c_imx_probe(struct platform_device *pdev)  {
>  	struct imx_i2c_struct *i2c_imx;
> @@ -1148,10 +1331,7 @@ static int i2c_imx_probe(struct platform_device
> *pdev)
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

