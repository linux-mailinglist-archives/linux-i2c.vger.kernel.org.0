Return-Path: <linux-i2c+bounces-10486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1CA93F8C
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 206E01B640CA
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F357223316;
	Fri, 18 Apr 2025 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PolOudso"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D62472A1
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745012722; cv=none; b=TLv4jFzAfvUXH2WllUnt3RzukINUAukTXdvB3GvxLyCyJ5yeKkL3lhWvp9ZMyp/auPiBML7ePOH7/A3nEfB8TwJK8rviAauhyZu32RFzGdmvlZuA/Adpd944jgVzHgkyG3fAA2LUjZCYRJDHGAMdSsLpzYK/1I+65SOGwVWDjyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745012722; c=relaxed/simple;
	bh=RFett+rj2+GwUjiMuPa73WpuK2fBTfvQJBWMLXtCkzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/S00weAej2a8He8wp+RMwZE6+FRYchQVoL3lBFlKAWNahA1z3IKDIVXHSqBF5qjIib2TXB+Uirtrb58vITFTy6ywzfO6l/wYO+HT9feifKvmi/BBDf/Q26vvofmkwNvY69OzVzo1IcjbbFWC2ZNiOW31eQK272kkQlYsiND5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PolOudso; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RFet
	t+rj2+GwUjiMuPa73WpuK2fBTfvQJBWMLXtCkzA=; b=PolOudsoZdT0021b/j7A
	ZxyppsAKutApOxjcLa317mdifY1xK+Uk1cr4+PpD9JebL3/ZFabtyFlp7W2dv4Th
	HOBXoxmduvInAWs4y/0wTrTEs+ZGJbSLlDINyxUD2hyNijeF0AyOsyo95AZD2FgG
	eqG1jql0sb+jkbaNVOnNiRgLLZmm3TCNLuqtHmexqjyUaoYLtqbXc232OnVfbZ7c
	hcHl94P0UX9EwGYYguSQqjbGlVwVsjKeNihLhnzUjQ+Ci00INfz6T8A56rNCvQ0q
	x2GbD3AYvOt7idwwHfCuAyTmpRHcd8Be+VjPb4DRhaMIrZVvELi5JLAi7fh5UTh2
	2Q==
Received: (qmail 1539840 invoked from network); 18 Apr 2025 23:45:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Apr 2025 23:45:12 +0200
X-UD-Smtp-Session: l3s3148p1@S0vVbhQz6MMujnsE
Date: Fri, 18 Apr 2025 23:45:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.15-rc3
Message-ID: <aALH6J33cYfaBH4a@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <mtqiyp7mtyuivs7snzfp3dcinr2u5jw63afxqto4s2rnqe6nyc@ozaxoxvtvdxt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tr/5Wl1R3qWoWBxT"
Content-Disposition: inline
In-Reply-To: <mtqiyp7mtyuivs7snzfp3dcinr2u5jw63afxqto4s2rnqe6nyc@ozaxoxvtvdxt>


--tr/5Wl1R3qWoWBxT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 02:18:43PM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> one fix for this week which prevents a potential NULL pointer
> dereference by adding an extra check in probe.

Thanks, pulled. Happy Easter!


--tr/5Wl1R3qWoWBxT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgCx+cACgkQFA3kzBSg
KbbGvRAAr2ujssUc3RXlrhmW5x0nqESGavg39d6HhOhf9xxkkY9HTqvAE8eg1LtO
n4ZjsEuIWRwALhYUfsdBvHnzRe/HhmCF1kubQCxOvaM1m7VJkZMuYXMtC+IjUpkE
bSFW+IgphyBaozJp69njkg7SE5awRa7c0mX7mZetjcIyePj158neyIZGAXS6QaC0
GRbTTR/edwHQj/NHre/q5NclengJvDPe3Gma7jDuF38+nJQKGnH4SNugx/lNHx0t
oP/0IV6aFHw+Aq8mhWJwNOu9e9tOtNfKesLVGU40O1fosYEhkVbhPiaqmnHRVNsq
aQj7c9gojjPtKYFcQJsQ/P0xPTopCzolqjT+G2TPhKFSJqkm2OVj3jHyF4lpbmk6
qANaPW6jYEoaFSW+z3r4RUfc0Tmw0g4XzorJEyDoYCYHTk5HHy25v+Ijn0tfrgSs
kfOdaVrN2yl3hahYjlWMgFp5g1HzKS9wH4+q1C69GgIE4ypmA0BFHp86pO1azPqz
iX/rAMJD3PhLjwTpqriY/kumVPGyZe4eE+WygNSFBTBfwa2ypBcpBAnUjWklqQ5k
TCGz0je9G0Ae2oukl/s+lzV3/NHsyXi7LZb4I7vj8UFG7DPex2GPP2tim0iAGa9j
luvdrJBKjdkC8nLtVMa0fB0jzMJOg8yCg+7zVoICGxUUYC6tt/Q=
=hlIN
-----END PGP SIGNATURE-----

--tr/5Wl1R3qWoWBxT--

