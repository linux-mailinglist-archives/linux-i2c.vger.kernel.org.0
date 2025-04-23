Return-Path: <linux-i2c+bounces-10574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E844A98395
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 10:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B1AC16DEB8
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 08:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719B928CF64;
	Wed, 23 Apr 2025 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bW39eyc1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C2B26E16A
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396787; cv=none; b=PXLf32AMAPzIcFrAzeM8eTiw5QMYibu9vNbxHXPGVpTCeSAFRJWfHmOLx/d8y95yV3fQ6uW74TDMTDzAcE8kEDsQTwBaoQn8CTwwPOF8Jq0cUuANInv9UaXDdkpIFKoBjlPoI+mUnuNpioW8e2Y3Stl42OaEaIyK1lBoorp9gQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396787; c=relaxed/simple;
	bh=zd76tPWLvz03FGMRE8CwkIY4StHtha9RgA2vfs7dSNk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tiwd+HmKDLssAT+lcxfny/W2Ox7qxsI4o76VFRtylRtI9WpBpZreHpn5tFEvvt4dDYCsg0KdLmCA3rEku6HhW1YKK14rM5xAyKuXiwav4358m91QAlHvubgDP4+P2Eve1yJ/TuZQosOUoijL61gaK+3PoIpqJt777e/gHFCfr0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bW39eyc1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zd76
	tPWLvz03FGMRE8CwkIY4StHtha9RgA2vfs7dSNk=; b=bW39eyc1Zdqb7rdfP2F5
	ieY6UgWtp/+V4BS8I1m4xQx/dVMgWvxNAmrFmuJyWfGqWHOC82aJQtPMDmRxjaaC
	khIXz0V503r+QdyccqIDl5NZKEvxB/sZn2cKgHYEtIdVK1NgrvP0u8BnA+AtkIHv
	CSX26KQEnqVf8RVbCl9kptC3RGyfiA65cPtBUwPp6ZV86/y9rOzFXm7XSbZvBSbG
	vl84MUTbQXn8rDWW+8abP72BsFj252Ahen/lMHxrFNyATrdSsEB8dePrdK1rS3VN
	4lWc9nyIoq2iLNcWLW+CxYIusHhg9gqOsUUjZwfQM+MIt90fyZx6eduBzBfOuLlN
	gw==
Received: (qmail 3005372 invoked from network); 23 Apr 2025 10:26:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Apr 2025 10:26:18 +0200
X-UD-Smtp-Session: l3s3148p1@/wX82m0z4OUgAwDPXx6JAAunYj8Nf7DC
Date: Wed, 23 Apr 2025 10:26:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v8] i2c: riic: Implement bus recovery
Message-ID: <aAikKreK-BCP-zLp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
References: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aAC8f0dAMERD8GjW@shikoro>
 <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>
 <aAFgwEB4SdgH-1fQ@shikoro>
 <CA+V-a8tmTqFi4iqGhR3cfUgKw7mxJrm6ixGAHq747ptrL3t2jA@mail.gmail.com>
 <aAITBfrOI0GAhGRA@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eYv3UB7V5mlJ9iEk"
Content-Disposition: inline
In-Reply-To: <aAITBfrOI0GAhGRA@shikoro>


--eYv3UB7V5mlJ9iEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Well, frankly, this is the only test I tried and, yes, it did work for
> me. Will check 'incomplete_write_byte' later today. I will also check if
> I need to run the tests more often. I did not do an endless loop.

Both tests work for me, even in an endless loop. I also get the desired
signal outputs checking with the logic analyzer.

Here is the branch I used:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/riic-recovery-experimental


--eYv3UB7V5mlJ9iEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgIpCYACgkQFA3kzBSg
KbYICg//YRlqSOeTRx9J+3cE0wYqmYTceyFoeDieEwHHdgw8XbU2bWLrIrIiC+aA
XfUVbc/TFcfXCOmzVueXWo+HQAJ5KWSsrwW7wOAlkD+SxgJVMDC7+GjKE0Yu8zLf
7y8E+fGop+9hoPCmsJ2dzDVrja5URBfFy6fLn/xdjzGTmm6PIlcwvp+8Hi3ySMLe
amXYX1zfUf5YqmC2JpyivLannnQ6/AA4yWSHH5UKRlO2wKr2rCbdbmV7nmASFYJp
FZa2Iu86k0WLYSVz6FuWx5/ObT5lhZvmhR3s30MwKE+FvUKWeDRFQ2dTUwKB/SK7
nKo5bXmCT0sB60SX+FrUeoLdbP2JiB/cSQbsVuZ3z75rqULI5dkE+bUOvgfxFsfe
WqZ5DpSBsBanxvHx12r37xNl+/bCWtJMsO/iXqhp3m4SBg9WseQ/bgKbRWQwp/yi
I+z3ZY5I0lgcijwjdQuwcSYyQPRlUJU/uO7poVFvWzqGzBwoErj5lnfHWtmRdOp5
iLhXhZ90U33uDoSAn9ukrFKXox8TgavFfaG5MHZMWOtpw+CmBHpNIso69q+WTD0O
i40k0Sgpr38oJjXtMYfELVtFX2E/3m/P2ZXETEDzp0Pa0AfnnVLJd0C0NAGfaxFQ
GnL+w+r98SFDHiXEM9HE80PiwfnqhFO5V5dH34tktpyCDeZNDVU=
=dlc3
-----END PGP SIGNATURE-----

--eYv3UB7V5mlJ9iEk--

