Return-Path: <linux-i2c+bounces-4897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B75DE92E367
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 702AC284E1F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6872215574C;
	Thu, 11 Jul 2024 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dC4WnT3x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5C155726
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720690014; cv=none; b=RTxlotg8tX3J53gYGe5aH4T8vBBLEkogaKB/cKqzXfnREObNs+mSDY22C9TY/ZQdsCtkjkzLDi1UiMdkqyOxYhF++vvZuMy179Z2P80zkynw7PckN8mpvLI5oxX0vLwcgH2bCISehDIgQH/VNs8JFuKSyO9pcrVS0szKPv2olJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720690014; c=relaxed/simple;
	bh=2tFtKgxNYDhaOhDDfnqF4Tr26RPT96HhtvIaZw5Jfrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMixYGCjhf3a3+gvu6f9DMA3AOiw7LUIYmNqBc/WctkAR9+BJKtSQYfpZZ7RGpPsz3zlCaaIcCoGbOWqlDD11hAV3FwAnp5HS7TQqm3Jy0GypG83zSF7A1kBABQoeLdY/LUYMQRHJRW1nwCQ+YeO4K2RRO91CzbonLC396RlzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dC4WnT3x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=z++z
	4PsmWomeVqtniGIkn0Y3nNRWhrQ+aa2t3xfmEjE=; b=dC4WnT3xETrUxe4YSQvV
	yzuEM6+/vVIic2Vf7vI1X6W9et7uxOF4ApYwLqR7QDHTbIC/Ad1ezPRiel6gNa0e
	IAxxS19zhUul/NGEbWHmi4smOSXX76ogZ3KkgdS8vTt7dKwKbshVE1iYKDare0ao
	5WpXNn8n98ES3LtX2pfPtIiBBV+hidfN0agQx9Rhbvi0blxWb2fn6I6OqD1RlG3y
	vl6Cyyo9cO1kouICtjngiO6S7Iys3ftpAJoTMC/bBl+PwmYuZQFYYGqXQrvmYUKb
	o24d3MEaMWxALFu3wPR+I5hzxLeHFTpv7ekOPyvFWtFWENzUIWkqBNHir/JR5h4q
	nA==
Received: (qmail 793755 invoked from network); 11 Jul 2024 11:26:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 11:26:50 +0200
X-UD-Smtp-Session: l3s3148p1@hEPTXPUcgK8gAwDPXwmZAIsFIv4n+Dpm
Date: Thu, 11 Jul 2024 11:26:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
	Alain Volmat <alain.volmat@st.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mark HostNotify target address as used
Message-ID: <Zo-lWi3EtRoJa6kk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
	Alain Volmat <alain.volmat@st.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240710085506.31267-2-wsa+renesas@sang-engineering.com>
 <c8f837f5-16b1-a5da-c687-a95d2ec42fa0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghnN+7tU7NIdeHXq"
Content-Disposition: inline
In-Reply-To: <c8f837f5-16b1-a5da-c687-a95d2ec42fa0@gmail.com>


--ghnN+7tU7NIdeHXq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > to the dummy driver so it will marked as "handled by the kernel" if the
>                                 ^ be? :-)

Yes, thanks!


--ghnN+7tU7NIdeHXq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaPpVkACgkQFA3kzBSg
KbbR+BAAgn9mPsdzPbBoJIYSuxAskuiXX+VC3m3aVXtcCy7BhOSgUg/dUkug9Ze6
wXBehGmaeANq9SN3GjyW4AEozsOHW/DTqpnT6M9x0h7vl1UWGZsJKvlPKwub5YR1
mLkzsTOnH120WIe2iCE+S1//Ljk90HNrODB9WwRLryQ0+48ZAzC4tnRHCVcJHH/V
Np8dCfD7+Ac8FxpYdymgOqx2nXWpI9KGgOKvWROnreOE2zr5ShMC+/3pC1OjBWMk
UZK205a8UoF8oQjavTqnG+k92kwydjYMiFy5SoXK47ODoU+LDoc30ZfWSOxMhEkk
bIbO0qil9VjYYuOBqI3TA4KjKQ8okoAQFdF+gmCnJ0yK4xaSktrQO+IJY1LDEJMs
scfiohh4IdJBKD7ZxNuS6s5BGtLN7yE/RdNq5CAXAFQ+Afssk2jWlFt1yr6oVMk3
VPzkkt8JXIbAVoVeunBIbR/AE6jgpLi1FY2dFK+DJAdf+ex/xl3oHdn/p6DbTv9M
HvuAOIUK7b0QkfHqcR9ZA8ceCQKkHhv+PIReXXei64DRrQWbosU+PLBJuVAbekvQ
Y+TdN2ju+se4yvXm9K0MsMVDJrzpwX9fQB2YAT5hnJQX0Y6MKCUOd6ZaWL4sxYWR
p8rkakj8FSYCn62Lf1ATEkc2+6ef1hMbDtvWwCPDEUnrgEkM9YA=
=Z9sf
-----END PGP SIGNATURE-----

--ghnN+7tU7NIdeHXq--

