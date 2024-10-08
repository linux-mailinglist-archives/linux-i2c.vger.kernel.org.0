Return-Path: <linux-i2c+bounces-7259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D84A69942AF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BCCA294A92
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 08:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F831DFDA2;
	Tue,  8 Oct 2024 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cwZNcloP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B391DD55F
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375803; cv=none; b=jfzSG9cJQgQMws9R2m7talIe6upziUzUx+HedG+gfrfekdlsGzbpZzd8OfZNd+3Nf8W643XSV6d+F8Q81IX3Xuv/7LtUMxLKrJshJI7mn+ACl7tIm/lC6hUtP7Blnsdvf2KRlw3v5oDAjDgNxqkSidxfTMYF/OkXBKqT7Qc8rAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375803; c=relaxed/simple;
	bh=MJb47KWfduFO4F6Ynl8+y9fzb9Gw0hKYfJZmt5kjt6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxmTEFxVddNzUJ9LA5TS6wd+VQ4COsQKf4BV8UomSQGbhPWm+Y60dTDo4lwqH6HYXlcGWvWvIbezZGtGo6YGStweku0he/z6jd/fKU6P1cf7tH8vUnMDkSxdGrZhvFOk373BwJJF/t7zRSl341IKJT1n2qdpvzGUADkkcj/OiK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cwZNcloP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MJb4
	7KWfduFO4F6Ynl8+y9fzb9Gw0hKYfJZmt5kjt6s=; b=cwZNcloPfWyUfj+ISVFO
	RDA61+XJvQJityfIfGgqzd6G6reQOcfGjN3bQxvE97VkBhnyWpY8WahxyCuralLP
	Ve2FNYNIxTexfuMamloE+yuhZCXXLom0dgFGNPZ5BIAuz3TYNLrJag6zNBlHJ4Uz
	9IeYqhKLheiuAsbXxePdwGnXRz6sEKLkNpyLCFQLrTFiXHfVrBP5liVDjsKShRqd
	ywUTOURlhrJX6wlHtCczBZC3JQXbXlH4rD4gHxNQFMaq8VO8gzPwuZ2heYsN3mTv
	lDDnb+BPBq3Enp0aD7ejqTSae2tyKa8Ch7iNikpggbKhjDjYGFdVVevMJlyKWGSP
	uw==
Received: (qmail 399307 invoked from network); 8 Oct 2024 10:23:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 10:23:15 +0200
X-UD-Smtp-Session: l3s3148p1@GqVJ2fIjo3RtKPHJ
Date: Tue, 8 Oct 2024 10:23:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: testunit: improve error handling for GPIO
Message-ID: <ZwTr8p56DuYHL9bR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240909101449.22956-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmAVtu/gduC/aQ47"
Content-Disposition: inline
In-Reply-To: <20240909101449.22956-2-wsa+renesas@sang-engineering.com>


--hmAVtu/gduC/aQ47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 12:14:50PM +0200, Wolfram Sang wrote:
> Bail out in probe if getting the optional GPIO returns an error. Bail
> out in the test early if the optional GPIO is not present, otherwise the
> timeout errno is misleading.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--hmAVtu/gduC/aQ47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE6+4ACgkQFA3kzBSg
KbZOERAAjb6N6Z4MiDv6pKJTFseNi9v+AhxOUwvE4ZEmXk740E7WlzbXGexDbLa7
1SEMPnP41Yf9+L/hnQDNW5Nuip/YhRSf9QNM5J6PNBaeTnE+r9eKT46jjVYFbp0r
IUjCGwTKuO5BfFAfwTZVnW83wNLf/U4g4fPVTzj9JP9C/KA/TbKN83FdR9ZStIAD
M4ZNWElxeqC1agqF8ZYCHolbMusaNdXh0hW2i95AWZdK0lL2IzJIJ//VbyxJyn93
terx6qWm1rggqD4uRBKCmagbWRTe2R6ttlAUtMOLZzfzZ10drzW2mo2vo3pb8VtW
yPKXVYr9DukP1RhHgkrwh9RGWArEzri6wjI1t43/DY1fmckMYim3Dx4Wy6CMSTkn
0c++7h7ZGeK7k2YQVOuRNDW+0IckC6JLl8r8UjtM0VoCDZXu50vIfTk61vf42X83
JSmF1qGRXy/Rcng54uopStmuTUXRDNJxX7OEI8lWip3bIhoHgd12lezoI7KRZ9v+
Ior3RAf1e/wUntOXaZRXnwRnxVW0FlRvNR/ZPlB/BKcTYXLxeDPOlWraliX2m3gD
pfyVedIZ2cVD1cf1EvCpRH/mqCzzz/GmwsoYkvNr3Sd3vxru3cNHHiGo9TKfwKLa
DSh1nNCY5/sO5XJICXlzO+nOCCpmjJ8SIKeBhhoNF9SO9ztWgMU=
=zoyC
-----END PGP SIGNATURE-----

--hmAVtu/gduC/aQ47--

