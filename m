Return-Path: <linux-i2c+bounces-10740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC7AA7502
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 16:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92484E1F75
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 14:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CAA254AF7;
	Fri,  2 May 2025 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cH01l50j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D6C3398B
	for <linux-i2c@vger.kernel.org>; Fri,  2 May 2025 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196384; cv=none; b=Ojp4MmVRlWQ3XlFIPjfwb0XlAKplbcKNa8jug9hNvJtH1vs1DpLSzoDwjYYefl55WOol5lrOC9PfZFFEQMoxcMocAzJbIxX9n3o4/ZGLQdjkiO8d93JCnPTYFz685aZPVnGuO7WlGeBBaPGa9DuMbAuSTes/1OJFhmuGeTOifB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196384; c=relaxed/simple;
	bh=KtbLasPz5LjPjek7oqwEZqrJPPilE284LnDl4n7NMCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhKR71JoSwpANB3GoqaNokAlW9JTF4Weog93knwTqUJR8HsJwYjlXLiFdiCQktJ28Aiwhyg/m8Y0ZsjdeRQb1nCW9GOIqe6BJBs7eUbyYm2pWxEETzSRBJ7olPmEqLvZkbWec6APlfu15k/tQKtzfd98b/OeQgXaFe/c5It37H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cH01l50j; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=j9SL
	XVtuAhp/oeGZ5KqOEOzkrxPtMVlVq47SbKT7Ckk=; b=cH01l50ju3erEO95qm6q
	7+Ei17jnc2HtD/8dw2+A33FkvIJ2h1pW0G5H+ZILaVisGHXzD4jsEebI7KlEN6LV
	mCgeYWy6+GZtUYvqz4nRCtJSdjhdg9rWklFptLuMmIWFt3fHKhQT2OeHQUDsQlVe
	E/xKx32O4JGZiuWIYXCsAuURCbSLDLC+LXMZrNoQHaoMfRlIUhSNakjYEarFzgeQ
	m0TRfoFx3cxR9AVpE0QJAD672fJ6k99k/XKCZW3gBU4LV0Vbk8vijd33Glo6dvso
	LKAaCrSEpQNnrNQg7JhAGsNcUKSvqjksih3Kn363VWeatoeUPyMR6iItz5DueiXX
	Dw==
Received: (qmail 1480956 invoked from network); 2 May 2025 16:32:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 May 2025 16:32:53 +0200
X-UD-Smtp-Session: l3s3148p1@VyiCBig0MMoujnsd
Date: Fri, 2 May 2025 16:32:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.15-rc5
Message-ID: <aBTXlNJMM-eNR9LV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <nflt7kb4vjqzg52g55lpyp7yvbbuwdj3au6xecuufojtucbhqp@visdczivr45s>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1pHgoB93OdiXo67k"
Content-Disposition: inline
In-Reply-To: <nflt7kb4vjqzg52g55lpyp7yvbbuwdj3au6xecuufojtucbhqp@visdczivr45s>


--1pHgoB93OdiXo67k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 10:44:51AM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> only one fix in this quiet week's pull request.
>=20
> Have a good weekend,
> Andi
>=20
> The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add53=
0e:
>=20
>   Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.15-rc5
>=20
> for you to fetch changes up to b1852c5de2f2a37dd4462f7837c9e3e678f9e546:
>=20
>   i2c: imx-lpi2c: Fix clock count when probe defers (2025-04-29 10:18:51 =
+0200)

Thanks, pulled.


--1pHgoB93OdiXo67k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgU15EACgkQFA3kzBSg
KbZBXQ/+Itk6vOKKfwOUkyZWu5OinQtjrs9FP4P3zS/WCTp39bboy5l+WV9BE5lG
VyB1QJx/kbAZH3vieUkjFpiqePT6gJjXAyyhhr3EqNCHZJk6joh3NWfsec6IEghN
C2eocUva4Zu+VAyOMNtVbSyuBRdrm+g6oDTsqSvXsAPa8q3nnfP/nTP5/G63y2wC
LJ+1RbGrbY7I760HMNY5WUMsa+Tdkz9KKMZWQoPfKyML7/WAI4UgL5HVIrzbR7oW
6LClnJxk6j9qo+u/Lq3ZxhMROOyjEAn14h/Ow6v7oRXAXYFsvp002vHsvUIMpgdh
a1sjbNQRHY4u+y20zyQExscWtqBr0vpccmt+vngesx7Mt6Vm24TJYt1aw82DCGqo
RpSiU4hugxX17Xay1agnC0ojXRMpNHL/26EUrwgFtl8X+8CIFaRNqBQ4YihCZpb9
LJich5bezMo4e5La2H3pKbVCrxBuZ80kOJRPVRPkueZJHIQj1Gwmnt4sKK1fkdCf
GgyTrIpXHkZOglU+CiqdP+lzI3GO6Oc9N5pwucC46fim8kCTnQ5dKgGKQb031Bn9
dVakB4z/jDUYGPk/WcLyeHR6efywHsOMCySgSGhETk84yZb//76MjduGcp4iG61o
CV+/QcSclaP2hp9tvcX7PKEaNVFYf6UcaKdLbT1FJYVt0ZDdA7c=
=829Q
-----END PGP SIGNATURE-----

--1pHgoB93OdiXo67k--

