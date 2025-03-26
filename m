Return-Path: <linux-i2c+bounces-10042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 236E7A720DF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 22:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CB3F3BB1D4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 21:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803EE25DB0E;
	Wed, 26 Mar 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I2SdTmol"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7F17A2E6
	for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743025027; cv=none; b=ejbgKV1EMRH4fVDEjtSaVIruErGetfecIIDDhhrU1gLBWEwuWtpePDJ9O4DwGXHBviznslFAFN/lDsp5RyTr30nYYK+z+S2MBYSkZjCTY0VYBf2SalkouV9sh9zRQw6BQt0y51dEeZK7353am24Pc095jWqaPfnzdwRhC8AhuLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743025027; c=relaxed/simple;
	bh=ggJEOn/mT0hruEOaJ2xblMkpSzBqFCVlZ/M1b6YkRG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeI+PYXq97I+ova+k5F/bYgrKp8ItKmgXdEJubMEoWAI6HD85NDtZYA4zVIFhVttdVnIL5Yen8qYhSsPKKPfHqmtatcbFNYJjIDpypRh3DSK1EWVixl0BSnPJiPHbmn7aqijK237Ud/sAV34snoemfNI5S955uMfc9KbsWLIAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I2SdTmol; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=waAV
	8xyBKzqQjDVVgkGMpTYykVt5jQ2ShovVMktJ36M=; b=I2SdTmol5WiHSLji+9GD
	LtkHPeIX9jdB2a0xukwVYKtQ0OeNz2qjkJlkNSzm1NuvBjaQHkOU0yQBd2XKMtLL
	4pKLeeyxYrCDr+94RlpsIXPGnYGk0wTFy22fVluRBAdbVGlX0UKkpMERxVrlDxcW
	Ac/0M+eOoGNgQI+LgciKDYqgSs+gp9Y1XGKk81SCUSOCySVB1+ouZOvXvBy29m//
	lwKxczLqQr8MQuE/NRUPDZKIQkQIDihsdk8JfpJDeEztOB9QcYAUaG3/A8Q/V2a3
	hEzp4k+dhTbijuiYSBK7iemisqKMT0bfsOuyZh01SzGt7V4HFymxETuuwfeZFYNe
	TA==
Received: (qmail 3763912 invoked from network); 26 Mar 2025 22:37:02 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Mar 2025 22:37:02 +0100
X-UD-Smtp-Session: l3s3148p1@fghPo0UxYNwujnsv
Date: Wed, 26 Mar 2025 22:37:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
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
Message-ID: <Z-RzfZKaw7qtYj0p@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor@kernel.org>, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20250326090112.22495-2-wsa+renesas@sang-engineering.com>
 <20250326-unhidden-alfalfa-4dabbeb32c9d@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tCgHaXXMp+Tzir+L"
Content-Disposition: inline
In-Reply-To: <20250326-unhidden-alfalfa-4dabbeb32c9d@spud>


--tCgHaXXMp+Tzir+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +          - const: renesas,r9a06g032-i2c
> > +          - const: renesas,rzn1-i2c
>=20
> I don't really understand the rzn1/r9a06g032 difference here. Why are
> both needed?

=46rom our experience with Renesas R-Car, we concluded to have a binding
for the SoC and one for the family it belongs to.

For example, the already upstream watchdog bindings:

      - items:
          - enum:
              - renesas,r9a06g032-wdt    # RZ/N1D
          - const: renesas,rzn1-wdt      # RZ/N1

I could add the comments here as well if that helps?


--tCgHaXXMp+Tzir+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfkc30ACgkQFA3kzBSg
KbZ9gQ//dX475wUUbL/5onLhQNDMhL7og0DOAz+Al6Ifj9XPFlB89HQ4QWHfZEyX
bg968Z6GGAICmrUIXeD5dpDu9zFpm12iT7660ladzJPuM571c8qU/dos6WQoGa/a
JcMMMKAn+nRPBlvVBKqv/pXV16+28mSWiCkM7bHQtbYiIfP0tSFFSLZVUhDWw7cp
hGm4DKvjq8XMEj+Vjf41xHkLPfW8rHN5su6aLEDHQ2MM0KxnIvBIhunbRgKWSNFD
TX1h/NfxoSbEYuu+qI2uo5dXhZiK/A2pANJeAUiv0yMThPDi0Jj2bFviOvRQKXe8
Dr5aHjhB+JZVReAhwnNCbhUMqOuhM9tbZbhxp631xC7/RK0YeZwVyS6uKM4Qgykj
5QmbCXwOkJ/+C7aPhhyz1Qv71616ZeLn2QrmRy0zimhTZnqcBiB0axKsAHBmgSKX
Zvxjn+yXZFUs8uK6qJHvqBSaBazAtkfa8HwTU32fxtGRx38KZVIL88lkgw30QFR0
fnZFuaGAVnPIFUQmYRULMGJ2Lr/iSn4em4rYoLsNHPOrBawj4GSP/N2x+13TbTjg
6EtILAzrC07P+fnXflCmnWfWzqAX5me6wGgSlK/mVKwea2AH+nTXD6AeWPmDl12D
H+M9luxnQetySGJ0VhTjc4anIaxAtnhLEv5ZBsaBzqqset5L9ig=
=Rdvj
-----END PGP SIGNATURE-----

--tCgHaXXMp+Tzir+L--

