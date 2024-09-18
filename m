Return-Path: <linux-i2c+bounces-6844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD3297B673
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 02:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC78F1C23409
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 00:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF676FCC;
	Wed, 18 Sep 2024 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMUomP5x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC84C74;
	Wed, 18 Sep 2024 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726619575; cv=none; b=Yt3Ie8ZN+qZrYLjrlhs0oOECgScS7zpORcheYh4p83lDi3c6deogQYLF19XLia2bh6LDo++LwtrdYxLQ3sLlQ7d7HuMb4O8FnUCqwEbdASpipdq8xdbigRWbjbQF8ZDVtmymB1+NNVTtnQWvWV70sifpPmTAUrUa5A8mZTVyOhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726619575; c=relaxed/simple;
	bh=VX89jGGqe8LcFZfqS1+w6fGYFBiKFfWaYF5DbCUvMyw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=k4bT6g3GiPGUINLqwmVUDZEnUOXdkqiBiXMw8fQ99MZmF3coT5lJZ+UaiVM9QJIBrTwIcLMcmM5Gn6qTwkzcxhxXQqhMkOAW++ujWP6whFNCIrd1EyMKWS+QlHhE8nhurmklrTrF/EdU0zuQwPvZWIgQiWd95bA+RG0BE7S+ZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMUomP5x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638E5C4CEC5;
	Wed, 18 Sep 2024 00:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726619574;
	bh=VX89jGGqe8LcFZfqS1+w6fGYFBiKFfWaYF5DbCUvMyw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=VMUomP5x9WGZphszjZYW61EpqSk/N//fiarc78qqmjz0l/EVrEk1Lz+v4XmVcz5PY
	 AgNTFdZPcczAqTJ2GFwqkm5nBuMuyVv3xLwjcDE2QtIWL0pOYfsHY6M/5dr/vz8su0
	 vc29PVIO7LcR8bXDhKO5Jntbi0xsBBvreX7XGuiUprMxeMANX0IB2tCDpYsYCRHZJO
	 Q2ABRsLzmH/KhmXNZXxyDw3dIqHR8nho8cjF5ZdZ1egYsk4vHHqpe8hCWGDZ+IAm7X
	 Jex0P24OVOEUdb3tcu7DWoGTMjtEUoJpxFNq+gJAd/1n6iCGGxhkQaf4e1mfQfebVx
	 UjNAovr3JpPqQ==
Date: Tue, 17 Sep 2024 19:32:53 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de, 
 linux-i2c@vger.kernel.org, andi.shyti@kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20240917232932.3641992-2-chris.packham@alliedtelesis.co.nz>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-2-chris.packham@alliedtelesis.co.nz>
Message-Id: <172661957208.22701.3209125488509586374.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add RTL9300 I2C controller


On Wed, 18 Sep 2024 11:29:28 +1200, Chris Packham wrote:
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
> 
>  .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.example.dts:22.19-30.13: Warning (unit_address_vs_reg): /example-0/switch@1b000000/i2c@36c: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.example.dts:32.19-38.13: Warning (unit_address_vs_reg): /example-0/switch@1b000000/i2c@388: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.example.dtb: /example-0/switch@1b000000: failed to match any schema with compatible: ['realtek,rtl9302c-switch', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240917232932.3641992-2-chris.packham@alliedtelesis.co.nz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


