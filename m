Return-Path: <linux-i2c+bounces-8919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC3A013F5
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 11:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FAED1883741
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 10:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787A415B543;
	Sat,  4 Jan 2025 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DpffPlEx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068FF28FD
	for <linux-i2c@vger.kernel.org>; Sat,  4 Jan 2025 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735986791; cv=none; b=ZDSFzK9g0Lv8pqsTeHYRDy+l79T+g4aQVw+l9a7/tF45FhcG5fnzHED3beeBUfv06SDuRptZF/B2Qo4vr3lNTe1Ac65BppldsFtkJM4C5v+GgiYSz+pJqNNN4gaRKSro5Q6mkM97VeGgDvbjeQqg9DT1RaENVVcajp7CKKOHj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735986791; c=relaxed/simple;
	bh=iMwwy5Mv9lJKjN2kk4eCeTUriGR5i7ApojrLtBl2KuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rO8SCjU2ysPc82CCJ1Ls4NE/UgO+fOJaINXqYHtN/bxX9sfRyXD5JqRDI/wYwdftFvnjzUMWezg5iNygN3BXXgIIVjPsoT07EiTRI9X3WUAdQIuJkRzSJGCAzHL9G1MkU//ps8G7P7zhAOo2AmEQTiDy7XKpb1toiQpeaJCgfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DpffPlEx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iMww
	y5Mv9lJKjN2kk4eCeTUriGR5i7ApojrLtBl2KuE=; b=DpffPlExxD8yAqa7W+UW
	vYFizOtTF3sucIrWAhDDGfDOiLJwwqiQ1sUjEX+B/kVZ3IfsORpzkPkb7EPPd8yW
	XPk8gXC/5SgF3KzWHk+y/hpsuQSOIIlPRS67FLgM5iHBgKEKYoYXb8pAHMnKQN+9
	/sqYwQS3QFzRNQ6Kdpd+8fnP8JBMOs2A66s9dvDHe9k5zW/qvjDo6FpnVJmmMhfT
	ppSsfUN48q4gAwW9oyiYUPdZy1wl0UmBV30lU0FfYTgKZyp1D7N6e8TywVprlpcw
	GZ8sFCRRZs8ChGwNhuPl7uzRYU7KXnxhgMX6XpgslXfJvozv2FMOdipA4gOxfYy7
	BA==
Received: (qmail 1132422 invoked from network); 4 Jan 2025 11:33:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jan 2025 11:33:00 +0100
X-UD-Smtp-Session: l3s3148p1@ktxZ694qrNQujntM
Date: Sat, 4 Jan 2025 11:32:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Atharva Tiwari <evepolonium@gmail.com>,
	kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <Z3kOW11SxEVwqcw-@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Atharva Tiwari <evepolonium@gmail.com>,
	kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250101103422.30523-1-evepolonium@gmail.com>
 <qj3ymbntblc26wnezki2pn2g26z5poc5njhsfbxzam3mpjy52p@px44dxiqhedt>
 <Z3hyr3ZVf4rBuV-N@shikoro>
 <eqjgc5a4fiz6csqmehyo66yduorxt3d3vnr62d5ijxy3wooheo@qabiaft2nri3>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7A042nzwTT1LCCYf"
Content-Disposition: inline
In-Reply-To: <eqjgc5a4fiz6csqmehyo66yduorxt3d3vnr62d5ijxy3wooheo@qabiaft2nri3>


--7A042nzwTT1LCCYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yeah! That was my first thought, but because this was reported
> by LKP (which I respect more than other code analyzers) as a
> potential issue, I was on the 50-50.

A potential issue on outdated hardware (or better: non-existing versions
of outdated harware) which has not showed up since the git era is not
really a for-current bugfix in my book. That being said, it does not
harm in for-current.


--7A042nzwTT1LCCYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd5DlgACgkQFA3kzBSg
KbZqww/8Cphh7w5sRyAMV6Wz7BuvmcASe5w2WYfGVUuP95I8dov6ijrKMAnb7Dnq
xxHUT8QPiWKekRwr4D39Oip6dES1JewOy29YOzOtJ8L5X0CNK5Mn0RCrYQxE0tvg
9Z2uQGn6h6IYJ6JqiwKaJPSMFmavzE5BUEUEOYoGxD+ysi3HUBxGEwuukg6HQvoh
DVBcP0t2onKO4ux3dANOfYTZYgpY9B7482dAx1AXLEKxxEQzpf0q06kWyx7ZJj8H
zbiYVo1QAjAgInrqHboWwyPfWJrZMfuKJiRwyjIPCAbDiiIDBRZSZEJvLB997Sat
hETJXhEMTOCoIfI/si8Pxw5KkYrs26FXatz+4LJ274urL910TJ6Ss6dpX3FHZEKU
GXbx04dXqckBGKYU7nuM5eUKCgObIaB50l5Rt22n8fe+RyFkWWVLorvJJOwSdNuT
OVrokU1tHrVYU4MbkXUuFTNJ/F2KhhIR/LcwHxc8vAhdqbKmGryyIhpvwPYNvqh8
BLel8Ynkdd5sIcpt5jsouJW7Lc7R3UsN5Qywii0azqAzDhlAXb8/0DHjrgQuuu0N
YKTMak95yNQjy/Lcp5205wxG0wrwJzRStmm7MBH041lKcDuZckJuN7l7UX0aQXxS
DHD6bWMuVZHiGnTwZ9divq2y2ejPs8keL/GN8i5nqe2jYAgnzRo=
=vX/9
-----END PGP SIGNATURE-----

--7A042nzwTT1LCCYf--

