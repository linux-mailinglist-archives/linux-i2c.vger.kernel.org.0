Return-Path: <linux-i2c+bounces-2445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F5880F36
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 11:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4344F1F23108
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8C13BBEE;
	Wed, 20 Mar 2024 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ibRegn5o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A53938F82
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710929050; cv=none; b=McLdrfvDdYzTEeYxurgk+uS8t6qtFc4YPmfZX+i+lVuJiKN/1nFnMcPtWMDGaPUexuc8GVnTTjaX5pt9jYqAjFhH/7v0R7B6T1WPpMo22PK5Itgpr44MC92Orxp8Mu6sznzkhnC54+/z4d/zg3i66K4nHsiPFNbJAXQiVgH/3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710929050; c=relaxed/simple;
	bh=5rPlvk1nqz2sh499uCLDuuTiFjlTxooqbaqswOinohU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUUz1WLG9AQ5svThcEl1k3P4V/PlHZARe5mGImfJMZqCQYkib04hCZN18d7/kEm3E8ShdEAcXatIOsGq1rVMa3nRQz7hNBram/M+3U/jOTo/aaKAQQcdhcRtG5PiPENfTElSgEqqYzEjZT6tXf0rOkFk27hw6Tecm6I571eP95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ibRegn5o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5rPl
	vk1nqz2sh499uCLDuuTiFjlTxooqbaqswOinohU=; b=ibRegn5o2A/4pWEOz/4m
	Ek+ZiyDBJ8bBS/Z+wO1tYHDRj5IOEm0fM3FNTm4t4yz/XVI7vqZmVaqZOP1QSFDP
	GbLJ6qR7k9mrR2QSO5Vjs5VnNwAgLXfwlM5RGQoA3k9fhXJxd4I0H+1AWFvQedBq
	L/oi9Ri78mCrLTui+XwOgkKbV6vbSQjpf0x/ZJO3xirUBarrio6gW/sdigch1ovQ
	z6joJlNFFD9HyyHXxlI+wNpnr3KHyo78ghUF+wR36CrDFTaYNmVmY6dwuo6amyzL
	y0AlzDgP2bVi5X1W8X6XEktXTbw8LJ4StAdNBq6MMMNci76qb1QMtH/BRYM5r036
	vw==
Received: (qmail 3167054 invoked from network); 20 Mar 2024 11:04:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2024 11:04:06 +0100
X-UD-Smtp-Session: l3s3148p1@kFADthQUtKBehhYE
Date: Wed, 20 Mar 2024 11:04:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 2/4] i2c: riic: Introduce helper functions for I2C
 read/write operations
Message-ID: <Zfq0lS8DyNc37REI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240319132503.80628-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L7COciTJCWjsS0ZE"
Content-Disposition: inline
In-Reply-To: <20240319132503.80628-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--L7COciTJCWjsS0ZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 01:25:01PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Introduce helper functions for performing I2C read and write operations
> in the RIIC driver.
>=20
> These helper functions lay the groundwork for adding support for the
> RZ/V2H SoC. This is essential because the register offsets for the RZ/V2H
> SoC differ from those of the RZ/A SoC. By abstracting the read and write
> operations, we can seamlessly adapt the driver to support different SoC
> variants without extensive modifications.
>=20
> This patch is part of the preparation process for integrating support for
> the RZ/V2H SoC into the RIIC driver.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks good, builds fine:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--L7COciTJCWjsS0ZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6tJEACgkQFA3kzBSg
KbYDxhAAryF5FtHRWGpTTdWBXKXcfam35RcU91UJ0SrhQixf8ot596q1CW3b45LS
w60jYdalZ16e1UXHkOQyLvEAis2TtW/k/60omBftZ7FFerAAWuorl04pRTfFZhli
qJgvrbF3v+umswN+8BkDCWaS2Z5pJk5RzSVCw5eqRGKzjoiZkbrcmK6k/czuxXnG
aOFvgA/v9HD6O/9ZkS7kVrME0bbjAev23WcZS+Q8xigRvlFm2vkNpAHmeL6VsGMO
fWAp8CNM60vz1mEMomBty36j37Mw9Xv+nP17OCrLe1RcIyptquKvL6/QoljHEDRD
80tcpN61OfiA/Q2IjuxL8iXOJWBlIYhnrWwEgAKv5SmqQwo86I/VgPax5ANNlTTA
GWHRlQHvq8h6pYuja6jT/MxgPtw9NvE33Ke2DsQu9vlkpy9cL02WZ4A2UemjmLWh
yeVH8FNieTubQic8wlFnzhR/rGwPrXfFDX8uYCdtYnG5OdxqNNrjNL51NXa07wCJ
wQrwSHFVkjSGfkXaup2JJLsNRP/Y6LQrswx0EpbhE2VvngwsZLUdVlIsChLVicDP
5Ra3Hjhs/6I7Xf5YedzIMcpPdgrd1dkHcZXW/fdsxY7hvmef9S0OzVPJnYGjx9Ky
pRT1hAI5PAzmbpqjlKCLcuslkbhcRjzXBWg+mauP6bPB04gDGL8=
=8C0O
-----END PGP SIGNATURE-----

--L7COciTJCWjsS0ZE--

