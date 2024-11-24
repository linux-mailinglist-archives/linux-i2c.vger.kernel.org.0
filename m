Return-Path: <linux-i2c+bounces-8173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DDA9D77F6
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 20:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9408D162D80
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 19:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AA6156962;
	Sun, 24 Nov 2024 19:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="LkAlmgzb";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="ARcZ6Ujo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A42905;
	Sun, 24 Nov 2024 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732477149; cv=none; b=BmIsqURAJhjhtXg52VWbOae66TzSOg8fx1LFMrQFWcAnOaZqPpX0Aw1dtKYaFONhbZdJxsb77+ULor0KTgIy4Zq3ECEFVLQpf3OMJt7p/cwNF3kyUFjrA0VUYb5IPBCYJYLb/IJ6yGQ38h82hTsmjDD+sEV7ZxWEGuVHEBxeZTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732477149; c=relaxed/simple;
	bh=edW6FblLRPc/971JbOeZphqmTOk6PouWc9UbeBAp+ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFb2GcH80fWTEJiTySiL14IEWPkIxfxqS3zMc6jrq2NUcpEel8Z77s066wegwYdr2VwZejjt1Ljd4GziQRrtF86IBEymQsBYZeQgdnFtoO7M1FT0QUoNLXumM8U04N3V2JR+dSefBSQyQI7SFC1gKvZkoFQdCbkmVOL+fSz5N5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=LkAlmgzb; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=ARcZ6Ujo; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 4BD95122FE1E;
	Sun, 24 Nov 2024 11:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732475960; bh=edW6FblLRPc/971JbOeZphqmTOk6PouWc9UbeBAp+ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkAlmgzbY871ngRwWpBpZ6TKn9VRzeinUPamUqhsoCNZGfiQ0e4DrlxxK/JZopBPF
	 uMuUKvA7RWCwshtLdaSurQlrMmwzD5p2O1Z8PEhszDbirdMx3aB8yBxFFI0DZKeY2p
	 xbEBqg2vcqL7rnVjnXULmP7GQXN4dZA1gISosmpX3rlZ9zPiKcmwJ3yQryI1HFBI4q
	 9CUMk95qsgA81qKhLSaw+DHJoKVZpshKAFV7yO9sxF+Gio3EGJGvNReen+Wbk/Y3HF
	 ATJLo6KTIgfYLLh12Icjaf/HFLJHshI8HkbyieDfZJrnrR96vPgLFTUxKFNlI79DhN
	 qjmpc6yjQmnrw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mx06GAu6XvGk; Sun, 24 Nov 2024 11:19:13 -0800 (PST)
Received: from ketchup (unknown [119.39.112.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 01A3B122FE1A;
	Sun, 24 Nov 2024 11:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732475953; bh=edW6FblLRPc/971JbOeZphqmTOk6PouWc9UbeBAp+ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ARcZ6UjozqyNxpmFO2lRHOJiJ+gpPng0A1BKWVFv8hOzAjxDqC3qGeEsIeiNG2yh1
	 ICymzkx7+BbQljgdF/O22T3D0l8m9mDjwhD3rSgMcEYa/NGevyJD3IFeBktL328YTV
	 m73tZyW/VZalh1wGpFWXkASURv8ZvQiKyPzvUprU7lfI4z45SbivaV/yTob07x5/AI
	 DAvrXGEhTTeOjokCdPLSNFufXDai0LivMO2hNlJnKXZJv8wALSr84wjxKOyCvFz96v
	 NqL/y/0o3BS51PeQJGRVHJ5VzuOYwTS14ZZ2EUsbikMRNKq8/79kpN3iOKNO/eiuGy
	 oZSOOR6Qy9qvw==
Date: Sun, 24 Nov 2024 19:18:59 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <Z0N8I2zv2vl9f8Y1@ketchup>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
 <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
 <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>

On Wed, Nov 06, 2024 at 06:29:56PM -0600, Samuel Holland wrote:
Hi Samuel,

I'm working on the clock driver for Spacemit K1.

> On 2024-11-06 1:58 AM, Troy Mitchell wrote:
> > On 2024/11/2 11:48, Samuel Holland wrote:
> >> On 2024-10-28 12:32 AM, Troy Mitchell wrote:
> >>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> >>> and supports FIFO transmission.
> >>>
> >>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >>> ---
> >>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
> >>>  1 file changed, 51 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> >>> new file mode 100644
> >>> index 000000000000..57af66f494e7
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> >>> @@ -0,0 +1,51 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: I2C controller embedded in SpacemiT's K1 SoC
> >>> +
> >>> +maintainers:
> >>> +  - Troy Mitchell <troymitchell988@gmail.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: spacemit,k1-i2c
> >>> +
> >>> +  reg:
> >>> +    maxItems: 2
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>
> >> Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
> >> REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
> >> looks to be standard across the peripherals in this SoC. Please be sure that the
> >> binding covers all resources needed to use this peripheral.
> >
> > RCPU stands for Real-time CPU, which is typically used for low power consumption
> > applications.
> > We should be using the APBC_TWSIx_CLK_RST register, but it's not listed in the
> > user manual.

The vendor missed the register definition of APBC_TWSIx_CLK_RST in the
documentation. There'll be an update soon.

> > However, you can find this register referenced in the K1 clock patch:
> > https://lore.kernel.org/all/SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/
> 
> Ah, well that driver is missing most of the bus clocks. For example, from a
> quick comparison with the manual, the driver includes sdh_axi_aclk, but misses
> all of the PWM APB clocks at APBC_PWMx_CLK_RST bit 0.

Thanks for pointing this out. Indeeded, the v2 of clock driver is
missing some bus clocks. I'm fixing them and working for a v3.

As for the I2C controller, I've confirmed with the vendor that both bus
and function clocks are required for normal operation. This applies for
all I2C controllers on the SoC, regardless of the region it belongs to
(RCPU/APBC).

> 
> If the clock gate exists in the hardware, even if it is enabled by default, it
> needs to be modeled in the devicetree.
> 
> > Also, to see how to enable the I2C clock in the device tree (note that the
> > spacemit,apb_clock property is unused in the driver), check out the example here:
> > https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi#L1048
> 
> The devicetree describes the hardware, irrespective of which features the driver
> may or may not use.

Best regards,
Haylen Chu

