Return-Path: <linux-i2c+bounces-12932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5EB55912
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 00:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3AD41C28351
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 22:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AB024A046;
	Fri, 12 Sep 2025 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gjJQnps9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F2E220685
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757715712; cv=none; b=ZkjJsceFIzvVmHeetVk1lxtc9vDr8VyHyYLGVm7A5iRujh7hjEMtxoSh8TgvjfT/qjplZPETa+kutE03/HBarL4o7qnMdt0AlqrakV86aYBiCp+BtLT/HEeGhCtprk2VTduWa+m1+ug7cSm/ZRHotMMqFuwBeoR7SjJUtTF1ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757715712; c=relaxed/simple;
	bh=7fOGJqk2vZj/fqhiH1RjflejSVIFU8XKt/REQU6YVD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7gmNGNU6gB0FH1ubhXIZM81T/7Imh+FZLJy0XMqiCqrL2bXtHEsJR4me9c6U3o3xA9og1CTNUhY5sAD20FJT6P+HqCcXwxaq5P7IvrwSnZc18hmOoJP/KN61B/E5AmkiZors8qTbKYdHCK1LmzmKTA7mKM+mbbTm6hEV8qazsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gjJQnps9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7fOG
	Jqk2vZj/fqhiH1RjflejSVIFU8XKt/REQU6YVD4=; b=gjJQnps9P0ECM7TMd07S
	g4I5j+Gxnivrn37/oauzy2D5owjGcpNWGt/9Fsd7g0/xoEeXM+UsTL0OeqHgi+fg
	yIcmfT8AfiTtAHSwZMMJitlytxYGDw9nU1twutLmWlCp0M4yrwenbF1iOQnJhpkL
	h2ZAsXmF26yeDvJarqjFb/TuqLCX9fN1dspqiw6lV3schaGV/QrvKzEV9AWyydVf
	0M04Pd6Re94DFPdAfnLEzZUjMnrAu+48prmn5Yax8EIJEWGAoh9NiUVxgQbLzrf1
	hnlGOeCfxwREhH1EWoavGq3yt0XIvRNWQoqLfCccv9tXmtxuICQIdSM6oNTccyZD
	sw==
Received: (qmail 1503168 invoked from network); 13 Sep 2025 00:21:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:21:48 +0200
X-UD-Smtp-Session: l3s3148p1@8KlsFKI+XpkgAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:21:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: ulf.hansson@linaro.org, rafael@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] i2c: core: Drop dev_pm_domain_detach() call
Message-ID: <aMSc_PVtS4rv2yI2@shikoro>
References: <20250827101042.927030-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JzFD1ugCEMAQ+u7l"
Content-Disposition: inline
In-Reply-To: <20250827101042.927030-1-claudiu.beznea.uj@bp.renesas.com>


--JzFD1ugCEMAQ+u7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 01:10:42PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Starting with commit f99508074e78 ("PM: domains: Detach on
> device_unbind_cleanup()"), there is no longer a need to call
> dev_pm_domain_detach() in the bus remove function. The
> device_unbind_cleanup() function now handles this to avoid
> invoking devres cleanup handlers while the PM domain is
> powered off, which could otherwise lead to failures as
> described in the above-mentioned commit.
>=20
> Drop the explicit dev_pm_domain_detach() call and rely instead
> on the flags passed to dev_pm_domain_attach() to power off the
> domain.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Applied to for-next, thanks!


--JzFD1ugCEMAQ+u7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjEnPUACgkQFA3kzBSg
KbZTlg//ebtCkEU7aWJidjaqUu6Zl3AZkhmoiWDiDZ4/BnpLPI+o0TgscxxaKSL/
OlF5A7f9SXH1+3imp7VRVxOsExDUC8FEPJchIcaTCKb+LSlZ5C1Y/7Yv3JkE6vs5
8K+fFf5Ips9Klo1ek2+Yav3DAzYyouozR5BD2KmV30Km0Lv/DcCqI34PU69+UouE
0SyK97e/dspOUG3rJ4xIsXf4O57ZF6/KA1lL+VbiZVFn+jC8uFKlOND8ivzLcb9U
9hBM0TFODndZ7cQpL3q6ucKp+3DQbu1S1oxR1XJtBAK0krnme/W1hUXtC8rNJLYu
zbJoC76vWbNHu+gc9jeNE1FMjHxPXliJkjy7fnRMRZPFQCe3rfxANT7oQvvraOqZ
2OiJNhuNJ3ot8cX8dAyPS3/zWH9Ffl9kz/TmElDJCNbcCdONCCoRqLvdRRdKVGqG
xvkMjUsK6YwOqQW4wd9Dtm7Ra/j5U8n2J/DIkAz79dmKOdDdkaDfC0qLDhwGrAor
nhwykVksY5jPjxvEe1lMDP7wwclPvy0RQVGYCjfrXqwJQwt+1Xd62I+sKRmZbARq
CoTPsCIlXEY+e3urzCbu2eUW0auV3LMcOFDQHVxXaNwsQNsGGg+267ckdO7NvhAW
19eGA++LaomO8P1LlgsI7Kt5J+9OcxdyXi5R4j0xqmv8de9btvk=
=LWLq
-----END PGP SIGNATURE-----

--JzFD1ugCEMAQ+u7l--

