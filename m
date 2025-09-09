Return-Path: <linux-i2c+bounces-12808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0EB5043E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 19:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C193BF1E5
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 17:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5BA316909;
	Tue,  9 Sep 2025 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lPrrdE/n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16561E1E1C
	for <linux-i2c@vger.kernel.org>; Tue,  9 Sep 2025 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438180; cv=none; b=jnahG5/We+OIcZ2Kb5V2Cfy82sXmds2MHFO1FzWzuGfPoHKpum5uLnEVwHUJgmYjrEQVQvvHvSO2grmtzJWuqZP+iv/tqmikgqVyM5uj11+wGJilHhfyXBaw6qN7LwClddJ1KYp1QY/ZwHYreFruvCb5CnyI3pTk+4oc75K9DHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438180; c=relaxed/simple;
	bh=Cr3VUDRxrErEN4ZdqPip4ljEVYh/iLQwpOpwK8H1np8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCEx4TRL2ObEfm+y2SkNNQmwVB2Iv5OAMX8JgAGAWhHxnAR8ExqiZ+NVtHFqS5s/CBwKrKN24C38hoKSY4r70dFLNZDHL9TVaeIeG7MIn24Q4PZcSu3B1TuyNKhi9XqLKy0eyhuAjHsJ1igOf/EeRAUQddMEZz7qMfYcmSHfD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lPrrdE/n; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Cr3V
	UDRxrErEN4ZdqPip4ljEVYh/iLQwpOpwK8H1np8=; b=lPrrdE/nkKoUvnFtOn5l
	aybOg+HuCaYz8HqNq5gFj1XMygHjo1qeD+k+6CPTKqXWAdsKRj7IbJ5dmBuufuFO
	Ka4o2mT2bcXvoyv9WdJUOizJ7au8fN/J4kk2C2PO4nf0IiwimDSqw2XnrguxLXFW
	UZfhzuC8pqglpxtBcEWGz28jmBQBjMIBbJ9xU7uxhEH9+t1Ry66F3ZSZ5WYtN/Hy
	VmthwFfftvBB9SJ+NYrf6WPGYkPJN4iA+mMnBP3mf/m9iaprZFrdVC19/GDa3exC
	CkZdXiB4rnczNDSzaOl3SaQDvD0Of+XyZ2F7m976WWI+2uS7aepVi/NiTHPICVIx
	rw==
Received: (qmail 316713 invoked from network); 9 Sep 2025 19:16:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2025 19:16:14 +0200
X-UD-Smtp-Session: l3s3148p1@mDQSdmE+mLAujnu/
Date: Tue, 9 Sep 2025 19:16:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
	conor+dt@kernel.org, devicetree@vger.kernel.org, digetx@gmail.com,
	jonathanh@nvidia.com, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH RESEND 0/2] i2c: tegra: Add Tegra256 I2C controller
 support
Message-ID: <aMBg3Z2OHkn2xWZ6@ninjato>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
 <22ucj42wvcqr5trsv75hbb6uj4y5zhjigs46w7mxtckisodcr5@77pgwttvycpl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hCGEKm6dXyof0vs+"
Content-Disposition: inline
In-Reply-To: <22ucj42wvcqr5trsv75hbb6uj4y5zhjigs46w7mxtckisodcr5@77pgwttvycpl>


--hCGEKm6dXyof0vs+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do you want me to pick up the DT bindings patch? There's currently no DT
> files that require this, so taking both through the I2C tree is fine,
> but either way works for me.

Agreed, this should be I2C material.


--hCGEKm6dXyof0vs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjAYNkACgkQFA3kzBSg
KbZfWw/+OFcdKEDLYEIbJaFpyb2G3Fy3GGhcPV2GdiL35QSR8wU40SV6jcCQwpbZ
qlnT4EIwwLSdb9w7G3wVYELN67q5+OIIhzbF4WUc4HSuBSlYtTyqPZgaSq+l+JTi
WY/ZaJGsyofd3TJWfElL3smLe75JyVh+Vo7+7m53OzanuFr45SV5n60G9oH7sTyS
s4K9zv/0CVq/8fZFLvJHtLl3vi7FOnKxGqVsCMZaWVG0CiP1bUSWxS6bF9za7roD
Zmu/fh+laPifJloMpo1UjzKcARISFvGfqj8SSz0jaMuAHHhRXo8B50ROJSoQFKa4
v/YslD35DNKrKQ0Mh/JO2Pf/hDI6WH4TLJ6uwqz6VkrJQzrvBJ8vEs/P4/bMWMC6
PMFG5ce3uvG9KLCj4A4JUtXoEkBvYPs9z5tIWJdL3UMFhY008zetas1TLBU5QeRm
GotFUyJ8C1GkxRaOWXnpfgUy5/uhA5MEctJ6jhVVZB/IK+bvU3+mEAAXs42X4ues
15HGZoDW6f0Uy+a6MMXIqCjk7MJSdzgEa+NhBnbZKBgfRovN0esmxbfThFSxyWlo
0qqYT6xPcucekcAf5rp8MtQpbF+e/YBK2LxxzsHrZPejRcvRdoQgDK/QXrJBhRY3
wPTQxEobr634Ztrjigw9tgUAo9mjgujjqVkx26pJs1v858YxNVY=
=PzYH
-----END PGP SIGNATURE-----

--hCGEKm6dXyof0vs+--

