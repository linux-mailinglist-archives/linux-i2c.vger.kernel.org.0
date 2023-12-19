Return-Path: <linux-i2c+bounces-877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8BC818DA7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C6A1C24E72
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735DA3715A;
	Tue, 19 Dec 2023 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QG+RfNMD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132FA37D21;
	Tue, 19 Dec 2023 17:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06B3C433CA;
	Tue, 19 Dec 2023 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703005590;
	bh=a7OnamfCwWf+orWN0KvpA25yoky33RSY7KSTSqDl/A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QG+RfNMDFWyLdUnI3z9dEpRaS/CjlNjdf9whequWAeBC/cq2NpTpAAOaJE6WGNqMX
	 aZwjfMcMV1oQ65I394Yc1ZK42hCLpm4YZMDDPj9iIRcKoy07BQhuREIcyGVOFpiYgg
	 0xr3pSG/It9HDJhPl0ZNh1CS5kynJQD8QigPks1esTRsEU7/LxYmsh5Jr42BvUXSH+
	 ENDM9zXsM5dWAcn+beWg5lXRuc5cTwyY8v4T64Yn5TsVrZmdz+YZXKhcoZ6nm6BQhN
	 jU+mHkzc8PDvgvPO/3bDN5H8/15C7BUiWRl9WyJ1sw2dauEaSgWpysP1GzZr6jutH2
	 Va2udn3TEkxMQ==
Date: Tue, 19 Dec 2023 18:06:26 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tim Lunn <tim@feathertop.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Jagan Teki <jagan@edgeble.ai>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on
 rv1126
Message-ID: <ZYHNkgxAauYp6ivX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tim Lunn <tim@feathertop.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20231203124004.2676174-1-tim@feathertop.org>
 <20231203124004.2676174-4-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sByZ41cl6uk/xLbT"
Content-Disposition: inline
In-Reply-To: <20231203124004.2676174-4-tim@feathertop.org>


--sByZ41cl6uk/xLbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 11:39:59PM +1100, Tim Lunn wrote:
> Rockchip RV1126 is using old style i2c controller, the i2c2
> bus uses a non-sequential offset in the grf register for the
> mask/value bits for this bus.
>=20
> This patch fixes i2c2 bus on rv1126 SoCs.
>=20
> Signed-off-by: Tim Lunn <tim@feathertop.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20

Applied to for-next, thanks!

But, phew, the fact that this driver _needs_ i2c-aliases in DT should be
fixed somewhen. I totally overlooked this so far :/


--sByZ41cl6uk/xLbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBzZIACgkQFA3kzBSg
KbbCTxAAhKVTE46KK8QieYwxX2cW+2NJfyL0OYbsB05G5G49MqoDkY9qO2m0+p+5
WWkmnMZHQ90vsx5Rep5qcFUmAC+q+b4+tU9qVT2WEPmdgsiBteDB43HetxdBBbzO
NwT8Z3uanQpcubf9hzW4v6UZAIrmmpvQWO7LKMa4ZqWtlFIYnyLYCLKl5MK8Rzbi
n+z/8ppmMp98e/lj153aKh+F8IxLNW5jHy83elAudC2ovyc2veIXhpcxria5S7Ca
U3KQdFvBdwLoGiAsMsLfRbIRYf9ItR7E4oKTyKnlEJzZF5C4gpjgeEa39w7g/Kl6
pIS2rnuMKvWObEnyvZGUJBbyxzFkjCOXA1O1wANLgtV3HrTWFifkIdup5pudJtKg
uhJqlqFfvDDGxpKrdSBFYT82tDL2WON+wiOg5bF7cjLx6r4QZ2MZBaiOmuMnsadE
BqLwnHjSR9QyAa+2SliYrahWyae9rFxwAVBv+/DrZpuK0L7u1SeMonq/r+jh7Fpf
yhpQTSW1levm6ltNXPyajNwpZiUKJCMB0yy/Sw/Tnpqw1e+PY0PxenPAgSOBIcPo
oNtTjhSXfS+QeorHPM9zUDu9OoCGRW412FRXQU6L+NVQOCjFOaX2d6RMPedbOYql
NZnS9kaFXtWL6roKEwFghdhym4sj6PO5ieJOpdsZh0xcXOUaf4E=
=Ifc0
-----END PGP SIGNATURE-----

--sByZ41cl6uk/xLbT--

