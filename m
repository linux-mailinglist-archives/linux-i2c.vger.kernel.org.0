Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5A62FB996
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732896AbhASOeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387569AbhASJey (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 04:34:54 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2AAC061757;
        Tue, 19 Jan 2021 01:34:13 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id u14so11856930wmq.4;
        Tue, 19 Jan 2021 01:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MVmfHpv1dqQMC+/17HbeSr8gZKRBSbuLaqGXcEQcgHk=;
        b=SsEI2cPmmm+oLI+ZZGbU+c63k+ebf/JYDG7XvRNGOYwaDFX0faD48+9eaCoDN1A8sf
         OhLUZLP4OocLGpbEChsbsls0TjUnV2rd7UJ+RHSzdSd57F0Q+UuBjl18zI8VnCmtFHoA
         nxMqUQlSyqzlTTlYP/dpE7VaNMeiw1k3I8y1UeohLWSuXtsWM+Dofa9YjPxdVT92dp3R
         9eekQ/Dnys1/sfHLwyBX+L5rTIoQXkZ1FDemKljcOIaMMilEn7o2pka/1kqjnx8wgN6/
         X06L5Fy7R1IsmLiVwbareaZoXxGTNsQ8oC3ZiqOijKgoZOEO01r9LWq5IDpNaxwI4GFT
         TM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MVmfHpv1dqQMC+/17HbeSr8gZKRBSbuLaqGXcEQcgHk=;
        b=F1gKN6o/swZyT0EJ6a01GPDVSOXk4r7yMcLVMnRJ9YDgAHos420vZkj4yTBkZyhgz6
         GEJEEq0WEm+sPhbBrRDl37SrfaIfQQzmspXZ/a1k9sEDcJbsm+oGN5/Bjszh9RBgx+FN
         gMnQeuNGpdj2xIGqaA8oxp9mS4KYhSbcwIUcR7lXhWPgFHFeSc6bPaF/txFUrosa+OGH
         1BeSVJWlIzCF1l9jkSLYAbaqsDAYQ+e6TSN2KW1hUQ3uc1W4IulBGkifkkGo3fo40r9N
         DE2CmP6w0mH6nU5zTKfWA3TnYlNxsULcYRtGoGVc4mh8+9oiJrlOH+PcrOSiHaVDR0pz
         Lthg==
X-Gm-Message-State: AOAM530N2D1d+I7uzClUFzoUMLUmabZH5xeq5dNtAS7vB9XTw5CDxIAf
        MWSqf/oZ+lKmbEjavWxLLmY=
X-Google-Smtp-Source: ABdhPJwYG2+3uoFvFp6GVLGj68M1KOo01VGgg6KN5PSx7K0AsWLwl+7t1PTTmgagt75wnM5n8A7DVA==
X-Received: by 2002:a1c:2945:: with SMTP id p66mr3221327wmp.110.1611048852535;
        Tue, 19 Jan 2021 01:34:12 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id h16sm34544932wrq.29.2021.01.19.01.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 01:34:11 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
 <20210119093358.GO4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <b01e1439-d503-2989-5769-971d75c1cae6@gmail.com>
Date:   Tue, 19 Jan 2021 09:34:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119093358.GO4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Morning Andy

On 19/01/2021 09:33, Andy Shevchenko wrote:
> On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
>> On 18/01/2021 21:19, Daniel Scally wrote:
>> I'm more and more confident that this will work, but it has some
>> knock-on effects:
>>
>> The both clk and regulator gpio driver expects to be able to fetch the
>> GPIO using devm_gpiod_get(&pdev->dev, "enable", ...). That won't work of
>> course, so we need to add another GPIO lookup table so those drivers can
>> see the GPIOs. For that, we need to know what dev_name(&pdev->dev) will
>> be so we can set the .dev_id member of a gpiod_lookup_table to that
>> value, but that isn't set until _after_ the pdev is registered (because
>> it has to figure out the id, we can't manually set the IDs because there
>> could be more than one instance of int3472-discrete bound to multiple
>> PMIC devices, and we don't know which id the current one should have).
>> Finally, we can't wait until the device is registered because it
>> immediately probes, can't find the GPIO and then fails probe.
>>
>> It's similar problem that causes us to need the i2c-acpi name format
>> macros, but complicated by the dynamic ID part of dev_name(&pdev->dev)
>>
>> Solving it is a bit of a sticky one; perhaps something like moving the
>> dev_set_name() part of platform_device_add() [1] to its own function,
>> that's called in both platform_device_alloc() and
>> platform_device_register(). That way it would be available before the
>> device itself was registered, meaning we could create the lookup table
>> before it probes the driver.
> See my previous reply. TL;DR: you have to modify clk-gpio.c to export couple of
> methods to be able to use it as a library.


Ack! Ok, I thought about that the wrong way. I'll take another look
tonight then.


>> (also, Laurent, if we did it this way we wouldn't be able to also handle
>> the led-indicator GPIO here without some fairly major rework)
> LED indicators are done as LED class devices (see plenty of examples in PDx86
> drivers: drivers/platform/x86/)
And this too - thanks very much
