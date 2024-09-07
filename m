Return-Path: <linux-i2c+bounces-6348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71A9703F2
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 21:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AFC11F22074
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 19:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9217E166F10;
	Sat,  7 Sep 2024 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jZ7KeRDW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8C1DDC9
	for <linux-i2c@vger.kernel.org>; Sat,  7 Sep 2024 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725737806; cv=none; b=Vn2GPtq6u1lpPT4BXlMAZhRRzSRwJ2UaFYmmXQrcvAL87LLphz0VcCoByirkajmaNWt7HFpzXVVdC3t31YUa6k5q7eUqvhx1ZDUy546FUhKdzvZU0ty1S4O8Qx4QwoB/iPzi55PRb4JmADJGx9sE1oLdiD0HOAdOZl84Hd5yC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725737806; c=relaxed/simple;
	bh=diq//ypwFpciLVOeg5yN2zfMUy+DDfDmYoj1id8kWHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/1/5Kg5yjEtdaFLr0PLXt1uvlEfcWQqSfYv0P6hStE8rXy30L6CLiC3XBfMUFY7SgXNLgTjY2UIgwCvZEA0YyzeL2Y+2Fg5OA9tBkqLqJcxgmbBTkCqWmHniaSkQlh2+ZKuzVm2plmZoDDakXbSM/ozRRISpQJGKOWo7peZAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jZ7KeRDW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ftmI
	51XeY5SayZ7K9um85kpUIGa3z77Fyu2HJa1sqPQ=; b=jZ7KeRDW4lUedqNBLJR7
	3yMfDiAwVEM9fmUcg6YiCIk+SO0/fkez5cBdVl6SAJ0e003lPPekRMZ++8pQbm/R
	/HBo75oSZ7Dm+AvjEZwjY2mXKcKjyx//kgfZpkXoiG60iypEb9JrJvgCQyYl8E93
	NYYukWi/46aQcgHXGNqZuSzVKQDjXzh7cTG7ymWveKTOuYx9IY4g3jrI5j/gy2D5
	t0Zn5C6fiextcLNWIylAU6t+svjzXl0Mut230o3cH+YU+FYQ8l2QKLongufhNsmU
	aq+lnGex715eYRM3IVCAY/Z8spy7QIAjqXng9pV8StmuEJ4Pu0DhQExAmYfjHuqJ
	dQ==
Received: (qmail 1597171 invoked from network); 7 Sep 2024 21:36:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2024 21:36:37 +0200
X-UD-Smtp-Session: l3s3148p1@fJlhpIwhXJYujnvu
Date: Sat, 7 Sep 2024 21:36:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: andriy.shevchenko@intel.com, biju.das.jz@bp.renesas.com,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v4 1/3] i2c: emev2: Use devm_clk_get_enabled() helpers
Message-ID: <ZtyrRLojI8GNiEj0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rong Qianfeng <rongqianfeng@vivo.com>, andriy.shevchenko@intel.com,
	biju.das.jz@bp.renesas.com, Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
 <20240827034841.4121-2-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zQo77BMXTDa4nVkc"
Content-Disposition: inline
In-Reply-To: <20240827034841.4121-2-rongqianfeng@vivo.com>


--zQo77BMXTDa4nVkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 11:48:39AM +0800, Rong Qianfeng wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>=20
> This simplifies the code and avoids the calls to clk_disable_unprepare().
>=20
> While at it, no need to save clk pointer, drop sclk from struct
> em_i2c_device.
>=20
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--zQo77BMXTDa4nVkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbcq0AACgkQFA3kzBSg
KbZZDRAAqpH+N1/D/nIYiSriyH3t4x3bAo19j269qgknU9HxkhD5orC618cheUhS
vi2v/4U63GraIoGKMfelq6BSXWzozNotp5SF4+LVQP2D2Xc94sc1YAT7nPMGUniK
AqVcb1eXrx99PEGU/hBVPu9DXXgOYM+8eK/xte0ASWlvishO6gKY3NqUhFxsF57G
24oSEOXk4yHQgYXBbZ0jt1+H9THOdMWCJ5VyvOVK0Rt2P9hk/XJSyHxlRHyU29nd
yQM46rWf0MMyG/qmZ5fJT8bCHJnAVpfLJUQlilLpH5w4pQ6uK/O3D+SKhIJn7Jwu
gGFD9ztMvvHbgBDU2TBO3yOf3xuh+P/ZcFSXOu9xCWycHa17U6wpnFQw940kYnR1
yP0uJTnWIJj3bwdHWiLFnctMS/3i7LODFNIk6uWUUxAyLMG8fBCkAPWSwcK0jEjJ
Ej1G6f7AHZTBxO4oXa57Ydo03cV2IIH7C6k86C0bTuwouhnf5oUK1AU2TTm9hNWx
abkuiEPotIXDe+sZK76C8XbGh1ViPn7xcYLM7RZe2iapQcs4gwulEEhtBSU4gjDK
aTpNdxVqByMvIh8kGEA3V05Mot0JdUNRpOa1uQH36hmdIKjEAU35oa45ZN5n+7kE
bg3gIqvXIJCc3P5FLFMvgrmj7CZ98RSs+CFOdbMADaWzID6yuuQ=
=xVsd
-----END PGP SIGNATURE-----

--zQo77BMXTDa4nVkc--

