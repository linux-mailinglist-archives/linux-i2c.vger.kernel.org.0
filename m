Return-Path: <linux-i2c+bounces-950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC781C81E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61C561C20A5D
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDF214F81;
	Fri, 22 Dec 2023 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nafDx/9b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962414F60
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 10:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DBCC433C9;
	Fri, 22 Dec 2023 10:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703240778;
	bh=vDEbnKzBzozNnG37b5osu92CxQb7NbMoAmkhMu31nMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nafDx/9baTbprUDXsKNmW0O3OxKr0a834R4pI0RVLrK8vX3goZJQ2jPki3V4n8Oyz
	 2BbQIqrmOPhGAFfCZv1lba0mJMhTQVPrRf5appC1mKYTnB/X4dPD/Z0V8y82dtvi96
	 3W7o7Z4o1+Z6siXiN2dPdjt4lxp1VQK2jjjT89PF68Ub5xny/7VIcyG6sfvB/czVNK
	 Iheo5cstpO7C2kNgxzdE6dtdElVUm/9m50FkvO1vDqi7sZKpz7ej+3MeVOYQFJW8Yt
	 ITXA5cKRnjvov9t9K4ifM7xw0ud2nFoWeVkvQJuDzIMwL9G9OPOJXjFKSVP4JCnogC
	 pNeLtP0erLvKg==
Date: Fri, 22 Dec 2023 11:26:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 07/12] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <ZYVkR8wSC7gc7kfO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <c3035b20e11b8c44eff7e9c4d4d69875313d0697.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D2w4vz1sZYzLJueA"
Content-Disposition: inline
In-Reply-To: <c3035b20e11b8c44eff7e9c4d4d69875313d0697.1698889581.git.hanshu-oc@zhaoxin.com>


--D2w4vz1sZYzLJueA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		irq_flags = IRQF_SHARED;
> +		i2c_dev->irq = platform_get_irq(pdev, 0);
> +		if (i2c_dev->irq < 0)
> +			return i2c_dev->irq;

Doesn't this belong to patch 11 where you introduce the new platform?

Sadly, I can't apply this patch anymore because patch 6 needs to be
dropped.

Could you rebase this series on top of my for-next branch once I pushed
it out later today? This will have the first cleanups already applied.


--D2w4vz1sZYzLJueA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFZEYACgkQFA3kzBSg
KbbVDxAAmAeG9Vc4h6M9/gklaccBg8CrrOq9HM4cRRF/sVxjWvup9bLLjsYh/2d/
jg2VuNCd8r39EvGb3gEYVWCyvhGRfgoKScXhWu6EBm8CnBNSOrG9KPdlLvV8u+mY
y1OxTKMU3o09t4/M/6ZiXfFv5IPikRI4oMHBRiSZ7QhpV8cY33UnjF9AAsKet+Yn
aqVO9+1832Q16qAhYpz/YmA3/fy8vkLjS9RLxjYsrQ+2238FmSWvrm1v3CSBnztT
9qQRGnN6zyygA723VhwFR3L2TqTASvgdrsQdnsgzXmk4UKdtUKHOj8utCK83Juu3
upgScJPTvEyDRK1VhPDkLwrVmatKB1ZeXCjHnFiLINtUUsXQNL59arsqa2ObF2nq
JXDNsS0mJ6TqceHKftTWCGDa3Lh2KS0o+bhY3pzHSqPvC02SMgwTBLchJzrU6X4t
Wp7AVSXUIeaSzgDoE6cJtYgZ7zIEOlxhtqOY7wWrOxJwl2YiOj2tqgSYDaxnns37
H6ueg3ptHu8AD7SJ5t/zUgwINIjINHniTouNsYDfrqU7Yf/TEKrLbgLO3QSqRWOi
pcJqjzsl9x1kf3e3zNUUESwFHFKkyuUjDv7NxiRm1AKRkxCXly6IiHoxp5EBMA/Z
0CwMOklSR7zk8j1p+Zjz6L3guCC9AP9P2q126yJQMF/nbvkwi2A=
=sfs2
-----END PGP SIGNATURE-----

--D2w4vz1sZYzLJueA--

