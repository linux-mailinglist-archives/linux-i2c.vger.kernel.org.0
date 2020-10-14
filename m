Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A55B28DFC3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 13:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgJNLYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 07:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44541 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730675AbgJNLYB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 07:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602674639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3H6mGsRZewK80OZHFyPkl46RKkyXB0PbUSdyfxyv/nQ=;
        b=N9ZSzSgFZUkOMIwA4JPHi6F8va7jVqKDn6NA0ZBIz3JlawwHWPWHaK0YIWLXgdnaD4j5kL
        BgWYchiau97To75r2p4kI5ZEtqa9R1oIFUu/G57zLd0ltDJchA+Yix73bYDeCNzcn0xMn0
        XLrB/fgTB78IzkWwBSNQ4NIWckL5jP0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-eIbXheXBOrG0CxePrbf7uw-1; Wed, 14 Oct 2020 07:23:57 -0400
X-MC-Unique: eIbXheXBOrG0CxePrbf7uw-1
Received: by mail-ed1-f69.google.com with SMTP id e14so1074796edk.2
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 04:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3H6mGsRZewK80OZHFyPkl46RKkyXB0PbUSdyfxyv/nQ=;
        b=FBTSM7m0JzRAYHRDXemOuNQsO3mIm3bNjjPVSQO25mjQIJzGiBkuoGNMurFu1FngJi
         bhxjy239dRjVCfwyoNysqJyymlYEdJQcjy/QUXt9nJTY8e7p9TOCckG+DvUx0ZJe/yYr
         CkzVIppHF7JCcnB/RxPbRo3UPRAxGEaqDPWMbvX4LQ4rpPVAvPBYgGERPEGkkjBlyPNz
         L63LhkcEcRtQmZ7JWSqdWMFokex3x3hWKVr2Sj2yZr3nzjxnFoj9VsURVl1RmxJmjCnw
         td0Ddpezg0gC4xbm3yHqdc7332QiH+YUm9BOhMZCLyUD0IEnDYxqumxqPUtu/YiV7Ye5
         qKfg==
X-Gm-Message-State: AOAM533b7MT+tLavo+LT+My9jHLspAQ+hUNFsywowbH+1cGs6Zqz1lLk
        r9KHDmOkuiQ2mj8m9M016kw9BB3biGXmR8RnOU03nUcKsh5x/dSJ+9DwTnfDpDIi4DDu6fjg9ON
        Ui+OtwvQIB58io64JWyOX
X-Received: by 2002:a17:906:5052:: with SMTP id e18mr4562638ejk.530.1602674635891;
        Wed, 14 Oct 2020 04:23:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKr1m32t14FkDc/W8AweDP9IBnI3ylZgpuTkWQR5km+xGPX1lrPGf71ctcfLHQF7DtS46eAg==
X-Received: by 2002:a17:906:5052:: with SMTP id e18mr4562615ejk.530.1602674635646;
        Wed, 14 Oct 2020 04:23:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id rn10sm1584899ejb.8.2020.10.14.04.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 04:23:55 -0700 (PDT)
Subject: Re: [PATCH AUTOSEL 5.8 17/20] i2c: core: Call
 i2c_acpi_install_space_handler() before i2c_acpi_register_devices()
To:     kieran.bingham@ideasonboard.com, Sasha Levin <sashal@kernel.org>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <20200921144027.2135390-1-sashal@kernel.org>
 <20200921144027.2135390-17-sashal@kernel.org>
 <1977b57b-fae6-d9d4-e6bf-3d4013619537@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bbeb7cae-d856-bb25-4602-8dd3bae62773@redhat.com>
Date:   Wed, 14 Oct 2020 13:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1977b57b-fae6-d9d4-e6bf-3d4013619537@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/14/20 1:09 PM, Kieran Bingham wrote:
> Hi Hans, Sasha,
> 
> As mentioned on https://github.com/linux-surface/kernel/issues/63, I'm
> afraid I've bisected a boot time issue on the Microsoft Surface Go 2 to
> this commit on the stable 5.8 tree.
> 
> The effect as reported there is that the boot process stalls just after
> loading the usbhid module.
> 
> Typing, or interacting with the Keyboard (Type Cover) at that point
> appears to cause usb bus resets, but I don't know if that's a related
> symptom or just an effect of some underlying root cause.
> 
> I have been running a linux-media kernel on this device without issue.
> 
> Is this commit in 5.9? I'll build a vanilla v5.9 kernel and see if it
> occurs there too.

Yes the commit is in 5.9 too. Still would be interesting to see if 5.9 hits
this issue too. I guess it will, but as I mentioned in:

https://github.com/linux-surface/kernel/issues/63

I do not understand why this commit is causing this issue.

So I just checked and the whole acpidump is not using I2C
opregion stuff at all:

[hans@x1 microsoft-surface-go2]$ ack GenericSerialBus *.dsl
[hans@x1 microsoft-surface-go2]$

And there is only 1 _REG handler which is for the
embedded-controller.

So this patch should not make a difference at all on the GO2,
other then maybe a subtle timing difference somewhere ... ?

Regards,

Hans


> On 21/09/2020 15:40, Sasha Levin wrote:
>> From: Hans de Goede <hdegoede@redhat.com>
>>
>> [ Upstream commit 21653a4181ff292480599dad996a2b759ccf050f ]
>>
>> Some ACPI i2c-devices _STA method (which is used to detect if the device
>> is present) use autodetection code which probes which device is present
>> over i2c. This requires the I2C ACPI OpRegion handler to be registered
>> before we enumerate i2c-clients under the i2c-adapter.
>>
>> This fixes the i2c touchpad on the Lenovo ThinkBook 14-IIL and
>> ThinkBook 15 IIL not getting an i2c-client instantiated and thus not
>> working.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1842039
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Signed-off-by: Wolfram Sang <wsa@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>   drivers/i2c/i2c-core-base.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 4f09d4c318287..7031393c74806 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -1336,8 +1336,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>>   
>>   	/* create pre-declared device nodes */
>>   	of_i2c_register_devices(adap);
>> -	i2c_acpi_register_devices(adap);
>>   	i2c_acpi_install_space_handler(adap);
>> +	i2c_acpi_register_devices(adap);
>>   
>>   	if (adap->nr < __i2c_first_dynamic_bus_num)
>>   		i2c_scan_static_board_info(adap);
>>
> 
> 

