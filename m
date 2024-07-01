Return-Path: <linux-i2c+bounces-4558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 487D291E60D
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 18:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C231C20D91
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF6B16EB40;
	Mon,  1 Jul 2024 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQBy6paj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564AF16E881;
	Mon,  1 Jul 2024 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853089; cv=none; b=BuHZUV/RUmXtHRXlufPcfRXbbh/7uC4JZ9L7ANNf/smb6dqf57+fP0ymDSUqGAgOEojFRNM/3M7L7rpQJ7qaN1Ul0mcGvB9maKxkN6zrFDcTRD5UL4XKvhrcT3btNhy+zpLQ6ynkDuStfjJQAf+lIp9m0PRljf7YWpd8xUadC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853089; c=relaxed/simple;
	bh=agWLB1dSsil03LVg+k0hNyOLjUMIwQj5qW3YF6NP3VU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ldEILZdV6cddio5fCOZ5FgBuM6zpr5zxRJvKFI8Cc/jGzXN3fR3mSWnSMnN+4PPYRN+nNUI4od3B6mCNVHoM5FmQC5e2CdFVhCbC/AxI6l8z6jDvfpn+QImh6z0vB2xwnx6yV0axbcfmKspCIPVW2uI+QkV+smCGkJGFsjZOKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQBy6paj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D62AC4AF10;
	Mon,  1 Jul 2024 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719853088;
	bh=agWLB1dSsil03LVg+k0hNyOLjUMIwQj5qW3YF6NP3VU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CQBy6pajkwKMefcUd3lLxZDuM2/mVXIBQOKyhDxEq601044HXLrBRyTr8Oxz50wvb
	 B2+WYfe73WqG7smoY27qDBwIyBEfV+NE9PtYzD8n37eENkfpRi2NW63XzCgYPgcUmb
	 lT2XJmPmGl/UOhdVFxmRamz7bgKeQGXYvk1/Dkuv4NnaycfuA8qheMau/VNqF7/dOi
	 TGsSa6M/v7dzQEvix1XwO60RILmZLWv6o3TNtUWHZJgfOYgX0uVGQGWaYG2VfSlN2c
	 Mo10boDdEtXBvLaJBurfkpgSwWYmY88C/rJhrdQX9XY733HJE5/Vk7KoZ611tt3XbQ
	 6LKnycCbANP4g==
Date: Mon, 01 Jul 2024 10:58:07 -0600
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
Cc: thierry.reding@gmail.com, andi.shyti@kernel.org, krzk+dt@kernel.org, 
 ulf.hansson@linaro.org, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, digetx@gmail.com, corbet@lwn.net, 
 linux-i2c@vger.kernel.org, jonathanh@nvidia.com, conor+dt@kernel.org, 
 ldewangan@nvidia.com, mkumard@nvidia.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, 
 adrian.hunter@intel.com, linux-tegra@vger.kernel.org
In-Reply-To: <20240701151231.29425-5-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
 <20240701151231.29425-5-kyarlagadda@nvidia.com>
Message-Id: <171985308555.97890.11616650071980012094.robh@kernel.org>
Subject: Re: [RFC PATCH V2 04/12] dt-bindings: misc: tegra-i2c: config
 settings


On Mon, 01 Jul 2024 20:42:22 +0530, Krishna Yarlagadda wrote:
> I2C interface timing registers are configured using config setting
> framework. List available field properties for Tegra I2C controllers.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../misc/nvidia,tegra-config-settings.yaml    | 83 +++++++++++++++++--
>  1 file changed, 74 insertions(+), 9 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dtb: /example-0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.example.dtb: /example-1/syscon@20e00000: failed to match any schema with compatible: ['sprd,sc9863a-glbregs', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/clock/milbeaut-clock.example.dtb: /example-2/serial@1e700010: failed to match any schema with compatible: ['socionext,milbeaut-usio-uart']
Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@38000000: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#
Documentation/devicetree/bindings/sound/st,stm32-sai.example.dtb: /example-0/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.example.dtb: /example-0/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240701151231.29425-5-kyarlagadda@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


