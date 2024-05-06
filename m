Return-Path: <linux-i2c+bounces-3438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F18BD667
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A9C1C20E41
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 20:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1845F15E1FF;
	Mon,  6 May 2024 20:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mx6DVh5f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41BD15E1EE;
	Mon,  6 May 2024 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715028036; cv=none; b=AkXvqPjBPTGAktG32YVoVpfvxpVvhuuaDHjln8Lqeh8EbGzIQotMbF5mH+LhAW4M8is+nt76doSCg3e4ru8d/P8R+nsvVAKVT8UttL7E13UHgQyPfN861bMzJWeGFrdbZhLoerq2qhbp03mbZrx+VHFiJyXa7PqcxsyrOfhTk6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715028036; c=relaxed/simple;
	bh=+vK6cEbZRHBbjIHqnVT2sOnHYT4Yyy5hSCTEpe7Wizs=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=S4ERvugXWqe6nQLVhN7Gm+/IC/MZpJs9B7CqS7Hqb5aqYUqaB4xTt5UFC6LkHhRyAL7TgCO92fzlt+bwS28N1Z09vmypaZBY3OAkTRPsnZ+lEkzR3C05j1j5++OoW0AuQdjloYCQHdhZAYz7sLR+Hq0Edzz1yrF2wMJxzco32VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mx6DVh5f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A1DC4AF67;
	Mon,  6 May 2024 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715028036;
	bh=+vK6cEbZRHBbjIHqnVT2sOnHYT4Yyy5hSCTEpe7Wizs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mx6DVh5fDjjEvG9Z9+FSsL4fi9y/Tyeo+AhPoN5Zu5OGveJugoshd6ejrtu1uw60s
	 3XoM7m/1LxjR6VCmSOsxWkqjchxr4JrvzFtwqQtUA+IvmPBaAMzOc1Eu69Mra9C3hU
	 /DVOyvyi3lVXFD4GQqKVIgyFHBFfg51OdTB+OFN1boGx4KzFoQ/8ewL+x2MPmVSH9d
	 XFOV6l7YT/osUekMz3PIQHWsOkjEuL+KGqL7fM4T6Esnk//StHRRjz//lIeKtv1IL9
	 il5TuUdrQini8h/AciCh6k+nTokAXGWDY20wGKRvwlV00xRqrV9EO7uQGrnyin48gy
	 PGHIIXIDWP3YQ==
Date: Mon, 06 May 2024 15:40:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Peter Rosin <peda@axentia.se>, 
 Quentin Schulz <quentin.schulz@cherry.de>, devicetree@vger.kernel.org
In-Reply-To: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
Message-Id: <171502764639.89716.24967031696813886.robh@kernel.org>
Subject: Re: [PATCH v2 0/7] Add Mule I2C multiplexer support


On Mon, 06 May 2024 13:37:51 +0200, Farouk Bouabid wrote:
> Mule is an mcu that emulates a set of i2c devices which are reachable
> through an i2c-mux.
> 
> The emulated devices share a single i2c address with the mux core itself
> where the requested register is what determines which logic is executed
> (muxing logic or device logic):
> 
> 1- The devices on the mux core can be selected (muxing functionality) by
> writing the appropriate device number to an i2c config register (0xff)
> that is not used by any device logic.
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
> The current i2c-mux implementation does not allow the mux core to use the
> i2c address of a child device. As a workaround, A new i2c-adapter quirk is
> introduced to skip the check for conflict between a child device and the
> mux core i2c address when adding the child device.
> 
> This patch-series adds support for this multiplexer. Mule is integrated
> as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
> boards.
> 
> To: Wolfram Sang <wsa+renesas@sang-engineering.com>
> To: Peter Rosin <peda@axentia.se>
> To: Andi Shyti <andi.shyti@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> To: Heiko Stuebner <heiko@sntech.de>
> To: Quentin Schulz <quentin.schulz@cherry.de>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> 
> Changes in v2:
> - Add i2c-adapter quirks to skip checking for conflict between the mux core
>   and a child device address.
> - Rename dt-binding to "tsd,mule-i2c-mux.yaml"
> - Add Mule description to kconfig
> - Fix indentation
> - Move device table after probe
> 
> - Link to v1: https://lore.kernel.org/r/20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com
> 
> ---
> Farouk Bouabid (7):
>       i2c: mux: add the ability to share mux core address with child nodes
>       dt-bindings: i2c: mux: mule: add dt-bindings for mule i2c multiplexer
>       i2c: muxes: add support for mule i2c multiplexer
>       arm64: dts: rockchip: add mule i2c mux (0x18) on rk3399-puma
>       arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-tiger
>       arm64: dts: rockchip: add mule i2c mux (0x18) on px30-ringneck
>       arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-jaguar
> 
>  .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  80 +++++++++++
>  arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  20 ++-
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  20 ++-
>  arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  19 ++-
>  arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  19 ++-
>  drivers/i2c/i2c-core-base.c                        |   6 +-
>  drivers/i2c/i2c-mux.c                              |  25 +++-
>  drivers/i2c/muxes/Kconfig                          |  18 +++
>  drivers/i2c/muxes/Makefile                         |   1 +
>  drivers/i2c/muxes/i2c-mux-mule.c                   | 157 +++++++++++++++++++++
>  include/linux/i2c-mux.h                            |   1 +
>  include/linux/i2c.h                                |   7 +
>  12 files changed, 361 insertions(+), 12 deletions(-)
> ---
> base-commit: 23918f4e52d072b96a4d909e91298b8dd6ad4325
> change-id: 20240404-dev-mule-i2c-mux-9103cde07021
> 
> Best regards,
> --
> Farouk Bouabid <farouk.bouabid@cherry.de>
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-jaguar.dtb' for 20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de:

arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: fan@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#






