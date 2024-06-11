Return-Path: <linux-i2c+bounces-3980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F47903D65
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 15:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06D2DB21B45
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3570D17D35B;
	Tue, 11 Jun 2024 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jElkHqQU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512C1EA71;
	Tue, 11 Jun 2024 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112730; cv=none; b=jyU6ukmG7Sb+SXhCFBTbWnVxXgzNZREFivZCYLJnpIrlNQ12z7WFW6qNqjw2fuJlE5Q1Lb665a3ixYyMxDEIT4DJbAlECeZz1vAuIsaPCEK5+UZZuJ43scm0DS9th9Ha5lMNazrCx9UzbehxRTGM0loGB1Hgg7/Y4IPHFXmLj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112730; c=relaxed/simple;
	bh=4Ecmaz+tOqycgV8YUD4eHo7O50NZPOPSrgUB34T1RJ4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=VL99mLtCCx7PpoicN71uye07BeL4YO9lvyD905/NQM2eXVK4nDgTwQvLmkSMyLsE+uFH1DqsjThV4xjWDppZbYKoIFpQYLSrqtPr3fe+wZ5dR1vNx3UQ4AIKA4v2IpL+naCbmELUFWWNJHn10FsLoqK/7r/n5kBDOQHqbIwBg9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jElkHqQU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFDCC4AF48;
	Tue, 11 Jun 2024 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718112729;
	bh=4Ecmaz+tOqycgV8YUD4eHo7O50NZPOPSrgUB34T1RJ4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=jElkHqQUFHlVRUi7T7S/jhRumOqUf0ZwvAPaaYe06sfGivntg1J3V8Gjtsmz2KSFx
	 0g3pg3U+JkJLSS8SkvqQeMvlTw3mMYgSOmhlJw+t7bgacBYVScxt0H3O+nlgG5NYKl
	 HRZXUrjOAriySKK/GxXWQ0X50z+2j/5Thaa6Owey7qeWS+fLf/JPb0uvcLEe7Wga9M
	 njjVB00G/4nbw8YfPKGZA8h99V+TVP0GQJjzWry1Z26Fp7fStDJNJl1X3AftYSLNEe
	 2UxS+D/hpF8nDNm0+SmsYwSElBOclJ93gEvH0i9ectiZYLXk0R56UqV1529lXvctiX
	 qhyvjSF0tmnGA==
Date: Tue, 11 Jun 2024 07:32:08 -0600
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
Cc: Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
Message-Id: <171811267304.1781724.4665185672258305049.robh@kernel.org>
Subject: Re: [PATCH v3 0/7] Add Mule I2C multiplexer support


On Tue, 11 Jun 2024 13:43:51 +0200, Farouk Bouabid wrote:
> Mule is an mcu that emulates a set of I2C devices which are reachable
> through an I2C-mux.
> 
> The emulated devices share a single I2C address with the mux itself
> where the requested register is what determines which logic is executed
> (muxing logic or device logic):
> 
> 1- The devices on the mux can be selected (muxing functionality) by
> writing the appropriate device number to an I2C config register (0xff)
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
> The current I2C-mux implementation does not allow the mux to use the
> I2C address of a child device. As a workaround, A new I2C-adapter quirk is
> introduced to skip the check for conflict between a child device and the
> mux core I2C address when adding the child device.
> 
> This patch-series adds support for this multiplexer. Mule is integrated
> as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
> boards.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> 
> Changes in v3:
> - Change "i2c" in comments/commit-logs to "I2C"
> - Fix long line-length
> - Warn when "share_addr_with_children" is set and the Mux is not an I2C device
> - Fix/stop propagating "I2C_AQ_SKIP_ADDR_CHECK" flag if "share_addr_with_children"
>   is not set.
> - Fix "old_fw" variable is used to indicate the reversed meaning.
> 
> - Link to v2: https://lore.kernel.org/r/20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de
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
>       i2c: mux: add the ability to share mux address with child nodes
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
>  drivers/i2c/i2c-mux.c                              |  48 ++++++-
>  drivers/i2c/muxes/Kconfig                          |  18 +++
>  drivers/i2c/muxes/Makefile                         |   1 +
>  drivers/i2c/muxes/i2c-mux-mule.c                   | 157 +++++++++++++++++++++
>  include/linux/i2c-mux.h                            |   1 +
>  include/linux/i2c.h                                |   7 +
>  12 files changed, 384 insertions(+), 12 deletions(-)
> ---
> base-commit: 79c1f584335af42ce359ee3ff0f4e9cc324296ed
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-jaguar.dtb' for 20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de:

arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: fan@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#






