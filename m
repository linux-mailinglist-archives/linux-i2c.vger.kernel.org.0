Return-Path: <linux-i2c+bounces-1349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B411283045F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 12:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7CB1F240B9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 11:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514BC1DDE7;
	Wed, 17 Jan 2024 11:16:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD71DDD5
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705490197; cv=none; b=bQGvZas+e6tYqVlB57hBaPUUFDAlpWqnRS7RfeZ/eo/fkm9k/GqYztRqoS+1NHTJ7uErU2kpR4sSljwugUydL5PqPSn+D4X3QuoI1uWhyeMX5XBYkB7R5urCC0yZ312GpB28vSu3I8G4LznKHPALoFyciyo69Q72Skc93P9HOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705490197; c=relaxed/simple;
	bh=5qKlaLziljLZ5noa6CzlpJUbxw1PitV5B5D7RLl7cCY=;
	h=Received:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=fo3CH823QIKMBWKc9QSWtF3jY8pRQocOaVQyjbhOqK0QkGSq0g3xKxiEsO7gaDIwmf7ykVDdrAkTi0SWuHap2ZMP5+scR4uzYHcbhO4Ifngs91OcnNTm2WULpOsc0snSCvcZk8ssl4xPOPoUO0sETL2SRwYPlWC6kINmCI+dYgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ3tx-0002Yp-2t; Wed, 17 Jan 2024 12:16:09 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ3tt-000S1i-0W; Wed, 17 Jan 2024 12:16:05 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ3ts-0004u3-31;
	Wed, 17 Jan 2024 12:16:04 +0100
Message-ID: <568f2bcb1bea01c36f59650d5cc5a84612197f8b.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>,  "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson
 <sean.anderson@seco.com>
Date: Wed, 17 Jan 2024 12:16:04 +0100
In-Reply-To: <4c6c5d07-ac53-4da9-93e0-1286ca5eb44b@alliedtelesis.co.nz>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
	 <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
	 <4c6c5d07-ac53-4da9-93e0-1286ca5eb44b@alliedtelesis.co.nz>
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

On Di, 2024-01-16 at 19:58 +0000, Chris Packham wrote:
> On 17/01/24 04:18, Philipp Zabel wrote:
> > On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
> > > From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > >=20
> > > Some hardware designs with multiple PCA954x devices use a reset GPIO
> > > connected to all the muxes. Support this configuration by making use =
of
> > > the reset controller framework which can deal with the shared reset
> > > GPIOs. Fall back to the old GPIO descriptor method if the reset
> > > controller framework is not enabled.
> > >=20
> > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > Acked-by: Peter Rosin <peda@axentia.se>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Link: https://scanmail.trustwave.com/?c=3D20988&d=3D8p6m5Tfi2yYJWYV9x=
YGcYnz7UYxB6WTGTPkmGu7b8A&u=3Dhttps%3a%2f%2flore%2ekernel%2eorg%2fr%2f20240=
108041913%2e7078-1-chris%2epackham%40alliedtelesis%2eco%2enz
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >=20
> > > ---
> > >=20
> > > If previous patches are fine, then this commit is independent and cou=
ld
> > > be taken via I2C.
> > >=20
> > > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > > Cc: Sean Anderson <sean.anderson@seco.com>
> > > ---
> > >   drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++--=
---
> > >   1 file changed, 38 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/=
i2c-mux-pca954x.c
> > > index 2219062104fb..1702e8d49b91 100644
> > > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > @@ -49,6 +49,7 @@
> > >   #include <linux/pm.h>
> > >   #include <linux/property.h>
> > >   #include <linux/regulator/consumer.h>
> > > +#include <linux/reset.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/spinlock.h>
> > >   #include <dt-bindings/mux/mux.h>
> > > @@ -102,6 +103,9 @@ struct pca954x {
> > >   	unsigned int irq_mask;
> > >   	raw_spinlock_t lock;
> > >   	struct regulator *supply;
> > > +
> > > +	struct gpio_desc *reset_gpio;
> > > +	struct reset_control *reset_cont;
> > >   };
> > >  =20
> > >   /* Provide specs for the MAX735x, PCA954x and PCA984x types we know=
 about */
> > > @@ -477,6 +481,35 @@ static int pca954x_init(struct i2c_client *clien=
t, struct pca954x *data)
> > >   	return ret;
> > >   }
> > >  =20
> > > +static int pca954x_get_reset(struct device *dev, struct pca954x *dat=
a)
> > > +{
> > > +	data->reset_cont =3D devm_reset_control_get_optional_shared(dev, NU=
LL);
> > > +	if (IS_ERR(data->reset_cont))
> > > +		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
> > > +				     "Failed to get reset\n");
> > > +	else if (data->reset_cont)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * fallback to legacy reset-gpios
> > > +	 */
> > devm_reset_control_get_optional_shared() won't return NULL if the
> > "reset-gpios" property is found in the device tree, so the GPIO
> > fallback is dead code.
>=20
> Hmm, I was attempting to handle the case where CONFIG_RESET_GPIO wasn't=
=20
> set [...]
> [...] it looks like we'd get -EPROBE_DEFER. I could change to check
> for that or just remove the GPIO fallback entirely. Any preference?

I hadn't considered this.

If CONFIG_RESET_GPIO=3Dn, devm_reset_control_get_optional_shared()
probably shouldn't return -EPROBE_DEFER. If we change that, the GPIO
fallback here can stay as is.

The alternative would be to drop the fallback and select RESET_GPIO.
Using -EPROBE_DEFER for fallback detection is no good, as there could
be a valid probe deferral if reset-gpio is compiled as a module that
will be loaded later.

regards
Philipp

