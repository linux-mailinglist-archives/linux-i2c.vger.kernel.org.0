Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2117711E649
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 16:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfLMPPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 10:15:16 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37686 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727621AbfLMPPQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 10:15:16 -0500
Received: by mail-lf1-f65.google.com with SMTP id b15so2226734lfc.4;
        Fri, 13 Dec 2019 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UlHDKsmoe+826B5v7eIvOR/a1j2zmQgZj5YuW8X/n7g=;
        b=XrG1R127W1w52k9bE/5s2TuntEnJwd2TcVRnrwI/HzdVApaV5zuGvPyUSa3yeu+DqT
         fsaCW7H5NRD44igN30Jnnrg5Q5cp2nZwMsU9CFDCpTM2HG76sdTnnNBoEX6EuvICJ02M
         eqN+/5oWObfAKufa4LOwNX+LefA3E9N+6HKfSuvnYeD0b85w2xhZcNqJ5R7jAbETunYY
         92SaCcRSq8JPJQNL+NB5lXM7VeXkbI9BSMuH+ByWdrpCx2DIAFZGYk8mfy5SWDPc7P3C
         R8/ZhWievymdG8QfVwrlQWqp6zlE4Eb6/h0kE6MHmp3MgmxagOcbhT+PH4NB20XunZu1
         LHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UlHDKsmoe+826B5v7eIvOR/a1j2zmQgZj5YuW8X/n7g=;
        b=nPypL3q44kgjNa3L+HMttA+UOcCNz8PuddDTta4L7sJisbf1gzCG4oWgC0HfE3Dt6j
         lVWAcWztU7en1o4E42UBCCQREk4LMhYX3r7Ny59OfhOouJmSJBJVXyuEBPe7SokbmS9y
         dAAD1jFc0Wk/nGN5djIWxVnj56w7j9ghV5H7uf7l3+96yd3RS85n6WuXVx4dDuFFwiJB
         ptdaG1qFEq8MEFyohMLeHcBU3U3IsaYgYfly4xuggJPWR6wSnX/fcFNYZsr6ZATO7yWY
         S0Wj2BvUDjHGVMiuPQAANIq7dzWYB5FQJzGvGbPNPz+9NLHIlzM7oWRedYzv5ZC9AFAW
         UBOg==
X-Gm-Message-State: APjAAAXu1tfwmCXTUJVSsdptlDUTXP7nXp7jgkcmN6d3mpWZ8CJdUAH9
        vzVFSURS4jz3Eon8XpkXY/HDKAN0
X-Google-Smtp-Source: APXvYqyc4aURS7fBO//VAwrteDvwHVi18UODR6SJD1pTyv03WId0aF0I3CFQgT1s4d+FG8JHDOh/sg==
X-Received: by 2002:a05:6512:c7:: with SMTP id c7mr9799063lfp.120.1576250113583;
        Fri, 13 Dec 2019 07:15:13 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t1sm4901890lji.98.2019.12.13.07.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 07:15:13 -0800 (PST)
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com> <20191213151208.GC222809@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a2a9cef-f4ed-c5a4-1f35-c89c3b5106a6@gmail.com>
Date:   Fri, 13 Dec 2019 18:15:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213151208.GC222809@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 18:12, Thierry Reding пишет:
> On Fri, Dec 13, 2019 at 02:34:26AM +0300, Dmitry Osipenko wrote:
>> System shutdown may happen with interrupts being disabled and in this case
>> I2C core rejects transfers if atomic transfer isn't supported by driver.
>>
>> There were several occurrences where I found my Nexus 7 completely
>> discharged despite of being turned off and then one day I spotted this in
>> the log:
>>
>>  reboot: Power down
>>  ------------[ cut here ]------------
>>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x9c
>>  No atomic I2C transfer handler for 'i2c-1'
>>  Modules linked in: tegra30_devfreq
>>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-00120-gf7ecd80fb803-dirty #3195
>>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x9c)
>>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/0x1cc)
>>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23/0x38)
>>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xfc)
>>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/0xc4)
>>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits_base+0x39/0x50)
>>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_power_off+0x29/0x2c)
>>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+0xe9/0x170)
>>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0x28)
>>  Exception stack(0xde907fa8 to 0xde907ff0)
>>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
>>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 00000000
>>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>>  ---[ end trace bdd18f87595b1a5e ]---
>>
>> The atomic transferring is implemented by enforcing PIO mode for the
>> transfer and by polling interrupt status until transfer is completed or
>> failed.
>>
>> Now system shuts down properly every time.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
>>  1 file changed, 88 insertions(+), 7 deletions(-)
> 
> I ran this on the test farm and the results are all green, so:
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> 

Thanks!

Does the farm test board's shut down by verifying the
hardware's power state?
