Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 090245E6417
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 15:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiIVNso (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 09:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbiIVNs2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 09:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1359FF160A
        for <linux-i2c@vger.kernel.org>; Thu, 22 Sep 2022 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663854491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y2Ud/qqg2elpmXsNxxNKNrA5ku1+e8yE9DeSYAF5uII=;
        b=BlG4Rv/BWAFotjzOvxbwNnW4eYn0P077FqoEZXK2oCDlN1or+lekDMjpNgjJwJHkGZmp/U
        KsGZmZJ43R+6C5g04iHrh7jR3IAJV7j9Av70jIzezUr73OeFgCmXkiFZ9NP16eVkIhHSQk
        0n8xjnDZUVcmbMTYz6HkD2UBI4WktH8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-j3lHtudONQ-G9PRjk99NcA-1; Thu, 22 Sep 2022 09:48:10 -0400
X-MC-Unique: j3lHtudONQ-G9PRjk99NcA-1
Received: by mail-ed1-f70.google.com with SMTP id w17-20020a056402269100b0045249bc17a9so6681971edd.9
        for <linux-i2c@vger.kernel.org>; Thu, 22 Sep 2022 06:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Y2Ud/qqg2elpmXsNxxNKNrA5ku1+e8yE9DeSYAF5uII=;
        b=xY5dIQflT0cG+TNfwQY/mxVtNk5cpo7fY19diYzqlWyqqMMOfGYENwXOmpM2fEbSVc
         kjJD0PILuQCpGoVPuici+NQmK5JW0yhtePPrEEiK9H9CHDQmogUfAKXcaqIemSmRinkm
         6rMWUiK9ndzAZzL0kEoA8fZ700S4UdloADauIQhQAf8TgAWg5c1+oDspyzSYZMx8VCNR
         MChrj6kXhr11xriR2sGHenqvdALZgHPcUykIP5sq0sn5i4triIWKb6I/eY6lnMAe3aok
         CmvsYk/h6nHfCF++zzpJdMPd9XW3KaHJe4k8kEK0LVSv/XJIly7Td+H0ES9LdNnWziU6
         /JyA==
X-Gm-Message-State: ACrzQf11s2Sl6AbOk16T+BxFdCCYp6DvzJrfO3u9026RsgdlR8N79Z//
        dNthzA65StwPtoYoiQ9f7bnOBxp0dT6BTFF0IU6dgSgtitdadWM8cK4sgMXHG8HgoRrb9PKb4QW
        WZ6SbdXfWGG0BlkyUJRgP
X-Received: by 2002:a17:907:7d8d:b0:781:fd6b:4545 with SMTP id oz13-20020a1709077d8d00b00781fd6b4545mr2994185ejc.117.1663854488999;
        Thu, 22 Sep 2022 06:48:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zc9GfNIXphN+bih2IsX701c8HyHAKU/xMdiQIvgFJ0vPVevf+0On4Y9/S92bBdf5C/z32aw==
X-Received: by 2002:a17:907:7d8d:b0:781:fd6b:4545 with SMTP id oz13-20020a1709077d8d00b00781fd6b4545mr2994171ejc.117.1663854488823;
        Thu, 22 Sep 2022 06:48:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kv6-20020a17090778c600b0076f0ab594e9sm2644319ejc.73.2022.09.22.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 06:48:08 -0700 (PDT)
Message-ID: <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
Date:   Thu, 22 Sep 2022 15:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Borislav Petkov <bp@suse.de>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
 <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic> <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic> <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YywwEvkZK1R9mJfE@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/22/22 11:51, Andy Shevchenko wrote:
> +Cc: Hans (mentioned your name and was under impression that you are in Cc list already)
> 
> On Thu, Sep 22, 2022 at 12:49:15PM +0300, Andy Shevchenko wrote:
>> On Wed, Sep 21, 2022 at 10:50:53PM +0200, Borislav Petkov wrote:
>>> On Wed, Sep 21, 2022 at 03:19:26PM -0500, Limonciello, Mario wrote:
>>>> Jan mentioned this in the commit message:
>>>>
>>>>> The function which registers i2c-designware-platdrv is a
>>>>> subsys_initcall that is executed before fs_initcall (when enumeration > of
>>>> NB descriptors occurs).
>>>>
>>>> So if it's not exported again, then it means that we somehow
>>>> need to get i2c-designware-platdrv to register earlier too.
>>>
>>> So I have this there:
>>>
>>> /* This has to go after the PCI subsystem */
>>> fs_initcall(init_amd_nbs);
>>>
>>> as I need PCI. It itself does
>>>
>>> arch_initcall(pci_arch_init);
>>>
>>> so I guess init_amd_nbs() could be a subsys_initcall...
>>>
>>> Or why is
>>>
>>> subsys_initcall(dw_i2c_init_driver);
>>>
>>> a subsys initcall in the first place?
>>>
>>> Looking at
>>>
>>>   104522806a7d ("i2c: designware: dw_i2c_init_driver as subsys initcall")
>>>
>>> I don't see a particular reason why it should be a subsys_initcall...
>>>
>>> In any case, this should be fixed without an export which was crap in
>>> the first place.
>>>
>>> Hm.
>>
>> I'm speculating here, but IIRC the I2C controllers may serve PMICs on some
>> platform that are required to be present earlier due to some ACPI code
>> accessing them. This Hans de Goede can confirm or correct me.

Right, thank you for Cc-ing me. At least on X86 there are several platforms
(and 100-s of device models) which use a PMIC connected to the i2c-designware
controller and this PMIC gets poked directly from ACPI _S0 and _S3
(power on/off) methods. So the I2C bus driver needs to *bind* to the controller
as soon as we find its description in ACPI, otherwise we get a whole bunch
of failed ACPI OpRegion access errors as well as various actual really issues.

So please keep this as a subsys initcall.

Regards,

Hans

