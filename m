Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C22610D3C5
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2019 11:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfK2KRk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Nov 2019 05:17:40 -0500
Received: from mail-eopbgr40054.outbound.protection.outlook.com ([40.107.4.54]:15170
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725892AbfK2KRk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Nov 2019 05:17:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHy3Y38ugQP0VyjKeO/86dRsSEmWqmxT/NyPXTnutnSqdwgNyfmZP/Q7RYO28bQ8Yg1ld4+wsrFtOS+R4IQ8/bK/cv6AujAn1QmWjgLNAPbDUIb5Crdnl5gQzM54sKFGbRzbCM9RZjbcFbf2xhu3eAsqjImQgLpSoWHljnTJzZ8CzNoopYLRGNiIqC2pfTQGvvmWG38PyUZJJv6vtbjvQZPi/dpEXklwZnw6Jzl8YU5Ih5crUVGG4Z8gGV+FM6F0S2Q2E0ivXewmT7m8cEtorpBE1hdwx7htn0cHhBhCouAcY8puq2sM9//fYse3ogKK0MZsu23EddlKw5QDwVvvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiVLXgQ523JN4Mk0uAB3Yx3bTek8RLmEl5/ws1Z/2tE=;
 b=LcbBiRmWaYV13rusmi2cFwG0uTVPjLUEr9CDSKPkThxGtlVqkEBnGrc8KplcXvg01NnGPpgvcdeAPkXwScQH6KFzFVAStr4WkAl6prxa1+ryjnrm2kt3HZ0vvqjnTTH9i39ZyqYK/7E82wkI8T9rFNfslreDEp19vpt61PT5tkpF1b5b5JaNdZLHJDbOftXZ5BVztMvaMG5L0qiCUivO/GwPaDkRvkU4z39E1WmBjaLmRnynTWAxLaNrbcpGgm5EMOokDKbgx6FR81drlHK7e9lAfvKaSb/VCJdfCvI01wOOq7Lfhqokg5HOGx9f8FYylMqrkLmu/nb969f7P4SMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiVLXgQ523JN4Mk0uAB3Yx3bTek8RLmEl5/ws1Z/2tE=;
 b=en+YQ2hYohhPAKLCgNzP+EIprX61FNggWkfVhlEp6CwMdbkussIkPsit6jlddUG+KLHpnAPUYhcg4d6m5C853Kk7lbjAWY0H4DD6fwb2TKOK/zcVZe8aoSEvU+KWGVNn5ACv4/sCHf9CHb65Ydb2pnJXimBpxWxBEqoAricf3WQ=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5946.eurprd04.prod.outlook.com (20.178.104.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Fri, 29 Nov 2019 10:17:30 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0%6]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 10:17:30 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
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
        Xiaobo Xie <xiaobo.xie@nxp.com>
Subject: RE: [v5] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [v5] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHVppQxnceFGU0hbkmDRwYjgnSxe6eh6RcAgAAB6kA=
Date:   Fri, 29 Nov 2019 10:17:30 +0000
Message-ID: <DB7PR04MB44905DA8682FDE307D148D8C8F460@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191129090513.2150-1-biwen.li@nxp.com>
 <AM6PR04MB5016FB583456A866AF7CAED6F3460@AM6PR04MB5016.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5016FB583456A866AF7CAED6F3460@AM6PR04MB5016.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f75dac26-24dd-4270-b525-08d774b557de
x-ms-traffictypediagnostic: DB7PR04MB5946:|DB7PR04MB5946:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB59463E792379A548B7A2F92F8F460@DB7PR04MB5946.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(189003)(199004)(13464003)(229853002)(5660300002)(55016002)(6246003)(9686003)(6436002)(66066001)(2501003)(71200400001)(71190400001)(478600001)(99286004)(256004)(14454004)(14444005)(25786009)(4326008)(54906003)(110136005)(66946007)(66476007)(81156014)(316002)(7736002)(76116006)(74316002)(7696005)(11346002)(86362001)(76176011)(305945005)(8936002)(64756008)(66446008)(66556008)(8676002)(81166006)(33656002)(6506007)(44832011)(26005)(2201001)(102836004)(2906002)(186003)(3846002)(6116002)(53546011)(446003)(52536014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5946;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpxaONy+trMcSmQmchZ63G1iZCnIs0RQY6nE1OaBl5Xhb559ONa/IPajK2z9oVgaCTn7NkW7i1tJuM14JdMYgmqXoUj27PaoDrmaxWcKUSg/hQJQIbXstAc3f0g75j+SimWuEYWGcz0oiCwZ5K+oCAjSL/TIQTuY3BhY4mw2XvdJT9P1I7G1wMpZ+u0Sj40BIwoRWTKza2okGn0Xay+Y2MDzdlMBEia1FEnI5YrUmNLZHBmQGKv75xXnEzNWpeuyfJ7CuIMWT3owtI/AhHZOtq/h/BV7CO80ZpAtAK+F0NIc8BwWIgrHWhCKL5tMHTWHj2zlk0eNEcbcOzjIc1XKmKYnjKIVse7Glcxr9TC5KsyR7sH0SNh8IkS4v1TzkJBy20BOBFsaAYlv00y4DCoAAHHaklLSaTMTsnJu/J/+C1ulUdBOHTlnMWqyXXrpivtH
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75dac26-24dd-4270-b525-08d774b557de
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 10:17:30.7041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juvuZnZUwpkiNaYJNKXxUlOkNPURkBI+kPl6PrdAbquwj0dG6eMffgSDxx7GfFS9t3slcQ5dBCo/rdJ0NmRwxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5946
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>=20
>=20
> > -----Original Message-----
> > From: Biwen Li <biwen.li@nxp.com>
> > Sent: Friday, November 29, 2019 17:05
> > To: shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> > imx@nxp.com>; wsa@the-dreams.de; Leo Li <leoyang.li@nxp.com>; Aisheng
> > Dong <aisheng.dong@nxp.com>; Clark Wang <xiaoning.wang@nxp.com>;
> > o.rempel@pengutronix.de
> > Cc: linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm- kernel@lists.infradead.org; Laurentiu Tudor
> > <laurentiu.tudor@nxp.com>; Jiafei Pan <jiafei.pan@nxp.com>; Xiaobo Xie
> > <xiaobo.xie@nxp.com>; Biwen Li <biwen.li@nxp.com>
> > Subject: [v5] i2c: imx: support slave mode for imx I2C driver
> >
> > The patch supports slave mode for imx I2C driver
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v5:
> > 	- fix a bug that cannot determine in what mode(master mode or
> > 	  slave mode)
> >
> > Change in v4:
> > 	- add MACRO CONFIG_I2C_SLAVE to fix compilation issue
> >
> > Change in v3:
> > 	- support layerscape and i.mx platform
> >
> > Change in v2:
> > 	- remove MACRO CONFIG_I2C_SLAVE
> >
> >
> >  drivers/i2c/busses/i2c-imx.c | 216
> > ++++++++++++++++++++++++++++++++---
> >  1 file changed, 198 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index
> > a3b61336fe55..52f70de16900 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -203,6 +203,9 @@ struct imx_i2c_struct {
> >  	struct pinctrl_state *pinctrl_pins_gpio;
> >
> >  	struct imx_i2c_dma	*dma;
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +	struct i2c_client	*slave;
> > +#endif
> >  };
> >
> >  static const struct imx_i2c_hwdata imx1_i2c_hwdata =3D { @@ -279,6
> > +282,14 @@ static inline unsigned char imx_i2c_read_reg(struct
> > imx_i2c_struct *i2c_imx,
> >  	return readb(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));  }
> >
> > +/* Set up i2c controller register and i2c status register to default
> > +value. */ static void i2c_imx_reset_regs(struct imx_i2c_struct
> > +*i2c_imx) {
> > +	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> > +			i2c_imx, IMX_I2C_I2CR);
> > +	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
> > +IMX_I2C_I2SR); }
> > +
> >  /* Functions for DMA support */
> >  static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> >  						dma_addr_t phy_addr)
> > @@ -588,23 +599,33 @@ static void i2c_imx_stop(struct imx_i2c_struct
> > *i2c_imx)
> >  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);  }
> >
> > -static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
> > +/* Clear interrupt flag bit */
> > +static void i2c_imx_clr_if_bit(unsigned int status, struct
> > +imx_i2c_struct *i2c_imx)
> >  {
> > -	struct imx_i2c_struct *i2c_imx =3D dev_id;
> > -	unsigned int temp;
> > +	status &=3D ~I2SR_IIF;
> > +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> > +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
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
> > +/* Clear arbitration lost bit */
> > +static void i2c_imx_clr_al_bit(unsigned int status, struct
> > +imx_i2c_struct *i2c_imx) {
> > +	status &=3D ~I2SR_IAL;
> > +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IAL);
> > +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR); }
> >
> > -	return IRQ_NONE;
> > +static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx) =
{
> > +	unsigned int status;
> > +
> > +	/* Save status register */
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +	i2c_imx->i2csr =3D status | I2SR_IIF;
> > +
> > +	wake_up(&i2c_imx->queue);
> > +
> > +	return IRQ_HANDLED;
> >  }
>=20
> Hi Biwen,
>=20
> We only use i2c_imx->i2csr for IIF judgement in i2c_imx_trx_complete(), c=
an we
Currently maybe we just use the I2SR_IIF, but other bit of i2c status regis=
ter will be used
in the future.
In another hand, i2csr represent value in i2c status register, unless we ch=
anged the meaning.
> use this code:
> static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx) {
> 	i2c_imx->i2csr =3D I2SR_IIF;
>=20
> 	wake_up(&i2c_imx->queue);
>=20
> 	return IRQ_HANDLED;
> }
> Or even put these three lines to isr function directly?=20
> i2c_imx_master_isr() is only called when if (status & I2SR_IIF) is true, =
so no need
> to read register again here.
I add i2c_imx_master_isr to let the code clearly. Although read register ag=
ain, but with advanced compiler
and more powerfull cpu, the performance won't have significant impact.
Thank you for your suggestions.

Best Regards,
Biwen Li
>=20
> Regards,
> Clark Wang
>=20
>=20
> >
> >  static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx, @@
> > -900,6
> > +921,13 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
> >
> >  	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
> >
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +	if (i2c_imx->slave) {
> > +		dev_err(&i2c_imx->adapter.dev, "Please not do operations
> > of master mode in slave mode");
> > +		return -EBUSY;
> > +	}
> > +#endif
> > +
> >  	result =3D pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> >  	if (result < 0)
> >  		goto out;
> > @@ -1048,11 +1076,166 @@ static u32 i2c_imx_func(struct i2c_adapter
> > *adapter)
> >  		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
> >  }
> >
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +static int i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx) {
> > +	int temp;
> > +
> > +	/* Resume */
> > +	temp =3D pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> > +	if (temp < 0) {
> > +		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c
> > controller");
> > +		return temp;
> > +	}
> > +
> > +	/* Set slave addr. */
> > +	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx,
> > IMX_I2C_IADR);
> > +
> > +	i2c_imx_reset_regs(i2c_imx);
> > +
> > +	/* Enable module */
> > +	temp =3D i2c_imx->hwdata->i2cr_ien_opcode;
> > +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +
> > +	/* Enable interrupt from i2c module */
> > +	temp |=3D I2CR_IIEN;
> > +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +
> > +	/* Wait controller to be stable */
> > +	usleep_range(50, 150);
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx) {
> > +	unsigned int status, ctl;
> > +	u8 value;
> > +
> > +	if (!i2c_imx->slave) {
> > +		dev_err(&i2c_imx->adapter.dev, "cannot deal with slave
> > irq,i2c_imx->slave is null");
> > +		return IRQ_NONE;
> > +	}
> > +
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +	ctl =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +	if (status & I2SR_IAL) { /* Arbitration lost */
> > +		i2c_imx_clr_al_bit(status, i2c_imx);
> > +	} else if (status & I2SR_IAAS) { /* Addressed as a slave */
> > +		if (status & I2SR_SRW) { /* Master wants to read from us*/
> > +			dev_dbg(&i2c_imx->adapter.dev, "read requested");
> > +			i2c_slave_event(i2c_imx->slave,
> > I2C_SLAVE_READ_REQUESTED, &value);
> > +
> > +			/* Slave transmit */
> > +			ctl |=3D I2CR_MTX;
> > +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +
> > +			/* Send data */
> > +			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> > +		} else { /* Master wants to write to us */
> > +			dev_dbg(&i2c_imx->adapter.dev, "write requested");
> > +			i2c_slave_event(i2c_imx->slave,
> > 	I2C_SLAVE_WRITE_REQUESTED, &value);
> > +
> > +			/* Slave receive */
> > +			ctl &=3D ~I2CR_MTX;
> > +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +			/* Dummy read */
> > +			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > +		}
> > +	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
> > +			if (status & I2SR_IBB) { /* No STOP signal detected */
> > +				ctl &=3D ~I2CR_MTX;
> > +				imx_i2c_write_reg(ctl, i2c_imx,
> > IMX_I2C_I2CR);
> > +
> > +				value =3D imx_i2c_read_reg(i2c_imx,
> > IMX_I2C_I2DR);
> > +				i2c_slave_event(i2c_imx->slave,
> > 	I2C_SLAVE_WRITE_RECEIVED, &value);
> > +			} else { /* STOP signal is detected */
> > +				dev_dbg(&i2c_imx->adapter.dev,
> > +					"STOP signal detected");
> > +				i2c_slave_event(i2c_imx->slave,
> > I2C_SLAVE_STOP, &value);
> > +			}
> > +	} else if (!(status & I2SR_RXAK)) {	/* Transmit mode received
> > ACK */
> > +		ctl |=3D I2CR_MTX;
> > +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +
> > +		i2c_slave_event(i2c_imx->slave,
> > 	I2C_SLAVE_READ_PROCESSED, &value);
> > +
> > +		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> > +	} else { /* Transmit mode received NAK */
> > +		ctl &=3D ~I2CR_MTX;
> > +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > +		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > +	}
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int i2c_imx_reg_slave(struct i2c_client *client) {
> > +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> > +	int ret;
> > +	if (i2c_imx->slave)
> > +		return -EBUSY;
> > +
> > +	i2c_imx->slave =3D client;
> > +
> > +	ret =3D i2c_imx_slave_init(i2c_imx);
> > +	if (ret < 0)
> > +		dev_err(&i2c_imx->adapter.dev, "failed to switch to slave
> > mode");
> > +
> > +	return ret;
> > +}
> > +
> > +static int i2c_imx_unreg_slave(struct i2c_client *client) {
> > +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> > +	int ret;
> > +
> > +	if (!i2c_imx->slave)
> > +		return -EINVAL;
> > +
> > +	/* Reset slave address. */
> > +	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> > +
> > +	i2c_imx_reset_regs(i2c_imx);
> > +
> > +	i2c_imx->slave =3D NULL;
> > +
> > +	/* Suspend */
> > +	ret =3D pm_runtime_put_sync(i2c_imx->adapter.dev.parent);
> > +	if (ret < 0)
> > +		dev_err(&i2c_imx->adapter.dev, "failed to suspend i2c
> > controller");
> > +
> > +	return ret;
> > +}
> > +#endif
> > +
> >  static const struct i2c_algorithm i2c_imx_algo =3D {
> >  	.master_xfer	=3D i2c_imx_xfer,
> >  	.functionality	=3D i2c_imx_func,
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +	.reg_slave	=3D i2c_imx_reg_slave,
> > +	.unreg_slave	=3D i2c_imx_unreg_slave,
> > +#endif
> >  };
> >
> > +static irqreturn_t i2c_imx_isr(int irq, void *dev_id) {
> > +	struct imx_i2c_struct *i2c_imx =3D dev_id;
> > +	unsigned int status;
> > +
> > +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > +
> > +	if (status & I2SR_IIF) {
> > +		i2c_imx_clr_if_bit(status, i2c_imx); #if
> > +IS_ENABLED(CONFIG_I2C_SLAVE)
> > +		if (i2c_imx->slave)
> > +			return i2c_imx_slave_isr(i2c_imx); #endif
> > +		return i2c_imx_master_isr(i2c_imx);
> > +	}
> > +
> > +	return IRQ_NONE;
> > +}
> > +
> >  static int i2c_imx_probe(struct platform_device *pdev)  {
> >  	struct imx_i2c_struct *i2c_imx;
> > @@ -1148,10 +1331,7 @@ static int i2c_imx_probe(struct platform_device
> > *pdev)
> >  	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
> >  	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
> >
> > -	/* Set up chip registers to defaults */
> > -	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> > -			i2c_imx, IMX_I2C_I2CR);
> > -	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
> > IMX_I2C_I2SR);
> > +	i2c_imx_reset_regs(i2c_imx);
> >
> >  	/* Init optional bus recovery function */
> >  	ret =3D i2c_imx_init_recovery_info(i2c_imx, pdev);
> > --
> > 2.17.1

