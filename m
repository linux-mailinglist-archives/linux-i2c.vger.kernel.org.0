Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AF2336D36
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Mar 2021 08:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhCKHlp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Mar 2021 02:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbhCKHlh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Mar 2021 02:41:37 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B883CC061574;
        Wed, 10 Mar 2021 23:41:36 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 75so656544otn.4;
        Wed, 10 Mar 2021 23:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VJsCZPekgWYPV5lmWVKBdLOlNeXJI7i8AN+H1rT/Fag=;
        b=UTcNQaCWmPlxyQYpxkoGjxuhPq80XmWVyp1W/EoOmhJiOfDwW+XAW7GvdnN5b3QM6E
         Fc5TV04tV7TrvC9S9vt08g4O7UxxUV1hYLBE0mxRX6R9KI+EzoUMllWRMRL3PpVmhKxr
         JoAOfuJ2YZT45O2u1HJCJB4B1Rh7JoOA5S1okhutsIGkFNGTmDzR56VeIFTXyU6+36wt
         Sn65FmolgkO8zlO8hjYW9jnDjnKA5Gm6gk/JscmYg0P7VINZIbFVrrTH6wxRwk6FzFjU
         QRWtX6+vpwnQuTzaX5BnLOupTtyJQRRvLZ9PnQo4jCDJJUwAGzLrV/nwAlm93ApkLqrz
         n8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VJsCZPekgWYPV5lmWVKBdLOlNeXJI7i8AN+H1rT/Fag=;
        b=SfiXKh+299IRSsm3L50s3hYTR3i7ysbnGm5DG6C6CK2ywFz+p0Imz0juotDqehuC5P
         c1cpZqvgvKKGHWNLHqwS0qkzYHBea5rBvAt3UB4wRzDZeaHIduZc3gjaFMfZQmSrYMIM
         qzGzamd6Cu1rmwURjF/GkXykSOGciEoOUwIQmZaDI63J0yHhlXEkviqbXRbLYwX7Unpm
         onWX2+JQt3lUbBZPmU7jjiXsNXO+xeM3LX3lDdPY3S0HVPWYGWgCH8ziuVinuXmjWx5w
         h4Lc+DlOZkcDa6zlWFK7V0b3k+eLMQhIeI8RwdTJTFvRwAfpSFT5QznoE3GRHNITEMZw
         VvEA==
X-Gm-Message-State: AOAM530WmkhYcCCpbj3B32I26unwmrP1O3y5/2E9jPBouwkkNrthaNXQ
        RYtkjpTwrHddT1v4oxZvAnc=
X-Google-Smtp-Source: ABdhPJzMwM04hEzMgR1Q7eZ8v0302Ff4XQD4jbNIqYAzKln36DW/NUnOHesclfCei1nBujZ6D9q72g==
X-Received: by 2002:a9d:404b:: with SMTP id o11mr5762939oti.342.1615448496038;
        Wed, 10 Mar 2021 23:41:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 67sm493490otv.5.2021.03.10.23.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 23:41:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
 <1aa0dc23-0706-5902-2f46-0767de0e3ad6@alliedtelesis.co.nz>
 <d5045879-45aa-db38-e6aa-4c8ea3e62f6c@roeck-us.net>
 <b41a802b-2833-13fb-58ad-1762a3507460@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d37a114c-fa3f-40e8-4d85-52eb1ff03c37@roeck-us.net>
Date:   Wed, 10 Mar 2021 23:41:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b41a802b-2833-13fb-58ad-1762a3507460@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/10/21 1:48 PM, Chris Packham wrote:
> 
> On 10/03/21 6:06 pm, Guenter Roeck wrote:
>> On 3/9/21 6:19 PM, Chris Packham wrote:
>>> On 9/03/21 9:27 am, Chris Packham wrote:
>>>> On 8/03/21 5:59 pm, Guenter Roeck wrote:
>>>>> Other than that, the only other real idea I have would be to monitor
>>>>> the i2c bus.
>>>> I am in the fortunate position of being able to go into the office and
>>>> even happen to have the expensive scope at the moment. Now I just need
>>>> to find a tame HW engineer so I don't burn myself trying to attach the
>>>> probes.
>>> One thing I see on the scope is that when there is a CPU load there
>>> appears to be some clock stretching going on (SCL is held low some
>>> times). I don't see it without the CPU load. It's hard to correlate a
>>> clock stretching event with a bad read or error but it is one area where
>>> the SMBUS spec has a maximum that might cause the device to give up waiting.
>>>
>> Do you have CONFIG_PREEMPT enabled in your kernel ? But even without
>> that it is possible that the hot loops at the beginning and end of
>> each operation mess up the driver and cause it to sleep longer
>> than intended. Did you try usleep_range() ?
> 
> I've been running with and without CONFIG_PREEMPT. The failures happen 
> with both.
> 
> I did try usleep_range() and still saw failures.
> 

Bummer. What is really weird is that you see clock stretching under
CPU load. Normally clock stretching is triggered by the device, not
by the host. I wonder if there are some timing differences before
the clock stretching happens.

Anyway, I just sent a set of three patches to the list; maybe you
can give it a try. The patches convert the driver to the with_info
API and drop local caching.

The code is module tested with the register dumps I have available
for adm9240 and lm81, but it would be great to get test coverage
on real hardware. I don't really expect it to solve your problem,
but it does reduce and modify the load on the chip (because
registers are no longer read in bursts), so it may have some
positive impact.

>> On a side note, can you send me a register dump for the lm81 ?
>> It would be useful for my module test code.
> 
> Here you go this is from a largely unconfigured LM81
> 

Thanks, that helped a lot!

Guenter
