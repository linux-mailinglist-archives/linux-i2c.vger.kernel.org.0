Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E3345506F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Nov 2021 23:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241244AbhKQWbl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Nov 2021 17:31:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32756 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241235AbhKQWbg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Nov 2021 17:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637188117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m5qu5e0Bmyi2YyXsZTCJ7FvtB46vdD6fod/tQPP96Gw=;
        b=RR2VKKS2NxijkPYqJoaRomlbhJGhRaoIS6J7hMXMvNffgvt021N3LA/EgVVpOYspZBuDIt
        ex1GeB/5qsPfkEzVM+C/GYUP+Tyys9rIcEa++QpXtjwY9awj9rp2aciFhe7tqUfllEAi1D
        xexoCjWKeLJ1M8/0WrzRfuoQdFZ/2tI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-1LxR1IfSNH2XEgl97Ay2rw-1; Wed, 17 Nov 2021 17:28:36 -0500
X-MC-Unique: 1LxR1IfSNH2XEgl97Ay2rw-1
Received: by mail-ed1-f72.google.com with SMTP id p4-20020aa7d304000000b003e7ef120a37so3434063edq.16
        for <linux-i2c@vger.kernel.org>; Wed, 17 Nov 2021 14:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m5qu5e0Bmyi2YyXsZTCJ7FvtB46vdD6fod/tQPP96Gw=;
        b=3emwZv2OJSYni+k6oE2CQIU2grALxi1uICCa45p3vPQOr+ZLAdDRBSRWeesE/4cW2u
         jqCpUZUgn7tKemRGZrDCEhILLYzrpJ7Noaok3cHtFLnjpzLCleP9eoryByFQMDTCeZRQ
         nBZMvK3v3GUFpo5cCpyk4IAeBmdZVZpg4qWF3n6ecVgf9Un0tMPF2TlCdagCcViZsiZ9
         HyonWXiXDUxsVVaWvaSKM8fCM+SZzlhAxzeBA7IJsJFRoCyCKGAsWWSPEqzd68pnmkXJ
         yo9crBy5Kr/LQGHAbkBu2jDZbb6SD35Tl5ZjsmFMFw7TkNfUtoNbQm/3iUz/y0cRWLSb
         9T2w==
X-Gm-Message-State: AOAM532Y2hCmNAzuBK/qqcQ6BOXvOUY5ut9Q0xvfw+wPu9o1Ia9pIykz
        aqeSxb40A4FoM1R33zAQzD7X2jqq7WhYZcIh7aqJughNOJ2Svm/uOefDL8e5hiRYqMSTSyyeAQ2
        Fjz6nLx7Mt3+rcfT7ri3t
X-Received: by 2002:a17:907:7b9b:: with SMTP id ne27mr26058728ejc.79.1637188114563;
        Wed, 17 Nov 2021 14:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXCOz8zE8sIXG+OzU8g75Ytk28xPrlKauEFcoiDMkcnmuf5MV+OAPoN5sFp5ENv9D9sTpHgQ==
X-Received: by 2002:a17:907:7b9b:: with SMTP id ne27mr26058685ejc.79.1637188114280;
        Wed, 17 Nov 2021 14:28:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q14sm617090edj.42.2021.11.17.14.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 14:28:33 -0800 (PST)
Message-ID: <380053ee-4a4a-963c-4f70-6b9dcfef1b98@redhat.com>
Date:   Wed, 17 Nov 2021 23:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 16/20] extcon: intel-cht-wc: Use new
 intel_cht_wc_get_model() helper
Content-Language: en-US
To:     Chanwoo Choi <cwchoi00@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org
References: <20211114170335.66994-1-hdegoede@redhat.com>
 <20211114170335.66994-17-hdegoede@redhat.com>
 <5653c424-e12a-e889-1ae5-14a768dcf221@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5653c424-e12a-e889-1ae5-14a768dcf221@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/17/21 07:47, Chanwoo Choi wrote:
> On 21. 11. 15. 오전 2:03, Hans de Goede wrote:
>> The CHT_WC_VBUS_GPIO_CTLO GPIO actually driving an external 5V Vboost
>> converter for Vbus depends on the board on which the Cherry Trail -
>> Whiskey Cove PMIC is actually used.
>>
>> Since the information about the exact PMIC setup is necessary in other
>> places too, the drivers/mfd/intel_soc_pmic_chtwc.c code now has a new
>> intel_cht_wc_get_model() helper.
>>
>> Only poke the CHT_WC_VBUS_GPIO_CTLO GPIO if this new helper returns
>> INTEL_CHT_WC_GPD_WIN_POCKET, which indicates the Type-C (with PD and
>> DP-altmode) setup used on the GPD pocket and GPD win; and on which
>> this GPIO actually controls an external 5V Vboost converter.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/extcon/extcon-intel-cht-wc.c | 35 +++++++++++++++++-----------
>>   1 file changed, 21 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/extcon/extcon-intel-cht-wc.c b/drivers/extcon/extcon-intel-cht-wc.c
>> index 771f6f4cf92e..a5aeeecc44fb 100644
>> --- a/drivers/extcon/extcon-intel-cht-wc.c
>> +++ b/drivers/extcon/extcon-intel-cht-wc.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/module.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>   #include <linux/regmap.h>
>>   #include <linux/slab.h>
>>   @@ -358,20 +359,26 @@ static int cht_wc_extcon_probe(struct platform_device *pdev)
>>       if (IS_ERR(ext->edev))
>>           return PTR_ERR(ext->edev);
>>   -    /*
>> -     * When a host-cable is detected the BIOS enables an external 5v boost
>> -     * converter to power connected devices there are 2 problems with this:
>> -     * 1) This gets seen by the external battery charger as a valid Vbus
>> -     *    supply and it then tries to feed Vsys from this creating a
>> -     *    feedback loop which causes aprox. 300 mA extra battery drain
>> -     *    (and unless we drive the external-charger-disable pin high it
>> -     *    also tries to charge the battery causing even more feedback).
>> -     * 2) This gets seen by the pwrsrc block as a SDP USB Vbus supply
>> -     * Since the external battery charger has its own 5v boost converter
>> -     * which does not have these issues, we simply turn the separate
>> -     * external 5v boost converter off and leave it off entirely.
>> -     */
>> -    cht_wc_extcon_set_5v_boost(ext, false);
>> +    switch (intel_cht_wc_get_model()) {
> 
> intel_cht_wc_get_model() is defined in driver/mfd/intel_soc_pmic_chtwc.c
> 
> Usually, mfd drivers share the data structure such as struct intel_soc_pmic. But, didn't call the exported function for only
> specific driver between linux kernel framework (extcon vs. mfd).
> 
> So that I think that you better to update the mode information
> to 'struct intel_soc_pmic' data structure and then use it
> instead of using the exported function which may make the confusion.

That is a good idea, thanks.

I've implemented this suggestion for the upcoming v3 of the patch-set.

Regards,

Hans


> 
>> +    case INTEL_CHT_WC_GPD_WIN_POCKET:
>> +        /*
>> +         * When a host-cable is detected the BIOS enables an external 5v boost
>> +         * converter to power connected devices there are 2 problems with this:
>> +         * 1) This gets seen by the external battery charger as a valid Vbus
>> +         *    supply and it then tries to feed Vsys from this creating a
>> +         *    feedback loop which causes aprox. 300 mA extra battery drain
>> +         *    (and unless we drive the external-charger-disable pin high it
>> +         *    also tries to charge the battery causing even more feedback).
>> +         * 2) This gets seen by the pwrsrc block as a SDP USB Vbus supply
>> +         * Since the external battery charger has its own 5v boost converter
>> +         * which does not have these issues, we simply turn the separate
>> +         * external 5v boost converter off and leave it off entirely.
>> +         */
>> +        cht_wc_extcon_set_5v_boost(ext, false);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>>         /* Enable sw control */
>>       ret = cht_wc_extcon_sw_control(ext, true);
>>
> 
> 

