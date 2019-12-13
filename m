Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5BE11E680
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 16:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfLMPZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 10:25:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36788 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfLMPZj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 10:25:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so3083523ljg.3;
        Fri, 13 Dec 2019 07:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vpQPUvm03IxC9CJiK4kP7EGdEHCSuBFUn665asErXvY=;
        b=AR6bM5rcNF/986NbNCEQGoh2OGNVIp20RdIEWLVX3Lz6Ru5RQpOThcU7eTVBVv3JvB
         uwW5/L6bvyaou6OpTcxtI0b3y5u9lxswO+irVDHBh9idiqtsmvZdcPw8lWVwNwOialOH
         gkdd2PSrpXJZ3Bl6j2LTSyMfQ251MfSnBZupKEPCVVgJ6CCeS2mBzEmXU1WH3d5gVd1F
         1u6T8AkOq5kJm2vllPiq235MA0Tm3KVPqd39/2xKpZeMbyNx/CeYFYd5b+GBewL02CUw
         7A369FlOtLnmxtW5y0ZcT+2CElrvyuIcxZ91gTVEYAyA90lg0seB6xmuive12Aj/yKzh
         ysAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vpQPUvm03IxC9CJiK4kP7EGdEHCSuBFUn665asErXvY=;
        b=tGPVm+/7JlIIBJ9mDkwfBun100Iq+p1X8HQAj4u2DBsBDzxDp1prfHF/H2QeWRFTu+
         tCITs2yR4r0gwGZRBTysxCMsrVIisLmrP7vO1Pnt92EInP2nmAzSi/nsCEDh1BS1EFmD
         Xcz0di2kRU78D4XJJkNuLcICKJJEIeLu9nd5uyBjrHC46EnmKTYzJ5R2SaDqZVft1kzw
         YAmexmR9W40LlQWQsL0ZkBNqESguoEoZek3IzZEoYjtfuAqWWYafQh/q6vhP5DqxHNTW
         gdrppiAr2w3G9fzgvy1Fw2pgxnzMXjt3BZ/NvZFH0yBWWRQHJOOj8QkRpLkG+tEhUASC
         Z9Bw==
X-Gm-Message-State: APjAAAXkbCVGvJPwffqiWyGVkB8TlYKRtEdQ17CXqp+5UQJ8kfqgMQ8Y
        AylDpPLrO8mKh5PsuNB/CNaBWMOK
X-Google-Smtp-Source: APXvYqzVYzB7rz3dmZxLnSFsF7aeMxxrRckTm0XmmHAfzsMamePK8EKc77HCYRP3IpZMj5Zoi6FkdQ==
X-Received: by 2002:a2e:580c:: with SMTP id m12mr9928921ljb.150.1576250736503;
        Fri, 13 Dec 2019 07:25:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id w6sm4661282lfq.95.2019.12.13.07.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 07:25:36 -0800 (PST)
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com> <20191213151208.GC222809@ulmo>
 <5a2a9cef-f4ed-c5a4-1f35-c89c3b5106a6@gmail.com>
 <20191213152017.GA293199@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <840b678e-de92-1564-1739-c15ca8dd5766@gmail.com>
Date:   Fri, 13 Dec 2019 18:25:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213152017.GA293199@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 18:20, Thierry Reding пишет:
> On Fri, Dec 13, 2019 at 06:15:12PM +0300, Dmitry Osipenko wrote:
>> 13.12.2019 18:12, Thierry Reding пишет:
>>> On Fri, Dec 13, 2019 at 02:34:26AM +0300, Dmitry Osipenko wrote:
>>>> System shutdown may happen with interrupts being disabled and in this case
>>>> I2C core rejects transfers if atomic transfer isn't supported by driver.
>>>>
>>>> There were several occurrences where I found my Nexus 7 completely
>>>> discharged despite of being turned off and then one day I spotted this in
>>>> the log:
>>>>
>>>>  reboot: Power down
>>>>  ------------[ cut here ]------------
>>>>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x9c
>>>>  No atomic I2C transfer handler for 'i2c-1'
>>>>  Modules linked in: tegra30_devfreq
>>>>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-00120-gf7ecd80fb803-dirty #3195
>>>>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>>>>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>>>>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>>>>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>>>>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>>>>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x9c)
>>>>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>>>>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/0x1cc)
>>>>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23/0x38)
>>>>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xfc)
>>>>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/0xc4)
>>>>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits_base+0x39/0x50)
>>>>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_power_off+0x29/0x2c)
>>>>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+0xe9/0x170)
>>>>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0x28)
>>>>  Exception stack(0xde907fa8 to 0xde907ff0)
>>>>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
>>>>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 00000000
>>>>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>>>>  ---[ end trace bdd18f87595b1a5e ]---
>>>>
>>>> The atomic transferring is implemented by enforcing PIO mode for the
>>>> transfer and by polling interrupt status until transfer is completed or
>>>> failed.
>>>>
>>>> Now system shuts down properly every time.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
>>>>  1 file changed, 88 insertions(+), 7 deletions(-)
>>>
>>> I ran this on the test farm and the results are all green, so:
>>>
>>> Tested-by: Thierry Reding <treding@nvidia.com>
>>>
>>
>> Thanks!
>>
>> Does the farm test board's shut down by verifying the
>> hardware's power state?
> 
> No, that's not something we test. I was primarily running this to make
> sure we don't regress anywhere else.

Verifying basics is also good :) Thanks again!
