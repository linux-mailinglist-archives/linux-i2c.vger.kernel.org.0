Return-Path: <linux-i2c+bounces-3646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E07708CCF89
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 11:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083BE1C2128E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 09:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D3213D29C;
	Thu, 23 May 2024 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="r4A24lNW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C0C13D260;
	Thu, 23 May 2024 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457471; cv=none; b=jSUq0IggyzCKJXJkgIzwurlotaYlSTdCYF7WPFwwakBgGkkcPuGgtxEfR+vVZvLF8FSDFodF0UIthWkMP6lUgASgQ4FWSksLFMDJXr6D7j06VNeBE6mfMhyNAs2M3mZWhtxCqZk2WV3wmbbQsK7vHVxd/eSZvUuQumKXSr7alyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457471; c=relaxed/simple;
	bh=3RNmpj8T/J28ZcWAgo+2/2V0jteUzgAQkIp6zBV7eJM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEFzrhOq+KGUxf2l8tGXHcoJdTGCx0r67T7EeisPS348V4hzxv2kdEc3g1zNM5ABarwp0oxAbir3nGQ7VsNfzSol/YPTNZRMtHlsBTuwrFBlZZqUNjUzUg2ZDeG5HVpCppmNQj4jrvvrF2ZgycG3ILhb2jtud8y2RIOuTyJi4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=r4A24lNW; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1716457470; x=1747993470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3RNmpj8T/J28ZcWAgo+2/2V0jteUzgAQkIp6zBV7eJM=;
  b=r4A24lNWJVfbFYTqOkt4BXrLUzoWuzDtpRMTeKtSbpDtBLkkBSFdt+st
   RCu8jf9VNcrlg22cEbA+QpsRWDxR3PECPDCi7uBAqdH1WiJKC5U9BDh8z
   +hNO7eRGusiZbxSBkpisDc/jssh60MBuQ8vMxNFCb7ntlp345uh60K34B
   1LpqkHy7KAjPbC8K6U7cKIBxfzqojx6JXjqTsB8tEovVGtm56RrAZCCM0
   BWFEFwRZD+vlt2HBekfEU924rdYQsSGOUuknGSYdkjSqyGHmvyvEi2YNd
   qc1UWEML5nPHNVG5n6QuKNHOqUb/V4BKIJiS9Sc2FJ81epHU/JLnwap0a
   w==;
X-CSE-ConnectionGUID: yai/vSIxQIKneP+ylDCdoQ==
X-CSE-MsgGUID: RMkYCa1QSMe+7TL0BWgdFg==
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="asc'?scan'208";a="256727518"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2024 02:44:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 23 May 2024 02:43:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:43:44 -0700
Date: Thu, 23 May 2024 10:43:26 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Markus Elfring <Markus.Elfring@web.de>
CC: Eddie James <eajames@linux.ibm.com>, <linux-fsi@lists.ozlabs.org>,
	<linux-aspeed@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Lakshmi Yadlapati
	<lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>, Ninad Palsule
	<ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 03/20] dt-bindings: fsi: Document the IBM SCOM engine
Message-ID: <20240523-armband-utopia-66892e08b90d@wendy>
References: <20240522192524.3286237-4-eajames@linux.ibm.com>
 <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KslNXwyxSH4K/mBw"
Content-Disposition: inline
In-Reply-To: <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>

--KslNXwyxSH4K/mBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 11:28:13AM +0200, Markus Elfring wrote:
> > The SCOM engine provides an interface to the POWER processor PIB
> > (Pervasive Interconnect Bus).
>=20
> Please improve this change description with a corresponding imperative wo=
rding.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.9#n94

The tense used here is fine.

--KslNXwyxSH4K/mBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk8PvgAKCRB4tDGHoIJi
0o7ZAP90vhT9+l0wZYf/DL2M8yWdcRsTVggSwuamCo1DKQsfTwD/aE/ubCJjEmqQ
/DEArNwqFRhNcUQASKgsVIujbbwvCwU=
=Y394
-----END PGP SIGNATURE-----

--KslNXwyxSH4K/mBw--

