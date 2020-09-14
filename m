Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FA0268D1C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 16:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgINOOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 10:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgINOOJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 10:14:09 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED6DC061788;
        Mon, 14 Sep 2020 07:14:07 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id c13so14814oiy.6;
        Mon, 14 Sep 2020 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cjdVkoWwc0/5Igc1ptSAdjkjxT++/T4F/9KSuux4LWI=;
        b=kdwxSn19yJOT55a9+z1IQ+FDD2NFNiJPXfPRhY/MAOJ2EEqM1mryIJnXaDL2JWd/30
         HhnCVjcep5F756Vq2Uj7phPiq1QtEeRsHuAwtUn0vRwCfuEoNeB9sYiKAE46PWiYz801
         FNasaL5C1sBxkddYIU4H1n/0IKhC50nWGysTHxkiaaqxYLHZd0EP6eCOebsfwTLsISV1
         lq42qmR+Dta8ID/+PY/Krqhk7pMdyAP4W4o9VY9R6R4epUxrLhjEhcekDceR1ShWBZvf
         /3O2fRkBx+wR8smBGZ+qaLGaXKj5LJYDLmkdDQnjGheGrwCN1v5VV0s7MWHvQDnF+STr
         MzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cjdVkoWwc0/5Igc1ptSAdjkjxT++/T4F/9KSuux4LWI=;
        b=aGAvqzLX//GezJSVX/PGhcz0uObEaJNrJUF/n5/e1qCrp3MzrA04e6i/k2IqGox5Bx
         70JJqfyt/kcurRBHuECNICTXIccIjwvNneYCBnjF98iQn2A+kdqIT07f6yX1JmzCqmos
         8JuSHFwEk1Z2HO02wwifBZBe72BhRCHvHw7HF2fiu6AdXbw/BGmoQv6ObbvoYZd3fsIj
         +Bi110smgf1g0yOCs9ZQX0wirv/tUZVksttEtRTFydQuevHXa40eMfll4hBfh/0Zs/I8
         18iHsYw8GjQnvfSmitAE7LqDzVROV/jhAvTlVUVLedD44afXZTsrRkg25ipLng021T9C
         OUqA==
X-Gm-Message-State: AOAM532Wbx8qchY8M1WNsEgVzER7r4tRVGU+copgSRlP3kWwg+5yqunJ
        u9JxdNZTy6/X2KD1x/Ti2EcfO9XS798=
X-Google-Smtp-Source: ABdhPJxrB/7TsCg/PODh7gd7puPAwReqZK90Y/XvlqjthIGRRtDRk5QHEnseXdZvCHHXvtd89l8dYw==
X-Received: by 2002:a05:6808:574:: with SMTP id j20mr9203997oig.158.1600092846475;
        Mon, 14 Sep 2020 07:14:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w124sm3696169oib.36.2020.09.14.07.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 07:14:05 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] hwmon: (pmbus/ucd9000) Throttle SMBus transfers
 to avoid poor behaviour
To:     Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.com, wsa@kernel.org, joel@jms.id.au,
        linux-kernel@vger.kernel.org
References: <20200914122811.3295678-1-andrew@aj.id.au>
 <20200914122811.3295678-3-andrew@aj.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <71067b18-c4bc-533a-0069-f21069c5fd0d@roeck-us.net>
Date:   Mon, 14 Sep 2020 07:14:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914122811.3295678-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/14/20 5:28 AM, Andrew Jeffery wrote:
> Short turn-around times between transfers to e.g. the UCD90320 can lead
> to problematic behaviour, including excessive clock stretching, bus
> lockups and potential corruption of the device's volatile state.
> 
> Introduce transfer throttling for the device with a minimum access
> delay of 1ms.
> 

Some Zilker labs devices have the same problem, though not as bad
to need a 1ms delay. See zl6100.c. Various LTS devices have a similar
problem, but there it is possible to poll the device until it is ready.
See ltc2978.c.

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/pmbus/ucd9000.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index 81f4c4f166cd..a0b97d035326 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -9,6 +9,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/moduleparam.h>
>  #include <linux/of_device.h>
>  #include <linux/init.h>
>  #include <linux/err.h>
> @@ -18,6 +19,9 @@
>  #include <linux/gpio/driver.h>
>  #include "pmbus.h"
>  
> +static unsigned long smbus_delay_us = 1000;

Is that to be on the super-safe side ? Patch 0 talks about needing 250 uS.

> +module_param(smbus_delay_us, ulong, 0664);
> +

I would not want to have this in user control, and it should not affect devices
not known to be affected. I would suggest an implementation similar to other
affected devices; again, see zl6100.c or ltc2978.c for examples.

Thanks,
Guenter

>  enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
>  	     ucd90910 };
>  
> @@ -502,6 +506,8 @@ static int ucd9000_probe(struct i2c_client *client,
>  				     I2C_FUNC_SMBUS_BLOCK_DATA))
>  		return -ENODEV;
>  
> +	i2c_smbus_throttle_client(client, smbus_delay_us);
> +
>  	ret = i2c_smbus_read_block_data(client, UCD9000_DEVICE_ID,
>  					block_buffer);
>  	if (ret < 0) {
> 

