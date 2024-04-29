Return-Path: <linux-i2c+bounces-3301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A18B5B96
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 16:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9066EB20DC0
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 14:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FF47F47F;
	Mon, 29 Apr 2024 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XU6p+tGh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2A7EF1C;
	Mon, 29 Apr 2024 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401690; cv=none; b=mm2IMI7aF0YGaIbVC14FPk2HsPmzaEyHPIEFx9QvUZJi1F9brdJC07MAOVsIaS1lOAYykXvysKEL2h7mdtVbfe0b/ZYTBPWNFk+76ZkZ6AeGdfMTMExjVQpcu0zN2K3yLQBE5sMWwtKdFIwxscxo0Hxaftd11h829O34Igxip3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401690; c=relaxed/simple;
	bh=BfGzqjUkUfh2bKjqEy9+ovnsRwzMYpaL/0SsvVv1eD0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=qKyj1ol7Q/fEcKMAuExxrdC5TBvnuYKXZbb2cmSTYCdv9UWF6kQpMZb1/L35YyJ2DyJkhh6qOvszcYaDpIEcoW0zSe4kHGwgwUGNXycgFVDqqXPbtmjvBP0J8q4MzwNQ99tbGD9fWkmOH7hngRFBBpWtGhbd/NUXhIhXZFB1zM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XU6p+tGh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CCCC113CD;
	Mon, 29 Apr 2024 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714401690;
	bh=BfGzqjUkUfh2bKjqEy9+ovnsRwzMYpaL/0SsvVv1eD0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=XU6p+tGhv5RfHy84tJ1zvaJPBiOwMr01YePNRSF5lEf54aBacb+FYPUm19/u54tug
	 hNl/QAQflnCtzjGEwVVNArWfqKzdI2qpqokL2wI8Dzx/oCcaKU/IKn49mz5k2+518G
	 HMfdvfA/l27awPv6pTNbQkbujj6qUQYzl+sDhVn/79a6ncw+RxSEyZqI2kwogV/ndJ
	 UqSgFgdj3SFDsQfF+xRFessMq3mLUy7LhyiskNM+kjOO6KQNemBHvdIOrYkrd2kvYO
	 v7g1jh/GsGPbSUG/Mq1iGLoa/DAi7bK1nHFIfviXIKCIhXE9E6sJoa7+88Wcz/qIbY
	 RcNyhtjr9CyrA==
Date: Mon, 29 Apr 2024 09:41:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter Rosin <peda@axentia.se>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
Message-Id: <171440140976.1676403.7480189987204011691.robh@kernel.org>
Subject: Re: [PATCH 0/7] Add Mule I2C multiplexer support


On Fri, 26 Apr 2024 18:49:31 +0200, Farouk Bouabid wrote:
> Mule is an mcu that emulates a set of i2c devices which are reacheable
> through an i2c-mux.
> 
> The emulated devices share a single i2c address with the mux itself where
> the requested register is what determines which logic is executed (mux or
> device):
> 
> 1- The devices on the mux can be selected (mux function) by writing the
> appropriate device number to an i2c config register (0xff) that is not
> used by any device logic.
> 
> 2- Any access to a register other than the config register will be
> handled by the previously selected device.
> 
>       +-------------------------------------------------------+
>       |  Mule                                                 |
>       |        +---------------+                              |
>     ----+-(1)->|Config register|-----+                        |
>       | |      +---------------+     |                        |
>       | |                            V_                       |
>       | |                            |  \          +--------+ |
>       | |                            |   \-------->| dev #0 | |
>       | |                            |   |         +--------+ |
>       | |                            | M |-------->| dev #1 | |
>       | +-----------(2)------------->| U |         +--------+ |
>       |                              | X |-------->| dev #2 | |
>       |                              |   |         +--------+ |
>       |                              |   /-------->| dev #3 | |
>       |                              |__/          +--------+ |
>       +-------------------------------------------------------+
> 
> The current i2c-mux implementation does not allow the mux to share the i2c
> address of a child device. As a workaround, when creating each i2c child
> adapter we do not assign the parent adapter to avoid the address-match with
> the mux.
> 
> This patch-series adds support for this multiplexer. Mule is integrated
> as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
> boards.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
> ---
> Farouk Bouabid (7):
>       i2c: mux: add the ability to share mux-address with child nodes
>       dt-bindings: i2c: mux: mule: add dt-bindings for mule i2c multiplexer
>       i2c: muxes: add support for mule i2c multiplexer
>       arm64: dts: rockchip: add mule i2c mux (0x18) on rk3399-puma
>       arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-tiger
>       arm64: dts: rockchip: add mule i2c mux (0x18) on px30-ringneck
>       arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-jaguar
> 
>  .../devicetree/bindings/i2c/i2c-mux-mule.yaml      |  80 +++++++++++
>  arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  20 ++-
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  20 ++-
>  arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  19 ++-
>  arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  19 ++-
>  drivers/i2c/i2c-mux.c                              |  10 +-
>  drivers/i2c/muxes/Kconfig                          |  11 ++
>  drivers/i2c/muxes/Makefile                         |   1 +
>  drivers/i2c/muxes/i2c-mux-mule.c                   | 157 +++++++++++++++++++++
>  include/linux/i2c-mux.h                            |   1 +
>  10 files changed, 327 insertions(+), 11 deletions(-)
> ---
> base-commit: c85af715cac0a951eea97393378e84bb49384734
> change-id: 20240404-dev-mule-i2c-mux-9103cde07021
> 
> Best regards,
> --
> Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-jaguar.dtb' for 20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com:

arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: fan@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#






