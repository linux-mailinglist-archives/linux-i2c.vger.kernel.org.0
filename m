Return-Path: <linux-i2c+bounces-5395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C625B9521A7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 19:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45AE1B224E4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 17:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677BC1BCA19;
	Wed, 14 Aug 2024 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V2VhDOQj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E309B1BD000
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658273; cv=none; b=mIEu838AKtuB745zkBJUVSqDK3hRyh895F5L0+gzqr9FZs0jMpugVFb4G7C2X3koZOKyvHQtx9Rb/sU9qraQejzlHO1gFUtwDJBm/B7T83g5W5uh4Idi4E/l33Ofd+DJspnpGalF1TkV5nnXJss7WY+z9+ic7dwekRxePhzbyDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658273; c=relaxed/simple;
	bh=g1AR0/vLsPUhf8e8RmulhJTIF1DTc0hoVCJ573rFeMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwhULLNmEPiftbiEJVaaaNMIANBv+qK618QjZbCgS6xW748eLBusGJdAs6fxgSJRLldcFihSvIM0dsX83Csw658UvCsTHqUIbXfMjUnR4C0cZrVnHO7mdc+uIr0X1GQRfCIjOu6GOCaVmU5i2zOa6J4c9/etkMaRtL+Vtia31sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=V2VhDOQj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=g1AR
	0/vLsPUhf8e8RmulhJTIF1DTc0hoVCJ573rFeMM=; b=V2VhDOQj2dB7H6YAQwF/
	xmkW/5Xco0vt1YiZb3lyAYVATTnbKY+6D0bSTXHJJTUciLGgrrGE8T9jR0EKMhij
	aaHwek+QWed7kXHzJqAdInhj1ZQC1pqz60e6BayCJX0qUKJ4FZ63JWxeStgGdT44
	ti836BGFAXK8W0kT7GekrbYVIpOIV8EozBSXrfkGIxo45C6LenRuWEqKO+00Qt8T
	2VNrKD60u3mtn72+5ZxGdeGx5ffY+7pQhLO5/8gAhIvrDRzp/FA+qLEERGod6wD4
	QLwvYOJBo7t2ogTlO7z7CsvM7mOJorMUbAOv9UqL9hXqDMyW0ilbXja8QIg7y0hK
	zw==
Received: (qmail 2060345 invoked from network); 14 Aug 2024 19:57:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 19:57:48 +0200
X-UD-Smtp-Session: l3s3148p1@IZjGdqgf4JIgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 19:57:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] i2c: testunit: return current command on read
 messages
Message-ID: <ZrzwG981HvC0Jsga@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
 <20240811212317.16119-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MsjtRCeo7UHaHX8a"
Content-Disposition: inline
In-Reply-To: <20240811212317.16119-5-wsa+renesas@sang-engineering.com>


--MsjtRCeo7UHaHX8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:23:16PM +0200, Wolfram Sang wrote:
> Because the testunit can start tests in the future via the DELAY
> register, it may happen that a command is still pending. Support
> detecting that by returning the number of a command in progress (if
> there is one).
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--MsjtRCeo7UHaHX8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88BsACgkQFA3kzBSg
Kbb3Yw//dYYehwYQqGZM/fuS4uvjpEaUb6aW2jHWkN2mCvAp5netUpThdNRtI9Xb
TVl/pMhViBdewh8FCdf1eZcG3irrl+SvcuEsCyihUABjfCGxv6ec+rTOYn5zlMZB
qeY7N2mBuaH7RhFOl3RnH8NGhFErVhsA2sT7DisoEcBDQxiK3VvyXziIO/GCy2Al
zXp0DquIqht77oEFCqoljKD2GokKusxZsXCjOJz4cLNQbcT6ppHAz6fs84G7NtHc
XKkOjeK5VVpsdTOUSXoHOwDOWWedDr7D/mMRlMJpRdMNLf1T//h1lBD7FpOceJYi
9Kryr9YGuVauo1X/dre0PKSFnPW7Xc+/e6ntjVqXeVc2T1DWX8yMb3ZulQ9Gh6Zf
DXYQskP801L/M97oTKR7MODGPVRGyjbtSMLtNg5506OJeq/guTnZ+78ESFXDvSqT
ce3gTamGVL7Wn2geKT7F7sqCFjhZpYiCPyZYhXU7/t4FqhoaOZpHpscss5ShE50r
JvMZGLM6IvObiNbNhPLDGP5Afw712sYwA3mAHyLrp/n0rZBzfdEfwO7go6wBjraw
U13nQs5tWuAUvDE4XVM1nK+4h0niJBr7K4zK0nyRThVAMPV1uUO5SuaS8hikjkrk
HjRm7ceLi7fSMHT9C4psPbYqxeTfDNG4TokYg78xD4bZaetBtQA=
=XlY5
-----END PGP SIGNATURE-----

--MsjtRCeo7UHaHX8a--

