Return-Path: <linux-i2c+bounces-6898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC697D57C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 14:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81AFD285017
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 12:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A0C14B083;
	Fri, 20 Sep 2024 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L9xIfOZM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA36C1E4B2;
	Fri, 20 Sep 2024 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836092; cv=none; b=X/v/3D+3GTD7mPM/WU1ivHpAwhbsFsMuGHu9JvLtC6wkGEqv3qASZPb1iozftm7SuKNsv6hpXE5Cg1J4v6IvJdY+8k9s0PfQUcK0m0v+PPWtz+DQx9EvaTsLB/BQg/4jkvFm/w3nOl3KB3bwp2tvrJVDbj1cCThF4ru/hDpdFt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836092; c=relaxed/simple;
	bh=R14GhD2eaVZfp2uc0mGxJshVUGI/gdpLqg2gi2KI2oA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGlfWYNqVrfOPUAiuot6yOGp9+EhlyJAtblRO+DzJY8lfgpTiECo/S99DIrII/v1C/GpkzUhmfTpzTnzVvqCaFhoDGuvUeTRgpMpjuMIJkdsB23jz0RRPqqn5cbW+jyaqTa8qDfBPUSCJqEjVyMiC4GHRW2a4FJ5ibWPJeM33Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L9xIfOZM; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C7A1240002;
	Fri, 20 Sep 2024 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726836081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4z60SE2ViWubCiF9T9YXND4B8XSD+ZrhuspMHxaZeDA=;
	b=L9xIfOZMdADxBU5tb7Y+HnSz29RSLs2C9Lcaf5/ZLpVdIcBRoZ78ytthsx7cliSyoCjcSP
	noM3Xeey3TAexjLF9D65RjZGTvfkVdrfaROSn7Bc90b06kH5QzGRFDMfuz01ykzpm5dz14
	POMpfTtzdX4geORYZTAs9AkwvIfzZwiLKdlSorhFAcDeRKsfQ183e51HmpS5Mlsq1jJB6C
	lFPlPsiJFc3YawN6eFHFRAJDmH/prDVCJ46Y+ylMl8LOtWx+X3rPZ9EAM/RYlsNdVyKikG
	kCBGcOQYZeT9IYwt+d5U+60OHXw9YuJeUFVbWfL5Ezs7IlutQCNKmQkIZ6mq9w==
Date: Fri, 20 Sep 2024 14:41:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Paul Kocialkowski
 <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 6/8] backlight: led-backlight: add devlink to
 supplier LEDs
Message-ID: <20240920144113.427606a7@booty>
In-Reply-To: <20240919124323.GB28725@aspen.lan>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
	<20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
	<20240919124323.GB28725@aspen.lan>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Daniel,

On Thu, 19 Sep 2024 14:43:23 +0200
Daniel Thompson <daniel.thompson@linaro.org> wrote:

> On Tue, Sep 17, 2024 at 10:53:10AM +0200, Luca Ceresoli wrote:
> > led-backlight is a consumer of one or multiple LED class devices, but no
> > devlink is created for such supplier-producer relationship. One consequ=
ence
> > is that removal ordered is not correctly enforced.
> >
> > Issues happen for example with the following sections in a device tree
> > overlay:
> >
> >     // An LED driver chip
> >     pca9632@62 {
> >         compatible =3D "nxp,pca9632";
> >         reg =3D <0x62>;
> >
> > 	// ...
> >
> >         addon_led_pwm: led-pwm@3 {
> >             reg =3D <3>;
> >             label =3D "addon:led:pwm";
> >         };
> >     };
> >
> >     backlight-addon {
> >         compatible =3D "led-backlight";
> >         leds =3D <&addon_led_pwm>;
> >         brightness-levels =3D <255>;
> >         default-brightness-level =3D <255>;
> >     };
> >
> > On removal of the above overlay, the LED driver can be removed before t=
he
> > backlight device, resulting in:
> >
> >     Unable to handle kernel NULL pointer dereference at virtual address=
 0000000000000010
> >     ...
> >     Call trace:
> >      led_put+0xe0/0x140
> >      devm_led_release+0x6c/0x98 =20
>=20
> This looks like the object became invalid whilst we were holding a refere=
nce
> to it. Is that reasonable? Put another way, is using devlink here fixing a
> bug or merely hiding one?

Thanks for your comment.

Herv=C3=A9 and I just had a look at the code and there actually might be a
bug here, which we will be investigating (probably next week).

Still I think the devlink needs to be added to describe the
relationship between the supplier (LED) and consumer (backlight).

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

