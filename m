Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985277C944A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Oct 2023 12:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbjJNK65 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 Oct 2023 06:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbjJNK64 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 Oct 2023 06:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA59BB
        for <linux-i2c@vger.kernel.org>; Sat, 14 Oct 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697281092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7K8u/F/T7vd5Qb0NUDHtY09uDfh7jAIHafbl7k57Yug=;
        b=LeZ/tTdAq54r0ous8fV4cANlh76yy8sg0pqN+Xa0DRVTi1m3KXRemoTqmf0nm7uKteIf87
        1QCfzhz+obaW8Al1OUfv/VyIGokV2RFLPzIjEisrBzgdXtw0gYpixHTADDrARjCTpgDCcK
        HvyanER19ihnO3pv1305HvzpPGCQppo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-G0UufzeBNlGWuEduxtMpXQ-1; Sat, 14 Oct 2023 06:58:09 -0400
X-MC-Unique: G0UufzeBNlGWuEduxtMpXQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ae0bf9c0a9so186315566b.3
        for <linux-i2c@vger.kernel.org>; Sat, 14 Oct 2023 03:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697281088; x=1697885888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K8u/F/T7vd5Qb0NUDHtY09uDfh7jAIHafbl7k57Yug=;
        b=GlypKhinl2aJQr4CH6cW/GVgu+7TzdtAVXQ2dY8moZHZ0Pr1hNTKwivSr7yu5fL3Tj
         iGd2h0w4jYARATNm6NU5DR+qnsHFeBiu24cXZ/UaDRBpqwb4n/on2ODS2tCHdn3uElK0
         p+NI8QuLk1f167p3B6/XrJbrlyaZYsiFo4J2EfsO8TCkt98gQuv0XeDIIfFnw/o7tFtm
         N9MKrjcrNLAsmxVQssvzKkAPbfviLY6ZZXBNnqSnR8vvOjJYuhw5dy0bBFA5MpbbldaZ
         lJSXf91QDnxJXLVOLwxHjnTmVITOVtQflhsiP+Qbwu74cH1MCRdZt/e5WjMTtZeZ/TxT
         IwQQ==
X-Gm-Message-State: AOJu0YxIH/GrQi0kW+NlCzoAF7dfOIUbyqAdw1tIV+AnU1FR3iQBLF1G
        /cYQ+n2MKnYjaGb6LpZAVUJejeZUo8SW4J1vwjDJZcp2TkV2me8UcpRsBNjtnIaZyDKWANO5BWO
        cwcyVpAq2ivACGaYR2U1s
X-Received: by 2002:a17:907:9306:b0:9bd:a2a9:a722 with SMTP id bu6-20020a170907930600b009bda2a9a722mr4380722ejc.45.1697281088714;
        Sat, 14 Oct 2023 03:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERPMfjIBAe6gPMoCmGJsf/nvUED0pBuGMeWmFvEJzgs1jrgiD92PRib0Pl5uaiKzqcHeO+Jg==
X-Received: by 2002:a17:907:9306:b0:9bd:a2a9:a722 with SMTP id bu6-20020a170907930600b009bda2a9a722mr4380709ejc.45.1697281088270;
        Sat, 14 Oct 2023 03:58:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vl9-20020a170907b60900b0099bccb03eadsm755833ejc.205.2023.10.14.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Oct 2023 03:58:07 -0700 (PDT)
Message-ID: <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
Date:   Sat, 14 Oct 2023 12:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
To:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc:     "Wu, Wentong" <wentong.wu@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 10/13/23 22:05, Shevchenko, Andriy wrote:
> On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:

<snip>

>> Ah ok, I see. So the code:
>>
>> 1. First tries to find the matching child acpi_device for the auxdev by ADR
>>
>> 2. If 1. fails then falls back to HID + UID matching
>>
>> And there are DSDTs which use either:
>>
>> 1. Only use _ADR to identify which child device is which, like the example
>>    DSDT snippet from the commit msg.
>>
>> 2. Only use _HID + _UID like the 2 example DSDT snippets from me email
>>
>> But there never is a case where both _ADR and _HID are used at
>> the same time (which would be an ACPI spec violation as Andy said).
>>
>> So AFAICT there is no issue here since  _ADR and _HID are never
>> user at the same time and the commit message correctly describes
>> scenario 1. from above, so the commit message is fine too.
>>
>> So I believe that we can continue with this patch series in
>> its current v20 form, which has already been staged for
>> going into -next by Greg.
>>
>> Andy can you confirm that moving ahead with the current
>> version is ok ?
> 
> Yes as we have a few weeks to fix corner cases.
> 
> What I'm worrying is that opening door for _ADR that seems never used is kinda
> an overkill here (resolving non-existing problem).

I assume that there actually some DSDTs using the _ADR approach
and that this support is not there just for fun.

Wentong, can you confirm that the _ADR using codepaths are
actually used on some hardware / with some DSDTs out there ?

> Looking at the design of the
> driver I'm not sure why ACPI HIDs are collected somewhere else than in the
> respective drivers. And looking at the ID lists themselves I am not sure why
> the firmware of the respective hardware platforms are not using _CID.

This is a USB device which has 4 functions:

1. GPIO controller
2. I2C controller 1
3. I2C controller 2
4. SPI controller

The driver for the main USB interface uses
the new auxbus to create 4 child devices. The _ADR
or if that fails _HID + _UID matching is done to
find the correct acpi_device child of the acpi_device
which is the ACPI-companion of the main USB device.

After looking up the correct acpi_device child
this is then set as the fwnode / ACPI-companion
of the auxbus device created for that function.

Having the correct fwnode is important because other
parts of the DSDT reference this fwnode to specify
GPIO / I2C / SPI resources and if the fwnode of
the aux-device is not set correctly then the resources
for other devices referencing it (typically a camera
sensor) can not be found.

As for why the driver for the auxbus devices / children
do not use HID matching, AFAIK the auxbus has no support
for using ACPI (or DT) matching for aux-devices and these
drivers need to be auxiliary_driver's and bind to the
auxbus device and not to a platform_device instantiated for
the acpi_device since they need the auxbus device to access
the USB device.

Regards,

Hans


