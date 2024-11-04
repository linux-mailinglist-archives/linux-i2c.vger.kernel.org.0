Return-Path: <linux-i2c+bounces-7750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E39BB2B0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 12:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E130B27CDF
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 11:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1811B6D0A;
	Mon,  4 Nov 2024 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z5ODLVVm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388051B3725
	for <linux-i2c@vger.kernel.org>; Mon,  4 Nov 2024 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717909; cv=none; b=Wq7tMU/RPAI+Qx9cnnaP8YtNzJF1kucJDEzK+QjOqifdaHaRSSRVNRXHWp9LxW510zQllw9OQdLyOgtPrONJvBk0dQNPU8Ez2Hoa3cjN0r4MxQ/L1zKtWS84lnY/qvtKh1Y8wQt7ZT2JYYuopylRQM/CW17jAVmCeQ34QT7HnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717909; c=relaxed/simple;
	bh=MOCNCFVhwZnctVoR6vaLnygQlRkM3aZGnqKH9Vfc9tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7ZffGEAcXRonpYJQuGPCeLPFDC9nJeOXGNoIguUxTe18CkIMY4zIeULpCh0ssEZhR2jAK12nzxjdWfinrXJqhr+VN5vxwq4dYr0kudO6AK9Iyw8rXLJQn9+zgHn8dtlvKe8G3Ztw3LAOR4E/6YpgFyF2Gxm3EkYDWa3FqVXFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z5ODLVVm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RC9G
	LskULpt+FKQVVMona9L1F+pGXF4JEza0YPJDJas=; b=Z5ODLVVme2ssjzuChvhq
	v83/WyuwnOS5fGZfwt9m+4AHLiCq5x9mcUrQYNoaCFwctgwOWa2+zChNUxLyZ82C
	uZs7+7eXcstG/uIy3Rz1G8HKzMmEaGTtLfmCjn5puplm2Q7J+sIZyb754i2bMPNY
	D7EpSTIsDTCHqUMlB11hPNyAjZjqZ0WKb+6Gj8FFAa7yM1Av4nYS7j+xFJ7V8Vn2
	+il/EkfZrZbMe3MmdKvw86UJs1p7PXLuCMFtkNtEA9TaVb7Xj+M25R4/HL9JfQqU
	u2/zqf1LeOKi6t3FhY+ta6YcY8Nsxs3WTvUxxaRI1IvL2uFn9hYxPDAMP/OYu2ye
	CA==
Received: (qmail 355553 invoked from network); 4 Nov 2024 11:58:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2024 11:58:24 +0100
X-UD-Smtp-Session: l3s3148p1@yGLlKRQmKzfVHA60
Date: Mon, 4 Nov 2024 12:58:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.12-rc6
Message-ID: <Zyio0JvARbWwoFoK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>
References: <nqnhd2eb26lxm4ho5czgkjgnvorugixpzyvbw7pmle24wdn56f@a63bfcrj52k6>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PIHyO4L6O4yJnv4o"
Content-Disposition: inline
In-Reply-To: <nqnhd2eb26lxm4ho5czgkjgnvorugixpzyvbw7pmle24wdn56f@a63bfcrj52k6>


--PIHyO4L6O4yJnv4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> I wish you a great weekend,

Thanks! I definately had one, was abroad.

I have a comment about this PR and asked the question replying to the
patch itself.

Thanks,

   Wolfram


--PIHyO4L6O4yJnv4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcoqNAACgkQFA3kzBSg
Kbbk1BAAhUmcLmXzkKPWoVAw9AdDuHbsEKRoopfo9vD4GChbucvVMRwdXYJpUoEd
QeYYssZXIdYlKRZjKAcfilcWB6TjUOXqy+veTIDeUbI5NrieEBUXd+1ghi5REJPz
foF57/cLW9qzWkGBYsyx5qc/E86f+mwLWmFPnRPFzM1JMy+IYze+h0TxSxf/xX/7
mT+FZph4BeIDIzttetxXJ4jzIPMZ7uMVsGfYqGcrso+IBdq5FAR0zNpSDDm0l+8q
kJ8+5W67D5aBUQkMMWXDkaoPIUBaj8/8S2M3kTi0RekEfl1YG+klWZuii8xdTtTA
KXbs2pKumREcB/1bdyn+G+BLCQIADxIJ/vwW57temLUU6UewekLlQSsN5LxY42UG
ueETCm5fXpgj45/qUfEY6rXM0DhLfXNbYT6A4CTak3T2c9BambQ86BTR9TBwoZwB
WH3MKaLX9UwFR+LWDXyetnXLM+gRHx/ZjL9dUWYlzsj5hUpD/pDLxaOJaLiwH/Fp
Vs7cqRuJ57+/xaJ6n2NeHsincl8X9V8lasf1bRAS3qMrsW+EqtupI385O4ScIbqc
toW35SCDipIfNnYc9AEipCZmpSpD/vFBdntvDpR447hygWXkQ1caEF8Wrm4sQcDw
5rh5gAO3ybTd2HpeuZvlh0B/XddtnEahFULN9ZNdf77XDCXw1o0=
=Y7F0
-----END PGP SIGNATURE-----

--PIHyO4L6O4yJnv4o--

