Return-Path: <linux-i2c+bounces-4346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CA916DD7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 18:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 608221C23563
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 16:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A42E170847;
	Tue, 25 Jun 2024 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnfgTCyr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BD3170827;
	Tue, 25 Jun 2024 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719332107; cv=none; b=bJsoB9idfv/oAIa+tSn/J0CWictgk9FXjEXlzbPOMmTJCYE8zCEuo6Gq/k4rvWIow9gmZfkJLsdif+QTOZF422hwoeV/yEz1IUZCOEurZCG33RT3FudoTr7wAAYRxPr8j7FFecKOWoU8Rm7Oa2rRLYf1aB56TWRxS5wCrq2apiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719332107; c=relaxed/simple;
	bh=XQohTkrMk3w4JsHXkU/yJh/3BOrnzSPrBLO6SVzxBHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sixheB1FlidzIdV9b4RaXAe78fmQaFVD2g15qFTjokaCdTKGuV6bqLvH50X9CIMCtRkB6FgKl45a/2OdQsr7VDHn6cNMNjIAm0uZtP8YAZRiYVl3ijTN3nOql1XQqfaYZz8EES3jLRoaKkAp+duAeaojOL7NlkpPyHVHotgh0Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnfgTCyr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24F1C32781;
	Tue, 25 Jun 2024 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719332106;
	bh=XQohTkrMk3w4JsHXkU/yJh/3BOrnzSPrBLO6SVzxBHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnfgTCyrXOezzPIysx6VazlMHDnu5Ix5DQFtaxQyv0kSoO2aOKkA7wyWg0usE1Zrb
	 pzNFQ6/NTB7nnE/Am9/EmLnqQyb8IudDMSa4efPW0u+TeR3zlbZbSXpd2pJZ43uYic
	 zGYhumaBwhuFNTezi85P4c1E6pRAbuXDoJmkzpmq+iDcrr5SOOXrFCIBEHLx2yF1yu
	 O8jmrupZ0xmmLYzp8HgNk7DM4ob42SWGxCbZTHtVwnWmi5vbjpbxcTJ2gL9Xu7FPt5
	 /pxG+hxNCJ6r2GwmHJWbSFwP23aUstQ8jwsh9x9/bws+b+EoO5x/PA1humux+m6Xq0
	 9iuME81K3Orhw==
Date: Tue, 25 Jun 2024 17:15:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei.Simion@microchip.com
Cc: robh@kernel.org, brgl@bgdev.pl, krzk+dt@kernel.org, conor+dt@kernel.org,
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Message-ID: <20240625-satisfy-froth-decbe11ba388@spud>
References: <20240621121340.114486-1-andrei.simion@microchip.com>
 <20240621121340.114486-4-andrei.simion@microchip.com>
 <20240624194913.GA267989-robh@kernel.org>
 <53820e28-f512-4129-9a17-a549ef664755@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AJI6S4BF4a0FtQ1K"
Content-Disposition: inline
In-Reply-To: <53820e28-f512-4129-9a17-a549ef664755@microchip.com>


--AJI6S4BF4a0FtQ1K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 07:33:18AM +0000, Andrei.Simion@microchip.com wrote:
> On 24.06.2024 22:49, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> > On Fri, Jun 21, 2024 at 03:13:40PM +0300, Andrei Simion wrote:
> >> Update regex check and add pattern to match both EEPROMs.
> >=20
> > The subject is wrong as 'at24' is not the vendor.
> >
>=20
> My mistake. It needs to be atmel,24mac02e4 and atmel,24mac02e6.
>=20
> >>
> >> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> >> ---
> >> v1 -> v2:
> >> - change patter into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep sim=
pler
> >> ---
> >>  Documentation/devicetree/bindings/eeprom/at24.yaml | 10 +++++++---
> >>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docu=
mentation/devicetree/bindings/eeprom/at24.yaml
> >> index 3c36cd0510de..f914ca37ceea 100644
> >> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> >> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> >> @@ -18,7 +18,7 @@ select:
> >>    properties:
> >>      compatible:
> >>        contains:
> >> -        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> >> +        pattern: "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"
> >>    required:
> >>      - compatible
> >>
> >> @@ -37,8 +37,8 @@ properties:
> >>        - allOf:
> >>            - minItems: 1
> >>              items:
> >> -              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|rene=
sas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$"
> >> -              - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> >> +              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|rene=
sas|rohm|st),(24(c|cs|lc|mac)[a-z0-9]+|spd)$"
> >> +              - pattern: "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"
> >=20
> > Are these devices available from multiple vendors? If not, I think I'd
> > add specific compatible strings with the right vendor rather than adding
> > to this pattern. It's rather loosely defined because that's what was in
> > use already.
> >
>=20
> So, would you like me to keep how it was before:  "^atmel,(24(c|cs|mac)[0=
-9]+|spd)$" and  "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(=
24(c|cs|lc|mac)[0-9]+|spd)$"
> and to add only:=20
> - items:
>  pattern: mac02e4$
> - items:
>  pattern: mac02e6$
> ?
>=20
> Or would you like me to add to "the special cases that don't conform to t=
he above pattern. Each requires a standard at24 model as fallback."  area?

I think the suggestion is to explicitly add these two devices down at the
bottom instead of adding to the regex. The first hunk I think in this
patch needs to remain a regex.

--AJI6S4BF4a0FtQ1K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrtBQAKCRB4tDGHoIJi
0nAGAP9c9ahF3KKPYkzc54SeH548SMqi21zBcYKc6rYUGCosVAEAnUfWuzDnMMEq
cxqJ7Z/xgXL8YmgJR7ul3OSa490w/gY=
=lw1j
-----END PGP SIGNATURE-----

--AJI6S4BF4a0FtQ1K--

