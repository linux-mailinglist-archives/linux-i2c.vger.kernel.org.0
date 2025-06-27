Return-Path: <linux-i2c+bounces-11637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D98AEB3B2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42EA4568259
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD479294A1A;
	Fri, 27 Jun 2025 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eOhNzCOf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D62AD22
	for <linux-i2c@vger.kernel.org>; Fri, 27 Jun 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018633; cv=none; b=QGyBXERW7m2MnjuYJqXJ39oMtmFXUU8/FnjhGtHQT5wRL1yWerSxcs6BA5EcdnbtPVP9T9rkCYMcHHyuNMrajc5t3kU5Uln0zwxb++B2aKrxznOZWb9hX5fLQMnmyy7fm43Er/lxDn3mi/WhbZAUod+7AAxAG4gbQPfdsK5lVnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018633; c=relaxed/simple;
	bh=T2nOxSJO+3aD6pj2YVFHst7Rt/ootjE2VC1St3irjHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwP7JuvmhGqUpVZIZjDbRAJDOo83zYjJDC3uyp0pAv/5bvUhvNU7hde7LHM5ig7lZVOY+ibogVXxmMqyHb8x/fqez/l2L1q6pd2ehASVPAhUssGYmj4gLE7lW1VtMCufeOxAkGGXX55IwsVJiH0Bs1RUh9UJCE1jtaOXOfEpKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eOhNzCOf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=M/uP
	gWCmGezyUxogkSTfZ1uXa9HK2g1Qg3jFyj9fYWs=; b=eOhNzCOf69+AlE8rUm9s
	e/AhcLLd3Q37NxyZkq5GzVtcSY6cDHPupe3OPNkMgosyrVUYkwfTFCYzMeIWevWF
	We9br/ydGdAAchJ0QyxpCE21UTgMn7pYitTsEOIuwj/pXubtk+eezYX/8vdPmlXC
	AOrl9rFfRRpShJ6N+6yE1i3bsm8EVUfThBoQkmh9wHamDEC9TEoUFYyFeBEiu2Ch
	GXwqrcTsBnfs7H7TF0a4jRqdT/ay0kG0QhVLiCmEk12L99hxUKah1bTbmcj9cBnZ
	NTSIGrjFNghagmKPgwG4y65WxTytPvFGU3JqOk1eue9LdnVvJy5z2HpPOQ8yCM+2
	xg==
Received: (qmail 1416444 invoked from network); 27 Jun 2025 12:03:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 12:03:40 +0200
X-UD-Smtp-Session: l3s3148p1@9nzfyoo4dLogAwDPXzuUAOCQSK0rM+sw
Date: Fri, 27 Jun 2025 12:03:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc4
Message-ID: <aF5sfAwym8XpVhYc@shikoro>
References: <7rnodnh6pww34mtj2rj4t5dnaj6gnngink3xkx2ijm73cyawlm@qtrv6kkhkjxp>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UcD/j3BeGuKAUrsq"
Content-Disposition: inline
In-Reply-To: <7rnodnh6pww34mtj2rj4t5dnaj6gnngink3xkx2ijm73cyawlm@qtrv6kkhkjxp>


--UcD/j3BeGuKAUrsq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> Thank you and I wish you a great weekend,

Thank you, pulled!

All the best,

   Wolfram


--UcD/j3BeGuKAUrsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhebHgACgkQFA3kzBSg
KbaiTw//VRVPWv7uC6dSdMvt5AYBZnsE4/xc264PdqYk3cMbV5HyNLgjNAz2WoDp
M62xktsQj2BK8j4ADvMOttuXm+drhDL7rCACtnnvc0tMyqROEw3lLeQ61MmApH3A
bWJqFr2SHYlzRsH3kWXCe/6Lx6yxnRPpSUA7ky53SKZj9JZnUfPsuLloiKKri6GG
nrLUa7J2tgDn+Yp3FdJoVofi1gfd9Y92yRRJ93UGO9ci5sNmivXoQQrD6Idcx0VL
70i6lfLsBrUhjvDDME6viA3FwBV46KtmZCramFctt42Su/2SgWXioLLq0j1kvggN
wmn8K3Ph23T3Gt+OIpvwhJl+hGjhtvhXQxKji7m4MhAzJDmgKuPtzNyMr2gMFMRe
hvE0pIism9+V/AUVIBaXdlRhHPNm3rsVE26egkAbU9ZrRbkZyuqH+UHG39lyLLf3
SyBjV9QV/ZBN+DCcjuBZI95DaLFUIujBdnKfM2AqaBxzJeJI5fA/jAIovzOdEuSp
/PEbuD0vrQPhLjeOlBMCQz/a+fbBDEjLO7c12fPkLp7YC3vKRDkkK3ayOJA4b/DH
8t3rLP2c/MwpbVl+3Sjy1GVtf1ZYH7BdWtOf03bHMrHINzGlBsAY4khk9zlLAO/7
/bzb+Dg3Vr4D0kBMWqnIX/nPseEE6BCsHFiL5d6L5f51EYJjto0=
=8ZWW
-----END PGP SIGNATURE-----

--UcD/j3BeGuKAUrsq--

