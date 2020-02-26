Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E09170014
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 14:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgBZNcq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 08:32:46 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33159 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgBZNcp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 08:32:45 -0500
Received: by mail-pf1-f194.google.com with SMTP id n7so1488492pfn.0;
        Wed, 26 Feb 2020 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q0cvKvc9VIsT5KqQD5jJEe/etF1MUJtiez3YIEAtkto=;
        b=EbFlCPjtSTCXDactd+zbcbLZI2sCLbK+tTcZA7W8EICz4NiyHCPUnxly8ZT8Fp70w4
         S/FxJnm49eSmb8o3ZJzDI3Fcu5Oc2WFjqED6lwdYnvd+wD04mV2uhymxusemFWk2RzaH
         mX99ZsHmJJ/gapRzppGFsoJ0slP+WozRCCpWA7Nr6zb+2CGp2+ylua0pdpWdGgOyVugl
         LamXGLnlXUE2+P8pTZ8XDKttAg8Urm4sxqSicbRChcAyHCM9s+NIyhihwNzUjDmC6t8a
         arV6ygI+y0bdh9/8HTdvPLyK2zWF81YbOKus5Kgy2U8ZCwy7aYhhDTo0OAX1VwdrP3w3
         Y0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=q0cvKvc9VIsT5KqQD5jJEe/etF1MUJtiez3YIEAtkto=;
        b=KgWvkfjpEp5FB8K6n4Q8h82fSexhfNcZe7PI7eoRjQ1bSa7yYRJP615HIJDDEW/V+T
         dlT7zQRudTxmZ8redA2MQLLWrNOGJkYT1R8FUvtYNG52m/vnO2EdeMypUfYxYmDdD2eJ
         b70wDxshc9izsOCJP+aLfmR/uxWZQ6z7zrha9ZBuoyy94qJokSfxOA+p/XVcPCLiEDO3
         /qDi7ZVL+Y47CVKSSYHuTRiOcSTpCRkiOI0w8Aj2UC5vASy7DGpBRIf5WWo9lru5V28f
         x89iirGEQkdz7LiBUYeAjd02AOW/GJyn+fOPeK+MbKPWwbN4prXXDMOEcVM6GmdS/CPr
         Vu7w==
X-Gm-Message-State: APjAAAXAoitYf0LJk9/fo6+ey/cskWmF//F9HefMvuaombgOwsR3VXR0
        8dFdnqTsa15V64NrTIf1KK9Slf55
X-Google-Smtp-Source: APXvYqxtmiqERaozZbLvMQDitIpuR84h75S5C9UGEJv0sQ8DPrxaBt8L5MTKj6Zs5ptAggMOsR7n9w==
X-Received: by 2002:aa7:848c:: with SMTP id u12mr4254011pfn.12.1582723963073;
        Wed, 26 Feb 2020 05:32:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a10sm2997491pgm.81.2020.02.26.05.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 05:32:42 -0800 (PST)
Subject: Re: [PATCH v2 1/3] watchdog: iTCO_wdt: Export vendorsupport
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
 <20200226132122.62805-2-mika.westerberg@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5e56f8b1-c411-69bd-6e02-c0dde3db69dd@roeck-us.net>
Date:   Wed, 26 Feb 2020 05:32:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226132122.62805-2-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/26/20 5:21 AM, Mika Westerberg wrote:
> In preparation for making ->smi_res optional the iTCO_wdt driver needs
> to know whether vendorsupport is being set to non-zero. For this reason
> export the variable.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I assume you'll send the series upstream in one go (through i2c ?).
If not, please let me and Wim know.

Thanks,
Guenter

> ---
>  drivers/watchdog/iTCO_vendor.h         |  2 ++
>  drivers/watchdog/iTCO_vendor_support.c | 16 +++++++++-------
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_vendor.h b/drivers/watchdog/iTCO_vendor.h
> index 0f7373ba10d5..69e92e692ae0 100644
> --- a/drivers/watchdog/iTCO_vendor.h
> +++ b/drivers/watchdog/iTCO_vendor.h
> @@ -1,10 +1,12 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /* iTCO Vendor Specific Support hooks */
>  #ifdef CONFIG_ITCO_VENDOR_SUPPORT
> +extern int iTCO_vendorsupport;
>  extern void iTCO_vendor_pre_start(struct resource *, unsigned int);
>  extern void iTCO_vendor_pre_stop(struct resource *);
>  extern int iTCO_vendor_check_noreboot_on(void);
>  #else
> +#define iTCO_vendorsupport				0
>  #define iTCO_vendor_pre_start(acpibase, heartbeat)	{}
>  #define iTCO_vendor_pre_stop(acpibase)			{}
>  #define iTCO_vendor_check_noreboot_on()			1
> diff --git a/drivers/watchdog/iTCO_vendor_support.c b/drivers/watchdog/iTCO_vendor_support.c
> index 4f1b96f59349..cf0eaa04b064 100644
> --- a/drivers/watchdog/iTCO_vendor_support.c
> +++ b/drivers/watchdog/iTCO_vendor_support.c
> @@ -39,8 +39,10 @@
>  /* Broken BIOS */
>  #define BROKEN_BIOS		911
>  
> -static int vendorsupport;
> -module_param(vendorsupport, int, 0);
> +int iTCO_vendorsupport;
> +EXPORT_SYMBOL(iTCO_vendorsupport);
> +
> +module_param_named(vendorsupport, iTCO_vendorsupport, int, 0);
>  MODULE_PARM_DESC(vendorsupport, "iTCO vendor specific support mode, default="
>  			"0 (none), 1=SuperMicro Pent3, 911=Broken SMI BIOS");
>  
> @@ -152,7 +154,7 @@ static void broken_bios_stop(struct resource *smires)
>  void iTCO_vendor_pre_start(struct resource *smires,
>  			   unsigned int heartbeat)
>  {
> -	switch (vendorsupport) {
> +	switch (iTCO_vendorsupport) {
>  	case SUPERMICRO_OLD_BOARD:
>  		supermicro_old_pre_start(smires);
>  		break;
> @@ -165,7 +167,7 @@ EXPORT_SYMBOL(iTCO_vendor_pre_start);
>  
>  void iTCO_vendor_pre_stop(struct resource *smires)
>  {
> -	switch (vendorsupport) {
> +	switch (iTCO_vendorsupport) {
>  	case SUPERMICRO_OLD_BOARD:
>  		supermicro_old_pre_stop(smires);
>  		break;
> @@ -178,7 +180,7 @@ EXPORT_SYMBOL(iTCO_vendor_pre_stop);
>  
>  int iTCO_vendor_check_noreboot_on(void)
>  {
> -	switch (vendorsupport) {
> +	switch (iTCO_vendorsupport) {
>  	case SUPERMICRO_OLD_BOARD:
>  		return 0;
>  	default:
> @@ -189,13 +191,13 @@ EXPORT_SYMBOL(iTCO_vendor_check_noreboot_on);
>  
>  static int __init iTCO_vendor_init_module(void)
>  {
> -	if (vendorsupport == SUPERMICRO_NEW_BOARD) {
> +	if (iTCO_vendorsupport == SUPERMICRO_NEW_BOARD) {
>  		pr_warn("Option vendorsupport=%d is no longer supported, "
>  			"please use the w83627hf_wdt driver instead\n",
>  			SUPERMICRO_NEW_BOARD);
>  		return -EINVAL;
>  	}
> -	pr_info("vendor-support=%d\n", vendorsupport);
> +	pr_info("vendor-support=%d\n", iTCO_vendorsupport);
>  	return 0;
>  }
>  
> 

