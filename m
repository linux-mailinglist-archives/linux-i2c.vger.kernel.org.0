Return-Path: <linux-i2c+bounces-4127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5AD91023F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 13:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78ABC28310F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 11:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BAD1AB341;
	Thu, 20 Jun 2024 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dk+EwCbV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CF921A19;
	Thu, 20 Jun 2024 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718881883; cv=none; b=t0M7FnTW6ApUqfj3cRTgrNLyeNB2wc18hXHdkHnI+EBir83gz4L1yA0dCB54kAF4uDGOIcemVm4KVkv3b6nOZiphbLBQM3+VLtEn1UA6rUgB3e4eh6tdzIEvrweCWUVRh33VgUZdyw+/8jmfhbZOTq7NT2xw3T0ulv4VcBDcTc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718881883; c=relaxed/simple;
	bh=95Ij0vKrYrGH00SkqoNbXKVDvTZtqsyiEyaQ1r0dl68=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=julO2FVFwfEpx3aFDT37Pn552V/anGEtnxYBNrYGlrtwcOCz4zp2vECQG7EHpZWpuPv1BvQd05oymOfNE6qfOw20iyCSsMo+/3Gy1hGDylWpk3cH0/eSQgYARZa/Jg4M1OfjjYpdd5JeIaeEVqQfqXKsMrZj10EzwOyEEL5TIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dk+EwCbV; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718881880; x=1750417880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=95Ij0vKrYrGH00SkqoNbXKVDvTZtqsyiEyaQ1r0dl68=;
  b=dk+EwCbV+PzKTLnNIk+bx8zi3NGr71q5DnXv+ehlqzf7OmfJ2pbbd8BP
   eTW9mvpU3DPuYwybpgRjlRHWu+41wUNCgrouPIubpmMA1MUGTeQzzIrBJ
   YYth8NcJNnORqDrPmktCHD97nsyoj6lYqh+o17JB1YKHxSTSHfGPX121F
   4p9ptbkQ/ZvekiPGimH55vhw6ftNv1JG65T71bDzyOEMefMoEaIdVymHR
   Ox2zwIkDYT9wzXk+69EDjI4OGeK5VOxJHnwrqYOvcL6eTII2QUpwaHHmu
   /RPmYcun1VXxLD8wq7b/qTH/jHXW+09FhUYJPk8BMSZ1jW4tZC4881+dC
   A==;
X-CSE-ConnectionGUID: gqLzAYtPQQ2L5OyNG4B4Sw==
X-CSE-MsgGUID: vm2+jEyqQ6GzAavsNlO9Ng==
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="asc'?scan'208";a="28263518"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2024 04:11:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 04:10:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 20 Jun 2024 04:10:51 -0700
Date: Thu, 20 Jun 2024 12:10:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <Andrei.Simion@microchip.com>
CC: <conor@kernel.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Message-ID: <20240620-bulge-sturdy-cd0f92f05de2@wendy>
References: <20240619072231.6876-1-andrei.simion@microchip.com>
 <20240619072231.6876-4-andrei.simion@microchip.com>
 <20240619-thee-herald-82725e1526e2@spud>
 <0d57b14b-48d1-4629-92f4-74934c6ecdeb@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YJZ0paq/YzbEpWyV"
Content-Disposition: inline
In-Reply-To: <0d57b14b-48d1-4629-92f4-74934c6ecdeb@microchip.com>

--YJZ0paq/YzbEpWyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:45:58AM +0000, Andrei.Simion@microchip.com wrote:
> On 19.06.2024 20:53, Conor Dooley wrote:
> >> Update regex check and add pattern to match both EEPROMs.
> >>
> >> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> >> ---
> >>  Documentation/devicetree/bindings/eeprom/at24.yaml | 10 +++++++---
> >>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docu=
mentation/devicetree/bindings/eeprom/at24.yaml
> >> index 3c36cd0510de..46daa662f6e7 100644
> >> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> >> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> >> @@ -18,7 +18,7 @@ select:
> >>    properties:
> >>      compatible:
> >>        contains:
> >> -        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> >> +        pattern: "^atmel,(24(c|cs|mac)[0-9]+[a-z0-9]*|spd)$"
>=20
> > Could we relax the pattern instead to make this bloat less? Would it be
> > problematic to just allow "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"?
>=20
> I) "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" :
> The first pattern does not specify where the digits must occur within
> the alphanumeric sequence that follows 24c, 24cs, or 24mac. It allows
> the sequence to be all letters, all digits, or any mix thereof.
>=20
> II) "^atmel,(24(c|cs|mac)[0-9]+[a-z0-9]*|spd)$" :
> The second pattern specifically requires that at least one digit appears
> immediately after 24c, 24cs, or 24mac, and only after this digit can
> letters appear.

> As hypothetical example :
> atmel,24cabc would match the first pattern but not the second because
> there are no digits immediately following 24c.
> atmel,24c123 would match both patterns because there are digits
> immediately following 24c, and the first pattern doesn't care about
> the position of the digits within the alphanumeric sequence.
>=20
> In case of at24,mac02e4 and at24,mac02e6 match both patterns.
>=20
> Let me know your thoughts.

Basically my reasoning here is that both patterns are very permissive
(although one clearly more than the other) and do not stop people from
creating compatibles that do not correspond to a real device, so I felt
that the more complex regex didn't really provide enough benefit
compared to keeping the regex simpler.

> I agree to change the pattern as you suggest.

:+1:



--YJZ0paq/YzbEpWyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnQOKAAKCRB4tDGHoIJi
0lggAQCYXfW9bQInGc1FKpTgtaCJ+HWNt14cEZjcpipzDaoOhgEAjLO9TIQb3XLn
9ifpQlSmibEvLdi8Nfjj7sqeoIJrqQs=
=CrCj
-----END PGP SIGNATURE-----

--YJZ0paq/YzbEpWyV--

