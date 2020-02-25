Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 292EE16C3BC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbgBYOVW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:21:22 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43370 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730569AbgBYOVV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 09:21:21 -0500
Received: by mail-pl1-f193.google.com with SMTP id p11so5545262plq.10;
        Tue, 25 Feb 2020 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QvBus++WyjhvYBCp9i75NW/uEyt5Dfmx631jJ94IeXM=;
        b=rBg91KtJEhzKGIJ0zR0yiJnzcswH1v0DnfWXA9yR9b9FenNLKprGBPpMMQPudBbM9t
         YGwDoSCsm8vkl4HUGdhWapbCT9pskfpNH7lnnxhQiq/VqOrAdZKcmDhIg5ds+R5r9ylJ
         T0l7vHtT0m+rHAOOpYVanToDoMA8K5zi5bWSpmHy1DWMIRcbpun6SxkNWFghYCMHpvxd
         s+HQ20n+/xUkxbT0+6np1Ea6skjax9TMx5jeO3oeAAA74Mnb2pMDP963TKZRUyLhdfec
         /lPnCqlwfXUSAeAgJuo93HNJvLpTDWNw0Kem+n1ngtCpa8KTcAYnzAJ12lCll2nt5Ura
         Wx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QvBus++WyjhvYBCp9i75NW/uEyt5Dfmx631jJ94IeXM=;
        b=pY1vY5kcIOAwzXh3lkpCBGEThUI+k+VdzPsZKy36QQqqO4B4mYn2sEMiQ4QgfZZ9yl
         6HKoizYlbd46f2pF7ZsKa0YgmiyKZLeUoVAIeD9Jco4HkgFpKSYx9qKGubmrr8A+8iVd
         4mdobH+HabV88SGi6ddZWMMQ/PzOgBQZPsXCtG78ymCnkzSCokQqwfWyYPz4dCgNZdRn
         1lilof2Gb/y9OiOLOhzKnKZuhwl8fUvFc9vl5aCao88oBAjOpWBw0Arg6gKIsbAm2qlQ
         rbQvSUla1TSZssQNhI/ov//4LeTIwp817OB4gG4+KhyD5otPMlHIbu3tVqeCLRxufmN6
         hHeg==
X-Gm-Message-State: APjAAAWGwdoAgW/fVkZtE7cRzow1GJvKFVfyRP2MJN7Z8aQLmEwidzD3
        zCa1MwH+lwuVPm403rOdOedSYoBT
X-Google-Smtp-Source: APXvYqwk+c9O++P8bbW000HdLInaZ9rMbX3+CxFjHo7AJo3BZQfjXEck+nF9sMxnT+MlMfw1ZoxCsw==
X-Received: by 2002:a17:90a:17c5:: with SMTP id q63mr5297103pja.138.1582640479142;
        Tue, 25 Feb 2020 06:21:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i2sm3270121pjs.21.2020.02.25.06.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2020 06:21:18 -0800 (PST)
Subject: Re: [PATCH 3/3] i2c: i801: Do not add ICH_RES_IO_SMI if PMC device is
 not present
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
 <20200225123802.88984-4-mika.westerberg@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2dec872e-26fb-eefc-5606-cfb1bf55d02e@roeck-us.net>
Date:   Tue, 25 Feb 2020 06:21:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225123802.88984-4-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/25/20 4:38 AM, Mika Westerberg wrote:
> Martin noticed that nct6775 driver does not load properly on his system
> in v5.4+ kernels. The issue was bisected to commit b84398d6d7f9 ("i2c:
> i801: Use iTCO version 6 in Cannon Lake PCH and beyond") but it is
> likely not the culprit because the faulty code has been in the driver
> already since commit 9424693035a5 ("i2c: i801: Create iTCO device on
> newer Intel PCHs"). So more likely some commit that added PCI IDs of
> recent chipsets made the driver to create the iTCO_wdt device on Martins
> system.
> 
> The issue was debugged to be PCI configuration access to the PMC device
> that is not present. This returns all 1's when read and this caused the
> iTCO_wdt driver to accidentally request resourses used by nct6775.
> 
> Fix this by checking that the PMC device is there and only then populate
> the iTCO_wdt ICH_RES_IO_SMI resource. Since the resource is now optional
> the iTCO_wdt driver should continue to work on recent systems without it.
> 
> Link: https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com/
> Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> Reported-by: Martin Volf <martin.volf.42@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-i801.c | 45 +++++++++++++++++++++--------------
>   1 file changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ca4f096fef74..7fa58375bd4b 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1519,7 +1519,7 @@ static DEFINE_SPINLOCK(p2sb_spinlock);
>   
>   static struct platform_device *
>   i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
> -		 struct resource *tco_res)
> +		 struct resource *tco_res, size_t nres)
>   {
>   	struct resource *res;
>   	unsigned int devfn;
> @@ -1563,7 +1563,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>   	res->flags = IORESOURCE_MEM;
>   
>   	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> -					tco_res, 3, &spt_tco_platform_data,
> +					tco_res, nres + 1, &spt_tco_platform_data,

Does this work as intended ? It still adds ICH_RES_MEM_OFF at index 2,
but if there is no SMI resource it will only pass two sets of resources
to the wdt driver, one of which (the SMI resource) would be empty,
ie have start == NULL and size == 0.

Guenter
