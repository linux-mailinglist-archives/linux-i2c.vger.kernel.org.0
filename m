Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0BFE2FF6DA
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 22:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbhAUVLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 16:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbhAUVJI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 16:09:08 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2479CC061756;
        Thu, 21 Jan 2021 13:08:28 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id m4so3100127wrx.9;
        Thu, 21 Jan 2021 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OMFMRDIlKBCL9Ohj87OUa8tkrf6G4uCu7Gi4SktmUto=;
        b=KIp5eccKN5MoF5EXrpEigjcHLx1XdU7pp8SCXjiUMhOP7z30XgYU21ZTTHczLR/j/V
         JjnhKqS1LUsWLbRXTE4le0QiPC1m3iNG2Fili4MHXGLYx3YVMoOu0bc7sRsN6v+BFMpv
         UjkckzY8iVFdijAmbxeupjYIL1YnEjAmdVXYIWq0IYB94NdcYmoghMZAnxgWAHGGmkFL
         pXO/3NlyjnPbCHVv+QktRvMlRkld1BBaQZ2rTQccbzW4J5ify05AH23Rc89B/K/jIJcr
         O1hOXNLtrjxcpeye37n7r7VVgdCFpW2TV5wdXh9MG4JH7lrRSBbKp/r58QcL0LQQcVPB
         4h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OMFMRDIlKBCL9Ohj87OUa8tkrf6G4uCu7Gi4SktmUto=;
        b=HEmT3MNZAfLxK3s6N/s2U5X15HRLC6TC6qHYU6vaFfq5hE/vSS3TLqYRZOsNblEST2
         bIcUu6XRR8MAnEcQuZmqNeGhYWkMJo/FooOSoQ8oSo94myTompW+uR1PNHIwy2mhSDGd
         ikGKDMMaF6dpFuU/G21h6aCed/oam/yCD906a7xUAOyiltHOSPWeqrdkPdOPV/z9kwQL
         ojGcKHCSh6Fbxkny+yzW4PIBK0pYzee+2Oy7GE7BX90CFQA4BpRRkMnXdgDJpCD2Hnp4
         TJdK3/MLRtJsMZCJj01s8DRWdwv6k/wZuIuFsgY1Z4JFFT+O8KkqPC/VTUREuc7iKWbq
         9jSQ==
X-Gm-Message-State: AOAM5302hU3OZW0OeaZg1zfiL9O6uyB5SiGyUtUMi7PVnYR6SGUBLG65
        S5kwXjOM+fwe5ssTkIt9WDA=
X-Google-Smtp-Source: ABdhPJw3191VKC674udlSDdtZ4NJ1fR1XfdltPOh/9Cz1AcR6fwweuP3nkh4JmZd0P/D8rW7WCg83Q==
X-Received: by 2002:a05:6000:1374:: with SMTP id q20mr1279024wrz.44.1611263306941;
        Thu, 21 Jan 2021 13:08:26 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id i131sm8816923wmi.25.2021.01.21.13.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 13:08:26 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
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
 <YAcKj9fyNZY8QETd@pendragon.ideasonboard.com>
 <YAcaM9Tcif1rS3V/@smile.fi.intel.com>
 <YAevLTVlUSXMylWL@pendragon.ideasonboard.com>
 <YAgXlgLauIGEe05w@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <837b221d-57ad-88fb-65df-e1cae64f0ad0@gmail.com>
Date:   Thu, 21 Jan 2021 21:08:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAgXlgLauIGEe05w@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi both

On 20/01/2021 11:44, Andy Shevchenko wrote:
> On Wed, Jan 20, 2021 at 06:18:53AM +0200, Laurent Pinchart wrote:
>> On Tue, Jan 19, 2021 at 07:43:15PM +0200, Andy Shevchenko wrote:
>>> On Tue, Jan 19, 2021 at 06:36:31PM +0200, Laurent Pinchart wrote:
>>>> On Tue, Jan 19, 2021 at 11:33:58AM +0200, Andy Shevchenko wrote:
>>>>> On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
>>>>>> On 18/01/2021 21:19, Daniel Scally wrote:
> ...
>
>>>>> See my previous reply. TL;DR: you have to modify clk-gpio.c to export couple of
>>>>> methods to be able to use it as a library.
>>>> That seems really overkill given the very simple implementation of the
>>>> clock provided here.
>>> Less code in the end is called an overkill? Hmm...
>>> I think since we in Linux it's better to utilize what it provides. Do you want
>>> me to prepare a patch to show that there is no overkill at all?
>> The amount of code we would save it very small. It's not necessarily a
>> bad idea, but I think such an improvement could be made on top, it
>> shouldn't block this series.
> Okay, let's wait what Dan will say on this.
> I can probably help to achieve this improvement sooner than later.


Well; turns out that we missed an operation we really need to add
(clk_recalc_rate) which in our case needs to read a fixed value stored
in a buffer in ACPI; most of the code is shared with an existing
function in the driver so it's not much extra to add, but I think it
kinda precludes using clk-gpio for this anyway

>>>>>> (also, Laurent, if we did it this way we wouldn't be able to also handle
>>>>>> the led-indicator GPIO here without some fairly major rework)
>>>>> LED indicators are done as LED class devices (see plenty of examples in PDx86
>>>>> drivers: drivers/platform/x86/)
>>>> How do you expose the link between the sensor and its indicator LED to
>>>> userspace ? Isn't it better to handle it in the kernel to avoid rogue
>>>> userspace turning the camera on without notifying the user ?
>>> I didn't get this. It's completely a LED handling driver business. We may
>>> expose it to user space or not, but it's orthogonal to the usage of LED class
>>> IIUC. Am I mistaken here?
>> If it stays internal to the kernel and is solely controlled from the
>> int3472 driver, there's no need to involve the LED class. If we want to
>> expose the privacy LED to userspace then the LED framework is the way to
>> go, but we will also need to find a way to expose the link between the
>> camera sensor and the LED to userspace. If there are two privacy LEDs,
>> one for the front sensor and one for the back sensor, userspace will
>> need to know which is which.
> I see. For now we probably can keep GPIO LED implementation internally.
>
