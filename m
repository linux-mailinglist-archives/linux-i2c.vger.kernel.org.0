Return-Path: <linux-i2c+bounces-14071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 31733C56254
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 09:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2319C343CFC
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 08:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B185933030A;
	Thu, 13 Nov 2025 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvngG+gP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66265289811;
	Thu, 13 Nov 2025 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763020852; cv=none; b=aC+G/BVmA7y9m2dRHBPDt2VzEsYZPPH75D6ZuCalBR2tHkUH4wyU+yeMRcf+bvK+2/x//nIklwVTAPiY53bLr4uMpc4SzTkJX8lpZXkErdM2DC/Wd3eU8rxBjKlJKSq0Jq1kacR6bC/IlMAdwzT8j8bPaZpup744b7KlOK2E7vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763020852; c=relaxed/simple;
	bh=WmqkW3UkMPxJ2hqmmHl3aY1fYJJukh2KzhzojgxvCVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoFpHHG7TubqtrMH5u3QQ9v4XZleqmLIV+YcDPU/xCu3MhYVR3qna0w2T/Z3btS3tKzeD8ufwOaM4eljEkrU6sm5rH5Vqez7pqzOawWkX2MS9iR6Y7E6GozQ8mxreb9HuVh6ZHe0ETPUBewcnrzCFvKlJoA6tyUED//i6YFRufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvngG+gP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D933C4CEF8;
	Thu, 13 Nov 2025 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763020851;
	bh=WmqkW3UkMPxJ2hqmmHl3aY1fYJJukh2KzhzojgxvCVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvngG+gP69SHM63Z5iI4/xBcHcRs5CX3CfTI4J8cHRSjueLzf1e79gBMCBFR16cDe
	 pW0tfxhuQ9L76KNMppP5d6rV1Vl5AjD1q2qhwkSoLbHEqj6OC3R27NLlZEqXJzyV0X
	 yc4nRv7c4ySqJKX4+z/EVNbxvMlPHMZerq8edYClXV1ka6zr7npFiBQWJGaIFmGiQr
	 YK62ZoCZu9cXjNk6cUzPSKAUh9nJQ65kNcp7PgOslvJDq0oYMKh5nYXJLizxnxrhxH
	 5Wk1hoq7bTIePtEoeYN6Mzy1J0YbKpIN9KOo+ZMScmRR2K9DYCkXrpPZDYPrHpDscU
	 VF5xF+BI5UbOg==
Date: Thu, 13 Nov 2025 09:00:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: bmc-sw@aspeedtech.com, benh@kernel.crashing.org, joel@jms.id.au, 
	andi.shyti@kernel.org, jk@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
	andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v22 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20251113-waxbill-of-awesome-fame-8a84d1@kuoka>
References: <20251112085649.1903631-1-ryan_chen@aspeedtech.com>
 <20251112085649.1903631-2-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112085649.1903631-2-ryan_chen@aspeedtech.com>

On Wed, Nov 12, 2025 at 04:56:46PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller introduces a completely new register
> map and Separate control/target register sets, unlike the mixed
> layout used in AST2400/AST2500.
> 
> In addition, at new AST2600 configuration registers and transfer
> modes require new DT properties, which are incompatible with
> existing bindings. Therefore, this creates a dedicated binding
> file for AST2600 to properly describe these new hardware
> capabilities.
> 
> A subsequent change will modify this new binding to properly
> describe the AST2600 hardware.
> 
> The example section updated to reflect the actual AST2600 SoC
> register layout and interrupt configuration.
> Reference: aspeed-g6.dtsi (lines 885-897)
> 
> -I2C bus and buffeset address offsets
>  - AST2600 I2C controller register base starts from 0x80, and the
>    buffer region is located at 0xc00, as defined in AST2600 SOC
>    register map.
> 
> -Interrupt configuration
>  - AST2600 U2C controller are connected to ARM GIC interrupt
>    controller rather than the legacy internal interrupt controller.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 67 +++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  2 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 000000000000..e6ed84c53639
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c-bus
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      The first region covers the controller registers.
> +      The optional second region covers the controller's buffer space.

1. List the items instead. We discussed this already and this had
correct format in the past and now it is getting to some odd style. Why?

2. How region can be optional? Device either has it or does not have it.
Please explain me how one, same SoC has optional IO address space? I
asked to explain WHY this is flexible.

You never replied.

NAK, we are discussing same over and over again. I am not reviewing the
rest. Go to previous versions and read the feedback again.

Best regards,
Krzysztof


