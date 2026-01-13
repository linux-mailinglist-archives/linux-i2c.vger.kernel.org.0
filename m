Return-Path: <linux-i2c+bounces-15135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EBED1AAA8
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6CE3300D15D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731F834676F;
	Tue, 13 Jan 2026 17:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Jd0e5zs4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C3329C74
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325748; cv=none; b=AsOlouf/IxtzP00iFP/qJaQBisQbG+07mmGGvKiSfDQuQHPjIVSnftdWxg/2wDPULxYCWHpk6tJFcfyZf2sgFtvZFJNe/6+UUgQhW5Og4qu4STBTcdYhp7gondm4v2mkNxbmAuVNo5WxAAWc5NRH5rBLlbEhX3AQ/TyS4vgRG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325748; c=relaxed/simple;
	bh=nK4IEAi3Z0jovsms8j1zbQ+KcbZnS6s/8gybJxweZVI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlInAbISwnrLHmUczdq74pQQqcbHbfYX0GjBa8iBuzA4vBgQ9LteXQmdSj1XgsU4gg/4ZlSQbgJv2it2iA3YaKRxJXBEGTgyyaqapL9NP3dFiHkceTTE5UDeVPSSu7OzX5P4YjKPeaYLmmuZa33HxlafGGNUDv1Phg4L0eD8RJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Jd0e5zs4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nK4I
	EAi3Z0jovsms8j1zbQ+KcbZnS6s/8gybJxweZVI=; b=Jd0e5zs4gExDhcgwLHcX
	hsxUIKGT75gnVIv7eovABKq0zcreoOSdnIyjlyjK6YJpnUgTggQP0c11erN5RrlN
	81lqyx7Arg1rA2GssMXPAdPXCYvIZ2I3nwpOwN67r8QDvzl97Gu1RHInYLTo+RcF
	UZRg0+8913OcnJG/Jsw0AMm3uxEDL6rPtKgGmKC39svqZoPy7LNrCNU3T0E1g/jO
	A6acCH0FBhFZbP139Uw+6HoHXDKcT0lmgIxYObWcAnxoUZDF5BhUGuUx02/6vkhB
	fmosai3fL5l88UjAPmreZ9VOJYWPkbBvifgfMilvk0JMRIxSB9KxDuS6WMWf2+c3
	6w==
Received: (qmail 1797577 invoked from network); 13 Jan 2026 18:35:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 18:35:44 +0100
X-UD-Smtp-Session: l3s3148p1@wzHUa0hI2rQujnvx
Date: Tue, 13 Jan 2026 18:35:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Makefile: allow installing perl scripts
 optionally
Message-ID: <aWaCb7j221AqkbeK@ninjato>
References: <20251111172843.471954-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qubSMdQ8DSgiyXMH"
Content-Disposition: inline
In-Reply-To: <20251111172843.471954-1-wsa+renesas@sang-engineering.com>


--qubSMdQ8DSgiyXMH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 06:28:43PM +0100, Wolfram Sang wrote:
> i2c-tools are used on embedded devices where perl is not installed and
> rootfs size matters. Allow build systems to skip installing the perl
> scripts.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.


--qubSMdQ8DSgiyXMH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmgm4ACgkQFA3kzBSg
KbaLTxAAlep9RTWtEsnpAn6gfWgH0TCu9XicqocZoR2uNAHJg5M9gTUo2WyGXI5g
B2VzYgzcsgLyrW3rZWdSFaLni82PWiT+7Rne39h2WTeFil5hstBWOLek2I7mh7w1
caHX5T8fggg8rmLh21XGZuc3Xtm7aPmh2LkRs8I8nDMrguqj1ih7yGiv6xuq6P1W
K+jqWYivGRp6rueOx4NIfoBF3mmX9VfVx7Fs9qd/oIgTTaXnPgDyv6zfbACL2fFI
sT/78vsOQ9P4/HJezRv/i7RizlHdGnRcb/9H7uG18dJ1XFR8fHuLMlwhsJWNeSg8
ADoMLdbByYkmDePvuk4thPhxSnCyKInMYd8dXV1RUG4sSU6kmvEV4Vvrm726FdYa
HEu3wdPvDiVJ2UIdOvuR2eb8goxNn4oW6+K6uTEW9tezK7lm9W4Y6B/qcu3doQyv
5XPXv2OooBJc+wYZ5TS3aJAIH6vjf32U1uXSZPAdk99D7WhcX7VFqsjqP3J12bQv
RaXk8zW5d/v2f64cMBv43Bl8KpxiT5IYDOJNiXQledulJp5OBYhNwZuPpZnyiYrj
jDiria/T26C6vzK0T3FCoyoxSgsNmdyZ4IOPF3YtVZF0MqAD7ov9JL0CqcY05er8
IV3UjkUTJbRTyPCzts++0E1r25HRSHvL4Xxh3maEm39Fs3/WOWg=
=XiYh
-----END PGP SIGNATURE-----

--qubSMdQ8DSgiyXMH--

