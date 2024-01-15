Return-Path: <linux-i2c+bounces-1318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF182DE7D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 18:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A8C6B21F9E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E830182AF;
	Mon, 15 Jan 2024 17:32:35 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D95718042
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQom-0004EU-7Y; Mon, 15 Jan 2024 18:32:12 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQoh-00044H-MF; Mon, 15 Jan 2024 18:32:07 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPQoh-000A5v-1x;
	Mon, 15 Jan 2024 18:32:07 +0100
Message-ID: <289c4af00bcc46e83555dacbc76f56477126d645.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,  Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>,  Sean Anderson <sean.anderson@seco.com>
Date: Mon, 15 Jan 2024 18:32:07 +0100
In-Reply-To: <7f311659-9f49-44dc-ad40-977d34066d98@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
	 <CAMRc=MdcCZP5kgv7JBdy2m_naNbTSeq4MDE_3mk+1-5UD4ntwQ@mail.gmail.com>
	 <7f311659-9f49-44dc-ad40-977d34066d98@linaro.org>
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

On Mo, 2024-01-15 at 17:13 +0100, Krzysztof Kozlowski wrote:
> On 15/01/2024 17:06, Bartosz Golaszewski wrote:
> > > +
> > > +static int __reset_add_reset_gpio_lookup(int id, struct device_node =
*np,
> > > +                                        unsigned int gpio,
> > > +                                        unsigned int of_flags)
> > > +{
> > > +       struct gpiod_lookup_table *lookup __free(kfree) =3D NULL;
> > > +       struct gpio_device *gdev __free(gpio_device_put) =3D NULL;
> > > +       char *label __free(kfree) =3D NULL;
> >=20
> > I got yelled at by Linus Torvalds personally for doing it like this. I
> > know this is a common pattern in code using GLib but Linus wants auto
> > variables to be initialized where they're declared...
>=20
> Declaration is here. Initialization is here. Therefore this is
> initialized where it is declared. What's more it is initialized to a
> valid value, because __free() accepts NULLs.
[...]
> > ... so this should become:
> >=20
> >   struct gpio_device *gdev __free(gpio_device_put) =3D gpio_device_find=
(...)
> >=20
> > and same for the rest.
> >=20
> > Don't get me wrong, I love cleanup.h but there's a (unofficial for
> > now) coding style.
>=20
> So you just want to declare it not in top-part of the function but just
> before first use?

IIUC, Linus wants exactly this:

https://lore.kernel.org/all/CAHk-=3DwgRHiV5VSxtfXA4S6aLUmcQYEuB67u3BJPJPtuE=
Ss1JyA@mail.gmail.com/

[...]
> >=20
> > > +               goto out_unlock;
> > >         }
> > >=20
> > >         rstc_id =3D rcdev->of_xlate(rcdev, &args);
> > >         if (rstc_id < 0) {
> > >                 rstc =3D ERR_PTR(rstc_id);
> > > -               goto out;
> > > +               goto out_unlock;
> > >         }
> > >=20
> > >         /* reset_list_mutex also protects the rcdev's reset_control l=
ist */
> > >         rstc =3D __reset_control_get_internal(rcdev, rstc_id, shared,=
 acquired);
> > >=20
> > > -out:
> > > +out_unlock:
> > >         mutex_unlock(&reset_list_mutex);
> > > +out_put:
> > >         of_node_put(args.np);
> >=20
> > I suggest reworking this to use cleanup.h as well.
>=20
> It's independent task. This is an existing code and any refactoring to
> cleanup or not is independent thing.

Seconded. Separate cleanup very welcome, but this series is about
adding functionality.

regards
Philipp

