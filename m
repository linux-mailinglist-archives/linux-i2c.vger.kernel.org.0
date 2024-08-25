Return-Path: <linux-i2c+bounces-5779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E495E3E7
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Aug 2024 16:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F59DB20FE5
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Aug 2024 14:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C41155399;
	Sun, 25 Aug 2024 14:26:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m12815.netease.com (mail-m12815.netease.com [103.209.128.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750212A1BF;
	Sun, 25 Aug 2024 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.209.128.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724596007; cv=none; b=ubbegKwiLQceOTCLXGEkjp4SmJpm9Uh3YUu7RBYUx906entqT42Fhb6bGsQgxPtE5QtonAud4O7Kix7jkYh0k5J1/gdQVQAHDVXTq4kuUOhFGOPuShYDuR6G8RStCdOszkXdntC4uvCqS3hnskZB8CZwdt4HP7qvOW2JrndvMSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724596007; c=relaxed/simple;
	bh=pZqwQJtt5ZpLN0gMl8xyL9mFpFuL6cREpcoZhJF6fCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FsUMB+9rmOwN+9NQqsBGXhzvXhvUBoterb1pwZwwtCRq/sMmTUh7/yI3qZr6S8TozJ12VVSe4W3ANiO7KwsKM4fT3n+PTDKQwM9ovU/GMexPXrFKSmPODqnoqVLWHYwBowht7rq+htKRJgnz/dwNM4Y7f0evJ4rWkg6aAMOlx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=103.209.128.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [58.61.141.165])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 9084A7E0183;
	Sun, 25 Aug 2024 22:25:12 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: detlev.casanova@collabora.com
Cc: airlied@gmail.com,
	alchark@gmail.com,
	amadeus@jmu.edu.cn,
	andi.shyti@kernel.org,
	andyshrk@163.com,
	broonie@kernel.org,
	cl@rock-chips.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsimic@manjaro.org,
	efectn@protonmail.com,
	finley.xiao@rock-chips.com,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	honyuenkwun@gmail.com,
	jagan@edgeble.ai,
	jamie@jamieiles.com,
	jic23@kernel.org,
	jirislaby@kernel.org,
	jonas@kwiboo.se,
	jszhang@kernel.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	maarten.lankhorst@linux.intel.com,
	macromorgan@hotmail.com,
	megi@xff.cz,
	michael.riesch@wolfvision.net,
	mripard@kernel.org,
	robh@kernel.org,
	tim@feathertop.org,
	tzimmermann@suse.de,
	ulf.hansson@linaro.org,
	wim@linux-watchdog.org
Subject: Re: [PATCH v2 12/12] arm64: dts: rockchip: Add rk3576-armsom-sige5 board
Date: Sun, 25 Aug 2024 22:25:09 +0800
Message-Id: <20240825142509.201943-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4367745.ejJDZkT8p0@trenzalore>
References: <4367745.ejJDZkT8p0@trenzalore>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGE5NVk1LGUwaSkMYSEweGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVSk1OWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NNVUpLS1VLWQ
	Y+
X-HM-Tid: 0a9189ed442703a2kunm9084a7e0183
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M006Nio5SzI0GhkuCj5PLjo1
	QhVPCzNVSlVKTElPTkJOQkpPSUhOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPSlVKTU5ZV1kIAVlBT09MSjcG

Hi,

> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> ...
> +	leds: leds {
> +		compatible = "gpio-leds";

Maybe there should be a blank line.

> +		work_led: work-led {
> +			gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};

Is the color missing?

> ...
> +	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_rtc_s5";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};

Missing blank line.

> +	vcc_1v8_s0: regulator-vcc-1v8-s0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v8_s0";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_1v8_s3>;
> +	};
> ...
> +&gmac0 {
> +	phy-mode = "rgmii-rxid";

Can we use "rgmii-id" and remove tx_delay here?

> ...
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency = <200000000>;
> +	no-sdio;
> +	no-mmc;
> +	non-removable;
> +	sd-uhs-sdr104;
> +        vmmc-supply = <&vcc_3v3_s3>;

Indentation error.

> +	vqmmc-supply = <&vccio_sd_s0>;
> +	status = "okay";
> +};
> ...

Thanks,
Chukun

-- 
2.25.1


