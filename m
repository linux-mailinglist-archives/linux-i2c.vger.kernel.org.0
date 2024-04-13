Return-Path: <linux-i2c+bounces-2926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 819458A3B41
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 08:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2361F283AE7
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 06:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D1117C8D;
	Sat, 13 Apr 2024 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UXFnA0ga"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB810957
	for <linux-i2c@vger.kernel.org>; Sat, 13 Apr 2024 06:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712990349; cv=none; b=LNqIJKj4ai57Q5l8Oz6ZqGH9m/LjtTFfq4GJWEjRQIn9JPIEPwWSFC6o8cy+mITPgk1Vy6bI0YJJCJ0a5UoCY082B1U7792zyLpjkIH52YTjroK9mliTdakqQvvtjUvlYWTqKfLWefvHG5h/CR1Za8Q2JIPaEzHySIXBRAXkACw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712990349; c=relaxed/simple;
	bh=hZke1ChR2zX30fUMb71QHmBPhn9bQ8Lye0W2PKfJAXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izLZKW08yMw7FxBVvO9FYSS39O64Jmi80qImpO2oPHQPNVpHJlBTj3PIccDIBOSBv4qrIhNLRsymwvdqjbdrjJQyq0BdD90bQDD+umg90UDjeVssECYtA1jOzYU8MyHBCOAwg5x9XVzZwKnGQnWmQLZ5+MgDqM4GrxhbdKBcuVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UXFnA0ga; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UGLa
	QB+Iw2RM3zOnSeet1OBI5DXFOCaVcQZGWoHw6/M=; b=UXFnA0gaRTlicU1eGmFw
	M14hrfGPhOdCy0ib+qkmujECYDiFSrKgoORtfxtbBa5WBOKyTUXuxrKWlxpIVE8C
	h3oupEisiSp0NWM94P7jK8j8ystIKDdu/QI+aXZVbxDuv2a8mU4uKI5KQd8ODy/g
	BD5nGZ0F1PlNXPWzTxnZTil9QtellL+7lW4cr7ioTL+0PojF9+H6cEmKL+iF/rxx
	XcfTT3i6ZnkDaaxO3T6OtmC3SnbQOdBMGmh2dFxsQWgYSRzlodSWnKc968nBuhzF
	nZIj/1Ahkv9/qHBip6PkYAWH2gc5BlYcaf7fJEIOqx1aYw4bX4WG4kik9EKBg5sv
	nQ==
Received: (qmail 1435521 invoked from network); 13 Apr 2024 08:38:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2024 08:38:55 +0200
X-UD-Smtp-Session: l3s3148p1@CBRspPQV8ElQk7GI
Date: Sat, 13 Apr 2024 08:38:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
Message-ID: <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Dragan Simic <dsimic@manjaro.org>, linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
 <4bcd397ec377a4932c34d62c85ef28ed@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qknyah4mgczhweoa"
Content-Disposition: inline
In-Reply-To: <4bcd397ec377a4932c34d62c85ef28ed@manjaro.org>


--qknyah4mgczhweoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Maybe it would be good to turn it into a debug message, instead of
> simply removing it?  Maybe not all client drivers handle it correctly,
> in which case having an easy way for debugging would be beneficial.

Hmm, but it still returns -ETIMEDOUT to distinguish cases?


--qknyah4mgczhweoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYaKHoACgkQFA3kzBSg
KbYlVA/+MUricXOt+mbCxREQXUINn+xSChvT9stYcMVqMxjDu0SEak6tkUuGcvTt
BAXj3a93QxZB0kyVlC+ULQHlssZxloRDwNUZ+aE/0OCobAwGFDNZCOyh7b0YirOE
r7YY0OP7vib7uFU5bNc6Ma9N7991PH107cxViqwYhiNNtNt0pOXa/WXP+ZMTqodP
AeOvQ+PN2aK9pmObgpvnXAr07Lgu5LqRlJPLP76fTKDbEp93cT9KLnr1h1MEaU4u
K6vNCPqasHCHtgYXCr1ScIzWT5WAgYH7pzEZK7ByX7L0Im8Mtq3HlIb2WIkapCH1
c0VDGUOPpNQAbzfX/fnZFr+ujb4CD2sedtsDo3R+uQO0xd3sXuMo6rAlf2wh79dj
3j9+tBcFBD+ZZIFcyXE5INVB/eMsVkZePRHr5Rzu9iwv/vSs+NvgFjnbUBE+/jCE
lC+R7EjoH+gKH+1cCfy2hK8nnrh3x7APIiCs9Od/L04kpZpH7o72IrUEvDzitlR3
CKKgGLCGypujRE5jD5uH84X0uJCwPSuXICFCA1Oxrsmp9spQ9hDoGPZV1xc9LF1p
fvzwLZGa8Z3TeiUXhB0ccQmrnd4BjXK37MBZ6l1Srz9AYZxPpC/JAAGi9ZCjlSl+
D/OkobkAhZx1/Z6nKZsCF7ENBjiDlLayyUX5CVAU7DjYipfMyDs=
=L3eu
-----END PGP SIGNATURE-----

--qknyah4mgczhweoa--

