Return-Path: <linux-i2c+bounces-12050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224DB136CF
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 10:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB1A162704
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 08:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31415220F30;
	Mon, 28 Jul 2025 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AeaVPipL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748A1C8611
	for <linux-i2c@vger.kernel.org>; Mon, 28 Jul 2025 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753691815; cv=none; b=HQiJAaJ7yHEm+S7qy0BkZdRfm53tqsq3OZ+wtP5nt8rkaA6oxvRqNsFOw4eZBjNcQG+2UfArwqNkSzZVDStZ9Af3Br7JgoDic5c/WmhaXgVWdxwSlK238CvQcE0w/XAXeLL10aUbN8waPWQcJtj3C+cXciIfEen7TUgyKxOAyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753691815; c=relaxed/simple;
	bh=owVASBJc5ZPIRKF65sWjzx44HMWv6Aoh5Rdw9F6zRi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwJgUf6c6WyMq2tXOgUThkMD8Df6d9Ezjhk2AsBAPJygXB7LRGBz4k+9lQ0NWWQtZlnRgt88erIzkH8g9M996ZmjOMYoqmL2lhP9j6ejsjX3sgBIJwbVqjeMR7SgMLm2JEuY4U2nCgh47O5JcDKmyaudCat1kn3Q2b/URAQo/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AeaVPipL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b6HQ
	vffNF/yAKibtcIquXTadS9cdgYvBBvG45nw0gkU=; b=AeaVPipLOaBb3n4NwzO0
	WQPusnPoVo1GSGwCkGbKnFydeWaDc+8yi9qcNaHgu9poQwqYHEctdbfnDoEdJcWH
	daMOSQoSs7G/0+cYu5hz825Wzj4exhOshpup8x8e+24U87rfV19GxP922mk1ryfL
	7MJUr9lxXUH64yghssHiw7c6WebFnlNJgVKdp4Vtd4tqvVXW48vhcfS1qg+v7tJt
	DbiNBAbl/H7LbfxzkDPoCsWhYruM44EniPJbskaGPafN73IWs0/mepTy1yGeyGz1
	TbCHq1n9dXetzhsBlfVSRO6wiDTTnXkB1+C+SRysGXsTINUi25ni8CjLUTpLVIOQ
	Fw==
Received: (qmail 3369008 invoked from network); 28 Jul 2025 10:36:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2025 10:36:49 +0200
X-UD-Smtp-Session: l3s3148p1@zyVXMfk62pggAwDPXyC3AG0QzsW8mHdp
Date: Mon, 28 Jul 2025 10:36:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.17, part 1
Message-ID: <aIc2oQJfF-Xg4jOU@shikoro>
References: <alsos2omteyu3d7ao3edavnd2dg2udpjmjok3gcdy65tgocw6q@o6fjrxd3xhsa>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzWaMZ+pT6D9ISPd"
Content-Disposition: inline
In-Reply-To: <alsos2omteyu3d7ao3edavnd2dg2udpjmjok3gcdy65tgocw6q@o6fjrxd3xhsa>


--jzWaMZ+pT6D9ISPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> I plan to send part 2 next week. Some patches depend on the
> fixes already sent and tagged as i2c-host-fixes-6.16-rc8[*].
> Nevertheless, those patches are already in i2c/i2c-host-next.

Ok, sounds reasonable.

> Thanks for reading through this longer message. I wish you a
> great weekend,

Hope you have a great time, too!

Pulled!

Thanks,

   Wolfram


--jzWaMZ+pT6D9ISPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiHNqEACgkQFA3kzBSg
KbaiNA//aRpKGxd5xbNr3h01UQxNnApwKqTFobAg5H0OjGs0kvbw2+MIXa9XQ786
w3cTSeoynXNePzJ0x3jhEuNFv0+f/lDeD4FP2FHCGKUBXFdscQJEsib38yJmjiTt
TpvgH27SWDYlwwhwUuox24B31q8lAkUzzGOe+xQ4Dx/A3NTy8IO7F7s3BLmaeGC0
Yscb15PbaTedJqq0eD+Fhc/iokDDO1gDxEObRv6NZYWZCX4JJ5H/5mBZC5kJJIaX
XJ1586xXL8oBH4lrCsMS09nLv+6T0k1V25jSQwApEplj7etdD1KFuxkUsLtiNals
0vuIKePGTVSqcCnunWRVpWtwxA99/ZbQaEwHiXhV2wy/QyrUy3il0vXvhEPJpCI+
RA1ZsCpruDl//vANz73rlpJsBOofVO0CYbZwIJvXuZm1pBfTC1vljgtOc4UzruEY
qwZhNyoKWFQv1jbadxFWWIp3zeNKKZSvzHmr49ter6BEtTAY233m2AnSzy6NHHrn
fqZyhX5pBwkG/sDC4RSiZvpWf8doLo+LQmy35qfjcUmnvwrcxin4zw+RewVCi/w9
pSLdDKJ+KgFGgJAPlQsbhiDZdNcI5XmHSHV/J02+mcGViPgzntSEbYyMvNaj3tFL
y7bKKiumWrSu3l2mHIXz7ZXMi6IvWkfClaE00tcX1qpbJ59AaVI=
=E+GZ
-----END PGP SIGNATURE-----

--jzWaMZ+pT6D9ISPd--

