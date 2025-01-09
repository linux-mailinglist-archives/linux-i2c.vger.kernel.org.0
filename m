Return-Path: <linux-i2c+bounces-8990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B3A071B9
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 719EF1884888
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 09:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADB92153CE;
	Thu,  9 Jan 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jC7mi8S1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236162153CD
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415668; cv=none; b=VCCfihoL/J2hA3H1WbahNAmy8eqgmBG/AAHpKotmJEOYxvHkQtt609GX/W53feQzlLcqg4N6SwIFjH6SILcm/dB2avicGYa37Sl4Yxv2NHTi4wbgAEuuYnTl431yKtB9XrOSxpc2GceIB7Im5KpunR2gHLUS+68pWa/WN0BAg9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415668; c=relaxed/simple;
	bh=sT90DPMHlGMdnDJEJkAYUUYNw023TOZWGVCjIIBRgDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZ1H2BZzjs7+UPLoxv+ZCn3nM5iR7/EnmQNom7hETPgmZdu85eeXjgnTpR8BZD7fAYLeN6V0OZdAxiIkCmd2KsXSmPaUE0tZoKlclaJETUiVbxklh6Ws9H1slhVxq7KZj+LdH0zDDxaHDXYmmuOUJ59TiT1unOU3SiZWFwQlQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jC7mi8S1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sT90
	DPMHlGMdnDJEJkAYUUYNw023TOZWGVCjIIBRgDg=; b=jC7mi8S1/I2txVE2R80y
	nRCCTZtdI1GESgutmdUcnVOHfABGufJuJHqsZZBMyngCeuMip99Koc1SU/Juh3Av
	u7SQ14fXCmy1LROqh0WMntNvRHWTrVnxJ7wwsM96Mma3P0hGC94f9WcVU8OuSzgd
	g+8kzjGmHnC8+u8G4o+yulbPBRX5GvugeUBPscytPZSy0rJKYCn52wfX09TTKP7F
	/Vk/IgSacYpMN/sOM2xCUuv5z/7duiAIb17Wk05PYIpi2K25PtKYrnDHY3FxmUeU
	YghsZ+YB7qETH6K39Do+TRJnk1b+avCpz6FB9o5NHoSTACX8DHCJT+GQaL3Lew5p
	2A==
Received: (qmail 2855576 invoked from network); 9 Jan 2025 10:41:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 10:41:05 +0100
X-UD-Smtp-Session: l3s3148p1@PDbixkIrDtwgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 10:41:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 8/9] i2c: riic: Use predefined macro and simplify
 clock tick calculation
Message-ID: <Z3-ZsKyZ7aGnpjuQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250103091900.428729-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f1nKlSfJhhdWEbs2"
Content-Disposition: inline
In-Reply-To: <20250103091900.428729-9-prabhakar.mahadev-lad.rj@bp.renesas.com>


--f1nKlSfJhhdWEbs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#include <vdso/time64.h>

Hmmm, what about using 'linux/time.h' instead and relying that it does
the right thing?

Nice cleanup otherwise!


--f1nKlSfJhhdWEbs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/mbAACgkQFA3kzBSg
KbZ9ahAAgU6NTbXLP+iFpm2Xq7pJJG2v95ORbUOGgSQ0o5tbicRs6oHkYEDRxy0b
r4S1zMB+KKXzo7WoFgXsK55Pet4K79ceiXRI6hOxQm0P2NQv52wSuS15IHVJXzgx
sPczpDTHMVC/cZmDkVA5dmfeOcjPtUofWifayMjjPDv5DNKaRTTShvBcuMtq9ah7
/soGzQmhqgZ8RgbbVq7q8Xlz0RkL6Ple7NG/asCPrDOOTy62PryzSxtxldQaHOAG
8VtVBXUDwBjqdvylZGSfFFN4Ow7jgJ6ULFYepM6s7lkfsIfaJt5hHpfC7RjDj+nW
FV3g13rRIj9XVwQyUIXpfb7fCbKMVf//zsbyK383+1nKqDqNrJ2ap5PYkxhV4Lp7
eViTw5M0JUn7KOxZh477fZMrGc2kUG1818Z6QdKi6x33lGFl0cnIoJ4P5dZ+RFWg
Ux4TSTvYh4ZTXP7+ImWVujHAdjy8e+VwKSeGA4YWnWhSyouiy/rU1mfTo34nXKQn
eD6J+13zINY86Und22A6F1ySu6iz7apJl+Z8wFte71/pwNqA0vDl7s3rGaG56IJB
+WPZ8rwIfzURCq/j0kNKh5puDVPF8Ilqc62feJkZ7dWWL4KCKY7+ZEWb3s4k4eQv
O0MoOr74Q9sVfVGQhoHLP4tA6MgX+GYM2EJcsPwL7ZtToKQuHbI=
=C3MD
-----END PGP SIGNATURE-----

--f1nKlSfJhhdWEbs2--

