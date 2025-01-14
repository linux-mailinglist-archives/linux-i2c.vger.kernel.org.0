Return-Path: <linux-i2c+bounces-9081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15721A1060E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 12:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26B13A527B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4572361DC;
	Tue, 14 Jan 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c+BVFOaj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B32A2361C9
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855971; cv=none; b=j7adsqAvjwYPGQNrOTOknoZNWiJ8oflJonjiHbrioif4u1pOoPeZwRny7iBOtygnVZ8mizJ+WLAnYs85zOGf6QXI9Ur1RE1lwvT/HuncH9o+lU1Dil8xeFqBaVof68Pc8wEF7vnuX4eI1Z5YE0nuHU44yHfFkIzpDyRWtbkpCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855971; c=relaxed/simple;
	bh=VjaueqAyNIt1jpMVruQ3SIyiwFZUUJz/HTHzfSu23rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwNHeonpOr5j5ADzSfGCuc3FWkuJ57k87jfSSVPHThlFJITPQ2lPZ+H9WMJ8YXEHTuQkiFboKJl4TC1XpDRr832Juil0Ldbc2+HiN6wFIG+dmCWy+WGmEOlQRNrm+NERR+nu8BxJ9HC+sAS912fJqnCh43ovd6kZktjoyDKcblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c+BVFOaj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Vjau
	eqAyNIt1jpMVruQ3SIyiwFZUUJz/HTHzfSu23rI=; b=c+BVFOaja9fhpbh5vdyJ
	dpsIejJlPsqcJZF4xhE8YUYG82yIxcF1RqCP0khTGCXhkFArpN1bGeK0wHpkhfbt
	9V+jaR9aEbKNUINEI64zh+ZtsdtsIJUOV4oqM+yvjqNqvyJ8zKcA9waKx2iCgmIX
	Hca75JzA/o62cpbaGkOTlaZdUL7722lfTWe4UgdsnV+P04dJJkn7lG79XXkZu9Jx
	04Z/VEuBPW5sIN/4tuWW+zJLJqhKSFilTJ00ZEF4u8v+L+qvanjF+lKICRizMJ9Z
	PLuO17mc9fKCmbxNJz6FRjTXbBaVnEUnwMRrb96TvhRB84m5TTRueCMGgwrnnUqS
	rA==
Received: (qmail 194402 invoked from network); 14 Jan 2025 12:59:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 12:59:27 +0100
X-UD-Smtp-Session: l3s3148p1@pbnzSqkryDdtKPCo
Date: Tue, 14 Jan 2025 12:59:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: add core-managed per-client directory in debugfs
Message-ID: <Z4ZRn4v1nEaCSkUT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
 <20250109122112.45810-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HDEKgQATGGd98ehk"
Content-Disposition: inline
In-Reply-To: <20250109122112.45810-2-wsa+renesas@sang-engineering.com>


--HDEKgQATGGd98ehk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2025 at 01:21:10PM +0100, Wolfram Sang wrote:
> More and more I2C client drivers use debugfs entries and currently they
> need to manage a subdir for their files on their own. This means
> inconsistent naming for these subdirs and they are scattered all over
> the debugfs-tree as well. Not to mention the duplicated code.
>=20
> Let the I2C core provide and maintain a proper directory per client.
>=20
> Note: It was considered to save the additional pointer in 'struct
> i2c_client' and only provide a subdir when requested via a helper
> function. When sketching this approach, more and more corner cases
> appeared, though, so the current solution with its simple and unabiguous
> code was chosen.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--HDEKgQATGGd98ehk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGUZ4ACgkQFA3kzBSg
KbYdVQ//exyB2wvpr3A8Cf8BJt7l0HbAD6ar5je9BHJ8YOhAHMlFdT4u0oxh6Jka
XvKnOTaXopahYV/+ibxN0xQCAEY3uINlBWTpVCOEa+qKS6MaLoXeXmiIWbpZ27xO
WHzD1T6ETFWOxGjNzFAdRXhVngZVHEYf5q9goTNwbhEuAeR+vvU0hiGgbY9yRQST
aSID/3bSvLO8YvFmj/abnDNkcTA9JuLYvMCGszi9i/pe5BWRKzz6i7GEH8VaBC9G
cOw4df2+XOk8/2/3l6smeIxmY3yJUic5e4U4o0fKk7NFWFyNfDzP0oA1k1UjOEhd
WjHgrT9m0W5QbR8rd3BujLa2NBH9GSynxm2AqrqZSwdq+qPU/IgiLIWmS5bMrBVg
wF33qC9TF3eqLbCBBZZudt6oBdWPG9XvKtGOyiSIFA1ajhp5nr5CwoJv46UPpt7Z
+XEPmYglX0Att/Vpg72VSD6zZQHgw954y5/N6ymPSw2CPRjcSBkRahMfL+vzbh+b
PAb5i4bTZcrh/uyt8Kr8TeTXeN74xprRcRG1WBfp156g9fkWlRYzkoYf05Q/7goT
LxYDtoCZzq3VvxbfyYi0YsAIDxlIhRpgEodU8ZmngEsGKflF3QHgm5e56k6gWPsw
+L9OIEs2UmdXWBf2FkwI/5D1e59KVO6dD6LjOa02qMuyAeQjK+8=
=qFOc
-----END PGP SIGNATURE-----

--HDEKgQATGGd98ehk--

