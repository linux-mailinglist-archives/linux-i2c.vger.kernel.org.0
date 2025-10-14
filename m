Return-Path: <linux-i2c+bounces-13481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA0BD9B6C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 15:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD6B34E2FD2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 13:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C4E3148C1;
	Tue, 14 Oct 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0NaH3Dx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2B2D8DB5;
	Tue, 14 Oct 2025 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448571; cv=none; b=cPvxcUtl1iaxm8fQDsWBiRwR2en8R9l6ACWiELJt4rJb9GwlsnUarmxTJB9k+QgEwy6by9RHz3HbT1N3F7mf7mP5/GedETmT94gUG8BxVRCKuNXfG6Wz6tbe66e+wxu04uXZAnaLf44NR+3R4MZeyyPQdkIvvZeoafVpKGAJRHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448571; c=relaxed/simple;
	bh=Vg5hluxE4jCCEKtMhxwm3cx1UysoRr/cxkURNh3znqg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KyxfwnWBz/Og1aeUTTYx+i0kmKSWnoVxL5IHYXKH2E+XGt1Co6816cihjfJYXxRWK9L4I9Cd89RRCVgAHKFcRq7nteT28m96HUEK0W5LJ2MP36/cur4UVNmsc3X9ZhoDT+SIobkP5DY9QkKySbYQC1NHZY3HxV6TcJfnqV4zK34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0NaH3Dx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564C9C113D0;
	Tue, 14 Oct 2025 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760448570;
	bh=Vg5hluxE4jCCEKtMhxwm3cx1UysoRr/cxkURNh3znqg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=e0NaH3DxFaURk5yTU0k0rsDhqc+CFbdAzfr6JQlfZy5pazZjUrZTA0U3HsAyG7kGP
	 3MuMJNqjGc4WdsfkFv0ez9YNP59tv/BK8ndmF57iJqkFROG2/MBvZMQNouIA+QLC97
	 OZe7VNGDZNPeVqTc//a5ERRgZRzNAld0A5X+2XyWHt8h6IOfINFeYjCKZ2FwdLdvwj
	 +eADY7pJUc+E/0jCe452kZcfPSgHF3Punq66YijBVWCBkWRyZANStZ1ngf6s4q3oF/
	 GacQKjTgdCk96aFVL16nvNOjytCEM588G9bKfDw6a5hbuv9pgJLj/C1IHR1Hu8tsN6
	 cJVJ+Hi25bs2g==
Date: Tue, 14 Oct 2025 08:29:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 alim.akhtar@samsung.com, andi.shyti@kernel.org, krzk+dt@kernel.org, 
 linux-samsung-soc@vger.kernel.org, pritam.sutar@samsung.com, 
 rosa.pila@samsung.com, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dev.tailor@samsung.com
To: Faraz Ata <faraz.ata@samsung.com>
In-Reply-To: <20251014112338.2023223-1-faraz.ata@samsung.com>
References: <CGME20251014111455epcas5p30731028365023e101dad3b9ba1f90bec@epcas5p3.samsung.com>
 <20251014112338.2023223-1-faraz.ata@samsung.com>
Message-Id: <176044840242.3094524.6549941972513295895.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: exynosautov920: Add DT node for all I2C
 ports


On Tue, 14 Oct 2025 16:53:38 +0530, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add i2c nodes for all the instances.
> 
> Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> ---
> Changes in v2:
> - Added link to bindings in change-log as pointed out by Krzysztof[1]
> - Link to bindings : https://lore.kernel.org/linux-samsung-soc/20250904072844.358759-1-faraz.ata@samsung.com/
> - Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250905092452.1782227-1-faraz.ata@samsung.com/
> - Reference: [1] https://lore.kernel.org/linux-samsung-soc/4a03bec1-34e2-444e-acb8-cae72dcbe6c2@kernel.org/
> 
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 845 ++++++++++++++++++
>  1 file changed, 845 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc1-3-g2bb07378bae9 (exact match)
 Base: tags/v6.18-rc1-3-g2bb07378bae9 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20251014112338.2023223-1-faraz.ata@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108800c0 (samsung,exynosautov920-usi): i2c@10880000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10880000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108800c0/i2c@10880000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108900c0 (samsung,exynosautov920-usi): i2c@10890000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10890000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108900c0/i2c@10890000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108a00c0 (samsung,exynosautov920-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108a0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108b00c0 (samsung,exynosautov920-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108b0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108c00c0 (samsung,exynosautov920-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108c0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108d00c0 (samsung,exynosautov920-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108d0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108e00c0 (samsung,exynosautov920-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108e0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@108f00c0 (samsung,exynosautov920-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@108f0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109000c0 (samsung,exynosautov920-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10900000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109100c0 (samsung,exynosautov920-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10910000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109200c0 (samsung,exynosautov920-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10920000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109300c0 (samsung,exynosautov920-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10930000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109400c0 (samsung,exynosautov920-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10940000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109500c0 (samsung,exynosautov920-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10950000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109600c0 (samsung,exynosautov920-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10960000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109700c0 (samsung,exynosautov920-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10970000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109800c0 (samsung,exynosautov920-usi): i2c@10980000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10980000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109800c0/i2c@10980000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@109900c0 (samsung,exynosautov920-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10990000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10c800c0 (samsung,exynosautov920-usi): i2c@10c80000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10c80000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10c800c0/i2c@10c80000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10c900c0 (samsung,exynosautov920-usi): i2c@10c90000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10c90000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10c900c0/i2c@10c90000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10ca00c0 (samsung,exynosautov920-usi): i2c@10ca0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10ca0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10ca00c0/i2c@10ca0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cb00c0 (samsung,exynosautov920-usi): i2c@10cb0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cb0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cb00c0/i2c@10cb0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cc00c0 (samsung,exynosautov920-usi): i2c@10cc0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cc0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cc00c0/i2c@10cc0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cd00c0 (samsung,exynosautov920-usi): i2c@10cd0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cd0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cd00c0/i2c@10cd0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10ce00c0 (samsung,exynosautov920-usi): i2c@10ce0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10ce0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10ce00c0/i2c@10ce0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10cf00c0 (samsung,exynosautov920-usi): i2c@10cf0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10cf0000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10cf00c0/i2c@10cf0000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d000c0 (samsung,exynosautov920-usi): i2c@10d00000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d00000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d000c0/i2c@10d00000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d100c0 (samsung,exynosautov920-usi): i2c@10d10000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d10000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d100c0/i2c@10d10000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d200c0 (samsung,exynosautov920-usi): i2c@10d20000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d20000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d200c0/i2c@10d20000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d300c0 (samsung,exynosautov920-usi): i2c@10d30000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d30000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d300c0/i2c@10d30000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d400c0 (samsung,exynosautov920-usi): i2c@10d40000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d40000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d400c0/i2c@10d40000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d500c0 (samsung,exynosautov920-usi): i2c@10d50000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d50000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d500c0/i2c@10d50000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d600c0 (samsung,exynosautov920-usi): i2c@10d60000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d60000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d600c0/i2c@10d60000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d700c0 (samsung,exynosautov920-usi): i2c@10d70000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d70000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d700c0/i2c@10d70000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d800c0 (samsung,exynosautov920-usi): i2c@10d80000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d80000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d800c0/i2c@10d80000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usi@10d900c0 (samsung,exynosautov920-usi): i2c@10d90000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: i2c@10d90000 (samsung,exynosautov920-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['samsung,exynos8890-hsi2c']
	'samsung,exynosautov920-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c', 'samsung,exynos990-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	'samsung,exynos8895-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/usi@10d900c0/i2c@10d90000: failed to match any schema with compatible: ['samsung,exynosautov920-hsi2c', 'samsung,exynosautov9-hsi2c']






