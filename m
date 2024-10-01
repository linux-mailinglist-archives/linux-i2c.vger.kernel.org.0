Return-Path: <linux-i2c+bounces-7129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEED98B78F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 10:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 522ED280C5B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDE21991D2;
	Tue,  1 Oct 2024 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OR3KXQkE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7831E4AF
	for <linux-i2c@vger.kernel.org>; Tue,  1 Oct 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772661; cv=none; b=FdPO4ysLb2BXACWzXwV0hKUAFIMkEwLR0JZUnmH8n90qQAraWHc8Sk5chHBc280JJGx6sZvPiyNn3gIaUFJ8cNL3fb49rblwhhc3kHrgCyUC5chNr+LC1qvw8YRYngBr1mJiK/DG+7YKJzU6soayjAtn7Xbdo0zCMJ+Vd+DhnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772661; c=relaxed/simple;
	bh=+mRURdgeA55eONnLbJP8OYsskYc6v/qhIFWyf/8NktA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZ/SoSH1JkL5RXwp/364pZqUyHNid4ab0fLJLiVar275fk+iaT630h7d5jP0VySaKJZA5xMYf7IRwwgb0bWYQSpx1PZOGvdQVPFxTSJSHGcyuXL24tpoYieN9dEtwlVC2UbVhImj+Xr5mqL7cv1ojA1X+sfBG90RmcRvzdosgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OR3KXQkE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vRtU
	e79gslQ6cPccbZ9Ag935/rQxMyhWN9cftpvLzgE=; b=OR3KXQkEafYTN8dtTzhw
	eo4IVQbtLztezlazL+Fbpf2B55sRe9eJNlTKzkRoL8S5J1qlctseUvZic10t7KHp
	QstYrQWVN3NVpx76UuQ5EZ1es6sRH/LMFI72nrkV4RTdQl6Z7bYE8dQXZjs8PgP6
	jKruKRXoDdNHB4+GZl2V8wc6VImg4WUhQvzgOQQ7j5moabpVFBSKgbCrDxfeONU6
	NdVKOHY7avxhoGaubYf863atQ2EYKRiZ57NMkUMLHnQTDWz3iFamGQYinTNURDqQ
	rLt8rQGIhPydxyU7MxGamDhhuoG1RLCUcv0OAmBny28qCMI7uflA93I0UOOBxVnr
	VQ==
Received: (qmail 2454730 invoked from network); 1 Oct 2024 10:50:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2024 10:50:57 +0200
X-UD-Smtp-Session: l3s3148p1@Sqp7a2YjTq4ujnuV
Date: Tue, 1 Oct 2024 10:50:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <Zvu38H2Y-pRryFFQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43zjrHNx5Tjwq6OP"
Content-Disposition: inline
In-Reply-To: <20240930-uneasy-dorsal-1acda9227b0d@spud>


--43zjrHNx5Tjwq6OP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Conor,

> At present, where repeated sends are intended to be used, the
> i2c-microchip-core driver sends a stop followed by a start. Lots of i2c

Oh, this is wrong. Was this just overlooked or was maybe older hardware
not able to generated correct repeated-starts?

> devices must not malfunction in the face of this behaviour, because the
> driver has operated like this for years! Try to keep track of whether or
> not a repeated send is required, and suppress sending a stop in these
> cases.

? I don't get that argument. If the driver is expected to do a repeated
start, it should do a repeated start. If it didn't, it was a bug and you
were lucky that the targets could handle this. Because most controllers
can do repeated starts correctly, we can also argue that this works for
most targets for years. In the unlikely event that a target fails after
converting this driver to proper repeated starts, the target is buggy
and needs fixing. It would not work with the majority of other
controllers this way.

I didn't look at the code but reading "keeping track whether rep start
is required" looks wrong from a high level perspective. The driver
should do repeated start when it should do repeated start.

All the best,

   Wolfram


--43zjrHNx5Tjwq6OP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb7t/AACgkQFA3kzBSg
KbbIhA//Ttljy7Uxhv02Sw0YdoqPUtZsFIR23KbjziR44RebbxLRbKt5L+IjUEe+
Lz+UPgZE+IP7P1FzZacMYA/fMsosbS931LuTn9gWg0m7mIX5NDxfqTXH+SQvzxp3
RkIiu59iswjYd6t0EXGnajGIxlf9c+Gclw8BMHZ34pDRZ5wtysySDWFhNa6E5Y5q
rQtcLqUrG1VvzUy/sAh1elOVWGnpvDhnvBEWrnThyOshc09hkmFSTJo3IR5DRkic
M7ewHZHZ28hpVipEfvC4BuLBUIE2jtvY4jvkcWKY+arkMOsq9AC6kETJv95RDLMW
OrsgAxUUzPGPSL8BuEgS4e1Pltj1rWQyKR8808Lv+mP/W/MIZb4WJ+DU0TFuPgCz
siP/DvATuqj+e5wnan6qwxHhk01Mm2jR8B65AiZHUeWZO9OphsbfJZsLr3htg+S5
kiyrggrnxezIj9rZI1HpJ0MeYGEyRHnnO3oNL1yLoa2O1zNW74oUtBSPprnDjAaD
lrJeDIf0tQ3demUg20KDQI6S4Y5Ua2mfptOnWSe5gXFVWbteYB9Foe387/mDtRYi
lT2tElTdDJmTVEasg5t3cyuqpy6lUC0i+NBFhKkkvsLXHAIyZ9Uhfpzh+9eo7fDq
Lj1I0/4a4UGEgPCZdgZNgVlTAZGMDoBVDEIfqt1uDRy5e6JKg7Y=
=ORiE
-----END PGP SIGNATURE-----

--43zjrHNx5Tjwq6OP--

