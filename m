Return-Path: <linux-i2c+bounces-5377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B49519BA
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 13:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A5E281F8A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 11:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0F91AD9D1;
	Wed, 14 Aug 2024 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K6ajvEuH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91B03D552
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723634099; cv=none; b=D9PEynv+CKFE22Bmgqq3GejNkyg6G2Af82LNV1YM+dFkpVF8x2neZe7aw+WW15Qa9t7CUBgMw2jF4OTriMz8Ss5WodCRPlwYhbmwddyOK0xWtnWTluUn6/bqk167tKWzM0FZgVh9f/L/HqujNt1unoIoWIHAQJFF0lyvn5AxfYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723634099; c=relaxed/simple;
	bh=KKAOeYS+MYTfm1k8svMYJV/zXT5z/EWHF1MgOLUUZVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6LAqNI2RkPSqzC1wnQoLQOdTrePdtFN0wkFWYxHKSmt3XFGt2dsWFQm0xk1yTqemezm5oL++ml2mQiiTRGCm3umq85N5zPqKEnGoBLQ7o5MY0EsEMf46gze8hYHB/Aw4lo/ZSHCsfAc/wjpEjzXg2PTh7ROOtP4pkyYdSVCs8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K6ajvEuH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=egwn
	xywXIrnj4cFqbEpEi1uuwkywfaG0JCUKPho91bg=; b=K6ajvEuH7FXmxXrc2PS7
	ZVXfVFcAwUpmTL5kRr9OkxH9Dp4iTVp83QnJXd3x8rO31Kmi9WvIni5PP0j78qkQ
	L0bg5kJATqsGgS0IBR8yYVqtyZzrQbOvifap7TFXM5/hofVYTRfgIHsDfSOT7EQM
	heorJAulz1zcCuo7ZTDbbl3HjcD11zTvdyVzeSdrtNidy0qhizIUPPV59wZvsW+a
	DwKTpBQ0uff2vmMYHULvqsg/XxSD5c4qm17879hlnxxDNSBpP52qYbvLupXARXXO
	daiHGNmiXUzVhGmECfKWx4NZlVDnsMtVXc7cSFR9E3gEh45UclFTktXB/j7PxGfJ
	gg==
Received: (qmail 1962160 invoked from network); 14 Aug 2024 13:14:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 13:14:50 +0200
X-UD-Smtp-Session: l3s3148p1@U/Sm1aIfeSdtKPNg
Date: Wed, 14 Aug 2024 13:14:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
Message-ID: <ZryRqVexisiS-SGp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzsNVcI6/pSZvvhN"
Content-Disposition: inline
In-Reply-To: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>


--hzsNVcI6/pSZvvhN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heiner,

thanks for tackling this!

> +static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
> +			 unsigned short flags)

What about just using 'struct i2c_client *client' here as an argument.
It has all we need and it currently seems unlikely that we need to call
it from somewhere else where we need this seperation.

> +	if (!(flags & I2C_CLIENT_TEN) && !(flags & I2C_CLIENT_SLAVE) &&

=46rom a pedantic point of view, I don't see a reason for not handling
those two cases above. I hate to be pedantic because 10-bit mode is
practically unused (and I am tempted to remove support for it once in a
while because it makes other solutions clumsy). And the other one is
super unlikely to happen because the backends do not autoload. However,
it is theoretically possible if someone loads a devicetree overlay and
initiates via sysfs at the same time. I liked the solution with the
bitfield and atomic access, but maybe a linked list is better?

Happy hacking,

   Wolfram


--hzsNVcI6/pSZvvhN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma8kaUACgkQFA3kzBSg
KbbFyA//QNIt53Va4N91LNL3Z63MAUZzGyd8iNUjcHE6+CHp2aJc5W5XJxM15Z4z
z5Bl6qe264Lq+I3DFLwfjHASJyOq1ElDmjs3J44YH9Ilc0CLSexpftAxMnn9Vw8o
RO7/uQewM1frCsYXtRacVS13+zqSyCyP4RNEFb5jajTxbITzMPdnd5wwOSiy/xGE
wxhq5g1vGcJeY/DXb1dy6IbJBF+3aJlsK4XOFi2VRr5ax6gIcERH3oAjNZN4n5S9
h+K/ZxaP4zkWHzdYR4WxZJ9tL4IEUGQcr76vaytLHedsqU20+REE9ptz0M4ENEM0
+mjQUEAyg4SUYM0Pf3EpflDo9f5uiTIxEhE4LAPwtD0i42i8epPr5Ut4AlXdFqiG
BZjUt9fdN1VVEehGMvxua6pnt9A4vq75gUTHfsbdMmUjOEjlKy1XojKJmTXsqaw+
UxquCikojPUywGnxK2vwf5e2WiOwd2F6+5muohQAT1/7ykHsg7JDWonQFQp1jfYn
In+eNPO4jHVZ90Mq4e69MbXcTrUCKJkCjtped+WqUwdkC5WxgHLQk/Suvgj809ue
L7Y1ZpMSAH8ogcZpuLjRLZbGRlI6WXimWnwaVvY/b7YNSerkndjJhe+07C+h+bEc
2H7vbWZ7i4rvGNe4cC+7+GRxEry8XqST2fJ1y8Hca4/HYm7eJ34=
=3Mns
-----END PGP SIGNATURE-----

--hzsNVcI6/pSZvvhN--

