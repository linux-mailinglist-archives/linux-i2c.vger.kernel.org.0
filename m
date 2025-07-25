Return-Path: <linux-i2c+bounces-12035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB8B11949
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 09:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F17F1C278D1
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 07:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFB32BD59C;
	Fri, 25 Jul 2025 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XH2AO74M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C54262FED;
	Fri, 25 Jul 2025 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753429240; cv=none; b=qAG2ELza+0g4OfHnfYCTB8hqzFtFaEo7JkKW5SVF4gYqaCWkD1w04koJ510YjOrgbPB6N4PZu/CI5gjctZI4ia7cwEtUVGhBEyh83HLJbRpNmpLxHDJGjWRZlWUyv67Z+psc5I1xBNI6iESaocVaI2r0KE8DFlrZNx/iTI8mYrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753429240; c=relaxed/simple;
	bh=mQb7ii/iz5xvC8IcCbRWR06c9PIGYpUz0dlyEmD+2U4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IrXK8GJJNn8nzDG3gWMQ+oNLspgg9E+86B6W9yCbkM35V7P4t+MRMBBPrE4NHS3HaOO41U/n3Qm8URN1Jnur6VUlzR29PsFfts0nwwrAGVDUb2V2ZEpWbMpN8IQFG2w1lcUuOLLYSMJux2jMHNvmMl7rpQfImRsozYZn0Ecq/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XH2AO74M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1BDC4CEE7;
	Fri, 25 Jul 2025 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753429235;
	bh=mQb7ii/iz5xvC8IcCbRWR06c9PIGYpUz0dlyEmD+2U4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XH2AO74M+7RES9iiESI6Vto2I7IXUo4PR6MniKzpyZPWXPo399sCeL0XtLqdNKVQR
	 0UpE3tn+NM6YrWvu4dF2C94dp/IpHuIer7qL+f5Az6Gw38VG5ILuwt4QSxK0KVp2MW
	 +JnwfXA92D06mfKcu+vdtr9jwnaqGV1EqmAbw6/D43khBpKNdyUORaCOrYrGkFlEyT
	 xiiBOS90s3m3SorOlWZW2StNm26M0SP6M8DHSkxl5XP70mEf5l/p83QsNsVDRsUKJr
	 t/Rvw0OuqdyQkHKLakxF2tSFG7cvkM/U2QPMo07cSwLFd6pot26Ix3xgn463DAITuw
	 cwt7Q2CuDXW/w==
Date: Fri, 25 Jul 2025 02:40:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-tegra@vger.kernel.org, nm@ti.com, andersson@kernel.org, 
 krzk+dt@kernel.org, linux-mmc@vger.kernel.org, kyarlagadda@nvidia.com, 
 thierry.reding@gmail.com, linux-i2c@vger.kernel.org, sjg@chromium.org, 
 andi.shyti@kernel.org, conor+dt@kernel.org, ulf.hansson@linaro.org, 
 devicetree@vger.kernel.org, jonathanh@nvidia.com
To: Rajesh Gumasta <rgumasta@nvidia.com>
In-Reply-To: <20250725052225.23510-3-rgumasta@nvidia.com>
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-3-rgumasta@nvidia.com>
Message-Id: <175342923470.141295.13172940562486185515.robh@kernel.org>
Subject: Re: [PATCH V3 2/3] dt-binding: i2c: nvidia,tegra20-i2c: Add
 register-setting support


On Fri, 25 Jul 2025 10:52:24 +0530, Rajesh Gumasta wrote:
> Add register setting support for the NVIDIA Tegra20 I2C controllers. An
> i2c-controller-common.yaml binding document has been added a top-level
> binding document so that all I2C controllers can use this binding. This
> new binding document defines some generic register setting properties
> for I2C and some standard I2C operating modes that the register settings
> need to be programmed for. This new binding document is used by the
> NVIDIA Tegra20 I2C binding to enable the use of the 'reg-settings'
> binding for this device.
> 
> Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
> ---
>  .../bindings/i2c/i2c-controller-common.yaml   | 73 +++++++++++++++++++
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 64 +++++++++++++++-
>  2 files changed, 134 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-controller-common.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.example.dts:24.22-73.11: Warning (i2c_bus_bridge): /example-0/i2c@7000c000: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.example.dts:24.22-73.11: Warning (i2c_bus_bridge): /example-0/i2c@7000c000: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725052225.23510-3-rgumasta@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


