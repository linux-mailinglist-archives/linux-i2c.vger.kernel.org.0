Return-Path: <linux-i2c+bounces-15118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7EDD19FB7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D473093B0F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133313939C8;
	Tue, 13 Jan 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CatY5qCo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFF73939B7
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318956; cv=none; b=sisbudEbM4iPRoo9ATSc8c4eIP/p08yqxwDX/vN0AH/6CNNcIzuGPreDgW12jsVd4edn5qd6IvV42CHL/MqOJO9j8Y+iJpmNZY9SUB/KM/JL2WIXowjoPkwoUqB3OVElmEi/8a6FWzdDxWsYYyyCZgDDDRHGEaEWkENs8RM5Gew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318956; c=relaxed/simple;
	bh=tPdWW4vU8ltIfv+T9GwVm3KlWqgXUNO6lQEguPepehw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpxYDveaxQ3oz5ijP6+Ua5JRlqmKokneZNC2RqkAYyY4CmJbFwdQgLm/C7H+zFJwXF5bXxo/2ZbiCtBBOBKgcXLQLp/uL3fGDnKaZJNW14YgxYwneZ9FYDrbSXLv+FX/vFouHKXaJGBmyVFOeQvuJ/d2imTMj0zPF+axnwp/WXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CatY5qCo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tPdW
	W4vU8ltIfv+T9GwVm3KlWqgXUNO6lQEguPepehw=; b=CatY5qCoIiYEpotS6xxe
	fY35QwhNrQ5dOKSASXK2nBhT1vOyToYd8CTFIPfLHBaODbfL3VRytgeKc9Rx7j2R
	L4h/DmYfWvWaENeIjQ4h0V8mSTmJQJcFzD1XLpkveyV0oA5zHzQ3XK3rm6IMevQH
	kCpS0Z3MqExfMnKqCg+RLbfFxtPTWmikiHlbuK3YR1HlOg6RH8OgXN/cl4cegyyg
	8fw//wLu2liOOmG0EgJfXz8pTybQji+mZ1GyLkh6qEXRzEGwZpqqGjc5mQPwGA4C
	1zaQbaDu4iZbDXwZ5+oa3odOu8fp5D+splnhrOjjpRAcYZ/yoWfuZwEqPo19ZGup
	tA==
Received: (qmail 1757942 invoked from network); 13 Jan 2026 16:42:30 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:42:30 +0100
X-UD-Smtp-Session: l3s3148p1@xoPa1kZIGJgujnvx
Date: Tue, 13 Jan 2026 16:42:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
	wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 4/6] i2c: tegra: Add HS mode support
Message-ID: <aWZn5VdufWw8np4l@ninjato>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-5-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fhc5SUEgDctk4dRK"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-5-akhilrajeev@nvidia.com>


--Fhc5SUEgDctk4dRK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 07:36:18PM +0530, Akhil R wrote:
> Add support for High Speed (HS) mode transfers for Tegra194 and later
> chips. While HS mode has been documented in the technical reference
> manuals since Tegra20, the hardware implementation appears to be broken
> on all chips prior to Tegra194.
>=20
> When HS mode is not supported, set the frequency to FM+ instead.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--Fhc5SUEgDctk4dRK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmZ+UACgkQFA3kzBSg
KbY1ew//YQ0eToGZmyxqvHB2AVoujev2Xs8TFrDcu178tBjyIquEOwoD1zqvFjLX
1sdstC+yqfPkwago/K1B8ZwCu4ekr9afDUWlPQ9m3nN1zzUO7EY5xWpLZFPWgj5p
6cdyxYWT2v0QzVk9315IvdQPBGD2xyLvsrLceRQHneceBsYgkTsVYo1KmE5+x8qc
FOxEe2eR5bLj0wFddL0e3mnGEtLDkhM0qf9xpeDZqYfHCiL1e3CGhn55LhFnXQBl
Yr6uVn/tcKF5ERaK/YWI12B/qLOP2ocPqSNfko0vA2jBwn0OefNT78XvSz6f65uD
xROBJc+uQMfQ9AyoRgz4N8X5eEOQMmONOU1tHLXweBdRvZK+hWGMx91uGAGKP6+G
k5jThhnN7XV/sIPuaRHFgQs+2eNdNjKgulZSupjBX5q35nrvJTQg7UmsFWwPyHXs
5F33/p7L1HaQlAQCHTZQ+mIwf6WVp0t4ch0JkQ2gy4qkfuB/FCtSIvvALkusI0nP
bvJjob+wZbutnrZphvyf7NPoh5NJRWAEE9Gl+HOfnYl0toFI1YEHEvf4koj1Apic
JJsoxrkRDNlnWaF7VZHxmonA7hvVQAckQ90N6nlReFnF7TBhrkt1Z9q1bioO6GEk
FOpoywFrQEEwIoYZ2fbk/cfj2P+f+q1wxNm3QxTfooCEzRXAsbE=
=r12Q
-----END PGP SIGNATURE-----

--Fhc5SUEgDctk4dRK--

