Return-Path: <linux-i2c+bounces-9780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AAA5CDE8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 19:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85502175D48
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 18:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78F7263C75;
	Tue, 11 Mar 2025 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kH94Yn7I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74425FA2F
	for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717758; cv=none; b=rxZfvo74no0l7CSi0jxiCOXYAOGeoudsxU7dLv6TuJN9XiGABNo5plXWCBFIN30of5RN0K7KXVUro/J/wE5+mJx79O+EeE+h1ZwLR564lw8p/FRgcWn+6+etmVfNOkhEy5JP+GJUiUXsq/CDuZLdXjObaQMhl/S583d8AYkCwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717758; c=relaxed/simple;
	bh=9X15yVtPK8bVmWqLZRTi+cR507jNF7k6sPV9emhz/Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E086b6vCseA0Qq5JjBjjIAfkxkkczsGxzDHJ/OHqjSaARiWmmEZP7XVgjEdIn3aCKPrmwVBCtBkOoEoYnadYyzWirMa5XMhhrXomDsCubYwLEbHC2lz/X/el50vTB45nGaCnCGAcXmj2UImOOcrGo/0a0uwYsjNv3VbAA+eTE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kH94Yn7I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9X15
	yVtPK8bVmWqLZRTi+cR507jNF7k6sPV9emhz/Mw=; b=kH94Yn7INUhujzxXZa9F
	qYhMJG5Un5/PmKtvCmse3UcQP46yY8Ozquk4nAG70xUfxj7cuEKT13pYfxivBfIn
	lUd9fMaLpDqkBu16Uf5ywNnaC8zriImupa8iHn2yC7buduS+eopUsA7MBQ+pXXil
	s9h3XywWIdNuYKhmGKb+DhwkiN94cLhoY+JNd31gXlZ42K04hrUUdXHDG11xCwp1
	1s88NdR2LTlFCesRVTzBFdN80/HjrNR8ti8B7aRyUPNf+9wkQ2H6iaJMLyg27Nz5
	NKij/fy5uhUi4EK5XqFLfVl4R42YMvcdVNc09h0qo4hNYYtq1H2BTLyG9GaXMZQb
	lA==
Received: (qmail 969077 invoked from network); 11 Mar 2025 19:29:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2025 19:29:08 +0100
X-UD-Smtp-Session: l3s3148p1@k1amQxUwesS57tsa
Date: Tue, 11 Mar 2025 19:29:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: vigneshr@ti.com, aaro.koskinen@iki.fi, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com,
	andi.shyti@kernel.org, reidt@ti.com, wsa@kernel.org,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] i2c: omap: fix IRQ storms
Message-ID: <Z9CA8H2GAArdTRqI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andreas Kemnade <andreas@kemnade.info>, vigneshr@ti.com,
	aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, jmkrzyszt@gmail.com, andi.shyti@kernel.org,
	reidt@ti.com, wsa@kernel.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
References: <20250228140420.379498-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pbb9IRLzipP7HCI7"
Content-Disposition: inline
In-Reply-To: <20250228140420.379498-1-andreas@kemnade.info>


--pbb9IRLzipP7HCI7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This needs at least to be tested on systems where false acks were
> detected.

Which do you mean? You did test this on GTA04A5, or?


--pbb9IRLzipP7HCI7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfQgO0ACgkQFA3kzBSg
KbYNng//dJNXHPtSyagIA2NIcawXbeW9DuepAmJECAsvWUxEclN9RCaVX9nm7mZo
AsGMdedDFbZS8zsNRkmnu9B0EegEubjWjXUhcg0JqWl5vgiO8BiT6GFMbiQleITa
7ADVB9c4du32CBEnb1jirBeBidciUoXSHxHE/e7jZoE+IPfypi61bpc1yS7fsTzH
9V9vWKALDg4/SMs0OFl77leLLiB+/mdNNRhzQZkba+72PUfxdRDr1mqTDAu+CrTe
YG/ACH1BOYJcNmawFwvy6IAGZWkmGZ6tlXx0duXUxkfAFQCqoBb+sZKTAFpjcS1N
hz99qG20hzQXOxtMj2Oq15FjXE2c5cNjDijTVlxCQPkWc8srm5/fh/JhF7uy9y1o
Ot+bWrypWRBKaMMwwTf0OalE9wgV/2FvwTKrgAw5N1yfRUun+7HifDUUQJvC249H
gQDnM2oMnkBZ2S5TZ1cfBd3zpVQ/X1s6byrCCoUOzgAzuBKEEmvmSAq0orrKuQrg
drBVElD3LXlGclBNJeC4IkThfo0E7n8bN9RAEdR+TTnWj/CL4WQTSE1F8E/uHjKr
9VwLbBoR7wGqjaFPSmqYgKnk4KpNJuxsWpJEPBAhrZZb5We5KuiACmEJovO+mSbx
/47B6kqCeGP4TOjlEOSIzqkKJqvFg0l+cPIY0+vERL1FKdpIwqA=
=eCGB
-----END PGP SIGNATURE-----

--pbb9IRLzipP7HCI7--

