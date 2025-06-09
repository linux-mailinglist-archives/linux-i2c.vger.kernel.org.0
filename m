Return-Path: <linux-i2c+bounces-11317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D30AD2825
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 22:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE201162C04
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF638F40;
	Mon,  9 Jun 2025 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTjsnV8i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B1D219A89;
	Mon,  9 Jun 2025 20:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502414; cv=none; b=LDMCdyLRlL/SEbTssQ6twL0WTnG1mRrl179R5i7CHvvlxbm8GL4EljxQY99xFyBiZ3+PgprtPHGfsCK6TUjP1D20rcHWjvPuRp8K27u/MUMGDs3Cig/eE3bZqQavnEo5vdwj6DpDX+9TWE/BYAHuU9wlINWbQvSRDR9kkHwpHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502414; c=relaxed/simple;
	bh=QkS659QHabzrTbHoAMc+/rCsJSOQknSL4ivRoGSy76k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Y7n9Cod3U4qYUFLLvs3aslwTAm76TVoyeemYwAmIFgyNxvvCLU7323R65NnSIRTY9L+CDJM98256EYmF6Yr+HDxzlkPjrUbWOXO05EvxN/u2NVHMdqJjY6uP9obovjtu2Lwzi5NJr5WV0JFestToLZTPiLqnuJNIVLML6lS018A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTjsnV8i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F78C4CEEB;
	Mon,  9 Jun 2025 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502413;
	bh=QkS659QHabzrTbHoAMc+/rCsJSOQknSL4ivRoGSy76k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qTjsnV8i2exyzbxwyXHUfZb+7GxhrmzUvKYYZTbWzYL8gks1A+oRBaR+wYYGR6SK3
	 9UDtBzOIN26X/OWi6/5FOMVOuXOwKHQnI2GiHRX7ilP/wPhApvkRyddylxqBZP20QC
	 oX7lXIx3BjywGRx4glwOa1ja7MD5777vbia4yfZoGl337/LsXwOVQcGsrOGJhX9ymF
	 Z7Oey4OUO3LP6Gw/x/yfNOlYdesVvueiJOYKZ29Y08UnIphnnyQ+jy14d3H+UbiwsN
	 46xvZJKmvppVrutx5BNFAlD5qXNyY7ofhoxEfJccmJX8K47N4Bje52z9JT0XatF46d
	 CcwSmbqKoevVA==
Date: Mon, 09 Jun 2025 15:53:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
 Sven Peter <sven@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>, 
 Andi Shyti <andi.shyti@kernel.org>, Janne Grunau <j@jannau.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
Message-Id: <174950228622.2915605.1412644681389156564.robh@kernel.org>
Subject: Re: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs


On Mon, 09 Jun 2025 22:56:17 +0800, Nick Chan wrote:
> Hi,
> 
> This series adds the device tree nodes and bindings for I2C on Apple A7-A11
> SoCs, since the existing driver appears to be compatible. The drivers for the
> attached Dialog DA2xxx PMIC will be in a future patch series.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
> Nick Chan (8):
>       arm64: dts: apple: s5l8960x: Add I2C nodes
>       arm64: dts: apple: t7000: Add I2C nodes
>       arm64: dts: apple: t7001: Add I2C nodes
>       arm64: dts: apple: s800-0-3: Add I2C nodes
>       arm64: dts: apple: s8001: Add I2C nodes
>       arm64: dts: apple: t8010: Add I2C nodes
>       arm64: dts: apple: t8011: Add I2C nodes
>       arm64: dts: apple: t8015: Add I2C nodes
> 
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  8 files changed, 589 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250527-i2c-no-t2-2f3589996d14
> 
> Best regards,
> --
> Nick Chan <towinchenmi@gmail.com>
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
 Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/apple/' for 20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com:

arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']






