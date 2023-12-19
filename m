Return-Path: <linux-i2c+bounces-878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B14B818DA9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8E011F26AF8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6C137D38;
	Tue, 19 Dec 2023 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3WC1B89"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684CB37D2F
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 17:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CA6C433C8;
	Tue, 19 Dec 2023 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703005700;
	bh=J+Ng+Ix4EiCSWdpru8z+Spb632pbe4eB/i5iY66YcB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3WC1B89m0p1VQFx47xm9fz6EOFg19+gP8SZFVlIc/EekjXWAfn4GP+T0TR+RrTbz
	 tp/EF/KGO3GckwsrdHKb178O/k0aPtIzCN1nWnzNrRIOGaxx29w+ygtC1faA05X95I
	 C9W2HAxrg1WGJ8kpxkZpLhdQ6GMB7/mGrQQLBQ98dj9Y/wjQMFKjiUd6Jj3VdnSLmM
	 5LEUc+RfIqkhHGh1F+xbDvjvJDHpv9iYvkO1k9aQLlZHzJFh9ImWRsvcU4yKfYdRHz
	 zWZC3IvQtMwLWkjQ5xy/nRMnh/hr/R/Kp95E25WLj2Woc9nf9CIin3pkGQU3jarj/K
	 NM0WxfEeOWhfQ==
Date: Tue, 19 Dec 2023 18:08:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: smbus: Support up to 8 SPD EEPROMs
Message-ID: <ZYHOAbm8VSoiUh3M@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	Linux I2C <linux-i2c@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
References: <20231114151328.5f40b7c5@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tb+nXM6p9mdXF+fF"
Content-Disposition: inline
In-Reply-To: <20231114151328.5f40b7c5@endymion.delvare>


--tb+nXM6p9mdXF+fF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 03:13:28PM +0100, Jean Delvare wrote:
> I originally restricted i2c_register_spd() to only support systems
> with up to 4 memory slots, so that we can experiment with it on
> a limited numbers of systems. It's been more than 3 years and it
> seems to work just fine, so the time has come to lift this arbitrary
> limitation.
>=20
> The maximum number of memory slots which can be connected to a single
> I2C segment is 8, so support that many SPD EEPROMs. Any system with
> more than 8 memory slots would have either multiple SMBus channels
> or SMBus multiplexing, so it would need dedicated care. We'll get to
> that later as needed.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--tb+nXM6p9mdXF+fF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBzgEACgkQFA3kzBSg
KbaCMQ/6ArBpQc54DhoxC+n3xoL191qLFdtwjP/v9gLIlCVOH8C2QqtG8/Xtl9I9
ffpx7/oJaN7f5+Irc8IkX1yFpbz7a+1MkydesPAxkFAi0N0p/gBJsN/BR+UgW62K
bQ33/cgN9XTpuDDf8spTJmAEzUSLKBv7IGODZkFMoHXKwCvM0GH44lF1hjYxF8k5
lmc6D7+0PHaFr25jvS7PRBAh9geZmh2aQOn5D2wH00WV6CpXdvTweIhBdSan00EQ
wms64fWxGpPpx2chcC4OGNlFEazrlTOB159otw7k6Vbj5vNDlYtmDvzirsp6La8W
gH3rd1XcK1kktn52r+qYg/4/7uMsM6o1jHTqYPlpK45Le+14xnEDTNnd/WeIrHDX
PnrnaMRdBkQcjJNLdD6ods2PxETTX50dUG65/nnW4jhsxK3jrb/UEjxTLUSIB0VO
XGDggObf+yK2Zj6b0C4yu1HjzFJ/ykj2YQMCXEB4buSHL/QLa1k2BWUemif7+SZj
9kDUVcXsUVb3HqdhOAeHuQzaj+gVRftbpB8mDqwO4TiRMQf1fUQZXc57OxzY8gLM
diLxDxCvdl+z8psUoP7CVr+S2Tcli0YV/yRYkPO96l1NL/VoSCu4Uhe1pbk68fdq
YEJiirBpKbkqXa1qVKlZo8SJax6XQ0eDv8TvPgFvT75OkfawXSM=
=rU7F
-----END PGP SIGNATURE-----

--tb+nXM6p9mdXF+fF--

