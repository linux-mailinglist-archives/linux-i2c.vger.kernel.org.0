Return-Path: <linux-i2c+bounces-4780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F51492AC59
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 01:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B131FB21376
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 23:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D8815099C;
	Mon,  8 Jul 2024 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EX90j3iX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D333BBCE;
	Mon,  8 Jul 2024 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720479813; cv=none; b=grNcL1QYRCjPuMWrkXqpVFMciOP4aPpJR/DuznSLtp1dk4/wUEwHnoc5chZriORM3CbGDaS5KByrKaNDqtjIpeEOBrq0k6GTwRIM0fdGo17vaVK0rSkRyEB52PNA8jtw4WJ1qH2TRB7Cc4Ci6Bw84MI5887YLjXwSHARrnJqm/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720479813; c=relaxed/simple;
	bh=Z5GwSzhcq9MvxkYULUBz/U1Czb52lUPwmgBTFwviZ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7SsmRBzv5fzIBRPmYLrOp5mchIeiCQuld5sHSfDCS/V+ZqjiU7IJc+qkcutJUvZC1ZeqCSjsblYrLSio9F5MLkAya/XKGrDyGeTuGESlFk7oCig8/J1qLxPALIXvsuELinfC5lV25ElbSJnSyzfAwzUxa3ZGYy9uHMnnGf+REM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EX90j3iX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4290C116B1;
	Mon,  8 Jul 2024 23:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720479813;
	bh=Z5GwSzhcq9MvxkYULUBz/U1Czb52lUPwmgBTFwviZ7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EX90j3iXDpqHcRJkAMnoseWhjVZN9xLZvNI6uxE8EhDSEJnOJHDugXzlqfbUEanlK
	 P1TbWtywQQi6+1ceeH7ecAYbCaqo8driXHGOI3YBP7qW64wK760cvhdqS53G9qCUYP
	 Wml3IqS81Ag08OSF2L0mqBEq8l1mNM2lCTipJ4ZsLs6BV6AbLHLG6PeWhUaiDFI1Ri
	 KEj5Nm3n2oyg7+JgQtVNMkAzDurWtPm2R88i4ifSaJDHN/2zwvYdjIJXy9OCHCcL2Q
	 PxwKX3sssNI2eQnU6bH4OkNSFAI7sYWHTHdU9IWAitlY1xRuzJ1ATQj2RgvSJ9ukm2
	 SmD6BPutebrdA==
Date: Mon, 8 Jul 2024 17:03:31 -0600
From: Rob Herring <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 3/8] dt-bindings: i2c: add support for tsd,mule
Message-ID: <20240708230331.GC4092671-robh@kernel.org>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
 <20240708-dev-mule-i2c-mux-v5-3-71446d3f0b8d@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-3-71446d3f0b8d@cherry.de>

On Mon, Jul 08, 2024 at 06:12:14PM +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which is an amc6821 and other devices that are reachable through
> an I2C-mux. The devices on the mux can be selected by writing the
> appropriate device number to an I2C config register (amc6821: reg 0xff)
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>  .../devicetree/bindings/i2c/tsd,mule.yaml          | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule.yaml
> new file mode 100644
> index 000000000000..dbbabba8dd6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/tsd,mule.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/tsd,mule.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Theobroma Systems Mule I2C device
> +
> +maintainers:
> +  - Farouk Bouabid <farouk.bouabid@cherry.de>
> +  - Quentin Schulz <quentin.schulz@cherry.de>
> +
> +description: |
> +  Theobroma Systems Mule is an MCU that emulates a set of I2C devices, among
> +  which is an amc6821 and other devices that are reachable through an I2C-mux.
> +  The devices on the mux can be selected by writing the appropriate device
> +  number to an I2C config register (amc6821: reg 0xff)
> +
> +additionalProperties: true

Must be false.

> +
> +properties:
> +  compatible:
> +    contains:

No, must define the entries and the order.

> +      enum:
> +        - tsd,mule
> +        - ti,amc6821

Need to drop this from trivial-devices.yaml. We don't define the same 
compatible in 2 places.

As the original device was ti,amc6821 and this is a superset, the 
binding should first document ti,amc6821 meaning that should be the 
filename, title, etc. And then describe the Mule additions. (I mean how 
the binding should read, not patch structure. 1 patch for this is fine.)

> +
> +  reg:
> +    maxItems: 1

To fix the additionalProperties failure you will see, you need to add:

     i2c-mux:
       type: object

> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan@18 {
> +            compatible = "tsd,mule", "ti,amc6821";
> +            reg = <0x18>;
> +
> +            i2c-mux {
> +                compatible = "tsd,mule-i2c-mux";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                i2c@0 {
> +                    reg = <0x0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    rtc@6f {
> +                        compatible = "isil,isl1208";
> +                        reg = <0x6f>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

