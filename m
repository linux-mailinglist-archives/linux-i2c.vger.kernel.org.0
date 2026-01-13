Return-Path: <linux-i2c+bounces-15120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5ED19FF3
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B995130BCC26
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0323939C9;
	Tue, 13 Jan 2026 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ns02Tbc8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E13939C4
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318967; cv=none; b=a3slDJ77Iki0iuWw3q6ICLNch4f4WoPkxk8RCRKuSoHHuLBM8u2+RUmcBJOT45HayGmeMvRukyYiqfwjHZgR4aCZIj+oCJM0Q1H83qdr2TDQCd76gyJyeb3mU60Y4LBbpAiuiqsmIY3qgMMi/dd/I1wcg+2aa2HN0gQTF9GIZfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318967; c=relaxed/simple;
	bh=Mf6K0Ntie5UvYmDjDs6OYvMdlab1HD6lw8JxBbXgRfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIm0jqpQ80qMUreim++hud+cnUetjr+z+GblnZnjs4Lbb/K6RmbAbMcvzQfHOG8lLSRl7CMjeJJvZYksRfdnk/uPHIrnbzyb1prU6ScYGItOPDcgLru/5AD0zvxXWfohbAWemW0nDNVYOhbeT9BiGDSBrAGE5LI/wkePzXOB68A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ns02Tbc8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Mf6K
	0Ntie5UvYmDjDs6OYvMdlab1HD6lw8JxBbXgRfA=; b=Ns02Tbc8pMT6FslTkRBz
	MPqYzL37qYkhP/AzcGjDa+tHbJ+2ZyY2gMLFVWWqsFHqNX8A5TS4cpJt8mUVQZkC
	4rB6r+wjvPOVTyJo6MmnHkQFUHpen4XBaDHVkhejcRaonij3XkY2HuuDjlreV75u
	noA+BDGhxBmQJB3cdIidDfoEb6eLp172EmDGACpDzpyeFm1uNSSjzlcFnXd5uGtK
	t6WH3RALasDBISMlI4kEXR7MdgtrHTx1U0stlxLp8J+sv+X+MvfGFTVKi6L5qvUT
	xmVF8bGRiNsNhPeasH7UKAPl/I3P7DX6ZLZW6Mw61IMvxbDjZl2WUAHTDfdqUHE9
	oQ==
Received: (qmail 1758153 invoked from network); 13 Jan 2026 16:42:38 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:42:38 +0100
X-UD-Smtp-Session: l3s3148p1@VaxW10ZIwNwujnvx
Date: Tue, 13 Jan 2026 16:42:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
	wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 6/6] i2c: tegra: Add Tegra264 support
Message-ID: <aWZn7eRfjZWIc8Ay@ninjato>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-7-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yKtR9RapIhGezWON"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-7-akhilrajeev@nvidia.com>


--yKtR9RapIhGezWON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 07:36:20PM +0530, Akhil R wrote:
> Add support for Tegra264 SoC which supports 17 generic I2C controllers,
> two of which are in the AON (always-on) partition of the SoC. In
> addition to the features supported by Tegra194 it also supports a
> SW mutex register to allow sharing the same I2C instance across
> multiple firmware.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--yKtR9RapIhGezWON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmZ+0ACgkQFA3kzBSg
Kbae4Q/7BjBAAB+8LbgZtpz05Dj/xsRYw/Es7YA3ziM9300cCNn5slFhHfs47/OU
CITO/z26Qe+bCdA1XV1YfOatvfrcnhbfR61/FNbYf/IoG4HXGzUgW/apRhohrT50
Fm/xGXH/i6POwgQrHEhtc3vX54LEUpIIqwoz8+dcF8V61Cdl9VFFmAhCJxNXSz93
il+VgzGo+dgUVFVhQni7KeVePRrRughID4PAVOaEONOeLY6owj7m7I4pGnl/BX12
tJzINWMEk1Xefvjn5xeOQMbmD+uKGsO3rqF0WpKKlmXGRVE61XacXVCvVvgF/Xu2
ZJFBu11rySTTUPDT4WpiEd8ibOMhqnmjRmKBCMt1TAj1vXEwcbyuPI1i6de6wsCv
AQ6uIDrp4LP6cHVE5Ox5h4YVGyzRaYpIzF0roe/M2/STLDTaRmm2HsETmhjt92n8
c/JQwOvqsWuuXwSmLFMKO3BohIa8XLoI1lkrEElwBUZzy3DAWGcA/94i4QOBxaoe
ESKNuFQ+XNzwYOl5V900Zt+ru3Kb6MhLZBFv6tpYhmn9SsLbSoml7ou++1LU8LSr
I1pRUEdd+3XT8wrngtq3ZXyLOIo8Lw1IVA13R8/UzdEJjzYXNniKISOSCL4m3Z11
cRcGBfrgor5tLnz+xhzZxqSCS5RQLJj+sYLs4skZtIMdioLN28A=
=5Yum
-----END PGP SIGNATURE-----

--yKtR9RapIhGezWON--

