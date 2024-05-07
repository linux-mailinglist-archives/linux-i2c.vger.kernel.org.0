Return-Path: <linux-i2c+bounces-3458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3588BE242
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 14:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AF9F289240
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 12:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEFA15B13C;
	Tue,  7 May 2024 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIw1G/oQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5154E156F42;
	Tue,  7 May 2024 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085350; cv=none; b=ug0tRw72oVs/orFH0toepE9RsGdVTZ3RwAy8LMGgRppfLvv+ncRQCTEOOZamqzsRA9UcMQq4XTMTwfC12q2P/9Snasa/w3CRfsvI/T1sQiKgyQdbk5l732jZJ+QR+2TFoSb26fWLfmRRtw2Av3O9HXSwkbrcV1CZxesi8SZDwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085350; c=relaxed/simple;
	bh=LsmGeq70zt60QfE3cj3pndGAIZKzOL2F4FtFs2fO80w=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=RBs4vtd4JqtcOASeF5lcYVcNt28xE/VlEsBlagmq99YLUmJIoSUA0H8VEQh9ENvfuhYlXQhvKE823yKHwksjxfG/N17dsNI1/JaX1ZTFIAZqFW2CE/2tG2+YhCdHCzJ8IlPigV4iZyuD4wnVL+4CgZNQ4bBSZSqdXijcv/FM8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIw1G/oQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91096C2BBFC;
	Tue,  7 May 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715085349;
	bh=LsmGeq70zt60QfE3cj3pndGAIZKzOL2F4FtFs2fO80w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=oIw1G/oQaH6QJ7LUBCSWj2KIl4GGSz9PdHcdmLDbLIVmyIBCOlP/LM0KIjUkBAaXR
	 WNGUP4Zj/i4K14ZyqrwS7jBYybSsb3hHUX+YGW60mzwz/loSKX62oZxxKx5NkW4V3I
	 /wwjC6gz4ucOsRsk1ywLrddJoN2mp6hQ01XRHuLIpjkDqxEBkkBjaq8lj8XJ8kxMRh
	 HADHOf7YKDFDCeNFyL00HFblI96OwWOM1T3423QELHpZKdyEYEDKEWULNtLRTI203C
	 mIi2XMGwN7rNGsw4AOv+eaa6HCL8eHbyXLcsa+DlHQ6//HCugWFP4pMT5OPCU80xD6
	 tb90QlIe0AYcg==
Date: Tue, 07 May 2024 07:35:46 -0500
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
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, jonathanh@nvidia.com, 
 conor+dt@kernel.org, adrian.hunter@intel.com, mkumard@nvidia.com, 
 thierry.reding@gmail.com, linux-mmc@vger.kernel.org, andi.shyti@kernel.org, 
 ulf.hansson@linaro.org, digetx@gmail.com, ldewangan@nvidia.com, 
 wsa+renesas@sang-engineering.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20240506225139.57647-5-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
 <20240506225139.57647-5-kyarlagadda@nvidia.com>
Message-Id: <171508534676.3540.5341170642240109274.robh@kernel.org>
Subject: Re: [RFC PATCH 04/11] i2c: dt-bindings: configuration settings


On Tue, 07 May 2024 04:21:32 +0530, Krishna Yarlagadda wrote:
> I2C interface timing registers are configured using config setting
> framework. Document available properties for Tegra I2C controllers.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.example.dts:37.20-50.15: Warning (i2c_bus_reg): /example-0/i2c@7000c000/config: missing or empty reg property

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240506225139.57647-5-kyarlagadda@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


