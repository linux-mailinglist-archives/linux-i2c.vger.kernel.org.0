Return-Path: <linux-i2c+bounces-2928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5898A3B63
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 09:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D4C1F22862
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 07:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11FD1CD2E;
	Sat, 13 Apr 2024 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ee/kev/T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FFD1CD26
	for <linux-i2c@vger.kernel.org>; Sat, 13 Apr 2024 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712992264; cv=none; b=E/2r6nUdn+CV6QjGdSRnQg2XqIrypOHimbhmgQDQIJWm1CfHiDFz3re3UFLN9uthqawOr+/nQT8wSiNRjVmT1Ww8ASBW1bA4bmHVyxZsbbQSgcvaJBN2UDVzaeXUizLPtGIeHcNtaPMdu5gsBe1d7rJugNh6pL7rOVQp+ZyfnEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712992264; c=relaxed/simple;
	bh=kvTTrXu/D+RBrfLW181LXtktGgwC7lY0YLQ1arsPkPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xoc2JpT+I9fObxEmDGir6L0ZOOQqsYM9Nok1+Pdtc2SK55r21o8rEYJBu2THCbxnuHZsDjOTmgw6Oz1ivXF2WAIAMdAs3I8YYY/dS7TjgAMs/G4AMzoln5HdqmwQtXQOEBdEFZNcvg+3DKByhz7+ecKElSXBUmEqrPHz5sgTOpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ee/kev/T; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fDsS
	qP37JlfsnuvUi76pse1YRgLT6bu9xfYi42wQzxM=; b=Ee/kev/TBG9MhQM+562M
	/l6v8JyCaSFeM9P5dsBDqQ8lKlzFxyqml8qH3LK/QNF/+LuqqFniIwLzrtkjEVZq
	tPOExrh3s095LRWH8rAlrBng28jES8fiE1UTmlkPg0Qt65dPnmKvY0DaxvdlTeIR
	e+afNoXyVUkXFFCp8oGd7hhANekvkhirYEbghpuX/8fmpbzUZwEGXqrlGMZdkpi1
	MjCePYcHmL02P/FIoJ8aalwryR9+6hAjy/5h2uC3uTZa6gl76hcvI7AUzIFwAJdL
	/7PhhSKZnzRgRgz6wI32Rf/weept8ZH1AydS0Bajqgn4tt0Ba51sUbwHQ6oeNf35
	1Q==
Received: (qmail 1442646 invoked from network); 13 Apr 2024 09:10:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2024 09:10:59 +0200
X-UD-Smtp-Session: l3s3148p1@pQQgF/UVSFRQk7GI
Date: Sat, 13 Apr 2024 09:10:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
Message-ID: <4ogowge36wr2lk2zdsv3zc3sm3pjk4h5wmy2hjth734kgsr3rs@lb4wsmkpavnd>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Dragan Simic <dsimic@manjaro.org>, linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
 <4bcd397ec377a4932c34d62c85ef28ed@manjaro.org>
 <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
 <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5pm4t4sjideud7d"
Content-Disposition: inline
In-Reply-To: <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>


--v5pm4t4sjideud7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dragan,

> Sure, but I think that having such an additional debug facility
> can only help and save the people from adding temporary printk()s
> while debugging.

Mileages, I guess. I like temporary printouts for temporary debug
sessions. This way the upstream source code stays slim. In my experience
with I2C over the years, debugging happens with developers anyhow.
Logfiles from users which help developers create patches are very rare.
And those users are usually capable enough to add debug patches.
Given these experiences (which may be different in other subsystems), I
don't see why we should carry the bloat.

That said, I'll leave the final decision to the driver maintainers.

Happy hacking,

   Wolfram


--v5pm4t4sjideud7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYaL/8ACgkQFA3kzBSg
KbbTqw/9HLHorgJpCWkk5dX2IWoSeGm6vwPo9lvfGt+zKqEFeo4X5NK/tZq1+DDw
VwDbGJjA1rQX/yVVyVfOMJ5WjijOh2VqDxFp1MDLHyjFFIUgsTUmks9xu5THk5BE
crRGbBhB6Js3rYdvcnbhePf/Y640ARyk2yHaQertEy7iJLhT+c+LyFbUFu3MDQj+
eUWXzHO0XApJnJ1YqnpDYYveqJBzC+IX5CYRJBVYHfyze4chasZZlwQgSVQR/wIM
wBc043r+6y8mN9M4qnApS/IipmF4kpJC39C3P49SxCx51XAQUfxELsQ3/xKoamZD
byF6vf07dheL8z5yTCDEBNGR04qAVtcMpIU8rWprjQB+rcYw1RJJmfr2gcut6Sf8
EogV42Z9O/evQdgOQnV7mGTFd79scfnhoJvO+0o6dYb9hMMk23D0rOcvK+hhaaQC
Tq9prAYaocSLx1lIYp0XZb7jPpdt1KPGIA0y8tygrniikjs202OPAESgA6yQD524
W2VhkwlmeDWS5QpPLe97sMNDyZAkAfRaYzIiDjzrBEU6bZyg5xpsTYo8LgWMIAGR
LcpKTnLZGRfe+d7NlEDJ5PoEjDUpqAsAUNm1n5+6fVoSthRcLtmX/YJJGmDOCDl2
RqcupKY08BVqunvPrT1Ub9LlD9sAARcBi4mGQKAv4Y2m8Q7Onus=
=dhyf
-----END PGP SIGNATURE-----

--v5pm4t4sjideud7d--

