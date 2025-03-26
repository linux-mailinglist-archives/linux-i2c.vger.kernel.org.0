Return-Path: <linux-i2c+bounces-10044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8AA72247
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 23:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3DD3189B1A9
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 22:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178A11F239B;
	Wed, 26 Mar 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtjxNbeR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF08D2E3364;
	Wed, 26 Mar 2025 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026842; cv=none; b=NmtxAFwns9coTPvTZxOSrXbHqKQGWf3qWVi/kSyWMQbDGTHLmq5RI2kx5ANZ/zOeUKx48wR2WHK6xUbU/15VcbJLCrADHgzSMP39dS4xFtqbIb+4tQFgzXy0m+g4MMqPkZba+2Y80PF0SIVY0VvwzzzY5O2tqLn15Q1bpDK2uR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026842; c=relaxed/simple;
	bh=FRJikSsA8yzvaWCCYthGB510YL+dH/cvtcAVRudDpK8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THuMEYRa+nP8yTcQL0ambcnLh0N1gxK2/smrqJO0zE0Z41dySm18RCjyi6LMTFsLeP1PFAR4A6fyuggxCTMHl/UwoJLnL1h79qGCnTuwSukd6MDZAzgVhhznRBZOjPEugDm+phQsqD3cA4xiEEYxVR+0+XGChk5acw/czeVvKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtjxNbeR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E105BC4CEE2;
	Wed, 26 Mar 2025 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743026842;
	bh=FRJikSsA8yzvaWCCYthGB510YL+dH/cvtcAVRudDpK8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KtjxNbeRid7Qwv9XXTLetaZMhymEgYHug6k8kVO25e6aEak5TVC5mg0W/Y8n8UiCv
	 A848AXYFBLNCiIkiXEktHUxCG7ced23DUZQFhfbAxKAc7CFtHEseXp1bkdDvvpvhRf
	 y0mbTf3u2tujBrAmP7VgZnlP+ua1KPoAKIJlAW6JSrCqxZeC++Ww0WrFUiY6OnUP92
	 vEaXSuua0UL+6+XJOSFAQuFT7qEDTAwGBgFUMX8DFrmgnPsM4nBDVSRICh8G72Gid3
	 QqioJWV3dJE8o2TGFnlOWjKEmzcOqedj8u7JT37O3cGWDajuVEn7U96Fm+W7g3jPfQ
	 Qf0mWqYGflhZw==
Date: Wed, 26 Mar 2025 22:07:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: snps,designware-i2c: describe Renesas
 RZ/N1D variant
Message-ID: <20250326-dispute-eloquence-b66b1574307f@spud>
References: <20250326090112.22495-2-wsa+renesas@sang-engineering.com>
 <20250326-unhidden-alfalfa-4dabbeb32c9d@spud>
 <Z-RzfZKaw7qtYj0p@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X3x43n9K5NuFCM7M"
Content-Disposition: inline
In-Reply-To: <Z-RzfZKaw7qtYj0p@shikoro>


--X3x43n9K5NuFCM7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 10:37:01PM +0100, Wolfram Sang wrote:
>=20
> > > +          - const: renesas,r9a06g032-i2c
> > > +          - const: renesas,rzn1-i2c
> >=20
> > I don't really understand the rzn1/r9a06g032 difference here. Why are
> > both needed?
>=20
> From our experience with Renesas R-Car, we concluded to have a binding
> for the SoC and one for the family it belongs to.
>=20
> For example, the already upstream watchdog bindings:
>=20
>       - items:
>           - enum:
>               - renesas,r9a06g032-wdt    # RZ/N1D
>           - const: renesas,rzn1-wdt      # RZ/N1
>=20
> I could add the comments here as well if that helps?

I think that would be helpful, to explain the relationship between the
devices. With it
Acked-by: Conor Dooley <conor.dooley@microchip.com>


--X3x43n9K5NuFCM7M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+R6lQAKCRB4tDGHoIJi
0pmZAP94LgRG4Bi2cS0tjrdo86Fn0vQVZVXykyaAirCcl273dAD9EW+VyO18XGP+
aMS1u1S6qZxh4qjFgJUPvxhSlyiEZQk=
=Vk5v
-----END PGP SIGNATURE-----

--X3x43n9K5NuFCM7M--

