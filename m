Return-Path: <linux-i2c+bounces-9617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B37A47A9C
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 11:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 206DB3B42B7
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 10:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545A422A1EF;
	Thu, 27 Feb 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XbZvj3ea"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6820B21D3E7;
	Thu, 27 Feb 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740653033; cv=none; b=PHsbgTY53M1DHp2o8XPXfv6c0Q6J9yBFpDmfPJFUu+HFSNeW7HP1F4ciZZ7io3OK468BKQ3jpA3PmNi1NKN15M7MREEL8IW6Fu+vfxW7Xm1DCWzAmfWIjzWzpvZIFYAFzf5NvWLAqI493luZ7MLTXD7FOpZfcjigly5itzPXnlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740653033; c=relaxed/simple;
	bh=ETwdDOtFOrakrghWy56GNhC/hHnp2ekIYkGwcXPrWBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eH30glhB61Dxj+Z41hgrNMeM2UicsKBafrCLVrwDSA/wLcWz9mK0J+1BpweSUSDFNQdM43uusu1tYIqcHYUZlxmJ7rufy8uVw+P4/QcEuOtC9dcjls15kZME1cqUhCWqD4x41wXAuSL9sfHHtXUjWf5KPhg/7SeP2wJUiNOnwv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XbZvj3ea; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9F364326B;
	Thu, 27 Feb 2025 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740653028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETwdDOtFOrakrghWy56GNhC/hHnp2ekIYkGwcXPrWBA=;
	b=XbZvj3ea1VxZ6LFwyFUD5LQvtI6D6skIomejZBrw6pbBj/fMVCaUr5SQPXiVhlcTrgoaz9
	LflljhA9TKoJf60zTRIMQckLHfhM1wbwxtnMu80jg1Zn3N+xzpNmkf2HZ8WlPNL0oj33L/
	3rekvaOixbAz1kJ+pZxkDi6Hj9UDhAG2WhnjmdNXgPWPkmYCaklEtmFz21pBzw3Od87BAX
	88dLwONErcS8BgyBZop9DrAxBbHE/FWYoYTGrQ8up7FXLJBHvDhlmZmzfFhDSIwM0W4LsJ
	PJKCZVrYk2zXjFmK3D3o8zoHkRXTlwIxURe+8klC08j6+p7clsQUzlBBOXEMzA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 2/9] i2c: atr: unlock mutex after c2a access
Date: Thu, 27 Feb 2025 11:43:42 +0100
Message-ID: <2388582.ElGaqSPkdT@fw-rgant>
In-Reply-To: <20250225113939.49811-3-demonsingur@gmail.com>
References:
 <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-3-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4992291.GXAFRqVoOG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjedvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteevieelgeekteevgfdtgeffvdeigfdvveekhffgteeiffdvvdekudejfedvgfdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopeguvghmohhnshhinhhguhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepfihsr
 gdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart4992291.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 2/9] i2c: atr: unlock mutex after c2a access
Date: Thu, 27 Feb 2025 11:43:42 +0100
Message-ID: <2388582.ElGaqSPkdT@fw-rgant>
In-Reply-To: <20250225113939.49811-3-demonsingur@gmail.com>
MIME-Version: 1.0

Hello Cosmin,

On mardi 25 f=C3=A9vrier 2025 12:39:30 heure normale d=E2=80=99Europe centr=
ale Cosmin=20
Tanislav wrote:
> i2c_atr_release_alias(), i2c_atr_destroy_c2a(), and c2a access, are
> protected everywhere with alias_pairs_lock, use it here too.
>=20
> i2c_atr_destroy_c2a() accesses the elements inside alias_pairs, which
> needs to be mutex protected.

This looks like something that should be fixed in my FPC202 series. I'll fi=
x it=20
in v9 so that you don't have to do it in your series. FYI here's the link t=
o=20
v8 of my FPC202 series:=20

https://lore.kernel.org/all/20250227-fpc202-v8-0-b7994117fbe2@bootlin.com/

I'll put you in Cc of v9.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart4992291.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAQd4ACgkQ3R9U/FLj
285GXBAAnbIDwVvS1NBBDdmmOAkUiV5IzCtoOi2nmS0DEww/s0ACzVFLXeOkRPIW
3EnveYKSWjmTanG0PGYlz9pgcQUI7aF1db7+nc3PQMNnmg2cwCXaVZuyKP4D2+R2
sH++NYDYduzKqCh9T2p7OUOaKvhun1h0WDboaWY0SzW+XX5EcUiTINFaSaJn5T3p
Lm70o/Z0jDhPCgfD4+Mr78q7EW7CvKj5gGau55deiZQxWBWZvNA7Aw3T3K5A84OR
6OQnNw1Qsus9fG4kmeVjFZUq7gjEs3DQgCNohO71fPWCcp2NnQ+s6PDmagnJ48Xo
DtX4fe3mL/mEEXXnUCy81dWIGfrnxOv2PiDBa2lIdbfXmIcVEcSeq4nkYg/IlzOj
ibm1Mkhuvb0llGMRdhZA5Z4yGHuDv92RxixvpHyMoXgKYkX48NVa4NNu5BqIxAIc
RsqtqutPbbZ4BmMaCEH88ZEeVBgeWFapaaTnq7efKJ/ZvkSecbqpuKySw3Rj7H3l
rjB8kkcV0yMNUoeeckBBLRwK+sXIpRKsz5Z12VujhstA0XKGQ+jz+/694wTOrMiG
8AMEjHTgz6bOtCph1l7Dc0HnR0WbzRmrCffpjzHTu0D2ikWO4AcBBaiB8Wc/rl7A
xgHKOWygbHzor5UBhtJTivQBCIozuDLOtuGD2c2ODi99ui+tPu4=
=YIka
-----END PGP SIGNATURE-----

--nextPart4992291.GXAFRqVoOG--




