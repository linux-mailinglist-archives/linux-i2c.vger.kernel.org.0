Return-Path: <linux-i2c+bounces-7786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B419BD1F6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61411B22E71
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC36C17B506;
	Tue,  5 Nov 2024 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1XOddRg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E4172BD0;
	Tue,  5 Nov 2024 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823244; cv=none; b=me+jJjKZ2WA3lJBIHiz9yQyv6NiCFEi3U7xzowSyoJUHEG/A3WUXvHFyfXIYIB4TTxd2nyEqjbSsrdC6xwwbf3zduEIZ0QAypJcWu9ilZrJdixDIlGU6j6Ebb0IlyNr7Aym39ceeUCEBsljzpIFSafZgh5qZcqOg5ZBCgQyibDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823244; c=relaxed/simple;
	bh=zM8rDeIgAwEMP+1FUdZD8AQYFImhDuF0iIzBR9ZWdYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqDboVsUrEBot2GFB+khjZSmsTLqLKRoKS/jb9ptHm6i7yUugoSn9+XUqwZwPFbli/2KunWbpITGasDv8XQ5JYk3+W4ilZILrizdGP3PopcbEe3C/chWNwAwQm0MB7tMYjZd4g6abH+uql4kJdiHnNznTN/T49+vSsCArIuaPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1XOddRg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53a0c160b94so6331998e87.2;
        Tue, 05 Nov 2024 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823241; x=1731428041; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OsgC3GUt52fG7g3FJ6lyd/7Hq8DIyDZOCFrlqdAN2z8=;
        b=h1XOddRgb5e4W4Nz71m/fpvwhPbdad1Pd7rILqDL52lxNWM4vhDiZNYoiI2ZXBSiD4
         5IwcCQLIfPZF3srxXWPaQXCk/2lQNwIbwRLCL5TRGN1hSKC6KCRRIP3+0V4LAzRt0QCL
         OS2lgalSVgKphx6Bvf1aak/WuRQ4trb6ttnLPxM7/yjxYgUM8Waokdx+34ayOuGVPiiN
         W8y14ZzTXyAO86uCK3m3tXnm8P5qgEJ3GYE/m8v9ZGImfwLqlvM+iefkZfh5VFGtWhus
         FTBFXIHfMl1toIqQiO7MuVgtda7+iiqyEt7DDit40bv1SZzvgCCCn0zwERXqVsW2zZbk
         Hpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823241; x=1731428041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsgC3GUt52fG7g3FJ6lyd/7Hq8DIyDZOCFrlqdAN2z8=;
        b=tTkOjT6+3oLltxeOYaAzYjJxJCXS0Y8ku5/03FwC+YZLF3978267ZkFQrnCEnROyLx
         GWyHjKxqYyW2J2ZRZToo7mQgtbGhkcZDvs8d7d5PzFySRsLRq32VfKyLTUne/pJo+NFt
         RJYyw6/ZVgmFSOMU1RRYtzutHki4wE9BBdyShqCqcKIWeBdF0sjyFi/UpMMfN/1Ypx22
         e9Zz9qO/9FZgYwszoF45VDRGY7sirGJXkcDxv2RVsca3u69LgoxngEvV4j52teKGI8w0
         XBvJzyOmnRXSqjTLEc/gy7dEM4BkDmHUJYdk9cOH41rdIyXYJf0C58dOrlfph2jFGE3A
         3exA==
X-Forwarded-Encrypted: i=1; AJvYcCUDHFxNdpfPKFqpgAN8XLc6dIpkwO+2cI7k+TLL797XupWMx2ToHFrsAZnH/gqml7+9guLhqtQT91zj@vger.kernel.org, AJvYcCVSiu+e36jyuV9a4p9wiRClUVFTBeAbZVd8rAQ7uewID1dNYCpSCt+I6078jp59yefHtccHtHRxT2yYKTFx@vger.kernel.org, AJvYcCWvtpaIO/B86mcAeFk9cLG52H/0L5F8HZO+J3SF8mMIYtACdmaY95tu/NW9u5wJ2tAZiFoMG+g7y98k@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx4PHSB/2f+owTQKbk1UzImNVCgdiwPAkpG5ZDFA2mkxYSQiBt
	AeDUIYyplMPZpmIBAf9qiqPKVk60wMG/0LI2BcCdNn+jrjLLpczk
X-Google-Smtp-Source: AGHT+IF8BLVkWOaws14kIJqjSIzF39hKa71k2p8OWLa7ITtzulUErFMEpSbUuonylZ3cZrDAMvQP+w==
X-Received: by 2002:a05:6512:3a95:b0:53b:1fe4:3fb9 with SMTP id 2adb3069b0e04-53d65e2474fmr7828089e87.49.1730823240757;
        Tue, 05 Nov 2024 08:14:00 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc073sm2168565e87.212.2024.11.05.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:14:00 -0800 (PST)
Date: Tue, 5 Nov 2024 19:13:59 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v10 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZypER5bqLAlH7VxK@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20241030072229.1013235-1-wenst@chromium.org>
 <20241030072229.1013235-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030072229.1013235-6-wenst@chromium.org>

On 24-10-30 15:22, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

> diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
> index df95aa6ad90e..a232f3cbb252 100644
> --- a/include/linux/i2c-of-prober.h
> +++ b/include/linux/i2c-of-prober.h
> @@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   *
>   * The following helpers are provided:
>   * * i2c_of_probe_simple_enable()
> + * * i2c_of_probe_simple_cleanup_early()
>   * * i2c_of_probe_simple_cleanup()
>   */
>  
> @@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve resources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty string ("") if GPIO
> + *	       line is unnamed.
>   * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().
> + * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed to msleep().
> + * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set to logical high,
> + *			   to enable the component.
> + *
> + * This describes power sequences common for the class of components supported by the
> + * simple component prober:
> + * * @gpio_name is configured to the non-active setting according to @gpio_assert_to_enable.
> + * * @supply_name regulator supply is enabled.
> + * * Wait for @post_power_on_delay_ms to pass.
> + * * @gpio_name is configured to the active setting according to @gpio_assert_to_enable.
> + * * Wait for @post_gpio_config_delay_ms to pass.
>   */
>  struct i2c_of_probe_simple_opts {
>  	const char *res_node_compatible;
>  	const char *supply_name;
> +	const char *gpio_name;
>  	unsigned int post_power_on_delay_ms;
> +	unsigned int post_gpio_config_delay_ms;
> +	bool gpio_assert_to_enable;

This header is missing '#include <linux/types.h>' for bool
type. Otherwise compilation may fail with following error:

```
./include/linux/i2c-of-prober.h:117:9: error: unknown type name ‘bool’
  117 |         bool gpio_assert_to_enable;
      |         ^~~~
./include/linux/i2c-of-prober.h:12:1: note: ‘bool’ is defined in header ‘<stdbool.h>’; this is probably fixable by adding ‘#include <stdbool.h>’
   11 | #include <linux/kconfig.h>
  +++ |+#include <stdbool.h>
   12 |
```

>  };
>  
> +struct gpio_desc;
>  struct regulator;
>  
>  struct i2c_of_probe_simple_ctx {
> @@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
>  	const struct i2c_of_probe_simple_opts *opts;
>  	/* private: internal fields for helpers. */
>  	struct regulator *supply;
> +	struct gpio_desc *gpiod;
>  };
>  
>  int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
> +void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
>  void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
>  
>  extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
> -- 
> 2.47.0.163.g1226f6d8fa-goog
> 

-- 
Best regards,
Andrey Skvortsov

