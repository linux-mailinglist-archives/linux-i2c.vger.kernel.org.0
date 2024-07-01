Return-Path: <linux-i2c+bounces-4557-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED791E605
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 18:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8AF3282E39
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420D316E861;
	Mon,  1 Jul 2024 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2FkOt36"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3A316DEC8;
	Mon,  1 Jul 2024 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853088; cv=none; b=RJ6325N3DQGf2TGinjFcyynU+J/0MT+qB6KlBB0nYjWIKHNgwbN2CRB1LsCyyxO0MmnkcwoIAJqr43W/LIZbxBGQsuhh/9RF6u2FKyVIzriLjLQZmzx9ILYxb93Q6KSJe9vZO95JNbISMkut8GafyGsSZImKl+pMp70/MZP4Fco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853088; c=relaxed/simple;
	bh=EO7/E1fmFPDxsl2pt25UyipimOIrITsdcLNZXiIE57o=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=W8L9FZCWOQ65xvSAZCcj3gLqIK5EauOZ8k3t5l/dptLt2nkIrzQuPuAhiu4/321E0Hc+Ukv/ckKXScBZQZ11QBRBhSTAKoKDDGLWvPHk1yOvctGsT6XBiyRn45Sk0D/WtPOK4gNF64YUqhWuOi3amvi+BNDsopGWBOcyTSLqyj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2FkOt36; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A698C32781;
	Mon,  1 Jul 2024 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719853087;
	bh=EO7/E1fmFPDxsl2pt25UyipimOIrITsdcLNZXiIE57o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=A2FkOt36R1LdB6Q7276KAk0Wor4qRKOK7KHUxqVztI461cf+tMQfm0eFCVQEw4UYs
	 Am1c3/FN52pd1EPGZNke8ZynfbsHZG4a1n0i6NXOOrM6Ei27SLltO7oKaEYVpAghTX
	 dCMFLKG3Hz8sA8d34/mrsEHV5I60v5HghmX+M2NZ3m5VpfDddj5eIa8uLrChzfEjdD
	 Qq5MwqJKxNtZ1mTlAs8Ssgny6VSnRfCkxcDLXBAShXaHWSwtN1a9GCyGxTPvMGBWh8
	 nqnC5V6advOYGyeM3uZL14cmyIVzQb/SUPxeI0VJTHv6Gg1cyx23vIMDMqWHAQftTr
	 nLjalPXSlMyiQ==
Date: Mon, 01 Jul 2024 10:58:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 thierry.reding@gmail.com, corbet@lwn.net, wsa+renesas@sang-engineering.com, 
 linux-mmc@vger.kernel.org, mkumard@nvidia.com, conor+dt@kernel.org, 
 digetx@gmail.com, jonathanh@nvidia.com, ulf.hansson@linaro.org, 
 adrian.hunter@intel.com, krzk+dt@kernel.org, ldewangan@nvidia.com, 
 andi.shyti@kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20240701151231.29425-3-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
 <20240701151231.29425-3-kyarlagadda@nvidia.com>
Message-Id: <171985308459.97826.5913144398477563186.robh@kernel.org>
Subject: Re: [RFC PATCH V2 02/12] dt-bindings: misc: Tegra configuration
 settings


On Mon, 01 Jul 2024 20:42:20 +0530, Krishna Yarlagadda wrote:
> Config framework parses device tree and provides a list of register
> settings with mask per mode to be applied by the controller.
> 
> Add binding document for config settings framework. Config settings
> are defined as a property per field and have different modes per device.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../misc/nvidia,tegra-config-settings.yaml    | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml:46:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.example.dts'
Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml:46:1: found character that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml:46:1: found character that cannot start any token
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240701151231.29425-3-kyarlagadda@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


