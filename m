Return-Path: <linux-i2c+bounces-11506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B97ADD028
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 16:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F7FB1621B8
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 14:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D35215793;
	Tue, 17 Jun 2025 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fdWASFvk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09F620ADD6
	for <linux-i2c@vger.kernel.org>; Tue, 17 Jun 2025 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171273; cv=none; b=JkR7teNMURVZyA3e0Mi1VFXWjr6Kf/eyQHqO6lE/mkGSX7k3zKavQkYtZyaqHTbp1ymhEkfH2xG8LCn34MNkVBWDPr5b7wJUMMSvBFn4gHus/TYWhg1dLzsznMWyz0HC33a+dP2WkvrU0iTPBkEapfrIzaIBVRCnui8dQyzYllk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171273; c=relaxed/simple;
	bh=KytBL3RgIELtg2bC3Sk3C2iv6mWErtVHz8v9zBmBiI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=misnrYpEOx30CM+cCkWUHQ9zBpgF+micOGCgWD8TuY+YI9fzlppLG88p7/GBSF1oWkpjofMbvbeslY5tuHq8oVc6Yf4puNJs4PN9nFgmSaSv5la2/9Voe9YP7ueTOgkCe5y9PWRQRJlCi9TWQ+kwhetgussqpw4+2Ni/CwlAxH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fdWASFvk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad572ba1347so925915166b.1
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jun 2025 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750171269; x=1750776069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jS1rvP0TIcJOf4zhH6GncBI8z7cnZ2da/ITssjAxL+Q=;
        b=fdWASFvkGQFnFqedHQ33o2r/ZyCGrFfv1lr5O/PzCIOIHIn7fuUKrRuHOj5fpfAi6e
         KXdZyLmymFcmFynLtDTcnv8vYl6nuIOHES61qRlAgqBs5uPdKbv1WuyHJfMyGfjHfHB/
         nKu0hupTHxh7UrVW8pXpLeXuM2p0nP/5WHwCPkgAFNTU21qTySGEJLbwwHB7Cvseg0On
         toZkysC2RnRCByuL/htfutrSEMZUEjtdD7/rn8sJV2c2cS4UAHvNChdy15dbHDwLlO10
         qwu87kfbzhEIzr+mFLCqDi1Vl+0DNu8SPjT/i2jdFAxEY2mjC0O9t2+Cn1dqzQ1tUGE3
         SNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171269; x=1750776069;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jS1rvP0TIcJOf4zhH6GncBI8z7cnZ2da/ITssjAxL+Q=;
        b=LeacTmacIr5G0rjyZjrKqp+y+76arVArA9e7bpppxg/fQRHNlMWi94/ccEftAu0h6P
         1CQZQnVSrCxjp5qxM9mD1+WOChLkZoWOU4DyfW874gBbMvD32NuJEj/ixa2xZSLlBYdS
         trm7DRDYUMwEGCUfpw/ctCnpDPqr9jvoW8MCWRsUBagmjyxJtzRhBwMURMHeyRTxrJ0r
         viCwvb0QPwDDpGP+5of+QJGVIKp1CuaalYoUzx0kqLGf8bcSfT82g3i8lmSn1NLCMF32
         xFIKJxyJqgWO9TJmt5d8WuIRMyrbk3QTqy7XSf6m0cPsGKpOCE4rVIMy/XOqD7PBIunY
         O2VA==
X-Forwarded-Encrypted: i=1; AJvYcCV3oP/GBMANlsEltiiQbRP0n7Czr6J0qtV7J2lB5HvDuQy2lo6Hzh8QvLtS1iZP5ECWT8sYPzieDIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11rpKkpoQJwrXHHPyO+VUTJOZ4iKgFY76NIM4fowzBd7KgCIy
	Yli42Fc0jKRr6d5wwmGWFdu2hz+4C0JqCLuf9rh6P7AbMOMoMdNZG9Bdw5Yway6ranc=
X-Gm-Gg: ASbGncu/6uE2DdTMA02XLm1datGhx7vZOsBba1iuBHn96Lmk3z3Pew/e4v53SWRaSRv
	xs8k54Lam3TfqB59VbaItznpzns2NHNYEOGka3JIQ54WAZvSLIB4BHpjFrq4a+gXyfxP6jXfhJt
	qc7/iQj+bWbPQUFThGkrutplhQzRSvtgveNhR6ckfpUDvVYHyAoje2pUFDa/ytcaIQ4quiY5slL
	4MuN37h0mFkT85fd2+rWQN/RQ2mhqY7ASBpZlGP+eJvWeEc0+b68Kk9HFwEq5hjfd4+Ycrxp7QG
	dfbyYE9gTkjpl5f42+XAd40ll8d+TfbTZVlyiyDWkIMKJ4hXEu1tkgyVKIQMbUxhVuyLVTfPOc2
	AoE28DQ==
X-Google-Smtp-Source: AGHT+IF+3GyIe+nHDzRNJzAEWhYWk4iX7mofrTQBbnjUzhNdEvD74l/4QWZwUnDwU3CtkbwTc3tvxQ==
X-Received: by 2002:a17:907:3c83:b0:ad2:1b0e:bfe5 with SMTP id a640c23a62f3a-adfad2a1e9bmr1449421266b.7.1750171269056;
        Tue, 17 Jun 2025 07:41:09 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adff0e8574fsm282909866b.42.2025.06.17.07.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:41:08 -0700 (PDT)
Message-ID: <04a6c53c-8383-4496-b502-149bd261cfdb@tuxon.dev>
Date: Tue, 17 Jun 2025 17:41:06 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] PM: domains: Detach on device_unbind_cleanup()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, len.brown@intel.com,
 pavel@kernel.org, ulf.hansson@linaro.org, jic23@kernel.org,
 daniel.lezcano@linaro.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bhelgaas@google.com,
 geert@linux-m68k.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, fabrizio.castro.jz@renesas.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>
References: <20250616135357.3929441-1-claudiu.beznea.uj@bp.renesas.com>
 <20250616135357.3929441-2-claudiu.beznea.uj@bp.renesas.com>
 <CAJZ5v0j_nm_z4ma2AsRkjiZn-AJ2bK982+Mwa8+_PoUAveNATQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAJZ5v0j_nm_z4ma2AsRkjiZn-AJ2bK982+Mwa8+_PoUAveNATQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Rafael,

On 16.06.2025 20:14, Rafael J. Wysocki wrote:
> On Mon, Jun 16, 2025 at 3:54 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The dev_pm_domain_attach() function is typically used in bus code alongside
>> dev_pm_domain_detach(), often following patterns like:
>>
>> static int bus_probe(struct device *_dev)
>> {
>>     struct bus_driver *drv = to_bus_driver(dev->driver);
>>     struct bus_device *dev = to_bus_device(_dev);
>>     int ret;
>>
>>     // ...
>>
>>     ret = dev_pm_domain_attach(_dev, true);
>>     if (ret)
>>         return ret;
>>
>>     if (drv->probe)
>>         ret = drv->probe(dev);
>>
>>     // ...
>> }
>>
>> static void bus_remove(struct device *_dev)
>> {
>>     struct bus_driver *drv = to_bus_driver(dev->driver);
>>     struct bus_device *dev = to_bus_device(_dev);
>>
>>     if (drv->remove)
>>         drv->remove(dev);
>>     dev_pm_domain_detach(_dev);
>> }
>>
>> When the driver's probe function uses devres-managed resources that depend
>> on the power domain state, those resources are released later during
>> device_unbind_cleanup().
>>
>> Releasing devres-managed resources that depend on the power domain state
>> after detaching the device from its PM domain can cause failures.
>>
>> For example, if the driver uses devm_pm_runtime_enable() in its probe
>> function, and the device's clocks are managed by the PM domain, then
>> during removal the runtime PM is disabled in device_unbind_cleanup() after
>> the clocks have been removed from the PM domain. It may happen that the
>> devm_pm_runtime_enable() action causes the device to be runtime-resumed.
>> If the driver specific runtime PM APIs access registers directly, this
>> will lead to accessing device registers without clocks being enabled.
>> Similar issues may occur with other devres actions that access device
>> registers.
>>
>> Add detach_power_off member to struct dev_pm_info, to be used later in
>> device_unbind_cleanup() as the power_off argument for
>> dev_pm_domain_detach(). This is a preparatory step toward removing
>> dev_pm_domain_detach() calls from bus remove functions. Since the current
>> PM domain detach functions (genpd_dev_pm_detach() and acpi_dev_pm_detach())
>> already set dev->pm_domain = NULL, there should be no issues with bus
>> drivers that still call dev_pm_domain_detach() in their remove functions.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - save dev->power.detach_power_off in dev_pm_domain_attach() and use
>>   it in device_unbind_cleanup() when detaching
>> - adjusted patch description
>>
>> Changes in v3:
>> - dropped devm_pm_domain_detach_off(), devm_pm_domain_detach_on()
>>   and use a single function devm_pm_domain_detach()
>>
>> Changes in v2:
>> - none; this patch is new
>>
>>  drivers/base/dd.c           | 2 ++
>>  drivers/base/power/common.c | 3 +++
>>  include/linux/pm.h          | 1 +
>>  3 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
>> index b526e0e0f52d..13ab98e033ea 100644
>> --- a/drivers/base/dd.c
>> +++ b/drivers/base/dd.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/kthread.h>
>>  #include <linux/wait.h>
>>  #include <linux/async.h>
>> +#include <linux/pm_domain.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/pinctrl/devinfo.h>
>>  #include <linux/slab.h>
>> @@ -552,6 +553,7 @@ static void device_unbind_cleanup(struct device *dev)
>>         dev->dma_range_map = NULL;
>>         device_set_driver(dev, NULL);
>>         dev_set_drvdata(dev, NULL);
>> +       dev_pm_domain_detach(dev, dev->power.detach_power_off);
>>         if (dev->pm_domain && dev->pm_domain->dismiss)
>>                 dev->pm_domain->dismiss(dev);
>>         pm_runtime_reinit(dev);
>> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
>> index 781968a128ff..a8f302ed27a5 100644
>> --- a/drivers/base/power/common.c
>> +++ b/drivers/base/power/common.c
>> @@ -111,6 +111,9 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
>>         if (!ret)
>>                 ret = genpd_dev_pm_attach(dev);
>>
>> +       if (dev->pm_domain)
>> +               dev->power.detach_power_off = power_on;
> 
> I'm assuming that you have checked all of the users of
> dev_pm_domain_attach() and verified that the "power off" value is the
> same as the "power on" one for all of them.

In v2 it has been discussed to just mirror the power_on acquisition.

Double checking now, all the current users of dev_pm_domain_attach() follow
this rule, except the i2c bus. i2c powers on the domain conditionally:

https://elixir.bootlin.com/linux/v6.15.2/source/drivers/i2c/i2c-core-base.c#L575

and powers it off unconditionally:
https://elixir.bootlin.com/linux/v6.15.2/source/drivers/i2c/i2c-core-base.c#L638

Should we take this into account ?

Thank you,
Claudiu


> 
>> +
>>         return ret < 0 ? ret : 0;
>>  }
>>  EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
>> diff --git a/include/linux/pm.h b/include/linux/pm.h
>> index f0bd8fbae4f2..dcbe2c1ef59b 100644
>> --- a/include/linux/pm.h
>> +++ b/include/linux/pm.h
>> @@ -720,6 +720,7 @@ struct dev_pm_info {
>>         struct pm_subsys_data   *subsys_data;  /* Owned by the subsystem. */
>>         void (*set_latency_tolerance)(struct device *, s32);
>>         struct dev_pm_qos       *qos;
>> +       bool                    detach_power_off:1;
> 
> Please put the new flag under #ifdef CONFIG_PM after memalloc_noio and
> comment it as "Owned by the driver core".

OK!

Thank you for your review,
Claudiu

> 
> Otherwise LGTM.
> 
>>  };
>>
>>  extern int dev_pm_get_subsys_data(struct device *dev);
>> --
>> 2.43.0
>>


