Return-Path: <linux-i2c+bounces-12880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74DB535FB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 16:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77900488304
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 14:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080B4340DBB;
	Thu, 11 Sep 2025 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k9acTOFS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028F926A1BE
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601792; cv=none; b=p7WlMO4B01yaB/p58BNXXs/BfWD2xzsEMBnE2eBXu/q/EeBkPIoLPTQsccWlCuQZuy8u3okUJrhDjPz5abvaoxBwd04+9ym1GSMyUDP8cNV1oD2Ld/8seXwFEzb/1jay9f9KWKWPKuDSzLGD8akpjfY1buYHB9C5H+XJCJ+TOUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601792; c=relaxed/simple;
	bh=72IiQUsPXoMJq5hAR0wcPhwXrau91fca7fQ408J4nl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnq+a4dhhA2uCrPa8268KmGajXMF3Lqr9rwkxnRYCvmHzJimV2iybb34HyesLBQLGAD/WJG6IosTYdYfGMHcpvN/EC3I9fXxUBT4HODX5IzkpohmshgHHb4o/MsAp7RJSiZd75k8pU7KS5XMz5xfD91Wm5MM6DEBCMqrd93LQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k9acTOFS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=72Ii
	QUsPXoMJq5hAR0wcPhwXrau91fca7fQ408J4nl8=; b=k9acTOFSwd0N9zSy9Oxs
	ohOGSYqJFYqgyrRQeZFSo8yiNFv/ropt/BJ4rnrJVibg5WAW2Tpsl2PulHwyccl2
	EQgCSU1ba+mIuESJds/Ufi6yj9NQO7guUtAt1LE+BIDDU4sqSj48HmSFQaVUEITO
	Jk4fxUOVG/AhnAbKhv1fvWKV4r8bzHg7YuMqs3P0i0IRq1edyejrx1zIXk7LrN/+
	5/rT2p5jTECcGD+Cgb+rV6K9McDVxEDI9vM5lsA4koOOS/m4On6lZ/XraYKQEtbj
	bCqgIiluDBj+E+dljnt/nrdwWmbKPoy9kLeD6Qo8vbXG5nkBJ0dC8QjXm4lTlmH/
	sw==
Received: (qmail 1019085 invoked from network); 11 Sep 2025 16:43:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Sep 2025 16:43:01 +0200
X-UD-Smtp-Session: l3s3148p1@HaDOjYc+zpYujnsE
Date: Thu, 11 Sep 2025 16:43:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i2c: Add Intel USBIO I2C driver
Message-ID: <aMLf9Nj3hF4t9rQH@ninjato>
References: <20250910133958.224921-1-hansg@kernel.org>
 <20250910133958.224921-4-hansg@kernel.org>
 <aMHznOCa_9vtW6_1@shikoro>
 <4e2f79bc-2827-4db9-bb2b-4a330cd14f2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bsepv0u1s7GMfX7n"
Content-Disposition: inline
In-Reply-To: <4e2f79bc-2827-4db9-bb2b-4a330cd14f2d@kernel.org>


--bsepv0u1s7GMfX7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > How did you test 10 bit addresses? I have never seen them in the wild?
>=20
> I did not test 10 bit addresses. This was there in the original code
> from Intel.

I suggest to drop it. There is no code handling the I2C_M_TEN flag which
should be handled if support is advertised.

> So I'll add I2C_AQ_NO_ZERO_LEN to the quirks.

Ack.


--bsepv0u1s7GMfX7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjC3/AACgkQFA3kzBSg
KbbDUg/9Gk2G4vWSrykXFqKNb8AMMd2P8HsNCzQKlfLni2gtPRwzPgSZqSLCHFDc
/qM7G7PIxgT5/7qgFfWVR1jK2QGt4XSQoW6Mysl0yZd8l3rAlW4Ukr1lBSL/I0dR
EcoOHLy/3T2k965QHz55UIRXNiTB6F18g8AihZv7EZTXkrzp4UHks0gf1fQa5Tj5
P5S8UKQbS6KCyhw/dvCzos3B0cxSRxtV7pIafNI7CMJUaXWS6PVe5rUQEfyLzUbX
CgYLzHe5zaQAJCJYrrrn76fnEB4NwXWwi3p7i2sAY3w1+3zi84vDgYtk7XqCQnl4
yyyVSfkgwPqquddPzqCc+FMhgp2CapFdQ8lZnzF4VZ6E8ANzvr4S9Tbk1S+ALEHB
k0G7D2Y8Qq4vUqhHAvxp32DuWaRCM3KluTYoWPaMxRd/YrM6gfYFAX26PgACYren
ZmieofajMYD4ZYXQqoeKLywyRVx3MH2QAbiKybVDBXOZXERjmWxAAGju31NkKcAP
jgxcpKVrPzwmnTKEF/apQ5UrF4Yi7JjvcGlmhJmILnbMiCmE20nJDYqlkgPxKTDI
xmKWxYX3s9mgJD3PxZo/uxQRVaHfAnLgWQBTaZ6slNksGioi9gU5l1v2UdSlJaqd
pjxPkWFu+T6VR02IE7qKB64RTA+YsaAZDgtFlVza8WClsSt7N18=
=BQwX
-----END PGP SIGNATURE-----

--bsepv0u1s7GMfX7n--

