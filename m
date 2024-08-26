Return-Path: <linux-i2c+bounces-5816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2178E95F9CA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 21:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A40551F2285A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 19:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C910199384;
	Mon, 26 Aug 2024 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="ca0roMD4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FD1990AD;
	Mon, 26 Aug 2024 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724701196; cv=pass; b=eA6nnB9zI9PbDpS0A5BVlxXOeM5jHXxfkDR+7VsCCdzI4nzhfgckXQVbEDNmDuGCbb0HK/t5Y74F15HRCil+1uo9i77YvXndTfZyWlgaXsVh0XtVE6/VPyR7Kj2T4l6W3AqdCM2jboGfDOx41pQmWipslQYmY6HrdqbvCoWGZi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724701196; c=relaxed/simple;
	bh=od6fy+3S+nzYLljRoQHr8oqNUdaDpZC207RnMbTjVc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EXxqDCon0UhLF+lFnkSgmrcsxuXvJijYvE36sUfHRRDBhgWTWcZ0D7wImrSjRGLGFW/Zyqst9eRYQIQAijC5//IhzJ3REbLckeD0R/BbWilC7o994mQ8BERUbtiVmYbp6M3OSOa2rV8QOavk9hkxPSD81AU93bUrQiUBL8dNByA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=ca0roMD4; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724701104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y8CvhF/MJMpIU8xUcXwDaR/0I/ZSweEEmXPq80aazFOnaFJYtKwl4bAoircq8YmuV6hXbjY/LG7ggwynibvQhGHfnA3ZxeJcjwFUFCvznyYbFk7aW61rIiOqUerkxcHHMLSrs42ET9t8PNTNaKsv5xPHKyWqwnZ6a6qTKIkYIe0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724701104; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o/g/+7cY7f/H3JMgXb+3Ce2wa+YsyQzpWO4kehk64OE=; 
	b=MUqYc1cFentcZXmMJg9AdlCdo8ojnSpq+vXAcb2Dy54wHiwWIOuJtTW6vVH4gpcV7uwcxMqELFKzkobFHCCb5EQOSXAiE16kMmMVa2SpQ7ZwzZfhgDdL75k4Q6T+BeMWw6EJYM/LEBPkdYRHZYc9FRT7i9Z7tpBAymCig84p9kg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724701104;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=o/g/+7cY7f/H3JMgXb+3Ce2wa+YsyQzpWO4kehk64OE=;
	b=ca0roMD4CCh2C6YxOlrU6DoQDhY/6r1S4aQEcvOV4tFUBCMSGleXec7uvWP4kkRv
	3tCHEJS1EM6ENk3vDrDuiM8rdiwTt9v6/9xC9v7IICGYmXiIINAfTSOzJBk3Dql+Dvd
	Cuvg2in63RexEjBhe2pp9MOB8TUQpI9kWJ45Y4VQ=
Received: by mx.zohomail.com with SMTPS id 1724701102774210.66353128633466;
	Mon, 26 Aug 2024 12:38:22 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: airlied@gmail.com, alchark@gmail.com, amadeus@jmu.edu.cn,
 andi.shyti@kernel.org, andyshrk@163.com, broonie@kernel.org,
 cl@rock-chips.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dsimic@manjaro.org, efectn@protonmail.com, finley.xiao@rock-chips.com,
 gregkh@linuxfoundation.org, heiko@sntech.de, honyuenkwun@gmail.com,
 jagan@edgeble.ai, jamie@jamieiles.com, jic23@kernel.org,
 jirislaby@kernel.org, jonas@kwiboo.se, jszhang@kernel.org,
 kernel@collabora.com, krzk+dt@kernel.org, lars@metafoo.de, lee@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net,
 maarten.lankhorst@linux.intel.com, macromorgan@hotmail.com, megi@xff.cz,
 michael.riesch@wolfvision.net, mripard@kernel.org, robh@kernel.org,
 tim@feathertop.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 wim@linux-watchdog.org
Subject:
 Re: [PATCH v2 12/12] arm64: dts: rockchip: Add rk3576-armsom-sige5 board
Date: Mon, 26 Aug 2024 15:38:18 -0400
Message-ID: <2622447.Lt9SDvczpP@bootstrap>
In-Reply-To: <20240825142509.201943-1-amadeus@jmu.edu.cn>
References:
 <4367745.ejJDZkT8p0@trenzalore> <20240825142509.201943-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Chukun,

On Sunday, 25 August 2024 10:25:09 EDT Chukun Pan wrote:
> Hi,
> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > ...
> > +	leds: leds {
> > +		compatible = "gpio-leds";
> 
> Maybe there should be a blank line.
> 
> > +		work_led: work-led {
> > +			gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
> 
> Is the color missing?

Actually, after rechecking, this is wrong. There are 2 LEDs on &gpio4:
 - PB2: Green
 - PB1: Red

I can set the green one as heartbeat and the red one as default-on.

> > ...
> > +	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc_3v3_rtc_s5";
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		vin-supply = <&vcc_5v0_sys>;
> > +	};
> 
> Missing blank line.
> 
> > +	vcc_1v8_s0: regulator-vcc-1v8-s0 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc_1v8_s0";
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		vin-supply = <&vcc_1v8_s3>;
> > +	};
> > ...
> > +&gmac0 {
> > +	phy-mode = "rgmii-rxid";
> 
> Can we use "rgmii-id" and remove tx_delay here?

Indeed, that's better.

> > ...
> > +&sdmmc {
> > +	bus-width = <4>;
> > +	cap-mmc-highspeed;
> > +	cap-sd-highspeed;
> > +	disable-wp;
> > +	max-frequency = <200000000>;
> > +	no-sdio;
> > +	no-mmc;
> > +	non-removable;
> > +	sd-uhs-sdr104;
> > +        vmmc-supply = <&vcc_3v3_s3>;
> 
> Indentation error.
> 
> > +	vqmmc-supply = <&vccio_sd_s0>;
> > +	status = "okay";
> > +};
> > ...
> 
> Thanks,
> Chukun





