Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F03C213A35
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 14:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGCMp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 08:45:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58593 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726022AbgGCMp7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jul 2020 08:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593780357;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5/yv8JdwOXfx/EmSiiGE/aUUOirGrGg2k/qCRYQBzF8=;
        b=QvNBA9RmDkIAV62RW/kzXOmEeM5CUAsWNmIL4qvHYyill0ZdWBf5FbPxxlQwCGbv2ayF/3
        YntUZin0xsTVecjiC8L36lzjrYuuqsjZMFvycYjE2itV5mkXrV6MAVTi0jSjEvzEr0RWdK
        1W59clvrl0aM2oTyADSqAo2GkEOhHRw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-cNrQYVyIOpG_hDAhft5iaA-1; Fri, 03 Jul 2020 08:45:54 -0400
X-MC-Unique: cNrQYVyIOpG_hDAhft5iaA-1
Received: by mail-wr1-f72.google.com with SMTP id i14so31271746wru.17
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jul 2020 05:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5/yv8JdwOXfx/EmSiiGE/aUUOirGrGg2k/qCRYQBzF8=;
        b=TOyrzHMEY8qJ6KiNAU3N7J9rRqgs2KBt5BJdegpreSD5nKT1qNnCPtPIQCiVv9G0Hz
         Aklovm8QX4GKMdf5XaPNyfZx2F6wqW9pdV6jJcaESaTp9BIsl9PmzaXpzgw5VLz7okcM
         tTXKeJiWQx7uHwszm0GaYtnReex9x+B3Hs+mjmuSI9xHy6ZOndQKIvvuJMD8iFifSs7C
         /4tfn/7flAxtHTT5XlDc2q4hh7FRfKLOIyAmhMstOo1e5G+O8kfc22AuGvUaOHJ0YGTo
         1fFcHtJ/AKU4Kzx4jybgsPzZVXu9f49jvhM58E/ibBnRoQ2oCDmzGREh8VpoO39xFsT+
         4iqQ==
X-Gm-Message-State: AOAM533ZKPsCx4kuFtTLsQ3fpYuA/m6I+X3rnf7mkOCaZrxx8q1yISvU
        CO8GnaYoYut/51g8ZQs2Fa5VRRxyWCBt50GpApD1UdLoU5hYJS+osxvZMktXknHYjLpgk9ah1Lg
        vss+XeWWszRGfKasF5Wng
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr37797237wml.142.1593780353420;
        Fri, 03 Jul 2020 05:45:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUAeWyQoevVuHUUjE7rBTyy7y98LCx6lHWDz5QKXVohIEzg5CHOhqDFiVF1zhhD/GyVY6vsQ==
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr37797212wml.142.1593780353163;
        Fri, 03 Jul 2020 05:45:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k14sm13802779wrn.76.2020.07.03.05.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 05:45:52 -0700 (PDT)
Subject: Re: [PATCH] i2c: revert "i2c: core: Allow drivers to disable i2c-core
 irq mapping"
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
References: <20200630162440.8453-1-wsa+renesas@sang-engineering.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <02adeb3f-761a-32e8-6596-81ccb7cafa6e@redhat.com>
Date:   Fri, 3 Jul 2020 14:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630162440.8453-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 6/30/20 6:24 PM, Wolfram Sang wrote:
> This manually reverts commit d1d84bb95364ed604015c2b788caaf3dbca0262f.
> The only user has gone two years ago with commit 589edb56b424 ("ACPI /
> scan: Create platform device for INT33FE ACPI nodes") and no new user
> has showed up. Remove and hope we will never need it again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. Looking for Hans' opinion here.

I'm fine with removing this.

Semi off-topic:

Recently I did have another special case, see:

https://fedoraproject.org/wiki/Changes/RemoveDeviceMapperMultipathFromWorkstationLiveCD

During one of the iterations trying to deal with this
it would have been useful if the code instantiating
the client (rather then the driver for it) could have disabled
the i2c-core code for searching for an irq, without actually
specifying one. This would allow passing through the ACPI fwnode
as fwnode in the board_info, without triggering the ACPI IRQ
lookup code in the core.

So basically allow board_info to say:

"There is no IRQ and do not try to find one"

This could be as simple as having the instantiating code do:

	board_info.irq = -ENOENT;

Combined with the a tiny i2c-core change,
to deal with drivers checking for:

	if (i2c_client->irq)

Rather then for:

	if (i2c_client->irq > 0)

This tiny i2c-core change would look like this:

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 26f03a14a478..a7b05ef31f5f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -343,11 +343,10 @@ static int i2c_device_probe(struct device *dev)
  			goto put_sync_adapter;
  		}

-		if (irq < 0)
-			irq = 0;
-
  		client->irq = irq;
  	}
+	if (client->irq < 0)
+		client->irq = 0;

  	/*
  	 * An I2C ID table is not mandatory, if and only if, a suitable OF

ATM I do not have a use-case for this, still I think this would be
useful to have. Would you be willing to take a patch with the above
change for this?

Regards,

Hans




> 
>   drivers/i2c/i2c-core-base.c | 6 +++---
>   include/linux/i2c.h         | 3 ---
>   2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 26f03a14a478..dc43242a85ba 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -319,11 +319,9 @@ static int i2c_device_probe(struct device *dev)
>   	if (!client)
>   		return 0;
>   
> -	driver = to_i2c_driver(dev->driver);
> -
>   	client->irq = client->init_irq;
>   
> -	if (!client->irq && !driver->disable_i2c_core_irq_mapping) {
> +	if (!client->irq) {
>   		int irq = -ENOENT;
>   
>   		if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
> @@ -349,6 +347,8 @@ static int i2c_device_probe(struct device *dev)
>   		client->irq = irq;
>   	}
>   
> +	driver = to_i2c_driver(dev->driver);
> +
>   	/*
>   	 * An I2C ID table is not mandatory, if and only if, a suitable OF
>   	 * or ACPI ID table is supplied for the probing device.
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index b8b8963f8bb9..098405df431f 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -231,7 +231,6 @@ enum i2c_alert_protocol {
>    * @detect: Callback for device detection
>    * @address_list: The I2C addresses to probe (for detect)
>    * @clients: List of detected clients we created (for i2c-core use only)
> - * @disable_i2c_core_irq_mapping: Tell the i2c-core to not do irq-mapping
>    *
>    * The driver.owner field should be set to the module owner of this driver.
>    * The driver.name field should be set to the name of this driver.
> @@ -290,8 +289,6 @@ struct i2c_driver {
>   	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
>   	const unsigned short *address_list;
>   	struct list_head clients;
> -
> -	bool disable_i2c_core_irq_mapping;
>   };
>   #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
>   
> 

