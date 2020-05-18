Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF8D1D784D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 14:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgERMRO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 08:17:14 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39677 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727040AbgERMRN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 08:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589804231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yh5vO2Gg5dFji06v+emn/jnRvsnOOQXkDj34BrphO1M=;
        b=NLUQzF9znflaAbfeum/9iMjKoFTzcK3LzjhZvbB5J5VqXTdN6kw1PrziUH2ndHsIytT+Qo
        yZwQPr2Pt/sIqxS891ZIeuKnJqP7mx8kEpHrYytP5V2lPWjWw6uL6uZieCkXI+BJdjHvlf
        uxU4XF1ClSi4Un3ve1gJhRsC4Fap084=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-tvejEa4bOrqFHhOr11SndQ-1; Mon, 18 May 2020 08:17:09 -0400
X-MC-Unique: tvejEa4bOrqFHhOr11SndQ-1
Received: by mail-wm1-f69.google.com with SMTP id f62so5742080wme.3
        for <linux-i2c@vger.kernel.org>; Mon, 18 May 2020 05:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yh5vO2Gg5dFji06v+emn/jnRvsnOOQXkDj34BrphO1M=;
        b=gF2vNkgu61cQMN84OS7wqPqphI7IH4mSuH4oWdhFtxEFR0boYTjCUHYnNe6p339dRG
         MEnaL7w2qSKOX6TwO6N7Lxl9hrnQGvOnrxQc3o/JvExQ37tHLRj8Pf+iGIx388Z6RP9P
         SK0Is11d6cYSwFHxabcBtHfakdkIblPfC4qJqVwcT597Y8FlsA/BeqMMjl30yYJ5G4Vx
         gUtVO7rp+8Ajn8AE0KY7IZ3kNXhHXc6zGR4qtfot9+WhOIOc4lFcHaQso1feJv1ABkO9
         Zp2xBPwb3taZJY4vwdQaSRhbyMi+vsFqponzecCgqjDoLRzfsRBvSnCjObeALnvIDRx3
         Mhyw==
X-Gm-Message-State: AOAM530QPsAEeSXwvUB+lZ99EeicjO3rHaeDlsdeX7Yu/HVcEL0EjRTr
        MhDsp4A+UvpURwTf4QrK5b2z9cdSiOO4DrgtNNhe+UrBgMj52HU+7Kw/ihg0pgmM6J78oWU7IWz
        MBO4DRMW+urMwIibGTfGU
X-Received: by 2002:a1c:740e:: with SMTP id p14mr19802622wmc.102.1589804228279;
        Mon, 18 May 2020 05:17:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZrSaW2VgPzMxopUFFxgNCFG8RAtoZX09dfcU6tGBhfVESSetsYttNxtEHg6rCsmAFH0DODg==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr19802593wmc.102.1589804227911;
        Mon, 18 May 2020 05:17:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f127sm16989995wmf.17.2020.05.18.05.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 05:17:07 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] mfd: ensure that AXP20X_I2C will have the right
 deps on X86
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <cover.1589801950.git.mchehab+huawei@kernel.org>
 <cfbb80f220bba5051640d92fc00825bdaa2ec877.1589801950.git.mchehab+huawei@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <aa23c170-f4e8-e1f0-5c7f-35e51ec84533@redhat.com>
Date:   Mon, 18 May 2020 14:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cfbb80f220bba5051640d92fc00825bdaa2ec877.1589801950.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 5/18/20 1:42 PM, Mauro Carvalho Chehab wrote:
> The axp20x I2C driver can be used on X86, but also on ARM
> platforms.
> 
> Yet, for X86, it has to be builtin and need ACPI OpRegion
> support enabled.
> 
> So, the dependency chain is diferent for X86 and for other
> archs.
> 
> Change the dependency chain to take this into consideration,
> ensuring that everything will be set as it should.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hmm, last time we tried something like this (it was tried before,
but in a bit different way) we ran into all kind of dependency /
select cycles / issues.

With that said I'm fine with giving this another try, maybe let
the test builders / rand config builds play with it for a while
and see what happens?

Regards,

Hans




> ---
>   drivers/acpi/Kconfig       |  3 ++-
>   drivers/i2c/busses/Kconfig |  4 ++--
>   drivers/mfd/Kconfig        | 21 ++++++++++++++++-----
>   drivers/mfd/Makefile       |  8 +++++---
>   4 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index ce2730d61a8f..4490200ef134 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -547,7 +547,8 @@ config CHTCRC_PMIC_OPREGION
>   
>   config XPOWER_PMIC_OPREGION
>   	bool "ACPI operation region support for XPower AXP288 PMIC"
> -	depends on MFD_AXP20X_I2C && IOSF_MBI=y
> +	depends on MFD_AXP20X_I2C
> +	select IOSF_MBI
>   	help
>   	  This config adds ACPI operation region support for XPower AXP288 PMIC.
>   
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 2ddca08f8a76..202e743c8e3e 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -563,8 +563,8 @@ config I2C_DESIGNWARE_PCI
>   config I2C_DESIGNWARE_BAYTRAIL
>   	bool "Intel Baytrail I2C semaphore support"
>   	depends on ACPI
> -	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
> -		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
> +	depends on I2C_DESIGNWARE_PLATFORM=y
> +	select IOSF_MBI
>   	help
>   	  This driver enables managed host access to the PMIC I2C bus on select
>   	  Intel BayTrail platforms using the X-Powers AXP288 PMIC. It allows
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 167f117ff015..11bbbed30098 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -187,7 +187,7 @@ config MFD_AXP20X_I2C
>   	tristate "X-Powers AXP series PMICs with I2C"
>   	select MFD_AXP20X
>   	select REGMAP_I2C
> -	depends on I2C
> +	depends on !X86 || (X86 && I2C_DESIGNWARE_PLATFORM=y && I2C_DESIGNWARE_BAYTRAIL=y && ACPI_I2C_OPREGION)
>   	help
>   	  If you say Y here you get support for the X-Powers AXP series power
>   	  management ICs (PMICs) controlled with I2C.
> @@ -195,10 +195,21 @@ config MFD_AXP20X_I2C
>   	  components like regulators or the PEK (Power Enable Key) under the
>   	  corresponding menus.
>   
> -	  Note on x86 this provides an ACPI OpRegion, so this must be 'y'
> -	  (builtin) and not a module, as the OpRegion must be available as
> -	  soon as possible. For the same reason the I2C bus driver options
> -	  I2C_DESIGNWARE_PLATFORM and I2C_DESIGNWARE_BAYTRAIL must be 'y' too.
> +	  Note on x86 this provides an ACPI OpRegion, so enabling it
> +	  requires that I2C_DESIGNWARE_PLATFORM and I2C_DESIGNWARE_BAYTRAIL
> +	  to be set as 'y'. On such architecture, the driver, if enabled,
> +	  will always be (builtin) and not a module, as the OpRegion must be
> +	  available as soon as possible.
> +
> +config MFD_AXP20X_X86
> +	bool
> +	depends on X86
> +	default MFD_AXP20X_I2C
> +
> +config MFD_AXP20X_NOT_X86
> +	tristate
> +	depends on !X86
> +	default MFD_AXP20X_I2C
>   
>   config MFD_AXP20X_RSB
>   	tristate "X-Powers AXP series PMICs with RSB"
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f935d10cbf0f..dd902b5c31ff 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -142,9 +142,11 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
>   obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
>   
>   obj-$(CONFIG_MFD_AC100)		+= ac100.o
> -obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
> -obj-$(CONFIG_MFD_AXP20X_I2C)	+= axp20x-i2c.o
> -obj-$(CONFIG_MFD_AXP20X_RSB)	+= axp20x-rsb.o
> +
> +obj-$(CONFIG_MFD_AXP20X)		+= axp20x.o
> +obj-$(CONFIG_MFD_AXP20X_I2C_X86)	+= axp20x-i2c.o
> +obj-$(CONFIG_MFD_AXP20X_I2C_NOT_X86)	+= axp20x-i2c.o
> +obj-$(CONFIG_MFD_AXP20X_RSB)		+= axp20x-rsb.o
>   
>   obj-$(CONFIG_MFD_LP3943)	+= lp3943.o
>   obj-$(CONFIG_MFD_LP8788)	+= lp8788.o lp8788-irq.o
> 

