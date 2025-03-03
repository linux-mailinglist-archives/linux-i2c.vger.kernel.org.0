Return-Path: <linux-i2c+bounces-9678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BFAA4B7CD
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 07:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38B2F3AAC0D
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 06:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C090C1E51F5;
	Mon,  3 Mar 2025 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T4UCCK7D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4AF1DED56
	for <linux-i2c@vger.kernel.org>; Mon,  3 Mar 2025 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740982134; cv=none; b=ndGZ1IhvWvWRHyLYIjRwap5QGC6EqDz+lSOXQZ70sr3/U7zajcY8fMVuWTn7kEG94r6jh1qXfvR9AvuDfHby5jh4hbEbq9g1fMtg5RU9CVsV5ZuOrP9rB93yrowPwgDbGfe8tBELmJErZGI4e3v8dSAMbGX7Bv8zFjxluIbprQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740982134; c=relaxed/simple;
	bh=/QZRPEFjSoqayM+6FnVCvhjR5X4Ps20vTPOqjHejMUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWkxlVruW5+0KSZjvWIoBHzpBTqA6J+sJL77khNBx5LLrlI5PcxSH7qWxR08psGwJxdUP4mDfoTn0I7Hmi4i7NNz1fMwvLZM+Pwv4dwE86RM4rla3BscHLOoGO4ACVq9a8S2LEfZy1T6iEyHs7TGPiYwY6wIpDwjA4Lh9lV6hGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T4UCCK7D; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f5nJ
	8GqBX+Y0PrnG8QSegNiuA3L+EfgTgBBMgy7TZVk=; b=T4UCCK7DQt9aqX9c+GfN
	fUNHTol0fucwK8j0eQFSey4k03s5iQgBENYRYIO8K+nzjxBRlcbEEBQ4pvsQGMtU
	4DIwHPYI/1eMixVAmXa1yJ9/4W9QhOv/Xz8xvGEkoMvsjdw/O+gkqd3bi9BSTR4K
	pZeHX+y0wRtWFOGgGgXsuCPyXyL1Tvxa2drkBkg4Yz3C9bxO3TY4/ACXI4BA+Szm
	171V6q4y6f7LfbBxizqzC6nxrAyNkvTJkXdfVndrXXhwmQ0ri8Lt8GGVvksRKkx5
	ly7DyrXNb1Jj6mdAN4g+CtMTBpTr84VewA6Xemrduc1Z246LmuqGd+8F1ch6gq7B
	yw==
Received: (qmail 2094502 invoked from network); 3 Mar 2025 07:08:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2025 07:08:41 +0100
X-UD-Smtp-Session: l3s3148p1@DB3o/Gkvoq0gAQnoAF7DALd8qOkixhgf
Date: Mon, 3 Mar 2025 07:08:41 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
Message-ID: <Z8VHaQsqAmhtQnbv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tWU+hAMp67fkq/U3"
Content-Disposition: inline
In-Reply-To: <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>


--tWU+hAMp67fkq/U3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +/* spacemit i2c registers */
> +#define SPACEMIT_ICR		 0x0		/* Control Register */
> +#define SPACEMIT_ISR		 0x4		/* Status Register */
> +#define SPACEMIT_IDBR		 0xc		/* Data Buffer Register */
> +#define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> +
> +/* register SPACEMIT_ICR fields */
> +#define SPACEMIT_CR_START        BIT(0)		/* start bit */
> +#define SPACEMIT_CR_STOP         BIT(1)		/* stop bit */
> +#define SPACEMIT_CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
> +#define SPACEMIT_CR_TB           BIT(3)		/* transfer byte bit */

This looks like a lot like a variant of the i2c-pxa register set. Has it
been considered to reuse that driver?


--tWU+hAMp67fkq/U3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfFR2QACgkQFA3kzBSg
KbadHQ//T3DW9roZhtPTeDwT9s9mkDm+L0NzczjCou49UCord1bP05lglXi4wjPM
HILnG/VCQvIEvThXiNTA5qmWhMUQGbl+D5BZgbiRMFSD3y3S3E1ca/VbUMOhqR7F
aj4kxIeopHvLJX4YBMRxLduRpz/HLpLpoOEhOLaF2sXo7e2MoMvxDrQ/6y4abvUj
W/UqFaIIEz7Of7JG9D5YfPplLD0RVuiFJ6h0/gglu0MicaFvQ73GAVLec7TNche8
9lpn9CbufaQJ2aUdFDPJiOzPfy8I0zBBGDVaI+yJYLvdm3v9GaNnqM/GC1M4SSHx
BlaYzBN3XRKjU/6M9SziVPb4CO1Aoy4VScvTVLXlkoNUfB0j9Zb46iB6sS7ex+AW
TH7XIT9WF8ef45NfSmb6jB7WHYnSlZ+iFc71uIK3zyJphVABhD60ykB3NU5QDCVT
QRVBGSkpLJSnl3GG7HYIl35Phl5ns1ROnJNKd9Z0iccFQ/JJg+GFCiAQPqnrBoX/
rGcrLfMgf4NVHOLfttL8E/kNk7YcDvbk/6soBJF5VYT+bgRNpsPBBWusWYx2Aefv
nj/n+kngXPQ4PnyuY3kj1nKI6/J9pRdq3E8+OwT5vXSqFDaM3si33IximlTsfkmt
23AI8N+S6KUFzcQXOg5CfYMmyHDIXdcfm410qTP+4odobQO2Oco=
=1qER
-----END PGP SIGNATURE-----

--tWU+hAMp67fkq/U3--

