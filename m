Return-Path: <linux-i2c+bounces-14105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8C0C62521
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 05:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6012835612E
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 04:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078BF30C62F;
	Mon, 17 Nov 2025 04:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eS8uyNUd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA32EC56E;
	Mon, 17 Nov 2025 04:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763353947; cv=none; b=bJ+F/iOA9ONz0zx3srgWkYYvLPNstKH8VPdzkETR+dNqSJb0JNK5bGpBpv/ShLQMqZAKG3JdWHf//pHXCvJpza8rwGG9LqAmbrgcbrhQLzQjNlJTymRM+IhOi4xGcPJWG6sRwNhoho2rZ7aXEgcSV7fd5xk2fPHjm/nutyXLU1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763353947; c=relaxed/simple;
	bh=HL6MeUGnbH+gyiyOSqBbks00vNfOL44P0gMp+dpGVxk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=K0VndwGIaHGkHnsPAtxjl6Ec1P5RCiudDsl//uceuL6at37dJieFaG/NkCl/fyx81VKUnqr7qYrS0WVi1FP+ZTVj4Hax6yRQe9Eu7O2RT6SwJegMF4gUyjnUtUhBpxaKtIPwBkTWw1oXWq30CK3BjJfnIZwXAaPET2dhwZZ9woM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eS8uyNUd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C383C4CEF5;
	Mon, 17 Nov 2025 04:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763353947;
	bh=HL6MeUGnbH+gyiyOSqBbks00vNfOL44P0gMp+dpGVxk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eS8uyNUdvX+Eb9FUkupN5W9tMTE4VtZXmnOBnD1FAxPktA7J8tjfmrRa18EQr7Axr
	 M0qb9yn8mZicfgAEbhaLP2G92N8qKf3jqHVbV2G3hHlJFfjvVamIc/QUBiiSVv3n19
	 rfjWTmGsyv4p/SyiZ5L2PBF7iBjgHG/HkxvThyRBeTaLa41N+6cmR7kSo6qHbZkKtB
	 CGECLvha9J0avRzEC1UU1+Oy+R9KHcUVW+kywJsXcDYXJeQZkYFHzwx3wDDnmE5eTc
	 dggKcVI/FJj8MKL3ut5dYjx6m0QJ6805S2oJHpNeV/HXuN1W6f9GO8E1LDZ42j9TU2
	 zHfv9Zrirsbyw==
Date: Sun, 16 Nov 2025 22:32:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, andi.shyti@kernel.org, 
 andriy.shevchenko@linux.intel.com, bmc-sw@aspeedtech.com, 
 jk@codeconstruct.com.au, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, conor+dt@kernel.org, 
 naresh.solanki@9elements.com, krzk+dt@kernel.org, benh@kernel.crashing.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20251117025040.3622984-2-ryan_chen@aspeedtech.com>
References: <20251117025040.3622984-1-ryan_chen@aspeedtech.com>
 <20251117025040.3622984-2-ryan_chen@aspeedtech.com>
Message-Id: <176335394552.766711.17435291607317271489.robh@kernel.org>
Subject: Re: [PATCH v23 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML


On Mon, 17 Nov 2025 10:50:37 +0800, Ryan Chen wrote:
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
> -I2C bus and buffer register offsets
>  - AST2600 I2C controller register base starts from 0x80, and the
>    buffer region is located at 0xc00, as defined in AST2600 SOC
>    register map.
> 
> -Interrupt configuration
>  - AST2600 I2C controller are connected to ARM GIC interrupt
>    controller rather than the legacy internal interrupt controller.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 66 +++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  2 files changed, 67 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml:25:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251117025040.3622984-2-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


