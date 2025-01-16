Return-Path: <linux-i2c+bounces-9122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D38A140C0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 18:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53B27188E1ED
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 17:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D482309A7;
	Thu, 16 Jan 2025 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BVaC2YYA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42822FAF8
	for <linux-i2c@vger.kernel.org>; Thu, 16 Jan 2025 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048037; cv=none; b=siXNH4RZ54L6uwBxmXf4c12HeAV+Hf8/nfqUkmViWDrvCxBPA4a+/aytpBig/bBIumUZUtuFJo0ivSCNmX0Z1fk36TcKoivgzEOHRZ1aESU+yTPn6ogb2I5LSKPmkfJqYa1uwuxACo6qfPM7uZr8aMEOdk+kB6wi15fsNhV4Dws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048037; c=relaxed/simple;
	bh=16InCz4T1l1mFM+JV/lnvq9OmsP+er2KHsmClEzLzMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ctz8R5CS9cryG0Bio/Rpn0EIBOML3hwWPrslmLlEx6GZOXnj/5t+CBQioFzU837lr4xqyW89a8CPDNqWgcokfSS5kClHN2RvV40VXXdOLSL9ULg4LYdtjiyi+aBZfwu8AjP2C8LO8oJUWsLULcHcXQmGwdTKXZepHzYkRcZuZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BVaC2YYA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=16In
	Cz4T1l1mFM+JV/lnvq9OmsP+er2KHsmClEzLzMA=; b=BVaC2YYA8xXm1rF7+BHJ
	B692F5aoqiIlPdU4ktkwz/3ikS/+qMaKY9HmJ2IWzH2KYwhJ+fro6LkTfl+esydA
	gjoi2+Vk/CdP7a1gAT4gzlX7AxLvLhXUis8vtKz7VXEYyOUf1bObcSPWt/OLgC6u
	wTpnNEDeNJ2S7Mq6i9vfZCBy+xol58fpd4wAaarjkryVGcOL2B2fDNmRHkvwe9Jn
	+u1CADFACE+HTelyj1BraTcoAlgIpTeY5b8KFFCjJ/z98/ee147hfupLvXKGICeC
	zEg8fBufwgqHdO9JldXfiyNGraXE086xtXr0xjbxQt7sH5jw5d2B8NBdp9KXPTC/
	7w==
Received: (qmail 970025 invoked from network); 16 Jan 2025 18:20:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jan 2025 18:20:23 +0100
X-UD-Smtp-Session: l3s3148p1@fzpnAtYriL0gAQnoAGFKABs35iVLDC7C
Date: Thu, 16 Jan 2025 18:20:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: check initial mux selection, too
Message-ID: <Z4k_10PvqnDEwXUY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org
References: <20250115072946.7688-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogTXpr5Jq/p9oEo7"
Content-Disposition: inline
In-Reply-To: <20250115072946.7688-1-wsa+renesas@sang-engineering.com>


--ogTXpr5Jq/p9oEo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 08:29:45AM +0100, Wolfram Sang wrote:
> When misconfigured, the initial setup of the current mux channel can
> fail, too. It must be checked as well.
>=20
> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--ogTXpr5Jq/p9oEo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeJP9MACgkQFA3kzBSg
KbZT6g/9FW4FfT6/WHyRcZ/33GOhvk7HgghXhRb3pZpsP4So5uKIrzprOvABvstS
yQMTmnO/Qu0xHsGRrUBP4QB844o36WOC8qs/Cnaza2f7qrNa9GdXtOy0OPu7Atgv
g25q+b8oVQlO7ur4VfCAtFZcGqkcug2qggJj1ypQQeBaINl2+DXHtgcKD2mFtTgA
lJYPmwgNdmQaJLZ03ejvxtFZtxX1TSyBQhno46atygUovZVtQEhj1KvIRvXAqH8K
IVXvBZ8NKlLAtWm7lrNzQFUcvWrbX4K3SvOfs72dwvpk1td3EPe0hn3Rk0AvdAYv
yDteNTRjlg8qVdbSjKubyMI5v4KK95WW8/P139fIJwkFpm6frRMqx+FX8CyXh5Tq
STbcNQ0A04yRUyINC2bv3vkqM0Ls9U0ka08WZHiCbWKuE5VW1OK/5H7hshcr5ooW
ha5DSNvDGjxXDrWV3dy5xBLYtrnsj0Y8w3Lq6IF2Jsv29GKm+aS0uFKG6pGnSirt
edaRsZe22ct3zxGR9cngklhyT2YvyYqcFMoBh1SWfYpEcrjwGcKlLXAANAhiueFq
mVr+hTsZv4ChrGtWol9Ff6JCUFQlzTTT1KZDBJiNw75cSJrueVvmo0PrUUase2X6
zmMaCz1509YyBfcK/eq0U05ORe7acNvNM8/auB6aiTx2CumZc50=
=LNvp
-----END PGP SIGNATURE-----

--ogTXpr5Jq/p9oEo7--

