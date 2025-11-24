Return-Path: <linux-i2c+bounces-14241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47668C7FD60
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 11:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 804524E3F93
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 10:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F9026CE15;
	Mon, 24 Nov 2025 10:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDj74o0H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E936823EAAB
	for <linux-i2c@vger.kernel.org>; Mon, 24 Nov 2025 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979534; cv=none; b=MPalM6+yDKcl/t1EDBR/4D9WqzgVBgwDHqil/+SMYuoFUfETgOrQiTlvW/0/ju9o2AAXDi6DYcNNx7kuwQGRXd+jru7deBTRszcgegNvoCnOa9jKLgMHWTYIs3Uxg9rxoUsiRfpBJpmTKWDnCIi6SruxFAASDo1dfxphYMxTWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979534; c=relaxed/simple;
	bh=MyhVfaLuUMB4FJ2DvvqxwnUvFdn4Yuvt+apgQWbex0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9QkBleDFJu06bc8vntjQDm5mkZg/4tvJkFM8zcbuZYcC/pdUPxmIJGaWBVBdRtT4hp9bEaLSyLyo+66Jaa4ce3jE0/geyciqUWlmeOnA1vZb/03wx6yM727RswbvEprmVu7Gpe4DkiNTIySFcKsVqVLS9Ss1agLWhCoZUC8cL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDj74o0H; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso19485211fa.1
        for <linux-i2c@vger.kernel.org>; Mon, 24 Nov 2025 02:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763979531; x=1764584331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvxeS/74nBAEFSf4nVKv65BSIxiE58qrGcTM82uuMOU=;
        b=IDj74o0HFUqwg5oAPuHzWCoDX8wnENMpghb8fYlHbFd+joukOk6S6qGiF6+y0rJCLt
         04dzl0+ln4wbM6wAZEPEW/2QRZdj89l7nEgx9lAiyjbVbufA6pnRfdyoX9xE2Wl5bQkX
         17maf+o/cVrQBIxHYEHwXLEgfPggkDoAF3Sf2WaVXaWOhvXbEx8nKHLF/ID1LRplhSHm
         bYADsINdkphQbYaTQ5lhR4x8WMN/REWpgWL6+axEUAeUS9cammWiEoNuRld04R8Zfw15
         V4URylWP1vv8JiODAn8gndkw1rjg7LjX4vfgBWDgttCckWoOjkTq4C0dgFwo9MPGOtnf
         cwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979531; x=1764584331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvxeS/74nBAEFSf4nVKv65BSIxiE58qrGcTM82uuMOU=;
        b=OrX2Nw27yM9+HNi8PsAJaK8UL0OnAVodEv45tHnplBZ4AVx5LQ8cdJn0lx9A8K5eTX
         RlWgO1W+emlAOIDPhTCLlNoiVw1i1wwKvCnTDNhmQEzTKmEbGv/GFsfijcPn0834hMfb
         NyfWW5W5NBs9eJosE5f1ryax2ivJHmQBgVD+D1yGeKvzWekmiP5J6PawWz/He5emJJ3n
         v6px384EgyyxB2Yi7StpehH+f0n+/JKNXdgAQ0YwQEz2zPHefRQORKxD7a913Do+9q6P
         n+03I43eW4gw2pGsIK25wacUa77gs0XzyxKnkQHNjY5gJY3W2+O6HwIsUvApd9CBrPQ+
         PG7g==
X-Forwarded-Encrypted: i=1; AJvYcCUX4WOwxHeY85M1lSAeb8z42RrOAVfu/Y12Vfy0yNJ1sqhtAhrexHBV6lPp3dCCCcHeUjZk21WRiXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xBU1m1uE9PcUI+1WkLULvoUPw6/v3F2SnMt8P1n7q693ekQ1
	F+L5G5EKDfec9/2FQradl2S9Xm7iAj0zzlycvHeLVcPq56PJDfY4sX049UesTW3L
X-Gm-Gg: ASbGncthbATgR17hQqSb57PfB4L270/dvaZXcuh27G66ShXaTs7a9cSWPoVmAxzPf8W
	TP+J8f97ZLOluPVizGVsQj6F4QAhvhoy075PVm6xzIYD0Yb9LH4CQ5az0g79GDTgbEXePh1cpde
	8nOIDILP/fzM+CnqUGsBC+wJtASzLsXvWjHbaWTeV8159jQpt/hpYbAqUvrwBZ8T1jaaNe7COwx
	EPihsx2W8gvfC46D+ayLaBXVBzosDX1ScWFY/+3FnQg2YEClCcKOc9gnWDdS7rm07P05lZU+q29
	IqWsVemSrDQU49wzM43cZEbmHS5OrghJsVjv93yjUxKqkxoXiLyV0jS6hnOUNgoEWounReZ1cTn
	3nTPP6iI0o7oiW1/goDixWj2iOeraZhavf/YanakWa8drDP1jfkq8NgplO1S98/AWE2bXr+fT+U
	J7EK7wX30WaD/Xig==
X-Google-Smtp-Source: AGHT+IGzb+yApYHtjewkoQzx7FPWIVvgfb9lCElhP6A4EWOQNvayCoMjjLyY5L5QUpilRr8Cj3haxw==
X-Received: by 2002:a05:6512:104a:b0:595:90ee:f476 with SMTP id 2adb3069b0e04-596a3edab46mr4292946e87.28.1763974136131;
        Mon, 24 Nov 2025 00:48:56 -0800 (PST)
Received: from [10.38.18.76] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5c5dsm4019850e87.79.2025.11.24.00.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 00:48:55 -0800 (PST)
Message-ID: <6ee209b3-4d7a-45a8-bd65-6a51730d458d@gmail.com>
Date: Mon, 24 Nov 2025 10:48:54 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] Revert "treewide: Fix probing of devices in DT
 overlays"
To: Saravana Kannan <saravanak@google.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel-team@android.com, Wolfram Sang <wsa@kernel.org>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, Matti Vaittinen <mazziesaccount@gmail.com>
References: <20240411235623.1260061-1-saravanak@google.com>
 <20240411235623.1260061-2-saravanak@google.com>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20240411235623.1260061-2-saravanak@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/24 02:56, Saravana Kannan wrote:
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> 
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.
> 
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>   drivers/bus/imx-weim.c    | 6 ------
>   drivers/i2c/i2c-core-of.c | 5 -----
>   drivers/of/dynamic.c      | 1 -
>   drivers/of/platform.c     | 5 -----
>   drivers/spi/spi.c         | 5 -----
>   5 files changed, 22 deletions(-)
> 
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 837bf9d51c6e..caaf887e0ccc 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -331,12 +331,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>   				 "Failed to setup timing for '%pOF'\n", rd->dn);
>   
>   		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> -			/*
> -			 * Clear the flag before adding the device so that
> -			 * fw_devlink doesn't skip adding consumers to this
> -			 * device.
> -			 */
> -			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>   				dev_err(&pdev->dev,
>   					"Failed to create child device '%pOF'\n",
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index a6c407d36800..a250921bbce0 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -178,11 +178,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>   			return NOTIFY_OK;
>   		}
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		client = of_i2c_register_device(adap, rd->dn);
>   		if (IS_ERR(client)) {
>   			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 4d57a4e34105..19a1a38554f2 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -224,7 +224,6 @@ static void __of_attach_node(struct device_node *np)
>   	np->sibling = np->parent->child;
>   	np->parent->child = np;
>   	of_node_clear_flag(np, OF_DETACHED);
> -	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
>   
>   	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>   
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 389d4ea6bfc1..efd861fa254f 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -743,11 +743,6 @@ static int of_platform_notify(struct notifier_block *nb,
>   		if (of_node_check_flag(rd->dn, OF_POPULATED))
>   			return NOTIFY_OK;
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		/* pdev_parent may be NULL when no bus platform device */
>   		pdev_parent = of_find_device_by_node(rd->dn->parent);
>   		pdev = of_platform_device_create(rd->dn, NULL,
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index ff75838c1b5d..17cd417f7681 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -4761,11 +4761,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
>   			return NOTIFY_OK;
>   		}
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		spi = of_register_spi_device(ctlr, rd->dn);
>   		put_device(&ctlr->dev);
>   
Hello,

Test system testing drivers for ROHM ICs bisected this commit to cause 
BD71847 drivers probe to not be called.

The devicetree blob overlay describing bd71847 enables I2C1 bus on 
BeagleBone Black aswell.

Probe is called when the driver is used with HW connected to I2C2 bus. 
I2C2 bus is enabled before overlaying devicetree blobs.


---- BD71847 Devicetree overlay source ----

/dts-v1/;
/plugin/;

/{ /* this is our device tree overlay root node */

	compatible = "ti,beaglebone", "ti,beaglebone-black";
	part-number = "BBB-I2C1";
  	version = "00A0";

	fragment@0 {
		target = <&am33xx_pinmux>; // this is a link to an already defined 
node in the device tree, so that node is overlayed with our modification

		__overlay__ {
			i2c1_pins: pinmux_i2c1_pins {
				pinctrl-single,pins = <
           			0x158 0x72 /* spi0_d1.i2c1_sda */
           			0x15C 0x72 /* spi0_cs0.i2c1_sdl */
         			>;
			};
		};
	};
....
....

	fragment@2 {
		target = <&i2c1>;

		__overlay__ {
			pinctrl-0 = <&i2c1_pins>;
			clock-frequency = <100000>;
			status = "okay";

			pmic: pmic@4b { /* the "test" defined as child of the i2c1 bus */
				compatible = "rohm,bd71847";
				reg = <0x4b>;
				....
				....
}; /* root node end */

---- END OF BD71847 Devicetree overlay source ----

Reverting this patch from linux-next from last friday fixes the issue.

BR
Kalle Niemi

