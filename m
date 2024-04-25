Return-Path: <linux-i2c+bounces-3181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFE8B2DAB
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 01:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C7128537C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D452C15887D;
	Thu, 25 Apr 2024 23:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8NJRlYV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D1156647;
	Thu, 25 Apr 2024 23:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714088399; cv=none; b=gX5tTu9Ah7rw1qcmmqH0RwQ5MCcCUkRNhy8uQgJZv0voMCyoEme9J8ayjjotxYnI3mcZ8k5UzldBUZP/f1bS5lbM/UsMmT1quNVMKrcSTWz5ZFBCnCjYHUzCq8PCpVbTX7m5y52HqOTiMEGdzK81sURxN9aOg0LvC8NY0+htE7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714088399; c=relaxed/simple;
	bh=/oN2iGCiL+NicvCJAspV+Q8NPoc1Br/lYrDCPGBMVNM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=MuXe4UCXdApURbcNhgzlxNL14VzY5cf324o6kkD+gI3P0euEd8HwqhEODdQ7MlRCu+W3c1ldqsDyuBFPS0ugs6wv7/ooaylfizChptMNBhehARg1aTd5LDnrx0dw+UneT77VRYkWk8LJNNnmyh0Lv8qxaVKrjQ2z0OcfXlrUcf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8NJRlYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7D7C113CC;
	Thu, 25 Apr 2024 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714088399;
	bh=/oN2iGCiL+NicvCJAspV+Q8NPoc1Br/lYrDCPGBMVNM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q8NJRlYVdYooFr1LJ/zQYNSD6DtJ+hQ5FyOs+/6W/ul3ud90x5zt6Ex1RbYGoZKV3
	 qukqvWj3AjRmAlVs0x6RbdfjulyPHFvJCcKppdTVfIL7ZnRUB8FhhOkpv8c+lwDg1q
	 IywI4SQ8AxQr3gtPN9Cc2b8e0grCqC11wf7zb7LXbHxOJ4Zrb5w40lRnNpWLR4kXjR
	 uZLkWrEKMZN9puXb0XDvWNXd/PCsRadQS9OT70dxVerVy/1IT70IZqn6v/Y2Cf5CAq
	 KSLOCn3d3botO3EfDUBR48FzAupB01ttVy8VqmXrc7DVrac4MHI/LyqwTlHvSXsqXx
	 vOz9P3QoGeSeA==
Date: Thu, 25 Apr 2024 18:39:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
 krzk+dt@kernel.org, linux-fsi@lists.ozlabs.org, lakshmiy@us.ibm.com, 
 linux-aspeed@lists.ozlabs.org
In-Reply-To: <20240425213701.655540-2-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-2-eajames@linux.ibm.com>
Message-Id: <171408839602.3902645.11975304379095234562.robh@kernel.org>
Subject: Re: [PATCH v3 01/14] dt-bindings: spi: Document the IBM Power SPI
 controller


On Thu, 25 Apr 2024 16:36:48 -0500, Eddie James wrote:
> The IBM Power chips have a basic SPI controller. Document it.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/spi/ibm,p10-spi.yaml  | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/ibm,p10-spi.example.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240425213701.655540-2-eajames@linux.ibm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


