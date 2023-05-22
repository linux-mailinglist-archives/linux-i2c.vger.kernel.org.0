Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A094A70BCE2
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 14:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbjEVMEw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 08:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233624AbjEVMEv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 08:04:51 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57484A0
        for <linux-i2c@vger.kernel.org>; Mon, 22 May 2023 05:04:48 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-30789a4c537so3884456f8f.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 May 2023 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684757087; x=1687349087;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XmGSkIC15ZBdqEyVUHdk4p0WQzlHdQ5XyKYa3D0QoFA=;
        b=P8Pl0wzG47Mrb4LOoe4y8hQKWb8XRQlBbaXjAcCoNfohmbC1mNS2da3YGTc3r9qjgi
         5lbalTBg89BSBDYeFYJWRMh4n7AnDXbvgl+qYkaLINDiwc6Qp33EAjPDKF1pyHLvLCEa
         Doj2qzzqwDDlFR77+CIeQCTSQSVhm7b1vci1Xgq5/j7ZjLS1sC0+7u3iMEkGCKw7KQtp
         f+5/YIddIgz6yfe1tR1kvHw1qukDRrYBi7h74/mEkRHHgf/K7775wFsBj/reyUdgQsp7
         MgWA/nos/X0+07fLcpACtyfAU+puf7nncoDXm9Qq5jLy1qWPjWbHyOO+Tv6xzg20o3wp
         Pp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757087; x=1687349087;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmGSkIC15ZBdqEyVUHdk4p0WQzlHdQ5XyKYa3D0QoFA=;
        b=GX/3SNvBP8CEmPjjNJZzk02B1xdUz7vCMZ0l86OjTP3hRAB/FANNLJWRPkxOqm7AqM
         K2UUF9k0Xs/7oDIuAch6iJPMYwHDnNHBiapgeAAz/JQqsG6+V9nr8V0RmE+ry+/CvxwM
         EkD1TTDvN86HY8xTkfi2wb8wp9d1gw8x+2IQ6zqRf3oiVRdxPa1MNdWVp8OtNY4eWuPs
         Qb0oNay6jd3JZi49wV4DyaBba6vD8q7lyZuzgf7E8Vn7YcAg92LFJVxfv9XIn5mAE2aR
         P1H0m+iO/fO5zDtQyYyJSGHUROJM99ankizNdPZXMK6+ujEVV8HZw+weAEaO3rnj5dQO
         bq4Q==
X-Gm-Message-State: AC+VfDxF0cDtbu7c6upObXwpIx5NoBk6HQzi/Sd8ydotdyc8vftQPrk/
        xcwGKHeSH+9ASiw7qCE5RuJEqg==
X-Google-Smtp-Source: ACHHUZ6HlF5QXNP0Yse6sMgYpKn/I5NauhHUsC+IEQLh2V/f1AUEzxrr3i8XFI2XIG5GRtTuSwwnnQ==
X-Received: by 2002:a5d:6509:0:b0:306:2b5a:d8db with SMTP id x9-20020a5d6509000000b003062b5ad8dbmr7866960wru.23.1684757086606;
        Mon, 22 May 2023 05:04:46 -0700 (PDT)
Received: from [192.168.1.91] (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id i7-20020a5d55c7000000b003079ed1f0a0sm7560047wrw.44.2023.05.22.05.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 05:04:46 -0700 (PDT)
Message-ID: <f02c52d4-a301-eb72-02b8-0c0003aac6be@baylibre.com>
Date:   Mon, 22 May 2023 14:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: RCU WARNING on 6.4-rc2, TI AM62 and TPS65219
Content-Language: en-US
From:   jerome Neanne <jneanne@baylibre.com>
To:     Francesco Dolcini <francesco@dolcini.it>, nm@ti.com,
        lee@kernel.org, tony@atomide.com, vigneshr@ti.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <ZGeHMjlnob2GFyHF@francesco-nb.int.toradex.com>
 <1a0a796c-497f-41a5-2f76-493c09e29325@baylibre.com>
In-Reply-To: <1a0a796c-497f-41a5-2f76-493c09e29325@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 22/05/2023 11:27, jerome Neanne wrote:
> 
> 
> On 19/05/2023 16:26, Francesco Dolcini wrote:
>> Hello all,
>> while testing 6.4-rc2 (2d1bcbc6cd70) on a TI K3 AM625 SoC with TPS65219
>> PMIC I noticed this warning.
>>
>> [   80.117502] systemd-shutdown[1]: All loop devices detached.
>> [   80.123176] systemd-shutdown[1]: Stopping MD devices.
>> [   80.128700] systemd-shutdown[1]: All MD devices stopped.
>> [   80.134123] systemd-shutdown[1]: Detaching DM devices.
>> [   80.139553] systemd-shutdown[1]: All DM devices detached.
>> [   80.144970] systemd-shutdown[1]: All filesystems, swaps, loop 
>> devices, MD devices and DM devices detached.
>> [   80.162682] systemd-shutdown[1]: Syncing filesystems and block 
>> devices.
>> [   80.169602] systemd-shutdown[1]: Rebooting.
>> [   80.173817] kvm: exiting hardware virtualization
>> [   80.213016] reboot: Restarting system
>> [   80.216767] ------------[ cut here ]------------
>> [   80.221380] Voluntary context switch within RCU read-side critical 
>> section!
>> [   80.221404] WARNING: CPU: 0 PID: 1 at kernel/rcu/tree_plugin.h:318 
>> rcu_note_context_switch+0x31c/0x390
>> [   80.237669] Modules linked in: 8021q garp mrp stp llc cfg80211 
>> usb_f_ncm u_ether bluetooth ecdh_generic ecc rfkill sp
>> idev crct10dif_ce snd_soc_simple_card snd_soc_simple_card_utils 
>> rtc_ti_k3 sa2ul sha256_generic libsha256 authenc snd_soc
>> _davinci_mcasp snd_soc_ti_udma snd_soc_ti_edma snd_soc_ti_sdma 
>> ti_ads1015 ina2xx industrialio_triggered_buffer pwm_tiehr
>> pwm snd_soc_nau8822 tps65219_pwrbutton lm75 kfifo_buf spi_omap2_mcspi 
>> rtc_ds1307 libcomposite fuse drm ipv6
>> [   80.278507] CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 
>> 6.4.0-rc2-00166-gf932e7bb873b #3
>> [   80.286938] Hardware name: Toradex Verdin AM62 on Verdin 
>> Development Board (DT)
>> [   80.294238] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS 
>> BTYPE=--)
>> [   80.301193] pc : rcu_note_context_switch+0x31c/0x390
>> [   80.306154] lr : rcu_note_context_switch+0x31c/0x390
>> [   80.311114] sp : ffff80000a71b4c0
>> [   80.314422] x29: ffff80000a71b4c0 x28: 0000000000000000 x27: 
>> ffff000000118000
>> [   80.321556] x26: 0000000000000000 x25: ffff000000118000 x24: 
>> ffff800008fafbd8
>> [   80.328689] x23: ffff000000118000 x22: 0000000000000000 x21: 
>> ffff000000118000
>> [   80.335822] x20: 0000000000000000 x19: ffff00003fd68cc0 x18: 
>> 0000000000000010
>> [   80.342955] x17: 0000000000000000 x16: 0000000000000000 x15: 
>> ffff000000118000
>> [   80.350087] x14: 00000000000001c5 x13: ffff000000118478 x12: 
>> 00000000ffffffea
>> [   80.357220] x11: 00000000ffffefff x10: 00000000ffffefff x9 : 
>> ffff80000a2a9a98
>> [   80.364352] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 
>> 000000000000bff4
>> [   80.371485] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : 
>> 0000000000000000
>> [   80.378617] x2 : ffff80000a251990 x1 : 0000000000000000 x0 : 
>> 0000000000000000
>> [   80.385751] Call trace:
>> [   80.388193]  rcu_note_context_switch+0x31c/0x390
>> [   80.392807]  __schedule+0x98/0xa7c
>> [   80.396214]  schedule+0x5c/0xc4
>> [   80.399354]  schedule_timeout+0x180/0x25c
>> [   80.403362]  wait_for_completion_timeout+0x80/0x15c
>> [   80.408238]  ti_sci_set_device_state+0xb4/0x1e4
>> [   80.412771]  ti_sci_cmd_get_device_exclusive+0x18/0x24
>> [   80.417907]  ti_sci_pd_power_on+0x28/0x48
>> [   80.421914]  _genpd_power_on+0x94/0x154
>> [   80.425749]  genpd_power_on.part.0+0xa4/0x174
>> [   80.430104]  genpd_runtime_resume+0x118/0x294
>> [   80.434457]  __rpm_callback+0x48/0x140
>> [   80.438206]  rpm_callback+0x6c/0x78
>> [   80.441692]  rpm_resume+0x3bc/0x59c
>> [   80.445179]  __pm_runtime_resume+0x4c/0x90
>> [   80.449272]  omap_i2c_xfer_common+0x38/0x598
>> [   80.453540]  omap_i2c_xfer_polling+0x14/0x20
>> [   80.457804]  __i2c_transfer+0x138/0x35c
>> [   80.461642]  i2c_transfer+0x94/0xf4
>> [   80.465130]  regmap_i2c_read+0x60/0xa8
>> [   80.468879]  _regmap_raw_read+0xf0/0x170
>> [   80.472799]  _regmap_bus_read+0x44/0x7c
>> [   80.476632]  _regmap_read+0x64/0xf4
>> [   80.480118]  _regmap_update_bits+0xf4/0x130
>> [   80.484298]  regmap_update_bits_base+0x64/0x98
>> [   80.488738]  tps65219_restart+0x38/0x48
>> [   80.492576]  atomic_notifier_call_chain+0x60/0x90
>> [   80.497280]  do_kernel_restart+0x24/0x30
>> [   80.501202]  machine_restart+0x38/0x5c
>> [   80.504950]  kernel_restart+0x88/0x98
>> [   80.508612]  __do_sys_reboot+0x1e0/0x264
>> [   80.512533]  __arm64_sys_reboot+0x24/0x30
>> [   80.516538]  invoke_syscall+0x44/0x104
>> [   80.520287]  el0_svc_common.constprop.0+0x44/0xec
>> [   80.524988]  do_el0_svc+0x38/0x98
>> [   80.528302]  el0_svc+0x2c/0x84
>> [   80.531354]  el0t_64_sync_handler+0xb8/0xbc
>> [   80.535534]  el0t_64_sync+0x190/0x194
>> [   80.539192] ---[ end trace 0000000000000000 ]---
>>
>>
>> This looks similar to what is described here [1], same issue or
>> something else? Any suggestion?
>>
>> The issue is systematic and happens at every boot. With a TI downstream
>> 5.10 kernel this issue was never experienced.
>>
>> Francesco
>>
>> [1] 
>> https://lore.kernel.org/all/20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com/
>>
> I don't have the same board to test and don't experience this boot issue 
> with the am62 board I'm using (the board version I have is a custom 
> board not released publicly by TI unfortunately).
> 
> Notice that: 
> https://lore.kernel.org/lkml/20230511122100.2225417-1-jneanne@baylibre.com/
> 
> Is not yet applied and would help handle shutdown/reboot under some 
> conditions.
> 
> This might help for reboot handling if you are forcing a shutdown/reboot 
> in your test.
> 
> But if the problem is your device tries to shutdown at each boot, then 
> this is just a side effect, not the original root cause.
> 
> Regards,
> Jerome
More background in thread:
Link: https://lore.kernel.org/all/7hfseqa7l0.fsf@baylibre.com/

This explains why downstream is different on that point.
