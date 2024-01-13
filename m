Return-Path: <linux-i2c+bounces-1292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A0882CE4D
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 20:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1DDC1C21087
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 19:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE3463A9;
	Sat, 13 Jan 2024 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7OyQ8Rl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6013A611E
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 19:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9874C433F1;
	Sat, 13 Jan 2024 19:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705173992;
	bh=7Rjz5SDxi7gwI4vKdDW+v70uamiT+LrGgBdoQvhYg1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7OyQ8RldgmydI0DwSTlTvqI8kbDKh97DWamrvh7pd68eU06fuvzPR/Sq6pu6u5t1
	 mi+rbk99C7j5J+sFRnprsDe9FmMQnUb0hVGMllgrla3KIre3WT7ZS8xumR1MqTzl7p
	 OHOIvArmnOA9hisIClgPWXIUnMWelRyNDNFTDL7Tf+tbV76Wm8samTptcNsbjuXgsz
	 4Cp/CFizu5gnO35qisPpnL8O/tKe9Q0mLtQhLJfRCN1NE0SCfwgO7XT2tEVtVxRYFf
	 wdfbuFFVNzkT7broaxrUpFcA+rxVOmuBGkD9RUkbb5ypZtHJfLzihi2/pFYaS7jDXx
	 QSeADtUs9YfVA==
Date: Sat, 13 Jan 2024 20:26:28 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Kim Phillips <kim.phillips@amd.com>, linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Borislav Petkov <bp@alien8.de>, V Narasimhan <Narasimhan.V@amd.com>
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
Message-ID: <ZaLj5Gg-k2b-TWFK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Kim Phillips <kim.phillips@amd.com>, linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Borislav Petkov <bp@alien8.de>, V Narasimhan <Narasimhan.V@amd.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
 <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
 <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="23G4Ezbhft/CDFA/"
Content-Disposition: inline
In-Reply-To: <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>


--23G4Ezbhft/CDFA/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Hold on, I'm testing this on top of next-20240111 and still seeing the
> > splat...
> >=20
> Btw, does this reproduce always? Can we be mislead if it happens somewhat
> randomly? Happens to boot once we revert some commits and then at another
> Andy's nearby commit does not and we make the wrong conclusion?

Thanks for all the work trying to find the regression so far. As I want
to send out my pull request soon, I think it is safest if I revert the
whole series and we start with a clean new version.

All the best!


--23G4Ezbhft/CDFA/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWi4+AACgkQFA3kzBSg
KbYGSxAAs2Tq7SMtZI0p3BDeW1mnOWq4bsbNTByGtdT+3g6UX1QUAUS4Wu5RihKO
DUQk1EBI8ggFDw3zvaeoEytF8VhhX7Z+rMncDHyjd4B7T6sUBoNyvE3HEQrNA6O/
2ujq+PnotfZ0tKu0+9BmXM1daYNy1fLjQQWz+M5x50FVIuOPDM4nZamRvb5gfplQ
/TdyTnw0dDFrxepGToCslcy4J96knyry2rSHeessEEo3D4Mr+ve2CykkHaaD3V7u
erlqajYdbKQ7/FfMizi58R2EnL4pBP3eK7bPuAqgKN5Fq443QvaGkeAwtsQqHl/f
6mbPkNbVJKgQbYRzDKw8nvZpWtHQooF98PK+vUeCI+JwWaCniy6s2mTKNyJfRD4j
SNWyhrLFNj5AYWTjjz2Evf7YqQG/t1Kuq2WIdhE3NdlEq4b5SPoMsXLn+lng3g7Z
O1UlpE9yakjeDrn2p9FhUtWHh/OAhvLbj9sHyrehD1pwAV4TtxeDfsZbLHMy/tHe
rsCOTyRGuUhkJfa8mXYyT2oWTdFzafetRq1r4DYj28M1JmSUZouqX4Mpru1/pFjW
/zGBJGceBLnoMVeAyvhEEAZpBFF6T6zT7tQAhRCdY0tM2K0TlB3zm6BD0jaHjt6W
fTaxsuyTBL6pMRjMkKUF3IQIy4Gj7rKsHMn2QPIJ94HRb0HSDec=
=26kL
-----END PGP SIGNATURE-----

--23G4Ezbhft/CDFA/--

