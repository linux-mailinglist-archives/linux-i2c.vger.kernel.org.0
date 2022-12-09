Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E18648856
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 19:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiLISRj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 13:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiLISRY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 13:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9680FA505B
        for <linux-i2c@vger.kernel.org>; Fri,  9 Dec 2022 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670609785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=570D9M8P8VwH+5u6QVwudCE9N1qA2/b8uaboQLq/EEU=;
        b=JkTgu47BFeWBNQhJ/1yRwmo8Cg0Kxc6zyugLtgZkvnelVy8135Ti4Jd80PYy4ivNWihH2g
        c4o6B5OcIb5kffcUWt757PbOTBozFdgTDxt6JqxlIYoeFZAPU1+/Zh4PMJ68/1MnWEMXcS
        Eg6o2X3EMIcLwbs/WKpBAYtQi8V/ZQ8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-rrkc5T9gNKmm_UsRIQndzw-1; Fri, 09 Dec 2022 13:16:24 -0500
X-MC-Unique: rrkc5T9gNKmm_UsRIQndzw-1
Received: by mail-ed1-f70.google.com with SMTP id z16-20020a05640235d000b0046d0912ae25so1846952edc.5
        for <linux-i2c@vger.kernel.org>; Fri, 09 Dec 2022 10:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=570D9M8P8VwH+5u6QVwudCE9N1qA2/b8uaboQLq/EEU=;
        b=O2anJWeMpkhz8IcrIFNMyhB6wWfnByB+KXuePhGZMBgD3d3uECBaONXKU8OaaaPTuj
         98Dis3UztxDLk2ZhMKEnWdhkE/8poZFmqkwmo3wae+BwMvDvMB83f4vdkteVN3h+yEVd
         cUY0zi00WIs5ClweZ8uBryG9CA/4i9AQcPPNh7jp8yFIId//9CzaZ3CJ/9MK/7+clPXJ
         jbJPK7vxcVhLM9zybhEwdcyb+f7gN4Q0ZSOklVz3p1EJdTZHUjVU8vyZPUqGEPjsj+Ey
         XQ3t+fr0ALmK0KiRH0k5Swnynw++pZf5sl3L1RJmS4Cl7VKOm/e8696HvwC1okup4ehq
         0jhw==
X-Gm-Message-State: ANoB5pmaTUveuKjIYeZcwnVVrf74sfAetRAnuNSUlQlSNkB+GOy5VLPC
        q0fkibGiN4FXwwnONoO12gJAj+B4sO0F/CqS69Efjf9jo5SNYf17U5Wl29+QVRAy4XJsoF+vBp4
        4GbH43oPvSoIPXsnt0CKz
X-Received: by 2002:a17:906:7158:b0:7c0:fa2c:fd5d with SMTP id z24-20020a170906715800b007c0fa2cfd5dmr6024815ejj.59.1670609783216;
        Fri, 09 Dec 2022 10:16:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4EMCM7etF+2vLtimJF3+DatjzHbFJKuAQdxEaB2JdPkpzen+BxVXLTDVTlvnmJWCil/XIKXg==
X-Received: by 2002:a17:906:7158:b0:7c0:fa2c:fd5d with SMTP id z24-20020a170906715800b007c0fa2cfd5dmr6024801ejj.59.1670609783020;
        Fri, 09 Dec 2022 10:16:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090623ea00b007c081cf2d25sm175268ejg.204.2022.12.09.10.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 10:16:22 -0800 (PST)
Message-ID: <6338cce6-c13d-bda3-6f0b-06767122076c@redhat.com>
Date:   Fri, 9 Dec 2022 19:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] i2c: designware: Fix unbalanced suspended flag
To:     Richard Fitzgerald <rf@opensource.cirrus.com>, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221209114034.18025-1-rf@opensource.cirrus.com>
 <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
 <e8b6733c-33b8-cb28-a62b-21dad9bd6466@opensource.cirrus.com>
 <c210c1d6-7327-d377-22e7-b5a123de5cbb@opensource.cirrus.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c210c1d6-7327-d377-22e7-b5a123de5cbb@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 12/9/22 15:22, Richard Fitzgerald wrote:
> On 9/12/22 13:36, Richard Fitzgerald wrote:
>> On 9/12/22 12:15, Hans de Goede wrote:
>>> Hi Richard,
>>>
>>> On 12/9/22 12:40, Richard Fitzgerald wrote:
>>>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>>>> i2c_mark_adapter_resumed().
>>
>> <snip>
>>
>>>
>>> It is not entirely clear to me where the unbalance you claim to see comes
>>> from? When runtime-suspended SMART_SUSPEND should keep it suspended at which point
>>> the system suspend callback will never run ?
>>>
>>> Are you sure that you are not maybe seeing a suspend/resume ordering issue?
>>>
>>> Did you add printk messages to the suspend/resume callbacks of
>>> i2c-designware-platdrv.c which show the system suspend callback
>>> being called but not the system resume one ?
>>>
>>
>> With messages in strategic places.
>>
>> [  169.607358] i2c_designware i2c_designware.2: PM: dev_pm_skip_suspend: SMART_SUSPEND=0 pm_runtime_status_suspended=1
>> [  169.607361] i2c_designware i2c_designware.2: PM: __device_suspend_late: dev_pm_skip_suspend:false
>> [  169.607364] i2c_designware i2c_designware.2: dw_i2c_plat_suspend
>> ...
>> [  169.702511] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 1 because !power.must_resume
>> [  169.706241] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 1 because !power.must_resume
>> [  169.706244] i2c_designware i2c_designware.2: PM: device_resume_early: dev_pm_skip_resume:true
>> ...
>> [  175.254832] i2c i2c-2: Transfer while suspended
>>
>> (Just to prove my logging isn't lying, for i2c3 it reports
>> SMART_SUSPEND=1)
>>
> 
> Oh, that's embarrassing. After confidently telling you my logging
> is perfect, actually there was a bug in it...
> 
> New log summary:
> 
> [  162.253431] i2c_designware i2c_designware.2: PM: dev_pm_skip_suspend: SMART_SUSPEND=1 pm_runtime_status_suspended=0

Ok, so the device's pm_runtime_get() count is 0 here (otherwise must_resume
should be 1 later on) but the device is not run-time suspended yet. Probably
because of some timeout; or because of runtime pm getting disabled durig suspend
before the count dropped to 0.

And this scenario will indeed cause the system-level suspend callback to
get called, but not the resume one ...

> [  162.253438] i2c_designware i2c_designware.2: PM: __device_suspend_late: dev_pm_skip_suspend:false
> [  162.253445] i2c_designware i2c_designware.2: dw_i2c_plat_suspend
> [  162.273115] i2c_designware i2c_designware.2: PM: dev_pm_skip_suspend: SMART_SUSPEND=1 pm_runtime_status_suspended=0
> [  162.362547] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 1 because !power.must_resume
> [  162.369216] i2c_designware i2c_designware.2: PM: dev_pm_skip_resume: 1 because !power.must_resume
> [  162.369220] i2c_designware i2c_designware.2: PM: device_resume_early: dev_pm_skip_resume:true
> [  167.901269] i2c i2c-2: Transfer while suspended
> 
> Same result that it doesn't skip suspend but does skip resume.

From your other email:

> Ok, what do you suggest as the fix?
> If you post an alternate fix I can test it.

I don't really see a better solution, so lets go with your solution, but then:

1. Simply drop the flag but don't add the if (!pm_runtime_suspended(dev))
check. The runtime status is always going to be set to active at this point
so the check does not do anything.

2. Drop the dw_i2c_plat_complete() callback since we now always resume the controller
on system resume.

Regards,

Hans


