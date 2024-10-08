Return-Path: <linux-i2c+bounces-7276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D4995223
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 16:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F31501F25EEF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 14:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47BD1DFDBB;
	Tue,  8 Oct 2024 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nCM2aK4G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6F1DF730;
	Tue,  8 Oct 2024 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398605; cv=none; b=JS+fZPx/sKzYb7I2gKJkmQ5KnNFxTeK7Xe56lr8uW4mJY8iY21rLYQQYLfhX8hHamfd5KZV6RRGeh5RncECj8ZLYaGKqOXhLvLrjm4BCMxMhjtb87qaSBLoitqQ3nm4+B6WXigeipkJ+vCc7lEblN3dYcD/K5NPDMS94BsalABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398605; c=relaxed/simple;
	bh=YTAF6QXU43/H1NucUPap1RM8bKotRWI14KyyhF3ievo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EDR+7xU4eyLmGn8zv9kHr1omlBOldvyrfnlAFGuB22ec3D2CZpzpyB6h+OagQQSmsM0VOm4ND35qFxBGFoz2npWksaqfzzyYW3dwCsHPfC7QBwz/NfpU+ua3mTodJtYS4kcfzgmMARNHskWW/slY/03xIqqlyRD0t3Uf4fSib9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nCM2aK4G; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6306FFF802;
	Tue,  8 Oct 2024 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728398601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1ZfW+l/q+cUZrpMcLspT8DrOEscOap+ktfFc2SQPnU=;
	b=nCM2aK4Gc1XPmsXVEP96VKilIHajWRxmGOXP3ZY9lanOkhE2jQ5tLxXLgHsTaPcsjC1UXP
	uUEFiR7E7vPIl4pka8Htl6cfERdf1j93C4sTN3rn6+VHi6hP/5tzZZFY9pvCtB2Hgda8x7
	bnV9+/s1SSCNEcomcbw21PtTrSwTw0NW3dXsPN2eFgD5nEgE3orUWY5wua71htCTGd7MNP
	spfqgNaghgIrQ5OiFvNwyGgcfhjYgAzSN8n4NV3xLXfC+mwp4eXYXwdqULais03/0FR/pY
	cl6C8YIhS6f92PJ0xAEaH3to5Hwu2cq/bx2Mar2B6xfkuEB9cRtbJAuuuj+S5Q==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Oct 2024 16:43:19 +0200
Message-Id: <D4QI63B6YQU5.3UPKA7G75J445@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: nomadik: support Mobileye EyeQ6H I2C
 controller
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
 <20241008-mbly-i2c-v1-2-a06c1317a2f7@bootlin.com>
 <oxcxs6n7y4bw33yfgaacd2cayf7otfochvlaofva2kabzjim6h@d6pam3gciepl>
In-Reply-To: <oxcxs6n7y4bw33yfgaacd2cayf7otfochvlaofva2kabzjim6h@d6pam3gciepl>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Krzysztof,

On Tue Oct 8, 2024 at 3:39 PM CEST, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 12:29:41PM +0200, Th=C3=A9o Lebrun wrote:
> > Add EyeQ6H support to the nmk-i2c AMBA driver. It shares the same quirk
> > as EyeQ5: the memory bus only supports 32-bit accesses. Avoid writeb()
> > and readb() by reusing the same `priv->has_32b_bus` flag.
> >=20
> > It does NOT need to write speed-mode specific value into a register;
> > therefore it does not depend on the mobileye,olb DT property.
> >=20
> > Refactoring is done using is_eyeq5 and is_eyeq6h boolean local
> > variables. Sort variables in reverse christmas tree to try and
> > introduce some logic into the ordering.
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> >  drivers/i2c/busses/i2c-nomadik.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-=
nomadik.c
> > index ad0f02acdb1215a1c04729f97bb14a4d93f88456..ea511d3a58073eaedb63850=
026e05b59427a69c6 100644
> > --- a/drivers/i2c/busses/i2c-nomadik.c
> > +++ b/drivers/i2c/busses/i2c-nomadik.c
> > @@ -6,10 +6,10 @@
> >   * I2C master mode controller driver, used in Nomadik 8815
> >   * and Ux500 platforms.
> >   *
> > - * The Mobileye EyeQ5 platform is also supported; it uses
> > + * The Mobileye EyeQ5 and EyeQ6H platforms are also supported; they us=
e
> >   * the same Ux500/DB8500 IP block with two quirks:
> >   *  - The memory bus only supports 32-bit accesses.
> > - *  - A register must be configured for the I2C speed mode;
> > + *  - (only EyeQ5) A register must be configured for the I2C speed mod=
e;
> >   *    it is located in a shared register region called OLB.
> >   *
> >   * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
> > @@ -1046,8 +1046,6 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev=
 *priv)
> >  	struct regmap *olb;
> >  	unsigned int id;
> > =20
> > -	priv->has_32b_bus =3D true;
> > -
> >  	olb =3D syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &=
id);
> >  	if (IS_ERR(olb))
> >  		return PTR_ERR(olb);
> > @@ -1070,13 +1068,15 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_d=
ev *priv)
> > =20
> >  static int nmk_i2c_probe(struct amba_device *adev, const struct amba_i=
d *id)
> >  {
> > -	int ret =3D 0;
> > -	struct nmk_i2c_dev *priv;
> > -	struct device_node *np =3D adev->dev.of_node;
> > -	struct device *dev =3D &adev->dev;
> > -	struct i2c_adapter *adap;
> >  	struct i2c_vendor_data *vendor =3D id->data;
> > +	struct device_node *np =3D adev->dev.of_node;
> > +	bool is_eyeq6h =3D of_device_is_compatible(np, "mobileye,eyeq6h-i2c")=
;
> > +	bool is_eyeq5 =3D of_device_is_compatible(np, "mobileye,eyeq5-i2c");
>
> You should use match data, not add compatibles in the middle of code.
> That's preferred, scallable pattern. What you added here last time does
> not scale and above change is a proof for that.

I would have used match data if the driver struct had a .of_match_table
field. `struct amba_driver` does not. Are you recommending the approach
below?

I don't see how it brings much to the driver but I do get the scaling
issue as the number of support compatibles increases. This is a fear
based on what *could* happen in the future though.

------------------------------------------------------------------------

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-noma=
dik.c
index 82571983bbca..98fc40dfcbfc 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -1061,28 +1062,46 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *=
priv)
 	return 0;
 }

+#define NMK_I2C_EYEQ_FLAG_32B_BUS	BIT(0)
+#define NMK_I2C_EYEQ_FLAG_IS_EYEQ5	BIT(1)
+
+static const struct of_device_id nmk_i2c_eyeq_match_table[] =3D {
+	{
+		.compatible =3D "mobileye,eyeq5-i2c",
+		.data =3D (void*)(NMK_I2C_EYEQ_FLAG_32B_BUS | NMK_I2C_EYEQ_FLAG_IS_EYEQ5=
),
+	},
+	{
+		.compatible =3D "mobileye,eyeq6h-i2c",
+		.data =3D (void*)(NMK_I2C_EYEQ_FLAG_32B_BUS),
+	},
+};
+
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *i=
d)
 {
 	struct i2c_vendor_data *vendor =3D id->data;
 	struct device_node *np =3D adev->dev.of_node;
-	bool is_eyeq6h =3D of_device_is_compatible(np, "mobileye,eyeq6h-i2c");
-	bool is_eyeq5 =3D of_device_is_compatible(np, "mobileye,eyeq5-i2c");
 	u32 max_fifo_threshold =3D (vendor->fifodepth / 2) - 1;
+	const struct of_device_id *match;
 	struct device *dev =3D &adev->dev;
+	unsigned long match_flags =3D 0;
 	struct nmk_i2c_dev *priv;
 	struct i2c_adapter *adap;
 	int ret =3D 0;

+	match =3D of_match_device(nmk_i2c_eyeq_match_table, dev);
+	if (match)
+		match_flags =3D (unsigned long)match->data;
+
 	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;

 	priv->vendor =3D vendor;
 	priv->adev =3D adev;
-	priv->has_32b_bus =3D is_eyeq5 || is_eyeq6h;
+	priv->has_32b_bus =3D match_flags & NMK_I2C_EYEQ_FLAG_32B_BUS;
 	nmk_i2c_of_probe(np, priv);

-	if (is_eyeq5) {
+	if (match_flags & NMK_I2C_EYEQ_FLAG_IS_EYEQ5) {
 		ret =3D nmk_i2c_eyeq5_probe(priv);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed OLB lookup\n");

------------------------------------------------------------------------

Thanks Krzysztof,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


