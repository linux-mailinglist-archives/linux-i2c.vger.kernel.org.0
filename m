Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CA2307A89
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 17:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhA1QTD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 11:19:03 -0500
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:53914 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232519AbhA1QSy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 11:18:54 -0500
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Jan 2021 11:18:49 EST
Received: from de-out1.bosch-org.com (snat-lb41g3-dmz-psi-sl1-maildeferred.fe.ssn.bosch.com [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 4DRQSG3m6mzbkh
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 17:10:54 +0100 (CET)
Received: from fe0vm1650.rbesz01.com (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 4DRQR92RZCz1XLFjt;
        Thu, 28 Jan 2021 17:09:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key2-intmail; t=1611850197;
        bh=MReZAxd0EH5Y3aZiWiz9G5/9hRs7nvCb0wAkvoZVmxo=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=FiTR+7zGkDV2Isy/4IP4q5ErDvNx0GWs7B/shE2735fLJMHRy59X3ZY8VptKPf2Tl
         KnNx+oMsAkR4Uv0BqCtIMycCNTON+kQVPPN9YodfTxV1/Tv1FVrlVcFp+Uu99dX+Bd
         x5TdLj4CUqy11/90MgPycdtFQ27mgaFsTfaLccEQ=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 4DRQR921NFz2HM;
        Thu, 28 Jan 2021 17:09:57 +0100 (CET)
X-AuditID: 0a3aad15-03dff7000000223b-64-6012e1d5e294
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id 9E.D2.08763.5D1E2106; Thu, 28 Jan 2021 17:09:57 +0100 (CET)
Received: from FE-MBX2042.de.bosch.com (fe-mbx2042.de.bosch.com [10.3.231.52])
        by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 4DRQR90xcGzW7n;
        Thu, 28 Jan 2021 17:09:57 +0100 (CET)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 FE-MBX2042.de.bosch.com (10.3.231.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 28 Jan 2021 17:09:56 +0100
Received: from FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f]) by
 FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f%6]) with mapi id
 15.01.2106.006; Thu, 28 Jan 2021 17:09:56 +0100
From:   "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "anson.huang@nxp.com" <anson.huang@nxp.com>
Subject: AW: [PATCH 1/1] mfd: da9063: Support SMBus and I2C mode
Thread-Topic: [PATCH 1/1] mfd: da9063: Support SMBus and I2C mode
Thread-Index: AQHW8xlUd4non6+XsUm+Dh7IRb1SI6o9EwMAgAAgDYA=
Date:   Thu, 28 Jan 2021 16:09:56 +0000
Message-ID: <df52d5e7069541e78b8b01ddc54a6777@de.bosch.com>
References: <20210125125458.1302525-1-mark.jonas@de.bosch.com>
 <20210125125458.1302525-2-mark.jonas@de.bosch.com>
 <PR3PR10MB41420E24A1303DA91175593E80BA9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PR3PR10MB41420E24A1303DA91175593E80BA9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.94.148]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsXCZbVWVvfqQ6EEg/VXeCyWvl/KbLF9ZrLF
        /CPnWC0eXvW3uP/1KKNFx98vjBaXd81hszi65x6zxZN7jBate4+wW1z9vZ7FYm/rRWYHHo8V
        n/Q9ds66y+6xaVUnm8eda3vYPDa+28Hk0f/XwOPzJrkA9igum5TUnMyy1CJ9uwSujKkrlrEV
        zDeu2LpyO3sD432NLkZODgkBE4kbt3cxdjFycQgJTGeSeHvhGCuEs4tRYunbn+wgVUICbxkl
        er+lQ9gHGCU+3KsHsdkE7CT2v37DBNIgIrCVUeJm9xowh1ngHYvEgfYPbCBVwgIOEt1nNjKC
        2CICjhI/zpxjgbCtJB6/vgZWwyKgKnFp2TomEJtXwFriyp03UDcdY5T4eWchWDOnQKzEy2Wn
        wWxGAVmJDRvOM4PYzALiEpuefWeFeEhAYskeiLiEgKjEy8f/oOKKEu3HXzBC1OtILNj9iQ3C
        1pZYtvA1M8RiQYmTM5+wTGAUn4Vk7CwkLbOQtMxC0rKAkWUVo2haqkFZrqG5iaFeUVJqcZWB
        oV5yfu4mRkiki+5gvNP9Qe8QIxMH4yFGCQ5mJRHet3OEEoR4UxIrq1KL8uOLSnNSiw8xSnOw
        KInzqvBsjBMSSE8sSc1OTS1ILYLJMnFwSjUwnZ60NKrVPvKltFziu3thW0/5FE80WiVVpzKR
        68Rf9vsdt8vbzyd7CV22jOCpip0tuHtDyoPJdnERiQ9YU88IlM07EaTktmN1zun2RUanakxt
        rmTN0XDr+qz/JuKVpdG1S0UXzS7EmGT+FJbOEdoSZHzo9fN127fHhL4tm5d6xtt28smFHI/2
        dd+UymiSrOkzLBbcF7FntpVdyBKXf11RaSLMaScnaVt6BHbxNzII+Ske++T2/djzeStm1lQ9
        Mqg7EHhg9oUnX+wcbbuyTrH9MPsSOTPpxraYhmv38meePvHP4Xc830r15W0nHSe/WLR5FvPa
        LczqgkfC+NXubDVxMO7hs/ol8d++/gajxNqjSizFGYmGWsxFxYkA+AHDY2MDAAA=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Adam,

> > From: Hubert Streidl <hubert.streidl@de.bosch.com>
> >
> > By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> > means the PMIC will automatically reset the interface when the clock
> > signal ceases for more than the SMBus timeout of 35 ms.
> >
> > If the I2C driver / device is not capable of creating atomic I2C
> > transactions, a context change can cause a ceasing of the the clock
> > signal. This can happen if for example a real-time thread is scheduled.
> > Then the DA9063 in SMBus mode will reset the 2-wire interface.
> > Subsequently a write message could end up in the wrong register. This
> > could cause unpredictable system behavior.
> >
> > The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> > interface. This mode does not reset the interface when the clock
> > signal ceases. Thus the problem depicted above does not occur.
> >
> > This patch makes the I2C mode configurable by device tree. The SMBus
> > compliant mode is kept as the default.
>=20
> Could we not just check the bus' functionality flags and set this accordi=
ngly?
> Something like this is already done in regmap-i2c to determine how to acc=
ess
> the device:
>=20
>  https://elixir.bootlin.com/linux/latest/source/drivers/base/regmap/regma=
p-i2c.c#L309
>=20
> This seems cleaner than a new DT property, or will this not work in this
> situation?

Thank you for the proposal. We were not aware of this possibility.

We experienced the SMBus timeout problem on a i.MX6 Solo. When looking
at the i2c-imx driver we see that it defines a list of functionality.

	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL
		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;

https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-imx.c=
#L1133

None of that seems to model the inability to perform atomic transactions
within the SMBus timeout. This is either a bug of this specific driver
or maybe the expressiveness of I2C_FUNC_* is not sufficient.

https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/i2c.h#L88

What flag do you think we could check to find out whether the bus is
able to obey the SMBus timeout or not?

> > Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/da9063.txt |  7 +++++++
> >  drivers/mfd/da9063-core.c                        |  9 +++++++++
> >  drivers/mfd/da9063-i2c.c                         | 13 +++++++++++++
> >  include/linux/mfd/da9063/core.h                  |  1 +
> >  include/linux/mfd/da9063/registers.h             |  3 +++
> >  5 files changed, 33 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt
> > b/Documentation/devicetree/bindings/mfd/da9063.txt
> > index 8da879935c59..256f2a25fe0a 100644
> > --- a/Documentation/devicetree/bindings/mfd/da9063.txt
> > +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
> > @@ -19,6 +19,12 @@ Required properties:
> >  - interrupts : IRQ line information.
> >  - interrupt-controller
> >
> > +Optional properties:
> > +
> > +- i2c-mode : Switch serial 2-wire interface into I2C mode. Without
> > +this
> > +  property the PMIC uses the SMBus mode (resets the interface if the
> > +clock
> > +  ceases for a longer time than the SMBus timeout).
> > +
> >  Sub-nodes:
> >
> >  - regulators : This node defines the settings for the LDOs and BUCKs.
> > @@ -77,6 +83,7 @@ Example:
> >  		interrupt-parent =3D <&gpio6>;
> >  		interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >  		interrupt-controller;
> > +		i2c-mode;
> >
> >  		rtc {
> >  			compatible =3D "dlg,da9063-rtc";
> > diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> > index df407c3afce3..baa1e4310c8c 100644
> > --- a/drivers/mfd/da9063-core.c
> > +++ b/drivers/mfd/da9063-core.c
> > @@ -162,6 +162,15 @@ int da9063_device_init(struct da9063 *da9063,
> > unsigned int irq)  {
> >  	int ret;
> >
> > +	if (da9063->i2cmode) {
> > +		ret =3D regmap_update_bits(da9063->regmap,
> > DA9063_REG_CONFIG_J,
> > +				DA9063_TWOWIRE_TO, 0);
> > +		if (ret < 0) {
> > +			dev_err(da9063->dev, "Cannot enable I2C mode.\n");
> > +			return -EIO;
> > +		}
> > +	}
> > +
> >  	ret =3D da9063_clear_fault_log(da9063);
> >  	if (ret < 0)
> >  		dev_err(da9063->dev, "Cannot clear fault log\n"); diff --git
> > a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c index
> > 3781d0bb7786..af0bf13ab43e 100644
> > --- a/drivers/mfd/da9063-i2c.c
> > +++ b/drivers/mfd/da9063-i2c.c
> > @@ -351,6 +351,17 @@ static const struct of_device_id da9063_dt_ids[] =
=3D {
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, da9063_dt_ids);
> > +
> > +static void da9063_i2c_parse_dt(struct i2c_client *client, struct
> > +da9063 *da9063) {
> > +	struct device_node *np =3D client->dev.of_node;
> > +
> > +	if (of_property_read_bool(np, "i2c-mode"))
> > +		da9063->i2cmode =3D true;
> > +	else
> > +		da9063->i2cmode =3D false;
> > +}
> > +
> >  static int da9063_i2c_probe(struct i2c_client *i2c,
> >  			    const struct i2c_device_id *id)  { @@ -366,6 +377,8
> @@ static
> > int da9063_i2c_probe(struct i2c_client *i2c,
> >  	da9063->chip_irq =3D i2c->irq;
> >  	da9063->type =3D id->driver_data;
> >
> > +	da9063_i2c_parse_dt(i2c, da9063);
> > +
> >  	ret =3D da9063_get_device_type(i2c, da9063);
> >  	if (ret)
> >  		return ret;
> > diff --git a/include/linux/mfd/da9063/core.h
> > b/include/linux/mfd/da9063/core.h index fa7a43f02f27..866864c50f78
> > 100644
> > --- a/include/linux/mfd/da9063/core.h
> > +++ b/include/linux/mfd/da9063/core.h
> > @@ -77,6 +77,7 @@ struct da9063 {
> >  	enum da9063_type type;
> >  	unsigned char	variant_code;
> >  	unsigned int	flags;
> > +	bool	i2cmode;
> >
> >  	/* Control interface */
> >  	struct regmap	*regmap;
> > diff --git a/include/linux/mfd/da9063/registers.h
> > b/include/linux/mfd/da9063/registers.h
> > index 1dbabf1b3cb8..6e0f66a2e727 100644
> > --- a/include/linux/mfd/da9063/registers.h
> > +++ b/include/linux/mfd/da9063/registers.h
> > @@ -1037,6 +1037,9 @@
> >  #define		DA9063_NONKEY_PIN_AUTODOWN	0x02
> >  #define		DA9063_NONKEY_PIN_AUTOFLPRT	0x03
> >
> > +/* DA9063_REG_CONFIG_J (addr=3D0x10F) */
> > +#define DA9063_TWOWIRE_TO			0x40
> > +
> >  /* DA9063_REG_MON_REG_5 (addr=3D0x116) */
> >  #define DA9063_MON_A8_IDX_MASK			0x07
> >  #define		DA9063_MON_A8_IDX_NONE		0x00
> > --
> > 2.25.1

Cheers,
Mark
