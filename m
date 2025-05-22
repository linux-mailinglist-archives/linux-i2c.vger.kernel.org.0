Return-Path: <linux-i2c+bounces-11102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A3FAC0508
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 09:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD6E09E098F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 07:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19623221F00;
	Thu, 22 May 2025 07:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M7+vUIKW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7022156E
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897218; cv=none; b=tzgDQ9XDncUav6zZpnBocRu6nVnl1cvg/0L3SEdBpK021/vg5W9uxgHEC8qB6KrQA9he5D7cly/vjwiQprH1YVEXqiZnj/P+q7rMpILdCjgXqgNYkHdRg3PPEu3MVlwTK0aIzwihDSIiNH2mIya2Y9MFybejSmVhmzIMxhS0o9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897218; c=relaxed/simple;
	bh=5jniAK26gbVBFrfRfJvxKyYjJvf8WPsvbSxy8AQKeeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrI4iZZaTF5ovag2hwuzNTbs+sWwJoMLGB3kc+Q4L6RLlEaOLNmlANV4jAEkr7WFm9hr562/rX1sKJrpgkuRlEZDV78sGaHDnUP9DCGzGHQxLdoptU29UErN2KHzsciZlixyTGVR5whQDYjX3+t1TCfZlznIo+N4Q/cvj3q6z2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M7+vUIKW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5jni
	AK26gbVBFrfRfJvxKyYjJvf8WPsvbSxy8AQKeeQ=; b=M7+vUIKWTFqoYcCjMoCP
	rMVmuZ0zYvMDn5HbosY5v/j1KAXG3fdt3vDe1nDlqHRpJJ6qkEj1RnjqCSGgsDNI
	cQYNjab9gvRZ7ie7LtvfjFHN586KZO+2HVl/ckf7c0sUcL++S03TTu5/JnoYMg5B
	utfiAUgTnNK/scB/iDhnbzXtD9llBwyEyRxsTLmERyft2dvokytRPfMpKTLISdlv
	Z5ajaCEGK0wJpBoKHIHRHu54XyWlRdkv/uQE6M/m5YtJinI7gAlaYB3eqy/Q5RbA
	kduXuGKll/nGsy040ur8ISmvAyN2+Q5TR3eHrF5o8qS0MM+GS+HoaRFYWKBm/I1t
	pQ==
Received: (qmail 3539744 invoked from network); 22 May 2025 09:00:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 09:00:12 +0200
X-UD-Smtp-Session: l3s3148p1@eLp0CLQ13p4gAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 09:00:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: tiny-usb: disable zero-length read messages
Message-ID: <aC7LfOYdq49yDsDt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>
References: <20250522064349.3823-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OVxl/HPxHSWgap/6"
Content-Disposition: inline
In-Reply-To: <20250522064349.3823-2-wsa+renesas@sang-engineering.com>


--OVxl/HPxHSWgap/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 08:43:49AM +0200, Wolfram Sang wrote:
> This driver passes the length of an i2c_msg directly to
> usb_control_msg(). If the message is now a read and of length 0, it
> violates the USB protocol and a warning will be printed. Enable the
> I2C_AQ_NO_ZERO_LEN_READ quirk for this adapter thus forbidding 0-length
> read messages altogether.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: e8c76eed2ecd ("i2c: New i2c-tiny-usb bus driver")


--OVxl/HPxHSWgap/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmguy3wACgkQFA3kzBSg
Kbbb7w//dN2u4Qeor4JAhfVsNoEzh2h99fVMpyft0Eo6UuLtGok5OXTESRTLIHLB
V7O0aNN7vJQ7ozP6Yy0gqTxh+u6SxNxR6XBz3Fjen8mk58acqnKvrHTzeyJ7IGYz
W+moaxbdW1pQdndRZbzbo1kImf48HcqnF/gsxFwnZe4o+Y9OMH6uKrdRfve/mY91
myHSoMdY+DEWzxPMwScXLp21ynFFi3JTOPXACAflpRttM829G+hnV3sXopZX8Q0E
JAGE42q1oZChvmCPCw3t8oAKgsPL9p1uKnJE4T7fQLvJ3aceuEwEA+zkeXTplqp+
H7jqS3o4qbuObEQtFh5UYi1avYLvQKLD+26Ujfg46AuVG48O8rCW2JRusWEMRjBK
YOTQknFWqlaaUWi+Q2251vHuEuBEJzbIg1Pusmt947RRrOrZd7O0+OO5DCj66jOb
mJaiyK/9cJ/6/t08KnuUqKEvaRgxLR99F6/YgN+piPluLdZ4hH73DDi0n1RFoH8N
m44SWD0U07HVOZ3yppWYfuKKR7c7SXxM7yEnnDm0t6USl5aEWYKmjlRXFf+iRrgF
hbH4cGYX5tA9werJXjPSOZj/oVcDqhEhaD8BImRLbrYlgxHGIkwGADIUB3TUvPAC
jasDDHeeGHmdDhBvKS17jY2BoHjTSmdN7IYIRCkjIYvWeZnGs44=
=tfdL
-----END PGP SIGNATURE-----

--OVxl/HPxHSWgap/6--

