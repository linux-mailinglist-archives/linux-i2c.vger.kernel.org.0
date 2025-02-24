Return-Path: <linux-i2c+bounces-9549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E53A41940
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 10:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9DF3A5A16
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180601FE46B;
	Mon, 24 Feb 2025 09:32:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F170146588
	for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2025 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389575; cv=none; b=qFyc58rlOm6lZNO9/LTtpqI7VCZP3LHkc50jN+zmWZpNfVzABa4PvkqYs8HFvJz5srJzf3lzmjJNoVdtG6E2rQk4s6aZoiFWiXqOPWW34fHC9aRXk+AWAwKLo/e6ipaq8aqg/4pb+JKM/PSjMShb5ZyD+IiZGWUfv9IfuWMZ4QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389575; c=relaxed/simple;
	bh=GJw38/7zb3uA+OAobw5YbPXz0q12/WPSDUd/mmzwGCw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QHIQmrtBOpd+NJwtMFOqiR1sdvWZ+5PW51aoQ2ZlZbiKFzirHxSGojoLUOy9wGzgy63xk9+wPH8Rj0kFW5ghaQPl89QsBHSNpcmXx0Vm9WlRHUN5hQ4qnBlSBX/a0puQ6Ujm45HWhdCpkwsx63A+NacT3tf7OdDzzRgCtI4mq60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUpA-0002iD-0i; Mon, 24 Feb 2025 10:32:28 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUp9-002ZLh-14;
	Mon, 24 Feb 2025 10:32:27 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUp9-0003W5-0p;
	Mon, 24 Feb 2025 10:32:27 +0100
Message-ID: <db8dad75c03d747d16cdc67ebbedd5c2f8c27a6d.camel@pengutronix.de>
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "benh@kernel.crashing.org"
	 <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org"
	 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"andrew@codeconstruct.com.au"
	 <andrew@codeconstruct.com.au>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Mon, 24 Feb 2025 10:32:27 +0100
In-Reply-To: <OS8PR06MB75413DA9AF08F23506FA6DDBF2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
	 <ee0f5b583aadb42e7557e1afc49c5b9af594d2c3.camel@pengutronix.de>
	 <OS8PR06MB75413DA9AF08F23506FA6DDBF2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Mo, 2025-02-24 at 09:04 +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new
> > register
> > mode driver
> >=20
> > On Mo, 2025-02-24 at 13:59 +0800, Ryan Chen wrote:
> > > Add i2c new register mode driver to support AST2600 i2c new
> > > register
> > > mode. AST2600 i2c controller have legacy and new register mode.
> > > The
> > > new register mode have global register support 4 base clock for
> > > scl
> > > clock selection, and new clock divider mode. The new register
> > > mode
> > > have separate register set to control i2c controller and target.
> > > This
> > > patch is for i2c controller mode driver.
> > >=20
> > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > > ---
> > > =C2=A0drivers/i2c/busses/Kconfig       |   11 +
> > > =C2=A0drivers/i2c/busses/Makefile      |    1 +
> > > =C2=A0drivers/i2c/busses/i2c-ast2600.c | 1036
> > > ++++++++++++++++++++++++++++++
> > > =C2=A03 files changed, 1048 insertions(+)
> > > =C2=A0create mode 100644 drivers/i2c/busses/i2c-ast2600.c
> > >=20
> > [...]
> > > diff --git a/drivers/i2c/busses/i2c-ast2600.c
> > > b/drivers/i2c/busses/i2c-ast2600.c
> > > new file mode 100644
> > > index 000000000000..bfac507693dd
> > > --- /dev/null
> > > +++ b/drivers/i2c/busses/i2c-ast2600.c
> > > @@ -0,0 +1,1036 @@
> > [...]
> > > +static int ast2600_i2c_probe(struct platform_device *pdev) {
> > > +	struct device *dev =3D &pdev->dev;
> > > +	struct ast2600_i2c_bus *i2c_bus;
> > > +	struct resource *res;
> > > +	u32 global_ctrl;
> > > +	int ret;
> > > +
> > > +	i2c_bus =3D devm_kzalloc(dev, sizeof(*i2c_bus),
> > > GFP_KERNEL);
> > > +	if (!i2c_bus)
> > > +		return -ENOMEM;
> > > +
> > > +	i2c_bus->reg_base =3D devm_platform_ioremap_resource(pdev,
> > > 0);
> > > +	if (IS_ERR(i2c_bus->reg_base))
> > > +		return PTR_ERR(i2c_bus->reg_base);
> > > +
> > > +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> > > +	if (IS_ERR(i2c_bus->rst))
> > > +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst),
> > > "Missing reset
> > > +ctrl\n");
> > > +
> > > +	reset_control_deassert(i2c_bus->rst);
> >=20
> > No reset_control_assert() in the error paths below? You could get
> > that and
> > simplify this by using devm_reset_control_get_shared_deasserted().
> >=20
> Sorry, devm_reset_control_get_shared_deasserted is new for me.
> Do you mean modify by following=20
>=20
> i2c_bus->rst =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> if (IS_ERR(i2c_bus->rst))
> =C2=A0=C2=A0=C2=A0=C2=A0return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), =
"Missing reset
> ctrl\n");
>=20
> - reset_control_deassert(i2c_bus->rst);

Yes see [1]. Remove the reset_control_assert() in ast2600_i2c_remove()
as well.

[1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_=
shared_deasserted

regards
Philipp

