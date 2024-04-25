Return-Path: <linux-i2c+bounces-3125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1917E8B1BCB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4C891F2504A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 07:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0864C6CDAC;
	Thu, 25 Apr 2024 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ddkHlP93"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E23134A8;
	Thu, 25 Apr 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029625; cv=none; b=fc552DDBp1KA9z5Aa0ORNCmfvp0ejWxU/SG7+kEclGiNMa/QYRRwIbQjPRtKCiEMgWhDrrIuW3C9JyuAO+SZfCfIx1ODK16vVuF124rEEpFDCHUJDYBjyCwmbTXCNUGsKRp+/92AVQbnkPe3jgu9OxnkN5d8PSdS5DdAsXY3ynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029625; c=relaxed/simple;
	bh=EbgiS937wyMUIsINg4XjAGDVFc8yWeC3ul2GhBuuGpo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgwAM3PoSE7u8hw1BmdxfscP+GGhEufvTY81Q+TETf9IgCvpblgGJo+DzHWZq6w0WK73IwvCPrwKT6FzB1rswSJM5GlJuI6FtgJbwVsq3rkJ730DMukGdgscfX31dy8AcIiqKfE78GxJiXZgUH5fGRHVZ8Yyal87pCFY9Sg6PiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ddkHlP93; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714029624; x=1745565624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EbgiS937wyMUIsINg4XjAGDVFc8yWeC3ul2GhBuuGpo=;
  b=ddkHlP93BNxUjKlj/u1fMHmiAAWLbbUps8MtLJEOfy/EasX25tmAYe23
   upaaQRorxjRrN60Qlfvy/hi0uZUAGz/RGAxCzDfsvM3Pi6B2HXiES6IWG
   +lPCN9SH75t8K1/J+YKlkY9g1Y3BEZATeugTDrGBoenLswuggjXnVL5YZ
   u+rih3BbEiH6+a6UUIf5oYhK5w6P9MXWl1XYeeK1jyRbnyYKZyY3sK3zk
   qgBhkDpRZ6wnsKrJEuILjh238rGbwRJP6letONptJx15CX0KcxtgBvEJJ
   YVCqfyhyWSTwK3TbnpqpfsIx26eDVf4lYJJzByUgOqsTXPF9CFT38KI1D
   Q==;
X-CSE-ConnectionGUID: i/f88L82RR+aDS+IUbY31w==
X-CSE-MsgGUID: hhqBzC/qTkqNY1MvEZMB0w==
X-IronPort-AV: E=Sophos;i="6.07,228,1708412400"; 
   d="asc'?scan'208";a="22592482"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Apr 2024 00:20:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:20:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 00:19:58 -0700
Date: Thu, 25 Apr 2024 08:19:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: adm1275: add adm1281
Message-ID: <20240425-jurist-unpadded-b3cccfc23862@wendy>
References: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
 <20240425070948.25788-2-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hn6R+dMae6L0t3k5"
Content-Disposition: inline
In-Reply-To: <20240425070948.25788-2-jose.sanbuenaventura@analog.com>

--hn6R+dMae6L0t3k5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 03:09:47PM +0800, Jose Ramon San Buenaventura wrote:
> Add support for the adm1281 Hot-Swap Controller and Digital Power
> and Energy Monitor
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.c=
om>

I acked this, but I'm having second thoughts. The 1281 follows the same
codepaths in the driver as the 1278, why is the 1278 not used as a
fallback compatible here?

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> index b68061294..5b076d677 100644
> --- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> @@ -5,7 +5,7 @@
>  $id: http://devicetree.org/schemas/hwmon/adi,adm1275.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Analog Devices ADM1075/ADM127x/ADM129x digital power monitors
> +title: Analog Devices ADM1075/ADM127x/ADM1281/ADM129x digital power moni=
tors
> =20
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
> @@ -27,6 +27,7 @@ properties:
>        - adi,adm1275
>        - adi,adm1276
>        - adi,adm1278
> +      - adi,adm1281
>        - adi,adm1293
>        - adi,adm1294
> =20
> @@ -91,6 +92,7 @@ allOf:
>            contains:
>              enum:
>                - adi,adm1278
> +              - adi,adm1281
>                - adi,adm1293
>                - adi,adm1294
>      then:
> --=20
> 2.39.2
>=20

--hn6R+dMae6L0t3k5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZioEAwAKCRB4tDGHoIJi
0hXiAQDo16OUHd8d+5DyJ3F4AUI0q2wMy30pQkPywBeyTSxRVAEAp1qrqN6u0noB
vPmcl+mHtDgXjG+t2nQN2S8kAvfKhAU=
=izMj
-----END PGP SIGNATURE-----

--hn6R+dMae6L0t3k5--

