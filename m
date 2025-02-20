Return-Path: <linux-i2c+bounces-9508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3DA3D553
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 10:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D84DC7A57D2
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 09:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C733F1F03C9;
	Thu, 20 Feb 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="hsLnC1K5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8B1F03DE;
	Thu, 20 Feb 2025 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740044991; cv=none; b=rMiATddkX6KoGRdHaWz/LLt9jVRJLtNvB03Y/DkwmmsNu5XXHTiwZUOrq+br2C6i3643F9jU7fFDwAN3nDZIpo+JeLxpi6lOelGt6LwjJqpCn4bUXCBw/XehoWlX+q9RIujokSX/VbJwh/IbMEEUpYTE5xKRE0s/Iu4UPvgtG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740044991; c=relaxed/simple;
	bh=ql5dyUwzsmgYnivLcSbAiC+k4nEzrGO6ammvLo/uFNs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQmpLf4AFGJC4SnK/57Pljb2BvMwBW+1DaCKtxg8norP6dKDjyZ2vvsRo1kDSPCQFHfcAd88nnGzkfksLMXldOiK5zmYys0lao3WxamTqJaXaRIWhkQL+4Pjnyg5QDubLFPuzkkgemDpUdBODNCOYrCulXAqaJX7aWM+yb0uGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=hsLnC1K5; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ql5dyUwzsmgYnivLcSbAiC+k4nEzrGO6ammvLo/uFNs=; b=hsLnC1K5q78HwAijmfQrsz7sQy
	98Kv/yILHk2lR8N1mro4X2N0PGTSjyWk1iFZ9yFWhqMmZBUqucdWMoMeqGIDoMZF6LhrVH4LWqCUc
	DLJyWEsYXDwb43jgAzD+r9kE6gJebd0N4MMHcmbh30jbpYA1eAj+cQ17EjQDQHcf8oAhya0zyk42j
	pzbtrno64PTIqK477bve9Nx9ZfTxRswAdFH87xiv8gURfw5NozPYlYL5JwSCAalSCGQmuY/ulVewT
	7dTtFaUZ9ApmmHGJiKdr0HS+RHB4Ob82Aldc8FdzOvOa+lDKqXsi25Hcd+o2sBuJNjtTcFmTS0Dr8
	LLzNM6Og==;
Date: Thu, 20 Feb 2025 10:08:52 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: vigneshr@ti.com, aaro.koskinen@iki.fi, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com, reidt@ti.com,
 wsa@kernel.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
Message-ID: <20250220100745.05c0eff8@akair>
In-Reply-To: <c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
References: <20250207185435.751878-1-andreas@kemnade.info>
	<c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pGvym2.eb.LfB7wXpsrzdqG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pGvym2.eb.LfB7wXpsrzdqG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 19 Feb 2025 20:22:13 +0100
schrieb Andi Shyti <andi.shyti@kernel.org>:

> Hi,
>=20
> On Fri, Feb 07, 2025 at 07:54:35PM +0100, Andreas Kemnade wrote:
> > On the GTA04A5 writing a reset command to the gyroscope causes IRQ
> > storms because NACK IRQs are enabled and therefore triggered but not
> > acked.
> >=20
> > Sending a reset command to the gyroscope by
> > i2cset 1 0x69 0x14 0xb6
> > with an additional debug print in the ISR (not the thread) itself
> > causes
> >=20
> > [ 363.353515] i2c i2c-1: ioctl, cmd=3D0x720, arg=3D0xbe801b00
> > [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, =
stop: 1
> > [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x1110)
> > [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR =3D 0x0010)
> > [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
> > [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
> > [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR =3D 0x0102)
> > repeating till infinity
> > [...]
> > (0x2 =3D NACK, 0x100 =3D Bus free, which is not enabled)
> > Apparently no other IRQ bit gets set, so this stalls.
> >=20
> > Do not ignore enabled interrupts and make sure they are acked.
> > If the NACK IRQ is not needed, it should simply not enabled, but
> > according to the above log, caring about it is necessary unless
> > the Bus free IRQ is enabled and handled. The assumption that is
> > will always come with a ARDY IRQ, which was the idea behind
> > ignoring it, proves wrong.
> > It is true for simple reads from an unused address.
> >=20
> > So revert
> > commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
> >=20
> > The offending commit was used to reduce the false detections in
> > i2cdetect. i2cdetect warns for confusing the I2C bus, so having some
> > rare false detections (I have never seen such on my systems) is the
> > lesser devil than having basically the system hanging completely.
> >=20
> > No more details came to light in the corresponding email thread since
> > several months:
> > https://lore.kernel.org/linux-omap/20230426194956.689756-1-reidt@ti.com/
> > so no better fix to solve both problems can be developed right now. =20
>=20
> I need someone from TI or someone who can test to ack here.
>=20
> Can someone help?
>
The original (IMHO minor) problem which should be fixed by c770657bd261
is hard to test, I have never seen that on any system (and as a
platform maintainer have a bunch of them) I have access to.
There is not much description anywhere about the system in which the
original system occured, and no reaction since several months from the
author, so I do not see anything which can be done.
Maybe it was just faulty hardware.

As said in the commit message, reverting it should be the lesser devil.
And that state was tested for many years.

Regards,
Andreas

--Sig_/pGvym2.eb.LfB7wXpsrzdqG
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT6OyBG8iTmbVOVWD8X53T0dSWG3AUCZ7bxJAAKCRAX53T0dSWG
3CEnAQD9YPchBZTlbER2pSZE6PR2QcdauLXq2J6xDhm69AFTVAD6AiOkdkrGCCLi
aYx1UJCBw1gI8VZjHqDZljSOEvWjCgY=
=OlEK
-----END PGP SIGNATURE-----

--Sig_/pGvym2.eb.LfB7wXpsrzdqG--

