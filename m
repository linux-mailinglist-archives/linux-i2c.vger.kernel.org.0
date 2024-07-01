Return-Path: <linux-i2c+bounces-4559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F391E612
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 18:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF49C1F24C30
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A2416EB71;
	Mon,  1 Jul 2024 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o40lU3+q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337216EB5B;
	Mon,  1 Jul 2024 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853090; cv=none; b=ghktExruRs94YHokEAvFJYm6U6+DWcgS7PiaPVfPI+wNH+5N+piR/SgzkudnMTeVc+b0qwrCwBV27+8fYz1g01IOjXUhJyiC9fRsVvfNITtN/rtc6ujtA8t9KLbnNiZWBX3TXWVddbQCSHT2KhcFLVAkyjC9qMR2TM8gJYyzQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853090; c=relaxed/simple;
	bh=TgmAawkvwnXSaXC3mxIRK84/4eKNm+uRnN4qvy+cKlI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=bJMyBIIaeo6Uo+jJISqsk5YDq+cILFozjVin5sNVIFlvqlWsjs36xFjwyh5vaDeTmvxp/jyvpN55TF63dzZnZd6z0r3fQw3RAhVboNZ8IVy5cmdJMfMln+pXgvrYX/qytErXuzipj3saONA5ovgN6MLQM2K02CPIrbPUkiLe02o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o40lU3+q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C74C4AF17;
	Mon,  1 Jul 2024 16:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719853090;
	bh=TgmAawkvwnXSaXC3mxIRK84/4eKNm+uRnN4qvy+cKlI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=o40lU3+quYwLTPcZr5Op6ZbcFXx5yUk+bUVd6zcwa4O3TrQ0I+DJQ1dID4dr+f2HM
	 E0AywnRbTLZqkV86bmlbKZDSlVAyVNIrnkwuI1UYKfHbO6CKkheWvEgNbTdARkhM93
	 PMZxaeHvXoqt1eOEBcksQwMIBHuoVGbRCwyJuHYDt0FwCJhY+Ag3JJoppTAmg/KqPE
	 xScpOljMwBJIbDAMlJiFtWNluw3/Qjt31p1ZwokgNQaysa0bZGlA5aplVMz9WOhioR
	 BVUlhWMTJZjmLvj5kMRPOe0F4hPCsI/WWVJhaB79d0hHGnyiHcWLy0lbw2v+YsbaUT
	 6KQpjByW83Cmg==
Date: Mon, 01 Jul 2024 10:58:09 -0600
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
Cc: ldewangan@nvidia.com, digetx@gmail.com, adrian.hunter@intel.com, 
 mkumard@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
 conor+dt@kernel.org, andi.shyti@kernel.org, ulf.hansson@linaro.org, 
 wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, 
 linux-tegra@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20240701151231.29425-6-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
 <20240701151231.29425-6-kyarlagadda@nvidia.com>
Message-Id: <171985308638.97930.5431807770986392243.robh@kernel.org>
Subject: Re: [RFC PATCH V2 05/12] dt-bindings: i2c: tegra-i2c: reference to
 config


On Mon, 01 Jul 2024 20:42:23 +0530, Krishna Yarlagadda wrote:
> I2C interface timing registers are configured using config setting
> framework. Add reference to I2C config settings.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml: config-settings: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240701151231.29425-6-kyarlagadda@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


