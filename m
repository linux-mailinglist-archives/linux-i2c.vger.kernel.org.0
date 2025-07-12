Return-Path: <linux-i2c+bounces-11922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0EB02D30
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 23:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0D13B9DE1
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 21:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD8C21C9F5;
	Sat, 12 Jul 2025 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWaGBzZ3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717511EEE0;
	Sat, 12 Jul 2025 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752355351; cv=none; b=ZPhZZ5ZvSkcpL0d+NQOeO7rqMRQ/OkboS76ovHn5+FQBSMBMm/TvhEbcVsCBoUAuKKeIOYAYlTRD28rpzJNEVPtdWYZzuXm21WDnjea1Ag2tWwu2aEngqiE05EKeqLh+LAICSf+yDpeJBYAKWRaGmjZ4wgjlXTzkXX0A9KX+te8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752355351; c=relaxed/simple;
	bh=IWlxFqjEHHAd1JHz8MbkD0zzwlAMWCP1b6rXJ65fD3o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=m7y199gPKhS8mVqmdK3JA84W2tBcWS1gEP/zfVtgeUBei5Kq/uXd8VpUmB6oOIjTgJBk6dfnOJPA2/xRw6gKyJoD576e+vUp8rlycB0t/ZiMyKkT5lHboQLOlooSFmg+qJf6x0ZOHC+jx1fQqE64ME5SleX6gonQcbRSKcsvbc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWaGBzZ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAECBC4CEEF;
	Sat, 12 Jul 2025 21:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752355350;
	bh=IWlxFqjEHHAd1JHz8MbkD0zzwlAMWCP1b6rXJ65fD3o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rWaGBzZ3hcLXDj6IRLKquX33sgdrCzXj+bV/qBx5UGc69oI/YvprABJ5U5NQaEuwk
	 /NJ5NqbzYn6SovNzR/7PfKfK0q9GOXj39Zf3umQVDfPUkh0Gx4tHcvwxaQK+HmpF/Y
	 1tSmd3GoiwcLiyL31n4H/VKfscv8GdQ0LOVRQKOOKy7Edth5CKI8ngudKpQmLkXvh+
	 RxCyLVjbP7bbWiWYbeGpmgesyIrEs7hNUSUwM2RM6z9Bf47SfvCdeczbXLkIIaFEvW
	 xsVUCy1Z71qtj7eILJp5bnr+oDiP0BbBaovCgRU+gUx7F2MB65n73Gx4pGz0Pon6/r
	 8s7fv8UvtXeTA==
Date: Sat, 12 Jul 2025 16:22:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Markus Stockhausen <markus.stockhausen@gmx.de>, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20250712194255.7022-3-jelonek.jonas@gmail.com>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
 <20250712194255.7022-3-jelonek.jonas@gmail.com>
Message-Id: <175235534986.1684385.2174297303057488223.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend
 for RTL9310 support


On Sat, 12 Jul 2025 19:42:54 +0000, Jonas Jelonek wrote:
> Add dt-bindings for RTL9310 series I2C controller.
> 
> Adjust the regex for child-node address to account for the fact that
> RTL9310 supports 12 instead of only 8 SDA lines.
> 
> Add a vendor-specific property to explicitly specify the
> Realtek-internal ID of the defined I2C controller/master. This is
> required, in particular for RTL9310, to describe the correct I2C
> master.
> 
> Add compatibles for known SoC variants RTL9311, RTL9312 and RTL9313.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 37 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.example.dtb: i2c@100c (realtek,rtl9310-i2c): realtek,mst-id: [0, 0, 0, 1] is not of type 'integer'
	from schema $id: http://devicetree.org/schemas/i2c/realtek,rtl9301-i2c.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.example.dtb: i2c@100c (realtek,rtl9310-i2c): realtek,mst-id: size is 32, expected 8
	from schema $id: http://devicetree.org/schemas/i2c/realtek,rtl9301-i2c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250712194255.7022-3-jelonek.jonas@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


