Return-Path: <linux-i2c+bounces-10421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF2A8B9C4
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 15:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1009E3BE045
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 13:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2066E17ADF8;
	Wed, 16 Apr 2025 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XcYvzW9F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78FC2DFA49
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808668; cv=none; b=o5O20toohjoH0UU3lUp8JqcVyGXClS7oH9WIf1PHbCCOQ0tm8WqoZqvjVGjvxbj3N1iZ0FE/5xFmgRENceJyFSu6v3/3AIXaor6F+v5q+Tpj0ydSTF3ChACna0oU5ZLP1CAQAGzZLJQnGS3G8SABVkz19UP9nllb5kLDr5B+58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808668; c=relaxed/simple;
	bh=Db6kAuczI1GzgC27qGtw0rRSj1FMs6lErP61NiCXOVg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIWNxPhyGWv65sIbDHX1bmazKlAvqSmtqmlLHz69PBGsFwRlWYVMd3mknvJBtjPfeDRBRksUzqyGDdJvT388yWCreMo9bj4S+JFFIpcmg4Rs7WO00ThX3eZVrId8Pe5W+6wwwwh+E3sWF08IanXNm8pmFGuVsDokewUyLSjZEOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XcYvzW9F; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Db6k
	AuczI1GzgC27qGtw0rRSj1FMs6lErP61NiCXOVg=; b=XcYvzW9F30hEbTRJafmU
	rYfJwbpulBHPJ93o7wkb3P8BNcIuNYYcPXIwL65mqdYN5ipmf0T4krhOhrSMTrSH
	FmyBmY+Fm7PxOPRWTwn3EpStRKVS763nk6E+wx76s2XDY6WXblqg8YDN2ruKlUdv
	AO0fa+yyjx9kXDJXuGGuQMqFz6ABlh3qVcuiuDGpQ6tv++P41sPriH1JGzbjyEdo
	A/W4IbjseN8F0olqjVKIIEVMsw8eyBVif3GxTvxbsq9yg3tFIHXgVWUgDL89LNNx
	TtE9BkgmsS+Uex0usCxjOtWunsMeNXK7/CL+gl1eFsMRh5kxWCK+rjroOdLudbyo
	UQ==
Received: (qmail 729387 invoked from network); 16 Apr 2025 15:04:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 15:04:24 +0200
X-UD-Smtp-Session: l3s3148p1@qY2i7OQy6rAujnsq
Date: Wed, 16 Apr 2025 15:04:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Message-ID: <Z_-q2OPauNKT9mye@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2XewglpALJFE1Ay@ninjato>
 <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
 <Z2gJtlb5Sc9esEba@ninjato>
 <CA+V-a8s4-g9vxyfYMgnKMK=Oej9kDBwWsWehWLYTkxw-06w-2g@mail.gmail.com>
 <Z_9fh2nfwAaUnhVV@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hg9JGdBgw8KooMu5"
Content-Disposition: inline
In-Reply-To: <Z_9fh2nfwAaUnhVV@shikoro>


--Hg9JGdBgw8KooMu5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Have you already played with these options? If you didn't and don't have
> time to do so, I can also check it. I luckily got a G3S meanwhile.

If the BBSY bit does not work the way we need it, maybe it is simpler
and better to just implement get_sda() and drop bus_free()?


--Hg9JGdBgw8KooMu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/qtcACgkQFA3kzBSg
KbYzPBAArrNfgEYCRTq4hK5XzFHwLSpYAj4FvXKijl+98UMvatdefUnlYJMCWy/Z
Cel1jyEW37xBxn+JXif1wROkr0plXjUt7DOGjzYhBM+thDYt2MN4PXCkpKyKqcb0
2/tX/4zABZn+bmdrms/53JAKiuQ0AS74qwGndcDRi2u6EpiFJNQu88YfgUgmO8mU
lMghErzwxoElv4UNFx98jU1nxm2Pt/az+AUfeEWGcsNNFmrVcxzqzl+gwnFbJukX
Wf8I9sYf571tYlP33E/P23PjShdW5uP2PP8IkC6L6bh4FiFhCsF7lTkH4eNm77yG
aT153vt4RPkzDy7n/tnS+pM3fQvsqpMu1K3lWHzzT2X3A8MkSU6d8kQhgxruQvgN
AbA2PgSIQZCrQJwiQwbGj1aYSHx5cfIE4SnwOy8StYZjlIhnUcz/urinWVSE3Uqo
r1LkQvJUelEtu1m/kyAsgGhbSuzt0WwsrFkneFTQbZB8mvCjrLl6WEKC9Il0f5Fy
l8xaCj+6EhzgG/3KxsebxSWGESzseO0ijl9jb5QuwXWipJliWYV7ZBxkuL0RUJ2W
zzkbav3a38Wl+WHau32Pn5QuzUyL7PHPfTSI1nykxuzNChVylWKge3EsVAHkcUiu
XNWJ1+mlUIFZY/evopcNyul359S4o3p1XqzQEB/yt+aKu4Z3oR0=
=eCiU
-----END PGP SIGNATURE-----

--Hg9JGdBgw8KooMu5--

