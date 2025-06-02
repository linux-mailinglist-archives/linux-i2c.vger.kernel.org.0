Return-Path: <linux-i2c+bounces-11193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA1ACACD6
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 12:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2792619607CF
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 10:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AC020C031;
	Mon,  2 Jun 2025 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jlIOAseB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C8920103A
	for <linux-i2c@vger.kernel.org>; Mon,  2 Jun 2025 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861756; cv=none; b=pUEbpTaeFe9mP1zpiCzG2TTbLPDocQjlkEXm7vPwTX1BeJuxg/Oa1E7j6EJhqw5CSP1g/nQW0H7n7zRdRl6L56cQ4y1hXfuOzo2BoSE6lcA2bcYyMuBNOWxrDPFjMbanMpnl9sodSp0Rxva8ntla8bj7CPzW/QD745c7ucoVb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861756; c=relaxed/simple;
	bh=7bGWWs+4p6un8NiBop/oIcpkSO5yAebwvmB4QV/UllA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZrJqYvQIRTeqNlzaNVwLQPKXr3ajDMcSuUJHTKPZWrdLUC2JU/o/Tmc/kMgMfLuuwGY6py+tx8B6WyLLEyMalV46sHCqF7O+WLURUYmQ7ak98x9NzVlZHS4Rc/oUCW1lZFoRkBAOvsWU7qMdJDlIy7fXLJh8+VSHuOU2V7qLnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jlIOAseB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7bGW
	Ws+4p6un8NiBop/oIcpkSO5yAebwvmB4QV/UllA=; b=jlIOAseB7DdMStRY8VgH
	C15JPBolMF0nkwF4a+PiPtPyTeilwvWlVUuyDCZBuUhOUSar2SyAV3ryHgwgA91S
	Zg8OWU2wuR3Vb20cHUnE3+eCHedI9MdmxTc5GCx2uMsO+CLmmIbTTqt0TJfrWxb7
	dEau4XWW3cnsVSmiGQP1g++GB94ZPXt+Di0hAy2AGZhPF+WyTe0cACgAgDw9uIlt
	u4wfNF+r5hBgAuLKB5AQLcOivcjnTeQQc6jPrMRIR1o1JJrnTuUhI+C8ezGzBKlY
	u7lG3dxiyoAN6C++1/+4XGLm/wwCSjQfJ+tvh5UWL4GHE+WYAyajDQMh658G9UKH
	SQ==
Received: (qmail 3354533 invoked from network); 2 Jun 2025 12:55:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2025 12:55:49 +0200
X-UD-Smtp-Session: l3s3148p1@mepLm5Q24AptKPMO
Date: Mon, 2 Jun 2025 12:55:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] i2c: riic: Pass IRQ desc array as part of OF data
Message-ID: <aD2DNNhG9_Bj58Yn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p0TvijFoPYANqdUd"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>


--p0TvijFoPYANqdUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:33PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> In preparation for adding support for Renesas RZ/T2H and RZ/N2H SoCs,
> which feature a combined error interrupt instead of individual error
> interrupts per condition, update the driver to support configurable IRQ
> layouts via OF data.
>=20
> Introduce a new `irqs` field and `num_irqs` count in `riic_of_data` to
> allow future SoCs to provide a custom IRQ layout. This patch is a
> non-functional change for existing SoCs and maintains compatibility with
> the current `riic_irqs` array.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1


--p0TvijFoPYANqdUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg9gzAACgkQFA3kzBSg
KbbxBg//SKzq7Y2TbgrcFY02e2zmA+f//ngSVsdGATypJihKvqsS/tkgLhZu4uI1
IgOvpXZTGbExw/0q7uFbNWQ+k7Fm7pIQmJWcqDMFy0hCJu9Hnq38vE7S/5a3il9q
1GvFIVTK9OfHe9eaa3mqOGk1ZusP8JA6ocpWAE6Y9aldJhj2PSliIiXryBnQttua
0hdUe2QK8e5Y1/3nwADEkd2WAY1d0CEakeahjy9H+xGAQXC51zYHUC2xUnAkjZj3
wYrpqde/aHdWm5P+M+uDpw21F5jSZKF/yRTT/DWDEN+fZy11UKG4KHIobyvk7ig8
utKdcmo4mAXPOQntYhTCK7iiDLO1Cw5cnJhUs9JnygZh5Qb1+ZbRfZSi8OIPVXMM
QEYWCVlxPKlQzxYCX/7nYbUDkNRdaqpu/AUXFBzalYo8avmEbnxPjsTdkGeSHQMR
HcIuUhvXdfZu4tmESYb/5C6HaTOcrVy1t3ffO08JMZugRpw4pe3eUmcAWHdyS4Y1
OqSKQ4NdkPwyLcJwsnkpHM/7HTb5g3gqxKDKq0XKizSInYVjKIFQhHTbVSKH7/gl
ZVEA0pi/ozXeDIkQSi2rt5rjFChO3Fgp12UQM4dJo7GYmELAsNuZZKHn/p2c7jVj
1ODtLVOrp5687Yfirx26se489MeUffNYqltp4/CUFyWZSdD4WMc=
=w+mr
-----END PGP SIGNATURE-----

--p0TvijFoPYANqdUd--

