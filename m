Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB37455082
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Nov 2021 23:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241295AbhKQWeI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Nov 2021 17:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46411 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241299AbhKQWeA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Nov 2021 17:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637188260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WTt9sUP3lJ68FegjO9GjX+kEi71roNPt0xleys8iI08=;
        b=MQgvTlLKeh867oPUD0SY4u3zq0MEZR+1Cfgen4Vo7bfal1GGulPddVTu/cbchWcyAv+SrP
        0AbkVkYsoTsPWoAeumRXmnOVExX+SQNf1OtUKkWXjLKWkCwyGiftU7pV1Re6D28kt1JUVw
        kO8wTRFvXgvgGsLYOffhfX9KFgu2mA4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-W7qi3cOuPs6ri2HcZ9tE6w-1; Wed, 17 Nov 2021 17:30:58 -0500
X-MC-Unique: W7qi3cOuPs6ri2HcZ9tE6w-1
Received: by mail-ed1-f72.google.com with SMTP id p4-20020aa7d304000000b003e7ef120a37so3438826edq.16
        for <linux-i2c@vger.kernel.org>; Wed, 17 Nov 2021 14:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WTt9sUP3lJ68FegjO9GjX+kEi71roNPt0xleys8iI08=;
        b=yDU/BBb+4UleuAlXxB5UI6snGbt2WYiqPCgPT7mMrlvqTIw1hw6KLv6VRqhnLvSHl6
         0+Bl4tYTV8fQbbC5GbtyVFFMs6yZ0BIB8hwihXkfg47dVc5TI6M+rY1+049CUXm0t6Ix
         D0JBqlfRPJwhJQ8L/PChjyFRPTQ8wOHB9MuB0CX8gDGHLsEcJQH5h3KW585XRqLAR+1L
         0FOKJTzFhNshjQyX9k7XuBuS5A9cYc0jLMnTc5yaLvFg6fLxV6fHDS9tHH/EN+W4s2Df
         ZMf+NAx2ZDHaMJRjLakm2ARujO1A80wwNtFfAZb7RSn8RxUixjkJQKa+llDT5ti1oxwy
         O0gA==
X-Gm-Message-State: AOAM532cdqZR62M7AsDPrygWkzk8kTfUDHgC45UMr4vzVXkSZF8U7UUW
        0m/4zi94QAHmLpk8DAi7jj3BmDGMf4xo0JBphBScq9RolkP+l+a2hhqIvGWg13LrWDDs/KF5E7N
        B/DUAZJKHNtY5LtaeC/7g
X-Received: by 2002:a05:6402:1a4d:: with SMTP id bf13mr3516585edb.101.1637188257639;
        Wed, 17 Nov 2021 14:30:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3kwytgat9SSbRxbQmqPU+zzuWWa6GBBPKDDWtWcCSnT7hIqf+Y247AjSB9BSn3oMXwtaYbA==
X-Received: by 2002:a05:6402:1a4d:: with SMTP id bf13mr3516553edb.101.1637188257483;
        Wed, 17 Nov 2021 14:30:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b2sm591632edv.73.2021.11.17.14.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 14:30:57 -0800 (PST)
Message-ID: <662623cd-c70b-63e6-499e-7c24b5d3e342@redhat.com>
Date:   Wed, 17 Nov 2021 23:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 18/20] extcon: intel-cht-wc: Refactor
 cht_wc_extcon_get_charger()
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
 <20211114170335.66994-19-hdegoede@redhat.com>
 <f84e2060-f6b7-64f9-78cd-e8ad8776ab2d@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f84e2060-f6b7-64f9-78cd-e8ad8776ab2d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/17/21 08:15, Chanwoo Choi wrote:
> Hello,
> 
> I think that you need to squash it with patch21
> I'm not sure that this patch is either atomic or not because
> you remove the 'return EXTCON_CHG_USB_SDP/EXTCON_CHG_USB_SDP'
> without explaining why it is no problem. Just mention that
> pass the role to next 'switch' cases. But, before this change,
> there were any reason to return the type of charger cable
> before switch statement.

The setting of usbsrc to "CHT_WC_USBSRC_TYPE_SDP << CHT_WC_USBSRC_TYPE_SHIFT"
will make the following switch-case return EXTCON_CHG_USB_SDP
just as before, so there is no functional change.

> According to your patch description, you don't need
> to make the separate patch of it. Please squash it with patch21.

Having this refactoring in a separate patch makes it easier
to see what is going on in patch 21. So I'm going to keep this
as a separate patch for v3 of this series.

Thanks & Regards,

Hans



> On 21. 11. 15. 오전 2:03, Hans de Goede wrote:
>> Refactor cht_wc_extcon_get_charger() to have all the returns are in
>> the "switch (usbsrc)" cases.
>>
>> This is a preparation patch for adding support for registering
>> a power_supply class device.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/extcon/extcon-intel-cht-wc.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/extcon/extcon-intel-cht-wc.c b/drivers/extcon/extcon-intel-cht-wc.c
>> index 119b83793123..f2b93a99a625 100644
>> --- a/drivers/extcon/extcon-intel-cht-wc.c
>> +++ b/drivers/extcon/extcon-intel-cht-wc.c
>> @@ -153,14 +153,15 @@ static int cht_wc_extcon_get_charger(struct cht_wc_extcon_data *ext,
>>       } while (time_before(jiffies, timeout));
>>         if (status != CHT_WC_USBSRC_STS_SUCCESS) {
>> -        if (ignore_errors)
>> -            return EXTCON_CHG_USB_SDP; /* Save fallback */
>> +        if (!ignore_errors) {
>> +            if (status == CHT_WC_USBSRC_STS_FAIL)
>> +                dev_warn(ext->dev, "Could not detect charger type\n");
>> +            else
>> +                dev_warn(ext->dev, "Timeout detecting charger type\n");
>> +        }
>>   -        if (status == CHT_WC_USBSRC_STS_FAIL)
>> -            dev_warn(ext->dev, "Could not detect charger type\n");
>> -        else
>> -            dev_warn(ext->dev, "Timeout detecting charger type\n");
>> -        return EXTCON_CHG_USB_SDP; /* Save fallback */
>> +        /* Save fallback */
>> +        usbsrc = CHT_WC_USBSRC_TYPE_SDP << CHT_WC_USBSRC_TYPE_SHIFT;
>>       }
>>         usbsrc = (usbsrc & CHT_WC_USBSRC_TYPE_MASK) >> CHT_WC_USBSRC_TYPE_SHIFT;
>>
> 
> 

