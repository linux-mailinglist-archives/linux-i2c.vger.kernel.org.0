Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 620586A919B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 08:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjCCHVY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 02:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCCHVX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 02:21:23 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FBD1ABDC
        for <linux-i2c@vger.kernel.org>; Thu,  2 Mar 2023 23:21:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j3so990995wms.2
        for <linux-i2c@vger.kernel.org>; Thu, 02 Mar 2023 23:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677828080;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MQLVyHbfVOZYN6zgY31RljZHbRaUH4TgGRwTrnUsjA=;
        b=MRq6hi5C3EXEvpoJjzPv6IRieUXz9WXIOhmrPK0fTIwjiWPku0pu1Zqz3YEVg3qDUH
         r2f81HPXk3FaFmT9MCMJt8zK2fg2LmOLuSPaAXXA61mqCrmDxysy9fIGeitC6mEzWKfb
         6ano6exepaFDM/AQ2a7SNTT0g2Oga2SUy9QqoDjvTW9/h1pnYzGFRXmPS06lCKrfoy1/
         HaGJ+Xcwc9ehzFH3e2GxTuhrd7oiIeKizka3ttLVERWKo2yh1Rw1GtsnCZ5w683I/VdV
         psa2D7BVx9O08Ws29EvRzZ7O2cujcwaXbgkVFCETscLq9Zjk2vRqh7DS+/d3tccbG3BC
         Ew7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677828080;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MQLVyHbfVOZYN6zgY31RljZHbRaUH4TgGRwTrnUsjA=;
        b=MTwLoovLoBzHEW8fe8aJ5tvmjcK9jAKNCJtkcQbYg5fY0HMqT05oXnRNdOMcCjW5Q+
         a8u4CcqGkR1mIBciuBDQzmgdWuXf5ZQO/VjdjP4omPoAqjPEs2axTa3lBX12hXekVMCG
         q/BCBFgAycdtqgAKk/vClgieMMHYtax8GEhCpmPH5o7tg4A/tpyPWQWvOney/6k+8Prs
         xN1gjLR7BWrdKyAMwsbcWOizUAm8d+VHm7+wVD4mBGq/RicUfHguFAb6c/kKoA0SHBxz
         h1nCcF6touPd8jNnNdDgrYQkdEGQQfDwRxBtZXk75uLkqSUWvFC8HiIR9mcv8AIGLgp0
         u/RA==
X-Gm-Message-State: AO0yUKUZUklp4UflB03zwMbgAa3l56CenNV6h7JifQ4kJGMmeRqLJduT
        MsLo3oOUXS3+urRQyodK2ipR8Ti8AOVdf3Cg
X-Google-Smtp-Source: AK7set8le86b49aQEZy5Egu60tyNJaZNg5q59rusaHtzi2919J0ZiStUS0YWz86W2LCUhTSEjo24fQ==
X-Received: by 2002:a05:600c:1547:b0:3eb:3104:efe7 with SMTP id f7-20020a05600c154700b003eb3104efe7mr743374wmg.23.1677828080330;
        Thu, 02 Mar 2023 23:21:20 -0800 (PST)
Received: from [192.168.79.191] ([151.48.121.118])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c485600b003e203681b26sm1532429wmo.29.2023.03.02.23.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:21:20 -0800 (PST)
Message-ID: <4e87d4dc-dd42-5720-0f41-6c1191e26ae9@gmail.com>
Date:   Fri, 3 Mar 2023 08:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] i2c: imx-lpi2c: clean rx/tx buffers upon new message
Content-Language: en-US
From:   Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
References: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
 <4d06ffe5-3ff6-241e-b35b-794c075f288e@gmail.com>
In-Reply-To: <4d06ffe5-3ff6-241e-b35b-794c075f288e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/03/2023 12:06, Emanuele Ghidoli wrote:
> On 30/01/2023 16:32, Alexander Stein wrote:
>> When start sending a new message clear the Rx & Tx buffer pointers in
>> order to avoid using stale pointers.
>>
>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> ---
>> I noticed an ambigous stack corruption once my rtc-pcf85063 driver probes.
>>
>> [    2.695684] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: pcf85063_rtc_read_time+0x10/0x100
>> [    2.706669] CPU: 1 PID: 63 Comm: kworker/u8:2 Not tainted 6.2.0-rc6-next-20230130+ #1185 ca067559321ae817c063baccdba80d328f10f73
>> [    2.718331] Hardware name: TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (DT)
>> [    2.724866] Workqueue: events_unbound deferred_probe_work_func
>> [    2.730712] Call trace:
>> [    2.733161]  dump_backtrace+0x9c/0x11c
>> [    2.736914]  show_stack+0x14/0x1c
>> [    2.740232]  dump_stack_lvl+0x5c/0x78
>> [    2.743907]  dump_stack+0x14/0x1c
>> [    2.747225]  panic+0x34c/0x39c
>> [    2.750283]  __ktime_get_real_seconds+0x0/0xc
>> [    2.754653]  pcf85063_ioctl+0x0/0xf0
>> [    2.758232]  __rtc_read_time+0x44/0x114
>> [    2.762081]  __rtc_read_alarm+0x258/0x460
>> [    2.766095]  __devm_rtc_register_device+0x174/0x2b4
>> [    2.770986]  pcf85063_probe+0x258/0x4d4
>> [    2.774825]  i2c_device_probe+0x100/0x33c
>>
>> The backtrace did not indicate the actual cause of it. Checking the code the
>> RTC driver seemed to be ok, so it has to be in the i2c bus driver.
>> At some point I noticed that I see both Rx and Tx interrupts at the same time,
>> which is odd. Also both rx_buf and tx_buf was set simultaneously. Clearly
>> a bug to me.
>> Clearing the buffer pointers upon each new i2c message triggered a NULL
>> pointer dereference:
>>
>> [    2.694923] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
>> [    2.703730] Mem abort info:
>> [    2.706525]   ESR = 0x0000000096000004
>> [    2.710278]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    2.715595]   SET = 0, FnV = 0
>> [    2.718653]   EA = 0, S1PTW = 0
>> [    2.721798]   FSC = 0x04: level 0 translation fault
>> [    2.726680] Data abort info:
>> [    2.729556]   ISV = 0, ISS = 0x00000004
>> [    2.733387]   CM = 0, WnR = 0
>> [    2.736358] [0000000000000001] user address but active_mm is swapper
>> [    2.742719] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> [    2.748990] Modules linked in:
>> [    2.752051] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.2.0-rc6-next-20230130+ #1184 44a8abebca6bfabc93e20ac52bce
>> 47da7f92cec1
>> [    2.763368] Hardware name: TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (DT)
>> [    2.769902] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    2.776868] pc : lpi2c_imx_write_txfifo+0x44/0xb0
>> [    2.781585] lr : lpi2c_imx_isr+0x60/0x8c
>> [    2.785512] sp : ffff800008003ef0
>> [    2.788831] x29: ffff800008003ef0 x28: ffff8000099c1ec0 x27: 00000000bfe632c8
>> [    2.795980] x26: 0000000000000000 x25: ffff800009b935ed x24: ffff800009a4d4c0
>> [    2.803130] x23: ffff00000365e800 x22: 0000000000000128 x21: 0000000000000000
>> [    2.810280] x20: ffff0000033f4080 x19: 0000000003000103 x18: 0000000000000000
>> [    2.817430] x17: ffff80003688a000 x16: ffff800008000000 x15: 0000000000000000
>> [    2.824579] x14: 0000000000000000 x13: ffff8000099d1db8 x12: 0000000000000000
>> [    2.831729] x11: ffff800009503180 x10: 0000000000000a80 x9 : ffff8000099b3d20
>> [    2.838879] x8 : ffff8000099c29a0 x7 : 00000000000000c0 x6 : ffff000002838028
>> [    2.846029] x5 : 0000000000000002 x4 : 0000000000000000 x3 : 0000000000000000
>> [    2.849626] imx-scu system-controller: RPC send msg timeout
>> [    2.853178] x2 : ffff800009c88060 x1 : 0000000000000001 x0 : ffff0000033f4080
>> [    2.858764]  enet1: failed to power off resource 252 ret -110
>> [    2.865897] Call trace:
>> [    2.865901]  lpi2c_imx_write_txfifo+0x44/0xb0
>> [    2.878443]  __handle_irq_event_percpu+0x5c/0x188
>> [    2.883151]  handle_irq_event+0x48/0xb0
>>
>> $ ./scripts/faddr2line build_arm64/vmlinux lpi2c_imx_write_txfifo+0x44/0xb0
>> lpi2c_imx_write_txfifo+0x44/0xb0:
>> lpi2c_imx_write_txfifo at drivers/i2c/busses/i2c-imx-lpi2c.c:364
>>
>> This now clearly pinpoints the wrong access which previously corrupted the
>> stack. The error leading to this wrong access is addressed in the
>> following patch.
>>
>>   drivers/i2c/busses/i2c-imx-lpi2c.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
>> index 188f2a36d2fd..c6d0225246e6 100644
>> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
>> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
>> @@ -463,6 +463,8 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>>           if (num == 1 && msgs[0].len == 0)
>>               goto stop;
>> +        lpi2c_imx->rx_buf = NULL;
>> +        lpi2c_imx->tx_buf = NULL;
>>           lpi2c_imx->delivered = 0;
>>           lpi2c_imx->msglen = msgs[i].len;
>>           init_completion(&lpi2c_imx->complete);
> 
> Hello,
> I have same problem with rtc-ds1307 driver and NXP imx8x (using ic2-imx-lpi2c.c bus driver).
> I do not have the full stack trace but I'm sure is very similar:
> [   10.750015] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: ds1307_get_time+0x2a4/0x2c4 [rtc_ds1307]
> 
> Your patches are fixing this too and they seem good to me.
> About the [2/2] patch your approach sound better to me than the downstream approach.
> 
> Emanuele Ghidoli
> 
> 
> 
> 
Hello,
maybe it is worth to tag also with "Fixes:"... I do not know if it was here from the first commit introducing the driver.

Best regards,

Emanuele
