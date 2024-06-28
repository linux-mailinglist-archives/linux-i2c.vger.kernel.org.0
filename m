Return-Path: <linux-i2c+bounces-4465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0E91BCDE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 12:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3571C21DC1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D575155CB3;
	Fri, 28 Jun 2024 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JlRLMEk8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F0481D7;
	Fri, 28 Jun 2024 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571821; cv=none; b=sUZtRLDGVFSKzrXdNPVBQjw1HobQVA5aZ3eaVsX9n8ZIThJTLlxfansr3YTYl8jq850ehs6LCk8cCwdAW4kJ5dzWK3yaNvido3kT3MO/qSNzY5l7GIAU3etoQKePYk6/1kX88RW8ni+yOGwl9r9jK0yQs+hPpgHxPnpbT9AWGuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571821; c=relaxed/simple;
	bh=ewJYo5B5Gn5p+bUGXnTqJoyHMt2jjLTs26XZMLBY5ts=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkfFLgWN5laBbNdzXB1bHEiWeE2zgE6kRmLul8WiORFgkdlPEHGDDTTMjaIFRroKpc2w6DZ2im6ODRAW3oXOwa4smGSUZg0gTMqL+38dQXXVqBe4QdVN5KAJrDdtGzYqM4o8PXjZ6TgYgQTaAhO2lkWcCOOH11AvAL46B6+/NRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JlRLMEk8; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719571818; x=1751107818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ewJYo5B5Gn5p+bUGXnTqJoyHMt2jjLTs26XZMLBY5ts=;
  b=JlRLMEk838rFfCJCz65dqELDlrDMmS7cWmpSd5Zy2HVsEilZZ8kEe5Y4
   eRmF0pU+VNkKHMyPZGpvOEUh3NHkXAJRUfvJ5F9Y9jOi6nu/qO8h6U/9v
   shH8G/QrMtcQ+o803kX5b4Isb22iUDvRmuROZZNpvQYEecdNZHV6nrkwc
   BDeJnIeQtp0FqV3PDYOY7gqNNIqGx6GoaK+v+JqQQgsI8FsQgTLqaE0HG
   9W0OkUJc/ORPIqYj1E4X+GwCPcX7z/ejIZLzXhjb4tisRvC8v+albtArK
   vse7Zs3AxNzwT+gXVO46NdBFQP+FtA0lzwanYDAFLI0UkD2i6wXRiubrp
   g==;
X-CSE-ConnectionGUID: 1fcM70mTSxeGp3bdmK8x+A==
X-CSE-MsgGUID: 6jb0hYoOSIuLQoRgVTRgyQ==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="asc'?scan'208";a="196017444"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 03:50:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 03:49:43 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 28 Jun 2024 03:49:39 -0700
Date: Fri, 28 Jun 2024 11:49:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Drew Fustini
	<dfustini@tenstorrent.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, Jarkko
 Nikula <jarkko.nikula@linux.intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?iso-8859-1?Q?Miqu=E8l?=
 Raynal <miquel.raynal@bootlin.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] Add I2C support on TH1520
Message-ID: <20240628-joining-blooming-64aefbfd9897@wendy>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <xkdmrmtiizoqo6mpc7i6iyhilxlw57nawn6ogv6dryaveyqddc@ach3rwy4abpe>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TjGWQMt2mYPYXnt4"
Content-Disposition: inline
In-Reply-To: <xkdmrmtiizoqo6mpc7i6iyhilxlw57nawn6ogv6dryaveyqddc@ach3rwy4abpe>

--TjGWQMt2mYPYXnt4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 11:30:28AM +0200, Andi Shyti wrote:
> Hi,
>=20
> On Tue, Jun 18, 2024 at 09:42:37AM GMT, Thomas Bonnefille wrote:
> > This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> > and a default configuration for the BeagleV-Ahead. It appears that the
> > TH1520 I2C is already supported in the upstream kernel through the
> > Synopsis Designware I2C adapter driver.
> >=20
> > This patch depends on the clock patch from Drew Fustini
> > Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4=
978c4d6b@tenstorrent.com
> > and the pinctrl patch from Emil Renner Berthing
> > Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.=
renner.berthing@canonical.com
>=20
> I think after these two go in...
>=20
> > Changed from v1:
> > 1. Remove redundant example for Synopsis DesignWare-I2C bindings
> > 2. Remove Node Ordering commit as it has already been taken
> > 3. Remove EEPROM label
> > 4. Rebase on pinctrl and clock driver patches
> > 5. Add pinctrl configuration
> > 6. Replaced the fixed-clock with a correct configuration
> >=20
> > Changed from v2:
> > 1. Reorder nodes to conserve ascending register node ordering
> > 2. Add support for I2C2 as it probably use the same controller
> > 3. Format comments to match kernel coding style
> > 4. Reorder nodes to conserve alphabetical node ordering
> > 6. Declare I2C2
> > 6. Set pinctrl pull-up resistor to the highest value
> >=20
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > ---
> > Thomas Bonnefille (3):
> >       dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>=20
> ... this goes throught i2c...
>=20
> >       riscv: dts: thead: Add TH1520 I2C nodes
> >       riscv: dts: thead: Enable I2C on the BeagleV-Ahead
>=20
> ... and these two go thrhough Conor's branches.
>=20
> Do you mind sending a ping when Drew's patches are included in
> the merge window? I can put the first patch on a special branch
> to keep it under my watch.

I think you can apply the binding whenever you want actually, there's no
need for the i2c binding (or driver changes, were there to be any) to
be held until the clock binding/driver is accepted.

Thanks,
Conor.

--TjGWQMt2mYPYXnt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn6VMwAKCRB4tDGHoIJi
0jNHAP4m1oXXhAI8AJklzSf40W3ivqUXLHUeMZ8nHNOHB8i0pQD8CfKBFliZjMqv
1e2iWkfTxBaM5iXO5IGnLhbQWp5W1gw=
=AKI+
-----END PGP SIGNATURE-----

--TjGWQMt2mYPYXnt4--

