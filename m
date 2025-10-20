Return-Path: <linux-i2c+bounces-13672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791CBF0DC8
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 13:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0B3D34B94C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 11:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B702FB973;
	Mon, 20 Oct 2025 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfN84N3F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942192FB96A;
	Mon, 20 Oct 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760960120; cv=none; b=SITQBbd5QZb7W2qxOGC2rt9iTgcIfBij8/pY1SUxLhAG2LyER21N93xmV3bv5Lkau3AIm7Wto0P7Y+/ryd+h9ut1nJWHPbFMCDkJPz3h7zukzAkubCqjE7+nq0qEPGXMYn3pDxOf7MhUO9mT11P42DX/dBCVuyzbSkz54gXH5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760960120; c=relaxed/simple;
	bh=ZioengeclCBPyaIw8m5VBq2tqjHhRbeGcSeZSVPGoOk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LUgtJNbxDkvF+fxDJdI/Ujg3C1DHf1Qxsog5FjfJM7km6/3MzFJYlwvwuc8PqnmfrGj+ooLO/hD0f6NRMz42EniLDD2XaZjoBJ3LOl+g7z5uEiRexyxYwpMswGvcyGhXWVfhn0gx7Z+WJQ/db34RzM15EZC33xnGNdBwFgRL+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfN84N3F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A9DC4CEF9;
	Mon, 20 Oct 2025 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760960120;
	bh=ZioengeclCBPyaIw8m5VBq2tqjHhRbeGcSeZSVPGoOk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MfN84N3FvlrHrKO6hwp0uof+Ta7bEnnpHDT3YaLa+WZMR3CMdo0kZHWC3c1U6E2pF
	 J5umlW8m4tmUBXWCdMwHbR4/0xVpTKgZPBLKDvRhZKJDxJztlux+q0MDAfDEkL6tk4
	 8OYnemTQgRJ0/6UVcCgGgfTHTwvb9712A6SjcKvzTp9OqaiU46BCKQI2Ydk8t6rmO0
	 EPlKRiwgd6lPVQLKfkryxc/KWv8F9NGbZx7wNrM1RS06vHJfcAyHaIhAQpol9wOgAt
	 CEIBujREfOOxhdxe8FDc9qugI9RYC1kUt+djUMqMw1/KQ0j89XW7VWnow0FdMexgWY
	 J7M8KbhYwuI/g==
Date: Mon, 20 Oct 2025 06:35:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, conor+dt@kernel.org, 
 linux-aspeed@lists.ozlabs.org, joel@jms.id.au, krzk+dt@kernel.org, 
 andrew@codeconstruct.com.au, linux-kernel@vger.kernel.org, 
 benh@kernel.crashing.org, devicetree@vger.kernel.org
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20251020013200.1858325-2-ryan_chen@aspeedtech.com>
References: <20251020013200.1858325-1-ryan_chen@aspeedtech.com>
 <20251020013200.1858325-2-ryan_chen@aspeedtech.com>
Message-Id: <176096011475.23064.13799548826512417145.robh@kernel.org>
Subject: Re: [PATCH v19 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML


On Mon, 20 Oct 2025 09:31:57 +0800, Ryan Chen wrote:
> The AST2600 I2C controller is a new hardware design compared to the
> I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).
> 
> It introduces new features such as:
>  - A redesigned register layout
>  - Separation between controller and target mode registers
>  - Transfer mode selection (byte, buffer, DMA)
>  - Support for a shared global register block for configuration
> 
> Due to these fundamental differences, maintaining a separate
> devicetree binding file for AST2600 helps to clearly distinguish
> the hardware capabilities and configuration options from the older
> controllers.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 67 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: properties:reg: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'address offset and range of bus'}, {'description': 'address offset and range of bus buffer'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
Documentation/devicetree/bindings/i2c/ast2600-i2c.example.dtb: /example-0/i2c@40: failed to match any schema with compatible: ['aspeed,ast2600-i2c-bus']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251020013200.1858325-2-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


