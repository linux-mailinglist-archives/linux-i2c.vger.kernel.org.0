Return-Path: <linux-i2c+bounces-13039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 653AFB8276E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 03:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE6841C24ADA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 01:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1E319E967;
	Thu, 18 Sep 2025 01:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSErDIGe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E719E7F7;
	Thu, 18 Sep 2025 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758157509; cv=none; b=Yh2v3lPccHRBu7lfpZ6/9GD6io4vMkoOWxSahE3fy95m1LYZG7op53W0TrvAN62gBu84Xvv3AF7hxGpSh8daDo6RE0aq4DUrcqcyXDwLn5tfDWIBP5fW/dI2LU5FcUMHCDRw24jHjb7+JlYqPQntdkKra32C/dDPJdcG87G2vbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758157509; c=relaxed/simple;
	bh=JrMhoFMUm4eDs2XlhAAG60oxkhmBAuKi4btin6G7ttw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rGOf6nem8HHJLVAnu9Wl5eBIbiq6wzfqG8uq7AcvhbIY0KUPtHf02Z31+WOZTJhGz03BF+N4ZPBhNsg+6MVO/kG8fNjA9K5vCgrqfyVhKKDwMlcvKq5PYjiFH7iscypxhGGVf4jfKaH6Tr/z5nuCBi+lDwah1lqDf0tB5dRGb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSErDIGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443F9C4CEF9;
	Thu, 18 Sep 2025 01:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758157508;
	bh=JrMhoFMUm4eDs2XlhAAG60oxkhmBAuKi4btin6G7ttw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eSErDIGe+LEGHn5z6DX00lQG9eE8GPgsoEj9wqa/njQdnj/tXZcubE/8vwK8uClpE
	 tEjSI+nNQDXQCLSO0Xch/harNhbA7J/1JunlPusv/e4iouFBj0K2OpgWUK19VuT4bS
	 wogKahP5RU6QFEzd6JVxRVwwOGXWTxOyhmwrgXnJvIuOVMCIPbaKWMUTv7IWDr1rO/
	 ZeLoZpEdlvbfPjjozhEeumupeW+6obs8QHaLjKJCG5k2R6XI/iuxmT5iqaM3HZmdJO
	 tK3FN7MJTvRcHL9sJfiscafjPDWDM0VVfsVNREfk0BQcLXAQeWoNGVCdz08++Z4lxO
	 lfPURdXO3UFKA==
Date: Wed, 17 Sep 2025 20:04:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org, 
 Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
Message-Id: <175815739205.3885634.2470288221363012784.robh@kernel.org>
Subject: Re: [PATCH v3 0/7] arm64: dts: exynos990: Add PERIC0/1 USI, UART
 and HSI2C support


On Wed, 17 Sep 2025 21:04:20 +0000, Denzeel Oliva wrote:
> Hi,
> 
> This series adds device tree support for PERIC0/1 blocks:
> 
> - Add sysreg nodes required for peripheral configuration
> - Add USI, UART and HSI2C controller nodes
> - Update bindings with Exynos990 compatibles
> 
> These changes enable serial communication interfaces
> (I2C, UART) for Exynos990 SoC.
> 
> Changes in v2:
> - Remove unnecessary blank lines in HSI2C nodes.
> 
> Changes in v3:
> - Add sintaxis ";" for parsing error parsing input tree.
> 
> Denzeel Oliva
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
> Denzeel Oliva (7):
>       dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
>       arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
>       dt-bindings: soc: samsung: Add Exynos990 USI compatible
>       arm64: dts: exynos990: Add USI nodes for PERIC0 and PERIC1
>       dt-bindings: serial: samsung: Add Exynos990 UART compatible
>       arm64: dts: exynos990: Add UART nodes for PERIC0/1
>       arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1
> 
>  .../devicetree/bindings/serial/samsung_uart.yaml   |    1 +
>  .../bindings/soc/samsung/exynos-usi.yaml           |    1 +
>  .../soc/samsung/samsung,exynos-sysreg.yaml         |    4 +
>  arch/arm64/boot/dts/exynos/exynos990.dtsi          | 1419 ++++++++++++++++++++
>  4 files changed, 1425 insertions(+)
> ---
> base-commit: 98ee0e036cfedf543c4728a604fd7870d0000efd
> change-id: 20250907-perics-add-usinodes-5ee2594041e3
> 
> Best regards,
> --
> Denzeel Oliva <wachiturroxd150@gmail.com>
> 
> 
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
 Base: using specified base-commit 98ee0e036cfedf543c4728a604fd7870d0000efd

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com:

arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
	'samsung,exynos5-hsi2c' was expected
	'samsung,exynos7-hsi2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']






