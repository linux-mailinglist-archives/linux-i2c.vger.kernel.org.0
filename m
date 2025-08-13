Return-Path: <linux-i2c+bounces-12258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86749B24489
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 10:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 530EF1BC0A03
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 08:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97C72F0681;
	Wed, 13 Aug 2025 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pIi2UAXc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E92EFD88;
	Wed, 13 Aug 2025 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074529; cv=none; b=gGJopKJcLdAW+of5JQ2gVXm4ZkjSoIbabKTH7qZYaUpyJJ4WXMYdPhpamNMiaCYAz8tmQsaC3d5r5CNLoKaD+AwxGKjabL1j0aaZ+/y8oBKy2xr8tnxBbJ9zSEQhJ373FKwO00KLKFtnPm63vOvfag/yzn6IGjoD2oL4xcAajC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074529; c=relaxed/simple;
	bh=Md87crP7XvrIg/32S+o/qDrdc4VwxcksNoXwwhiGwsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBug/UQuRqEipffnK6Omepz7d64o/bfacRUhRqohT9ZdpraVfLuKFU3QDj2byK+VeewVxEelUhH7UgcJsJ7Dl3zPk/T8N8AooMmJ9uLcKQ9Rd94IPy/C0M5YvYhOCEzYxc2oXLPVrqAFzR13B11jy+pQkaB3BFtpW8Z++5dfLls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pIi2UAXc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1E0A2346;
	Wed, 13 Aug 2025 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755074472;
	bh=Md87crP7XvrIg/32S+o/qDrdc4VwxcksNoXwwhiGwsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIi2UAXc77OYxdCzuJVZEoMcuMzkf39RZGUsU40DeVBghp7VCoEc7LbqVhsaKcBMz
	 Ms3GxWk4hvXhWkKiaCMZGs5+1OmF9qv5vpbApxxLAZ9MZFdTrnSnYYymrC/8kL+yRb
	 QQ7kK/NO9iB7L3mnvwpmvDA84BEMtlPSs27evlT4=
Date: Wed, 13 Aug 2025 11:41:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Todor Tomov <todor.too@gmail.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v2 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <20250813084146.GA6440@pendragon.ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
 <175506028291.2605875.11473205221167147078.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175506028291.2605875.11473205221167147078.robh@kernel.org>

On Tue, Aug 12, 2025 at 11:44:42PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 13 Aug 2025 00:45:09 +0300, Laurent Pinchart wrote:
> > Usage of the clock-frequency property for camera sensors is discouraged
> > in favour of using assigned-clock-rates (and assigned-clock-parents
> > where needed). Mark the property as deprecated.
> > 
> > Update the examples accordingly. In DT examples where the sensor input
> > clock appears to come from a programmable clock generator, replace
> > clock-frequency by the assigned-clocks and assigned-clock-rates
> > properties. Otherwise, just drop clock-frequency.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Changes since v1:
> > 
> > - Adapt examples in bindings that reference sensors
> > ---
> >  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
> >  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
> >  .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
> >  .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
> >  .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
> >  .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
> >  .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
> >  .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
> >  .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
> >  .../bindings/media/samsung,exynos4212-fimc-is.yaml         | 4 ++--
> >  Documentation/devicetree/bindings/media/samsung,fimc.yaml  | 3 ++-
> >  11 files changed, 38 insertions(+), 17 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a required property
> 	from schema $id: http://devicetree.org/schemas/media/i2c/samsung,s5k6a3.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a dependency of 'clock-names'
> 	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'anyOf' conditional failed, one must be fixed:
> 	'clocks' is a required property
> 	'#clock-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

This is what I get for relying blindly on CI :-/ Sorry about that, I'll
fix it (and try to fix CI too).

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250812214620.30425-2-laurent.pinchart@ideasonboard.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

-- 
Regards,

Laurent Pinchart

