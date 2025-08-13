Return-Path: <linux-i2c+bounces-12257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6525B23FC4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 06:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF80D189B32F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 04:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFCC286D6F;
	Wed, 13 Aug 2025 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WffvXXt2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF42322E;
	Wed, 13 Aug 2025 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755060284; cv=none; b=amq2smiGiL8e9ffbueFkxpFjRB9XUZ6B/NI8kx2zzNYApH8UNtoTlIit8gr7umyb3BqA8ImnfJ7fjfThBxpeanxd5iQL9B8jld59/YiYToY3Ncu1LzzoigCLJu++ph65hmrATeiMJ/TZgKRFcQBFjjSvaccXfgMNW4zg8xsnorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755060284; c=relaxed/simple;
	bh=mLumtAp+bbBtgP7qUvg6ku56O+DpRiPGVHcqO7y1glo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TRTtpogA3v/b8BinxuDqg4ZSdr+y1OJfvHech2yZ/6UO9T+gDV2wTAxYyrva6bcaS9EvDW0wfkDPt2UsQYgpO2Gv62MgkGBwCQhdRHXyXo1MTVySkQmbzG0B3iSzbgQa2nPHvr1Ipg5bzVD/QSN7Kx/1VpUNB4vtpXIY4TtDPKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WffvXXt2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBC4C4CEEB;
	Wed, 13 Aug 2025 04:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755060283;
	bh=mLumtAp+bbBtgP7qUvg6ku56O+DpRiPGVHcqO7y1glo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WffvXXt28pnoVIhHLjWzUtfZCMtH4qYK5bBaPX4HWz5kB7T3MoapSkhW4wH40s4bG
	 QJ/2350vbeL82pY0E5uF1s4YkpTE02LxibIdv/cecRDVWgnv/Xl9z553rzzD9/BtPP
	 JEzZYZOxeXxVfFug9meWaJSPUOswUcrfseuM0oYrDOhSESMb//mpQMczfRBQQSt1hh
	 ogJv1wv6YOXYHfoBWB7VvG/kLWHRdhZL8ZkmH967yBMxZ2X7scDnAOGp2nVTA3sQT2
	 W0XPT6Wjcl1Ml4trN4AmYBqLWA/5kSy8oBiYjrmsJ4zxrbdNDhVd1j79DLTU6rjQAa
	 0Pze0RK9bFLQQ==
Date: Tue, 12 Aug 2025 23:44:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
Message-Id: <175506028291.2605875.11473205221167147078.robh@kernel.org>
Subject: Re: [PATCH v2 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors


On Wed, 13 Aug 2025 00:45:09 +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property for camera sensors is discouraged
> in favour of using assigned-clock-rates (and assigned-clock-parents
> where needed). Mark the property as deprecated.
> 
> Update the examples accordingly. In DT examples where the sensor input
> clock appears to come from a programmable clock generator, replace
> clock-frequency by the assigned-clocks and assigned-clock-rates
> properties. Otherwise, just drop clock-frequency.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes since v1:
> 
> - Adapt examples in bindings that reference sensors
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
>  .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
>  .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
>  .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
>  .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
>  .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
>  .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
>  .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
>  .../bindings/media/samsung,exynos4212-fimc-is.yaml         | 4 ++--
>  Documentation/devicetree/bindings/media/samsung,fimc.yaml  | 3 ++-
>  11 files changed, 38 insertions(+), 17 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/media/i2c/samsung,s5k6a3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a dependency of 'clock-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250812214620.30425-2-laurent.pinchart@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


