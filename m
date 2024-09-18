Return-Path: <linux-i2c+bounces-6855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CFE97BDD8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 16:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA300285001
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 14:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5685C18A6D3;
	Wed, 18 Sep 2024 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8E0r8AZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A9F9CB;
	Wed, 18 Sep 2024 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726668851; cv=none; b=E3iSIDyY7jgC5a0VYkNwvkGooikNJywKc3A4Al2B1Zj34yGkLEtV6uKXeLRrDrUdAVKFUKAE46gMBOJqZsvkQGXJ2JTZ7FpKRb46SdTd5d0AkJzyHqRQRhWERKDnCTtKbVpJI3PFijjNcLxba45Fu5cEYHm/YL2RwHAOQiuPnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726668851; c=relaxed/simple;
	bh=rDnqc8tkSn/rSuf0HFELypue7d4pHGKdC07TTyFxcXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mvj1qgueYu/PDfqlAmQ+jzIzvPFzCl7rk6GfNeSKzx46apbE7L/Bx5zDs54M+C4ZTT6UITSRQ4VakQqgRN87oiMbFs4MwSkmogxbNINHnjU9jz6wpTa02XZjzqHPJfUhTIs/6tx8sTfiUx+dwd60BGoMXURohaY6+GqvcgU/Lo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8E0r8AZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9DCC4CEC2;
	Wed, 18 Sep 2024 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726668850;
	bh=rDnqc8tkSn/rSuf0HFELypue7d4pHGKdC07TTyFxcXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8E0r8AZhGt/hNrTJlx3qULQ/erOYDyoDNgRdYVmjTNWcP9fkKo+a/aTCtPHJc+Yw
	 aL6Bfz0Bw6JZNKchM2eB5+SePf2kSM5Be9E3cbykad5SuXmm4GQ90mM2KyZGsvQKZD
	 u+iosA+F3qOoKaVLrFxhbLJjYz0ga4QL+ousiJwx58l/r5UPiX+Lo1PuYkJbT4ERkP
	 j8DcfMnj4w6sA6xmFNBO+FMwfVhwefKt6qAJvHc0gt6xbyZgBctOhSMp36HXZvdnnh
	 LxqT87XgRMjOehLwbYbJHQODX+X5ED2sBBS8NO7CzT60/9MYs6l9adO8Ooo9MvSNeb
	 O/uijEzbU6NnQ==
Date: Wed, 18 Sep 2024 09:14:09 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add RTL9300 I2C controller
Message-ID: <20240918141409.GA1494676-robh@kernel.org>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917232932.3641992-2-chris.packham@alliedtelesis.co.nz>

On Wed, Sep 18, 2024 at 11:29:28AM +1200, Chris Packham wrote:
> Add dtschema for the I2C controller on the RTL9300 SoC. The I2C
> controllers on this SoC are part of the "switch" block which is
> represented here as a syscon node. The SCL pins are dependent on the I2C
> controller (GPIO8 for the first controller, GPIO 17 for the second). The
> SDA pins can be assigned to either one of the I2C controllers (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     This does hit generate the following dt_binding_check warning
>     
>     realtek,rtl9300-i2c.example.dts:22.19-30.13: Warning (unit_address_vs_reg): /example-0/switch@1b000000/i2c@36c: node has a unit name, but no reg or ranges property
>     
>     Which is totally correct. I haven't given this thing a reg property
>     because I'm using an offset from the parent syscon node. I'm also not
>     calling the first offset "offset" but I don't think that'd help.
>     
>     I looked at a couple of other examples of devices that are children of
>     syscon nodes (e.g. armada-ap806-thermal, ap806-cpu-clock) these do have
>     a reg property in the dts but as far as I can see from the code it's not
>     actually used, instead the register offsets are in the code looked up
>     from the driver data (in at least one-case the reg offset is for a
>     legacy usage).
>     
>     So I'm a little unsure what to do here. I can add a reg property and
>     update the driver to use that to get the offset for the first set of
>     registers (or just not use it). Or I could drop the @36c from the node
>     names but then I coudn't distinguish the two controllers without failing
>     the $nodename: requirement from i2c-controller.yaml.

Use 'reg'. Looks like you need 2 entries for it.

Whether a driver of some OS decides to use it or not is irrelevant to 
the binding.

> 
>  .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> new file mode 100644
> index 000000000000..5b74a1986720
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL I2C Controller
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +description: |

Don't need '|' if no formatting.

> +  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
> +  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
> +  assigned to either I2C controller.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtl9300-i2c
> +
> +  realtek,control-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset of the registers for this I2C controller
> +
> +  realtek,global-control-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset of the I2C global control register (common between
> +      controllers).
> +
> +  clock-frequency:
> +    enum: [ 100000, 400000 ]
> +
> +  realtek,sda-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0

0 is already the minimum.

> +    maximum: 7
> +    description:
> +      SDA pin associated with this I2C controller.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - realtek,control-offset
> +  - realtek,global-control-offset
> +
> +examples:
> +  - |
> +    switch@1b000000 {
> +      compatible = "realtek,rtl9302c-switch", "syscon", "simple-mfd";
> +      reg = <0x1b000000 0x10000>;
> +
> +      i2c@36c {
> +        compatible = "realtek,rtl9300-i2c";
> +        realtek,control-offset = <0x36c>;
> +        realtek,global-control-offset = <0x384>;
> +        clock-frequency = <100000>;
> +        realtek,sda-pin = <2>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +      };
> +
> +      i2c@388 {
> +        compatible = "realtek,rtl9300-i2c";
> +        realtek,control-offset = <0x388>;
> +        realtek,global-control-offset = <0x384>;

Humm, normally we don't want the same address in multiple 'reg' entries. 
Is this offset known to vary? It could just be hardcoded in the driver 
or implicit from the compatible (different compatible is the usual way 
to deal with differing register layouts).

Rob

