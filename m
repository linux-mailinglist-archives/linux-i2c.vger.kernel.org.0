Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAD2168FCF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 16:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbgBVPlW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 10:41:22 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33382 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbgBVPlV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Feb 2020 10:41:21 -0500
Received: by mail-pl1-f194.google.com with SMTP id ay11so2168986plb.0;
        Sat, 22 Feb 2020 07:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZKqnhKtnjlrm/NrpyM5QaS9UL8/A0/pvxGGFI8Wsv3o=;
        b=Pgu+gYaDPETaF85sNjWfDPiAD6EkDxAO6E9xek1rU5M6uwrNQN13L3OMjjvwiPxDoe
         gp49QnHzOchd1YoaxN/JosfktWZFqyf/pV5JScPo+95BIbujN1wTPRaAsX2HGOHpASmG
         UzrvvEAy2gZ9ddMNJfWXCse+uP9NdXWuN2uqQ4B7RFbnVMdfeFQyFx6UHwi6xBTO6vqP
         TUWuBZ4qN5wJAo0WeeVPDrlHANL/sbbVl1wut/om3pYofISgu2DFAqWO2dDXENljZckj
         1ugcPNB6OUHLG23KAG2eHjzujmB4nPLqGnfPe8YLLPAZEjJTUkpK9foURb2yHjwdm7ue
         XMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZKqnhKtnjlrm/NrpyM5QaS9UL8/A0/pvxGGFI8Wsv3o=;
        b=c6xdj2CfQENiUAe74mRONG/chuTE7G3pbJCKfzCKurPwFEAeNx+zlW+Q44QlxrBPCE
         wBUNoDhoVJw276QnFhAthPvpF3z1kANkH0N4RRanpxntjY7K0iAdR50yO9n0b9GG8/p5
         8M4DFBuGsjElLpZevfWSoQUXHqqsznLNscO3ImqmBDC+KXKe2Giv8qOL5vY0Den4Lr4w
         rnFDwvjxq2GIPbw4TEUSWgq1NIjSR1wHYuwfLXEFWZM8b6MeLXNvnegw71BrV+5V0Bgh
         Y5TLY5msyUBAqtckbgNhUCAG+KoBlYgxsjU+XP7aU8Nh53rsvIMkpAQ++2qY0pyeiapu
         rSLg==
X-Gm-Message-State: APjAAAVpjkWL+TnNNKt3FaJ6bP1Tjtz4eAS6KKHb9afeKfaSiTX6rdIe
        2yTl6RuqpBSh+T/Tm+d5tS2+r2ay
X-Google-Smtp-Source: APXvYqxQm22B+SJe7ymcheyrXUZZA2F9Z0qnG9iBS9cXm58rL50yqAHe+Sb+plQX+1/lnt4E7jPOEg==
X-Received: by 2002:a17:90a:17e5:: with SMTP id q92mr10137107pja.28.1582386080725;
        Sat, 22 Feb 2020 07:41:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r8sm6230930pjo.22.2020.02.22.07.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2020 07:41:19 -0800 (PST)
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
To:     Martin Volf <martin.volf.42@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
Date:   Sat, 22 Feb 2020 07:41:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/22/20 3:13 AM, Martin Volf wrote:
> Hello,
> 
> hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
> motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
> kernels, the driver nct6775 does not load.
> 
> It is working OK in version 5.3. I have used almost all released stable
> versions from 5.3.8 to 5.3.16; I didn't try older kernels.
> 
> Even on new kernels the sensors-detect finds the sensors:
>          Found `Nuvoton NCT6796D Super IO Sensors' Success!
>              (address 0x290, driver `nct6775')
> but "modprobe nct6775" says:
>          ERROR: could not insert 'nct6775': No such device
> There is nothing interesting in dmesg.
> 

My wild guess would be that the i801 driver is a bit aggressive with
reserving memory spaces, but I don't immediately see what it does
differently in that regard after the offending patch. Does it work
if you unload the i2c_i801 driver first ?

You could also try to compare the output of /proc/ioports with
the old and the new kernel, and see if the IO address space used
by nct6775 in v5.3 is assigned to the i801 driver (or some other
driver, such as the watchdog driver) in v5.4.

If you are into hacking the kernel, you could also add some
debug messages into the nct6775 driver to find out where exactly
it fails. If that helps, maybe we can then add those messages into
into the driver source to help others if this is observed again.

Thanks,
Guenter
