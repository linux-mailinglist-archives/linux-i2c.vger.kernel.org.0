Return-Path: <linux-i2c+bounces-3133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 968308B1D3D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 394B11F23A86
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD8E84A46;
	Thu, 25 Apr 2024 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1eLhvimG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27C980056;
	Thu, 25 Apr 2024 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714035661; cv=none; b=MNEt+cw0tB9VNp9fQm+ZysHob0IvwJ8EjiAvnBQf4Ha6muIqoVVqrbRDd6LROkqMR8MAUyEvAZ63IuigQZ/a/KgppFQErsGMAHh6k3XIw/qx1iqedXGtnq4z++7LFFNC4wrHt9s3UL7/gD5fzgXkzJcrSXgexTHNPJ3Odo8LU5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714035661; c=relaxed/simple;
	bh=wPeg0IqiY+o/vc4YdB3Yt/sWLRBKKZcicUVDHUyXfR8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2vNpxVfd5+OI+89berGtdgEAfOt0/tF9XJ+L4IPsg1qBORe0NbH0K+S259uHan5V7w2p2b3GeolCe4gS/X8MzLZ66L8ayMQ2PazpGGj57RLw+1WkPmsGsDHLmBlYvp4c6hDQIF6qT0TVUvuje1urIwPRX2lbdbqCJIxiBbSLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1eLhvimG; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714035660; x=1745571660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPeg0IqiY+o/vc4YdB3Yt/sWLRBKKZcicUVDHUyXfR8=;
  b=1eLhvimGMmSREv4xGYXicmK4mo3Btnh7A7dfhaQJg0Sm3ggwszxhBD+w
   zfWHUjY56UF0IboDTFtwWMKaQ3rUmAyP7HDw3+HwEYh9e34tmnzHT+wPT
   IQGBylWPIQVLcI782AT/W0DlZIFDbB9W/ENhT4mRSAiESXWsxF7g37NPn
   cgJOh8gxldLj4MikAIGEzULibYBruzowpIL20zuOWHAX/RjiG/OjypwYv
   QgRY/Onz/FDU/CK+RFdJbNa6MjkmsQx/74coEB8XwDp2CAHQ1GE7D+Tw/
   nM8IJdx6hT4iJu48+cg/luZsXsrUAhjTpLl/q7GobKtm1tmtz6S9gyjsy
   A==;
X-CSE-ConnectionGUID: /8g22YwRTJWm2ALCCzb01w==
X-CSE-MsgGUID: vJF5Dj9pTq+mEs5pThBumA==
X-IronPort-AV: E=Sophos;i="6.07,228,1708412400"; 
   d="asc'?scan'208";a="22604673"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Apr 2024 02:00:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 02:00:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 02:00:26 -0700
Date: Thu, 25 Apr 2024 10:00:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
CC: <jszhang@kernel.org>, <guoren@kernel.org>, <wefu@redhat.com>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>,
	<thomas.petazzoni@bootlin.com>, <linux-riscv@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Drew Fustini
	<dfustini@tenstorrent.com>
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
Message-ID: <20240425-boxcar-maroon-f07c5aba9272@wendy>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ChY57WC1c4Rd39Ve"
Content-Disposition: inline
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>

--ChY57WC1c4Rd39Ve
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 25, 2024 at 10:21:31AM +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.

> As there is no clock driver for this board as of today, this patch
> series uses a fixed-clock named i2c_ic_clk.
> There is also no pinctrl driver yet so pinmux must be handled manually
> for now.

https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com/
https://lore.kernel.org/linux-riscv/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/

These seem to be the most recent versions of each. I guess they're both
just waiting for their authors to have the time to get another version
written.

--ChY57WC1c4Rd39Ve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiobjwAKCRB4tDGHoIJi
0m3oAP4tAD2kosaFcYvaXiFZn6dyRnma6alALn7IOrD+fGMjIAD+J6CU6uKzRjBl
1LEW+b76173fZg3Ov1Ds6FNSXUQKLg8=
=i8Ye
-----END PGP SIGNATURE-----

--ChY57WC1c4Rd39Ve--

