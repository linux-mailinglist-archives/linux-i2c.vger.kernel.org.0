Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8334A602B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 16:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240381AbiBAPbO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 10:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239751AbiBAPbO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 10:31:14 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBEBC061714;
        Tue,  1 Feb 2022 07:31:13 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id m9so33918734oia.12;
        Tue, 01 Feb 2022 07:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UPBnfs9IIErMG9UWZegVg4Nd9cpkesaMUdLMx6iOWuY=;
        b=lr2bhrkeFJA1c5oGu5C1DnADC/V4XKTdW2A76wWKma9+WhHxU+DplKi3EoZ6xRVz9x
         k2k+eJbiDh0OOeJ26V/t6OEK091u5D/zvnfmXAygsN7WYLKhX5y9hcZWRmjUvW3IFwt/
         CpFj4+ViqE9esBbCsTN9us39ea8QXNE+6v3OTqFSxv2u6Fni4q+XFFej4qhhrmPz9bbm
         CRXlmyBjWss06ncduG+YKH1FzD9G0XT9vTQwj6cazSlqSPJ6nIg3WyhBbA5Lpr9MxFkn
         b00nf7VWvBeTViHrmbZQx27EzmtAYbM8QDZ/Zzeyub14titelz514gaxmHXZgU8n0GbP
         Xt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UPBnfs9IIErMG9UWZegVg4Nd9cpkesaMUdLMx6iOWuY=;
        b=PM4EnaKeep/L/ES8J0qVh2fyOdSJNefqN1HPft6pSsR3GhgdA7TeDdw2KaOJNqtOjQ
         ODExP3jEHz6nQuhAonRz+DNJMkrwv5KzftvUb88otmF+p6vy1aGg7MSYiC82MOFZKbyv
         Rd9rUaCEsgbDWMsjStN9aCV8GWw8TIiL4Nyo/U/vp7dZisLhfhnhQZ0+9WtYgx6Ugot7
         HM45BAVcoPBBUDmMPk5dj1mMLXn01oEKHYn02HnF4J0yFueEFZLhxe/2czhgngU7bVWw
         5Q6TePXweXTRIkUfYVjRgV1FWIss02Aynh0XZQj3sJGJufnrtgXAtupgqjLi1KgTmv86
         pMRg==
X-Gm-Message-State: AOAM532Xqt+LMI4GdjIL+xVYOCb4WUinPceadxmSJYWxQfMwT7vLfI43
        8uB1G6PYq7ZY/9By1XG3kh4=
X-Google-Smtp-Source: ABdhPJxTtLpjeYuwtw07w8gbX1/LAam68hLOmN1V3T4jgYTbe+qYXJWrMhIrzcXZ2ruaHPeVPwxQSg==
X-Received: by 2002:a05:6808:23ca:: with SMTP id bq10mr1486267oib.281.1643729473327;
        Tue, 01 Feb 2022 07:31:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y3sm17616850oix.41.2022.02.01.07.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 07:31:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ecf12beb-a03b-2aec-1dc4-8183a8b6daa6@roeck-us.net>
Date:   Tue, 1 Feb 2022 07:31:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Content-Language: en-US
To:     Terry Bowman <terry.bowman@amd.com>,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com
Cc:     linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130191225.303115-1-terry.bowman@amd.com>
 <20220130191225.303115-3-terry.bowman@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220130191225.303115-3-terry.bowman@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/30/22 11:12, Terry Bowman wrote:
> Combine MMIO base address and alternate base address detection. Combine
> based on layout type. This will simplify the function by eliminating
> a switch case.
> 
> Move existing request/release code into functions. This currently only
> supports port I/O request/release. The move into a separate function
> will make it ready for adding MMIO region support.
> 
> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> ---
>   drivers/watchdog/sp5100_tco.c | 155 ++++++++++++++++++----------------
>   drivers/watchdog/sp5100_tco.h |   1 +
>   2 files changed, 82 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index b365bbc9ac36..16e122d5045e 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -223,6 +223,55 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
>   	return val;
>   }
>   
> +static u32 sp5100_tco_request_region(struct device *dev,
> +				     u32 mmio_addr,
> +				     const char *dev_name)
> +{
> +	if (!devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
> +				     dev_name)) {
> +		dev_dbg(dev, "MMIO address 0x%08x already in use\n", mmio_addr);
> +		return 0;
> +	}
> +
> +	return mmio_addr;
> +}
> +
> +static u32 sp5100_tco_prepare_base(struct sp5100_tco *tco,
> +				   u32 mmio_addr,
> +				   u32 alt_mmio_addr,
> +				   const char *dev_name)
> +{
> +	struct device *dev = tco->wdd.parent;
> +
> +	dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n", mmio_addr);
> +
> +	if (!mmio_addr && !alt_mmio_addr)
> +		return -ENODEV;
> +
> +	/* Check for MMIO address and alternate MMIO address conflicts */
> +	if (mmio_addr)
> +		mmio_addr = sp5100_tco_request_region(dev, mmio_addr, dev_name);
> +
> +	if (!mmio_addr && alt_mmio_addr)
> +		mmio_addr = sp5100_tco_request_region(dev, alt_mmio_addr, dev_name);
> +
> +	if (!mmio_addr) {
> +		dev_err(dev, "Failed to reserve MMIO or alternate MMIO region\n");
> +		return -EBUSY;
> +	}
> +
> +	tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
> +	if (!tco->tcobase) {
> +		dev_err(dev, "MMIO address 0x%08x failed mapping\n", mmio_addr);
> +		devm_release_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
> +		return -ENOMEM;
> +	}
> +
> +	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
> +

I know this is the same as the old code, but I think it would make sense to change
this as suggested by 0-day and use %px instead.

Thanks,
Guenter
