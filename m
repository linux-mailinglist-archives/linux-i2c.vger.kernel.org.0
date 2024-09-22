Return-Path: <linux-i2c+bounces-6917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7C97E338
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Sep 2024 22:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6031D2812A6
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Sep 2024 20:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D8B51C45;
	Sun, 22 Sep 2024 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFWabVu6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A42E219E4;
	Sun, 22 Sep 2024 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727036759; cv=none; b=pD8vw9HKZ2RZLTcxDxuVJU15I/CCg6sD+bgmuTlFQ5Ut0+7Zv6rDIQHdOqEAMOBGjldWQiCC8eTQkPJnjtgdp41FETBeXJCxxiwxKb+hpiUthJZzCRMt9dl+SWMzh4Fo5X7ejOaWz/ma4bH9xZ62bez1VUxFyTeYK/4Eu7c9sXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727036759; c=relaxed/simple;
	bh=sCJqfQ3cx+gDrUkYtzCV35EPLuNeBVpyT3aqAwSo/0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgKLYA1tIhaA26sG9mx/g8IrAB9fmFknyD7DNrsr6606L64jfWdxU+DPnaS0nvHH9ZcD/KBQTKA+1N4XfCkkYqLRvkYcbknZBy7JTCjQFxz2kQiAo9ztEMzfDnhtXvcwC0x55aPUVyGWIDdtI6d2Nv/lDOqSk1ZjhHVlym86ozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFWabVu6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CAEC4CEC3;
	Sun, 22 Sep 2024 20:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036759;
	bh=sCJqfQ3cx+gDrUkYtzCV35EPLuNeBVpyT3aqAwSo/0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFWabVu66kX1+0hbuyI4L2iLtakpYzGT5iwP/aeSagJ8mltE1WKz4604APs81rZUo
	 wjzvCsqEFXMdru8vZR05Ep5YjS4AJI0s/jXRGOWHgHJ1IEqNkftmcuPsM8FB8Z7nzH
	 Gd81BHhZX3rvNQsBzkliOkV8V/e01UpblRHHQuFCx5yVHQKnWe0cQFe+8n0qVsneKI
	 rLJpD4nyIOX3P0rBEsmISrpO0zbbS3V8/OnYwumqLbVNOBjZ8bm0EzxCJIftguurCP
	 bDBkPN+9vlXhGtOV7mEei18mt9i4wWIcvqyZ87zvvlcvIlxVEOChlXAxtP7OtOXnGR
	 oc5aApV/6aJCg==
Date: Sun, 22 Sep 2024 22:25:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Message-ID: <6hlfdtbdf7yhkaoiuglhk4gksgzpahewzjf4cseedon7x2tx3s@m6c23rqxwkyu>
References: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
 <20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz>

On Fri, Sep 20, 2024 at 12:09:28PM +1200, Chris Packham wrote:
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
>     Changes in v2:
>     - Use reg property for controller registers
>     - Remove global-control-offset (will be hard coded in driver)
>     - Integrated the multiplexing function. Child nodes now represent the
>       available SDA lines
> 
>  .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> new file mode 100644
> index 000000000000..e8c37239b299
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> @@ -0,0 +1,82 @@
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
> +description:
> +  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
> +  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
> +  assigned to either I2C controller.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtl9300-i2c
> +
> +  reg:
> +    description: Register offset and size this I2C controller.
> +
> +patternProperties:
> +  '^i2c@[0-7]$':
> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description: The SDA pin associated with the I2C bus.
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +unevaluatedProperties: false

This goes after "required:" block.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    switch@1b000000 {
> +      compatible = "realtek,rtl9302c-switch", "syscon", "simple-mfd";

Drop... or put entire example in the parent device node.

> +      reg = <0x1b000000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      i2c@36c {
> +        compatible = "realtek,rtl9300-i2c";

Parent is 9302c, but this is 9300?

> +        reg = <0x36c 0x14>;
> +        clock-frequency = <100000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        i2c@0 {
> +          reg = <0>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          gpio@20 {
> +              compatible = "nxp,pca9555";

Mixed indentation.

> +              gpio-controller;
> +              #gpio-cells = <2>;
> +              reg = <0x20>;
> +          };
> +        };

Best regards,
Krzysztof


