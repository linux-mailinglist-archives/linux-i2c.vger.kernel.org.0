Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1659D87021
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 05:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404791AbfHIDSN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 23:18:13 -0400
Received: from mail-eopbgr30085.outbound.protection.outlook.com ([40.107.3.85]:15363
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404592AbfHIDSN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 23:18:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6mUVWJuWmXGI16HZwQAynqV15HnS3WGpIB1RQDve9JVwL/ZVDvagqEvvzmrVBYC5KgwsoLhfonBsaV6fGaZ1hJS2YHc6lviVmBWl9LrYBnHPRR26ZahkZ113bN8vjwqkyDNJm48VY42aHtCytU/N3CHQoU7dVxx2knDbk8yalJ89DFkaublaeTYCxXTACgmvj9/nrRIo59On0P+NNhxC0ViEjP+wT3IrY6Rhok1J05GCD5eEcINILG4uijjRhesYMhmoKGZAaannwPTbMwIgUqWQy4T3dIIql7HVe5YhCI+Y7DCQNCDhVwiENrvVttVCrs76FR1LXxQ3G2BUKJSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FND4ZeqgPB7BOoDNT7JDeRS33AKaL+O/4APIN17637A=;
 b=kFb1955peTXVOHz7MQFmPXfaJl+3+xTEmuwnUoGBjPyftJajV5BVn6BYg+aHEw+KRqaLc8SCfpzkCUdger152CQhqVe6en1jVTwvHwaZvh8rprfIZm47+Rf0x9J88JzJT3r/lyt9M+XUmxvbEE5GQKhLaaXfhvqB9Kml1TQggE3NQ3PA/w3Sh4/zP7GUoBhZ7WLLePOlTwBqn13mu56H42fPqgXzasxJYygzoebVj9Y4s8TWOS7ycrrsLdf/ajac7xH8Sc2cXqp0iBKW8FkpbLFr4PjV70vdUPWZncdKqVc4qQP5kpBy3hASbFjac6gmM+U71+/2aJbadHAIguwYrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FND4ZeqgPB7BOoDNT7JDeRS33AKaL+O/4APIN17637A=;
 b=QEL7hbsV9Te0eR7W3XpohGASqklJEdzeRQAmjwSDmQdwyE6GCGiAUXxDjgSSWzPQxsJUruhHUwAPwZOuyJo1gDcaCAzM0JdmKafMgS4pkUC3NJ7YJRocn4Rq8K3aae7RIt48hnbiTHe/ySscwcH7p0Kn/fqbmFtav+4uu8H5qqg=
Received: from VI1PR04MB4495.eurprd04.prod.outlook.com (20.177.54.89) by
 VI1PR04MB5247.eurprd04.prod.outlook.com (20.177.51.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 9 Aug 2019 03:18:01 +0000
Received: from VI1PR04MB4495.eurprd04.prod.outlook.com
 ([fe80::652b:5f8c:2c53:9762]) by VI1PR04MB4495.eurprd04.prod.outlook.com
 ([fe80::652b:5f8c:2c53:9762%3]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 03:18:01 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Joshua Frkuska <joshua_frkuska@mentor.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: RE: [EXT] Re: i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [EXT] Re: i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHVTZ48m9LP8x07tUuNIj/REJ9fGqbxrQ0AgAB2tSA=
Date:   Fri, 9 Aug 2019 03:18:01 +0000
Message-ID: <VI1PR04MB4495EA1A44120654B494EB3D8FD60@VI1PR04MB4495.eurprd04.prod.outlook.com>
References: <20190808035343.34120-1-biwen.li@nxp.com>
 <20190808200202.GA6609@ninjato>
In-Reply-To: <20190808200202.GA6609@ninjato>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45b03160-1646-4ff7-7b26-08d71c782f7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5247;
x-ms-traffictypediagnostic: VI1PR04MB5247:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5247A8E161E8F1277D1A20D18FD60@VI1PR04MB5247.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:187;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(189003)(199004)(54906003)(186003)(14454004)(9686003)(6306002)(52536014)(316002)(66556008)(66476007)(66946007)(64756008)(26005)(76116006)(11346002)(446003)(476003)(81166006)(6116002)(66446008)(81156014)(99286004)(33656002)(486006)(2906002)(110136005)(8676002)(86362001)(3846002)(229853002)(74316002)(6436002)(7736002)(305945005)(966005)(7696005)(76176011)(5660300002)(102836004)(6506007)(55016002)(53936002)(6246003)(478600001)(4326008)(44832011)(66066001)(256004)(8936002)(25786009)(71200400001)(71190400001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5247;H:VI1PR04MB4495.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CwOlp9rNtD23rF8cD0IiJ+PWISbqEO7zc7XxD1tQRSTgZxFKWpVESKN2yoPjOZMf4QX29ERo7zjymMANyrzf5uYsLyr1kpFswoFcNQJZAElFpfXiP1EeCtEcoxJH7q4P+znEch/MnAkb/KkxZHEWMkmhkacPfxvZfZfOQdJF3TvLRqA/+sVI/9aR7p2F+PgHQopLdENmVAv8CuJHKxzB4+vXnrMBwcxy3D9Scplz0paxFdCgij2nbVbc6ImzCFZv6LZDuCU3KsitLauLc3JJDScvJrnwJrltDdX7HMEnmSpwOPwKyXwxj+pg7r0EiwfYLECv0VxKQpmZY2CuV5UN7jTanF2JmT/tocZBh/2B+8Ax6KCe540pUpXBQPAliIw/ewqNPq28jgzUbTYT3RaQAoIvmvtCndwATHEI89DGITY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b03160-1646-4ff7-7b26-08d71c782f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 03:18:01.3024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLbTbpJaWYiHEz7gimXUMexipQSlEL9mfYv7eLzB74P4HH6RJgZF/C7FoWp7xztgPikJWCCrE+w1tPlYhfWtIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5247
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > The patch supports slave mode for imx I2C driver
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
>=20
> Wow, this is much simpler than the other approach flying around:
>=20
> http://patchwork.ozlabs.org/patch/1124048/
>=20
> Can this one be master and slave on the same bus, too?
At the same time, the same bus is in master mode or slave mode.
>=20
> CCing the author of the other patch.
>=20
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 199
> > ++++++++++++++++++++++++++++++++---
> >  1 file changed, 185 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index b1b8b938d7f4..f7583a9fa56f 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -202,6 +202,9 @@ struct imx_i2c_struct {
> >  	struct pinctrl_state *pinctrl_pins_gpio;
> >
> >  	struct imx_i2c_dma	*dma;
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +	struct i2c_client		*slave;
> > +#endif /* CONFIG_I2C_SLAVE */
> >  };
> >
> >  static const struct imx_i2c_hwdata imx1_i2c_hwdata =3D { @@ -583,23
> > +586,40 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
> >  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);  }
> >
> > -static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
> > +/* Clear interrupt flag bit */
> > +static void i2c_imx_clr_if_bit(struct imx_i2c_struct *i2c_imx)
> >  {
> > -	struct imx_i2c_struct *i2c_imx =3D dev_id;
> > -	unsigned int temp;
> > +	unsigned int status;
> >
> > -	temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > -	if (temp & I2SR_IIF) {
> > -		/* save status register */
> > -		i2c_imx->i2csr =3D temp;
> > -		temp &=3D ~I2SR_IIF;
> > -		temp |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> > -		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
> > -		wake_up(&i2c_imx->queue);
> > -		return IRQ_HANDLED;
> > -	}
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +	status &=3D ~I2SR_IIF;
> > +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> > +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
> > +
> > +/* Clear arbitration lost bit */
> > +static void i2c_imx_clr_al_bit(struct imx_i2c_struct *i2c_imx) {
> > +	unsigned int status;
> > +
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +	status &=3D ~I2SR_IAL;
> > +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
> >
> > -	return IRQ_NONE;
> > +static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx)
> > +{
> > +	unsigned int status;
> > +
> > +	dev_dbg(&i2c_imx->adapter.dev, "<%s>: master interrupt\n",
> > +__func__);
> > +
> > +	/* Save status register */
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +	i2c_imx->i2csr =3D status | I2SR_IIF;
> > +
> > +	wake_up(&i2c_imx->queue);
> > +
> > +	return IRQ_HANDLED;
> >  }
> >
> >  static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx, @@
> > -1043,11 +1063,162 @@ static u32 i2c_imx_func(struct i2c_adapter
> *adapter)
> >  		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
> >  }
> >
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx) {
> > +	unsigned int temp;
> > +
> > +	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
> > +
> > +	/* Set slave addr. */
> > +	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx,
> > +IMX_I2C_IADR);
> > +
> > +	/* Disable i2c module */
> > +	temp =3D i2c_imx->hwdata->i2cr_ien_opcode
> > +			^ I2CR_IEN;
> > +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +
> > +	/* Reset status register */
> > +	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
> > +			  IMX_I2C_I2SR);
> > +
> > +	/* Enable module and enable interrupt from i2c module */
> > +	temp =3D i2c_imx->hwdata->i2cr_ien_opcode
> > +			| I2CR_IIEN;
> > +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +
> > +	/* Wait controller to be stable */
> > +	usleep_range(50, 150);
> > +}
> > +
> > +static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx)
> > +{
> > +	unsigned int status, ctl;
> > +	u8 value;
> > +
> > +	if (!i2c_imx->slave) {
> > +		dev_err(&i2c_imx->adapter.dev, "cannot deal with slave
> irq,i2c_imx->slave is null");
> > +		return IRQ_NONE;
> > +	}
> > +
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +	ctl =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +	if (status & I2SR_IAL) { /* Arbitration lost */
> > +		i2c_imx_clr_al_bit(i2c_imx);
> > +	} else if (status & I2SR_IAAS) { /* Addressed as a slave */
> > +		if (status & I2SR_SRW) { /* Master wants to read from us*/
> > +			dev_dbg(&i2c_imx->adapter.dev, "read requested");
> > +			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED,
> &value);
> > +
> > +			/* Slave transimt */
> > +			ctl |=3D I2CR_MTX;
> > +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +
> > +			/* Send data */
> > +			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> > +		} else { /* Master wants to write to us */
> > +			dev_dbg(&i2c_imx->adapter.dev, "write requested");
> > +			i2c_slave_event(i2c_imx->slave,
> 	I2C_SLAVE_WRITE_REQUESTED, &value);
> > +
> > +			/* Slave receive */
> > +			ctl &=3D ~I2CR_MTX;
> > +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +			/* Dummy read */
> > +			value =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > +		}
> > +	} else {
> > +		if (!(ctl & I2CR_MTX)) { /* Receive mode */
> > +			if (status & I2SR_IBB) { /* No STOP signal detected */
> > +				ctl &=3D ~I2CR_MTX;
> > +				imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +
> > +				value =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > +				i2c_slave_event(i2c_imx->slave,
> 	I2C_SLAVE_WRITE_RECEIVED, &value);
> > +			} else { /* STOP signal is detected */
> > +				dev_dbg(&i2c_imx->adapter.dev,
> > +					"STOP signal detected");
> > +				i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
> > +			}
> > +		} else { /* Transmit mode */
> > +			if (!(status & I2SR_RXAK)) {	/* Received ACK */
> > +				ctl |=3D I2CR_MTX;
> > +				imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +
> > +				i2c_slave_event(i2c_imx->slave,
> 	I2C_SLAVE_READ_PROCESSED, &value);
> > +
> > +				imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> > +			} else { /* Received NAK */
> > +				ctl &=3D ~I2CR_MTX;
> > +				imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +				value =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > +			}
> > +		}
> > +	}
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int i2c_imx_reg_slave(struct i2c_client *client) {
> > +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> > +
> > +	if (i2c_imx->slave)
> > +		return -EINVAL;
> > +
> > +	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
> > +	i2c_imx->slave =3D client;
> > +
> > +	i2c_imx_slave_init(i2c_imx);
> > +
> > +	return 0;
> > +}
> > +
> > +static int i2c_imx_unreg_slave(struct i2c_client *client) {
> > +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> > +
> > +	if (!i2c_imx->slave)
> > +		return -EINVAL;
> > +
> > +	i2c_imx->slave =3D NULL;
> > +
> > +	return 0;
> > +}
> > +#endif /* CONFIG_I2C_SLAVE */
> > +
> >  static const struct i2c_algorithm i2c_imx_algo =3D {
> >  	.master_xfer	=3D i2c_imx_xfer,
> >  	.functionality	=3D i2c_imx_func,
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +	.reg_slave	=3D i2c_imx_reg_slave,
> > +	.unreg_slave	=3D i2c_imx_unreg_slave,
> > +#endif /* CONFIG_I2C_SLAVE */
> >  };
> >
> > +static irqreturn_t i2c_imx_isr(int irq, void *dev_id) {
> > +	struct imx_i2c_struct *i2c_imx =3D dev_id;
> > +	unsigned int status, ctl;
> > +	irqreturn_t irq_status =3D IRQ_NONE;
> > +
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +	ctl =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +
> > +	if (status & I2SR_IIF) {
> > +		i2c_imx_clr_if_bit(i2c_imx);
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +		if (ctl & I2CR_MSTA)
> > +			irq_status =3D i2c_imx_master_isr(i2c_imx);
> > +		else
> > +			irq_status =3D i2c_imx_slave_isr(i2c_imx); #else
> > +		irq_status =3D i2c_imx_master_isr(i2c_imx);
> > +
> > +#endif /* CONFIG_I2C_SLAVE */
> > +	}
> > +
> > +	return irq_status;
> > +}
> > +
> >  static int i2c_imx_probe(struct platform_device *pdev)  {
> >  	const struct of_device_id *of_id =3D of_match_device(i2c_imx_dt_ids,
> > --
> > 2.17.1
> >
