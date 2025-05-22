Return-Path: <linux-i2c+bounces-11101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8FAC04EA
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43E418928AE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 06:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDED1F151D;
	Thu, 22 May 2025 06:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jR+F/rxo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748ED3BBC9
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897061; cv=none; b=tElhij1ov6Le/N/9dmsNCw5jbehA83G3M/kvdvTKv1j2uscLtcjjHC6Kqan8+nabm+BCV8dkAAGpXHyzUsccxKG2lb1T20UhesASBwkhh6EEW4Mu3LywcldGaNqF9Lddt4x7GFmwmF2rTbe4NfFVcYmigEMtFVbCKMOTggBEtIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897061; c=relaxed/simple;
	bh=lwTj+kwD88lf4sDXs77K5GCvwgzFI1BEY+NCuIqYLcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZ9CN+ePW2otpN6kVCMmaPuRfj+P4R2HspkKQuh+FnLdX4HIDZRSEhxsI75yhHQB0UTREnbbbAuhXZTGGWI8dWSrm6IIxSpqzkBjqIJ7yB1rc7mqT9G9/DarqF8oUqM/ejD9+eXuFjbr+PqEKPdTxewJPx7NqCx2FARCS7Hvg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jR+F/rxo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lwTj
	+kwD88lf4sDXs77K5GCvwgzFI1BEY+NCuIqYLcE=; b=jR+F/rxoXRdAbJ6bZYL+
	8P2MHfBdLPeQm9MURvLd8xxqYCxUs7MG/J2j7GN5PhgzD4Z3KAogQSygaZdPr0Bz
	TS4GZDF2OBdk/Vh9WPVLH94SmoQL0czQC6753MWf4osDqRWPI9FuREEkn95zDaKa
	2LZeYiGWY0AyBe+erE3oxfI1KYD+1dol29Ynb/nDnhzixBxXNFiiUJmb1W5DUtH9
	1OdSZEwv6rbzoEd8+l1fETVR0oFOIRKJ14DK+LlrOC3avg/rhVg85Dr9JvnEyWUY
	dwFtcCoNGXKRxaVB6L9vUaSJCpV1bNK179jccPkzGL0gNV24/m3VT/Qww8GT4iWq
	Vg==
Received: (qmail 3538860 invoked from network); 22 May 2025 08:57:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 08:57:37 +0200
X-UD-Smtp-Session: l3s3148p1@1bMx/7M1prAgAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 08:57:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: robotfuzz-osif: disable zero-length read messages
Message-ID: <aC7K4J5zz52KBGYM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Andi Shyti <andi.shyti@kernel.org>
References: <20250522064234.3721-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rBb3F+D/Tl6AhZtL"
Content-Disposition: inline
In-Reply-To: <20250522064234.3721-2-wsa+renesas@sang-engineering.com>


--rBb3F+D/Tl6AhZtL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 08:42:35AM +0200, Wolfram Sang wrote:
> This driver passes the length of an i2c_msg directly to
> usb_control_msg(). If the message is now a read and of length 0, it
> violates the USB protocol and a warning will be printed. Enable the
> I2C_AQ_NO_ZERO_LEN_READ quirk for this adapter thus forbidding 0-length
> read messages altogether.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: 83e53a8f120f ("i2c: Add bus driver for for OSIF USB i2c device.")


--rBb3F+D/Tl6AhZtL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmguyt0ACgkQFA3kzBSg
KbbEKg/+J4bpbPsnwtcmA0QVeOdLVAZBW/qy3SISw0RO0fIGOwumwqTgg7HPRu/i
uDFE0l5/sP8+bWYF6ZcFJ1Q5OCQJUGmyrnVoKmSvc/e0eIGNhs7VcbOYSkqTEnYD
ah8UHsEvJnxyTYmyya3+YN9gnRIiV2UA+rQgIODYeOHi069aw5xXHK13CwZoBUwp
l60WmNnkl+BnTP7a6tuAi4Enhs1VC/7t33xFHivYQYwpqSHS48GPjdtVtfyg1T1G
HMcZdk88t8YoNng08fM3y+Oqj2nld6gNaqD60N9oqA8hoUV+fQ1eCVD8QS9Arv0/
6nrM/Ak22GhKiyF0gbPXFc922MmzkDEm5mGF2wuIQ/DjgxwubiItZPezfHcdUw4F
ks4fvGOW4aDBrqGzk7ET9hnFA/G4Db9DX0I2vhaV/whEeBJiMcZpSMcMiwnadWhL
EDdkQyvunP3Aslmv5UwywwL0FBYJj9N6SUcpixJrFti3L/hEI7mY29HcPMsyx/0a
aMZ5GxTU9hDcMFYlpZfAAHHBB7xNTgj5MJjwxkAvAh9zpkWyQog40hXQQRtsHcHq
/ThXrgiBxKSf5cTI4uIMkOej735EYabxmNSnJ1+SKwXRq66O7xOQXFqQlvoBaEEN
XSZcz7HPChhbDwxmRhikLeKlgF4YYusc62KrEjs9xuxp1OwqITw=
=cKnE
-----END PGP SIGNATURE-----

--rBb3F+D/Tl6AhZtL--

