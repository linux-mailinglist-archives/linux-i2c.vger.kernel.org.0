Return-Path: <linux-i2c+bounces-9544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D646BA41618
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 08:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 660E67A2196
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 07:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CD41C863D;
	Mon, 24 Feb 2025 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCsrvMjQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9DE1891AA;
	Mon, 24 Feb 2025 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740381395; cv=none; b=pvDu/mUkw17TIz8oUQX0grzC85CNuPR8dtfJUAadDvdlru3sXOsaOYZ3teAlv4FcN48HA9xPUWeM3K6WG2sxnXjX7nb324UR50DietNFgnt27fRjgCJH9vjWOCvdnftV8diKWaxDVSq3DKjv7JVWETB95qdqewgDu0RQiWBmJI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740381395; c=relaxed/simple;
	bh=2pBGmTogQCkZU/xIxkV1ntJSYG2JD2YqKohqWLQmXu4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mFHuHCWFpcTmW4ezKfb85IqSTBz6cU9G3qRfylnYnFPHPWhczAOaM9ZZpO4ivJVr4Z/wuriybmWc2BakX8erdGgCWVKE/QL9OUVTRHOC8nAueYSaip6UQrLMo9iqZaAnd6exVINk/l0mD8sjs6Rp8fNG+4DOV3qjM/1rcETCbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCsrvMjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48827C4CED6;
	Mon, 24 Feb 2025 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740381394;
	bh=2pBGmTogQCkZU/xIxkV1ntJSYG2JD2YqKohqWLQmXu4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dCsrvMjQLCzpbeyKIBH+s0BVDBGeHCz9RrZkebic83ktfM4vw0gqL8fje2cJ5ce7e
	 BaDVvtxsrgzSHK+16pwIQsUc5y3vkghLu8MY96zCwSEVhw6Pb2HYEDKE2jfCqmE8TC
	 Vtdc5FOmfpVaPd4TNIxN73EtlG0TwoJae/v9IRjHuOfHYL/Evaz+dIDXafrvMlZZ/J
	 x+Y92P5h6+h+F+IN6f9lZ1QOhhC7uTYvI4FhKjz+E3qEX8Gp8GA69GF2iSD31NXE/o
	 NspuiHPWB2/ZlbdGfFFJssj9Nrdvt5VtS5f0Ym8k/mHGz0Ssto5wY6vU7rc6qO1fmw
	 YE8PdOQ2jmDNQ==
Date: Mon, 24 Feb 2025 01:16:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: benh@kernel.crashing.org, linux-i2c@vger.kernel.org, 
 andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org, 
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, andi.shyti@kernel.org, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, 
 andriy.shevchenko@linux.intel.com, conor+dt@kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
Message-Id: <174038139252.1126908.7016492425946254564.robh@kernel.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2


On Mon, 24 Feb 2025 13:59:34 +0800, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dts'
Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224055936.1804279-2-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


