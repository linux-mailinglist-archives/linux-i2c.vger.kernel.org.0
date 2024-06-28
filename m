Return-Path: <linux-i2c+bounces-4455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831C91BB2B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426511F21074
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E750D1509AF;
	Fri, 28 Jun 2024 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KR5ufZlM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE251465A1;
	Fri, 28 Jun 2024 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565825; cv=none; b=p5PtBUiyoJ4SsxyeQdMURkU+KEOrWsZa3vOMtjF/3xNWj/ZZ+4aviIvDiDD46sqU30vatB2li0aR9d/43BsWs1BAm4t6i9AWaR4oCcMhOpg0RHHmpJMpAQRUEEWeEaYbSpUoogoajTYQXZyuCNQaCC4BWZOZ4U5TGa+vZ3cqCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565825; c=relaxed/simple;
	bh=18XyDU6KxQP0I3pISmWb4VOCYmhixglX1iyFMD05Xhk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUur3aTo3H6JvJNFbE0kIgmbAGyJmU8bOidzNyN0tjOU2l7LbdmqNGV7ERMyynGD1Qp1IS+cFNobZZ/SoGaNmdkvfNACFOHHcy4dlVpinsnCNmLu3yp7YxX2ZUsTM7jjbUKgbSvT42e6YrxyHPD/vg/4MBUHIFADB1GL5cVYNdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=KR5ufZlM; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719565823; x=1751101823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=18XyDU6KxQP0I3pISmWb4VOCYmhixglX1iyFMD05Xhk=;
  b=KR5ufZlMcL09qWES+6rR6ahMqUgrkRlo0e2RfT/oldQK6NCPZTmq/8wf
   Im0jtzqFni4ZAsMSaE28DjnnWm12YttjRxr78sdhkXGHCxggG+9mMOHU4
   K6AQ2imFk526a0dJbgrWwLtEjSypDFEsgEMAUOEH7hE7K/Pmqd7rNLk+D
   mQXiKb+sPCYAKHYTdBXGqG+w4EzRDfoUihJi7RBOKCGypi7rQOzxIpZNB
   FtCB/0wwGHIKxWWkpcyz7TuwKwMnINGaQCunD6nojiIOaG3BLFYw8j9Et
   C2qZD3ceMssy4gMrxIuqO2UCUHn0nDwd2cmC0NjyxeX7YMgknrRP1cUZ+
   g==;
X-CSE-ConnectionGUID: emjLZb+xQLGEIhpt6YhZ7A==
X-CSE-MsgGUID: 6cb5ts00QnykAsc7VOYgvA==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="asc'?scan'208";a="196014344"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 02:10:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 02:09:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 28 Jun 2024 02:09:46 -0700
Date: Fri, 28 Jun 2024 10:09:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrei Simion <andrei.simion@microchip.com>
CC: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: eeprom: at24: Add Microchip
 24AA025E48/24AA025E64
Message-ID: <20240628-plunder-wackiness-72b0acf3624b@wendy>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-4-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lv+YdYS0y6vWVfZO"
Content-Disposition: inline
In-Reply-To: <20240628080146.49545-4-andrei.simion@microchip.com>

--Lv+YdYS0y6vWVfZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Jun 28, 2024 at 11:01:46AM +0300, Andrei Simion wrote:
> Add compatible for Microchip 24AA025E48/24AA025E64 EEPROMs.
>=20
> Reviewed-by: Connor Dooley <conor.dooley@microchip.com>
                 ^^             ^
There's no way that I provided a tag with my name spelt incorrectly
given I use a macro to insert them. Please copy-paste tags or use b4
to pick them up, rather than type them out yourself.

> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> v2 -> v3:
> - commit subject changed to reference Microchip 24AA025E48/24AA025E64
> - drop the pattern: mac02e4$ and mac02e6$ and a-z from regex
> - add these two devices down at the bottom
> - added Reviewed-by
>=20
> v1 -> v2:
> - change pattern into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep simpl=
er
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 3c36cd0510de..699c2bbc16f5 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -132,6 +132,10 @@ properties:
>                - renesas,r1ex24128
>                - samsung,s524ad0xd1
>            - const: atmel,24c128
> +      - items:
> +          - const: microchip,24aa025e48
> +      - items:
> +          - const: microchip,24aa025e64

I don't think this patch works, the schema has a select in it that only
matches ^atmel,(24(c|cs|mac)[0-9]+|spd)$. You either need to have these
fall back to an existing compatible (iff actually compatible) or else do
something like:
diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documenta=
tion/devicetree/bindings/eeprom/at24.yaml
index 699c2bbc16f5..4d46b8c5439d 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -18,7 +18,9 @@ select:
   properties:
     compatible:
       contains:
-        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+        anyOf:
+          - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+          - enum: ["microchip,24aa025e48", "microchip,24aa025e64"]

Thanks,
Conor.

>        - pattern: '^atmel,24c(32|64)d-wl$' # Actual vendor is st
> =20
>    label:
> --=20
> 2.34.1
>=20

--Lv+YdYS0y6vWVfZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn59yQAKCRB4tDGHoIJi
0pbWAP9lw36XATcOJnKRPW3/m90qj11xA11z1cjkMvJSaLhYswD+J0qymDWKbMDe
6CYdmhIP5LTEvRfu8+ZdsTtp5Q1ckgY=
=2QcV
-----END PGP SIGNATURE-----

--Lv+YdYS0y6vWVfZO--

