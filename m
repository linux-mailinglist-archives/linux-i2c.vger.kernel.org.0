Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC781B6108
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Apr 2020 18:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgDWQdq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Apr 2020 12:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729407AbgDWQdq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Apr 2020 12:33:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F4FC09B041;
        Thu, 23 Apr 2020 09:33:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a21so6874739ljb.9;
        Thu, 23 Apr 2020 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tAn1shUBNNakvYCQL+s6mMcCDRrVLS5bHorftkCoepw=;
        b=F/sDkbg9eR9uOa3Ziuy7wuAPTZdYr3C4xlrE793YbjCkgvCCwv4f1kRw4pVa1scuTi
         VmmVDU2mLAWRBfG5uhiPuEQOu3l7hJTRbujcT9dttF8QjldZdiMFnwCHhBSf+9SHKbBd
         bcBINMVHHZwCYExvpG8uRi84L79NcLAguqwTWcHAyN/pxIY4zfqUxWkJIF0J+S3tYw6T
         LYOhxBt5w4TFMC1sJydAW+j8oN7NJ5KYJWHESQGP/fNOItXVjLq+6i8dwkqzF2nq+Cnk
         QSb1PNh8bBqYmUmyeOTUXtL9BpDCp97ckrRniEpP8fXHT/anyEnS91/IOg/6s4mNPZAz
         A1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tAn1shUBNNakvYCQL+s6mMcCDRrVLS5bHorftkCoepw=;
        b=byIOpp5guWA/JNJbDEI5R6iM3vbrwm6+uCbAYPNIqj6hG64IYvlFzgDTYV8eiD9yvt
         utmDujoLw8kJrpSKayoAOkGj4zymCix8wZQQ4nwHaKXT9DTuJPR4Ykqp4vSa9pVLJPUV
         jrFZ8MA18PWlQYggKWAdqcyvp+z0RsFwxOadYeSxKMklD92xRqxZTMNoKe2SVNKluvlY
         w9MgRH8gchowyBoSYXQIkB6iVR/WGaALHfA0Lit6rtdnM+hrAxF6318cCXWLCSc2EEQy
         XomLdWp7PPHlQFp5eYTNfwypw7pQHjc3dti0G2KcGgjAPd++5WoUGGHDiD4OTMWOZTEh
         wEMQ==
X-Gm-Message-State: AGi0PubW6G9WUoh3lBAbXfCcb9gcsQgJJCQ3DJm8DQ5mX5ZrCh/NaQDa
        EHQO0tup6D86PWPHjFo+J5lWBsym
X-Google-Smtp-Source: APiQypL1iVIogi3rRVYwY+/ni9SjumEkAptLvW+9rxUc9zq2PVTO6ihJP5Gh1pvA1xhNnIkP+/WWMg==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr2975652ljj.112.1587659624165;
        Thu, 23 Apr 2020 09:33:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o16sm2420603ljp.53.2020.04.23.09.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 09:33:43 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
 <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
Date:   Thu, 23 Apr 2020 19:33:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.04.2020 13:56, Jon Hunter пишет:
> 
> On 22/04/2020 15:07, Dmitry Osipenko wrote:
> 
> ...
> 
>>> So I think that part of the problem already existed prior to these
>>> patches. Without your patches I see ...
>>>
>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>
>> Does this I2C timeout happen with my patches? Could you please post full
>> logs of an older and the recent kernel versions?
> 
> I believe that it does, but I need to check.
> 
>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>>
>>> [   59.553778] Failed to disable avdd-plle: -110
>>>
>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>>>
>>>
>>> However, now with your patches the i2c is failing to resume and this
>>> breaks system suspend completely for Tegra30. So far this is the only
>>> board that appears to break.
>>>
>>> So the above issue needs to be fixed and I will chat to Thierry about this.
>>
>> Okay
> 
> So I have been looking at this some more and this starting to all look a
> bit of a mess :-(
> 
> Firstly, the Tegra PCI driver suspends late (noirq) as we know. The PCI
> driver will warn if it cannot disable the regulators when suspending but
> does not actually fail suspend. So this warning is just indicating that
> we were unable to disable the regulators.
> 
> Now I don't see that we can ever disable the PCI regulators currently
> when entering suspend because ...
> 
> 1. We are in the noirq phase and so we will not get the completion
>    interrupt for the I2C transfer. I know that you recently added the
>    atomic I2C transfer support, but we can get the regulator framework
>    to use this (I have not looked in much detail so far).

That's not good :) I didn't realize that *all* interrupts of every
device are disabled before .noirq is invoked. It appeared to me that the
IRQs disabling and .noirq invocation is performed for the drivers one
after another, but now I see that it's not true.

https://elixir.bootlin.com/linux/v5.7-rc2/source/drivers/base/power/main.c#L1446

> 2. Even if the regulator framework supported atomic I2C transfers, we
>    also have the problem that the I2C controller could be runtime-
>    suspended and pm_runtime_get_sync() will not work during during this
>    phase to resume it correctly. This is a problem that needs to be
>    fixed indeed!

Could you please clarify why pm_runtime_get_sync() can't be used by the
I2C driver's in NOIRQ phase?

> 3. Then we also have the possible dependency on the DMA driver that is
>    suspended during the noirq phase.

Yes, this is correct.

Again, some regulator drivers may do something on suspend too, although
looks like the current upstream Tegra devices are not affected by this
potential problem.

> It could be argued that if the PCI regulators are never turned off
> (currently) then we should not even bother and this will likely resolve
> this for now. However, really we should try to fix that correctly.

Yes, keeping PCI regulators always-enabled should be a good immediate
solution.

Also, the RPM's system suspend/resume needs to fixed for the pci-tegra
driver, like I already suggested before.

> What I still don't understand is why your patch breaks resume. Even if
> the I2C transfer fails, and is deemed harmless by the client driver, we
> should still be able to suspend and resume correctly.

If DMA is getting synchronized after DMA driver being suspended, then it
could be a problem.

Could you please try to apply this hunk and see if it makes any
difference (I'll probably make it as proper patch):

--- >8 ---
diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index a42c0b4d14ac..55fc7400f717 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -816,6 +816,13 @@ static bool
tegra_dma_eoc_interrupt_deasserted(struct tegra_dma_channel *tdc)
 static void tegra_dma_synchronize(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	int err;
+
+	err = pm_runtime_get_sync(tdc->tdma->dev);
+	if (err < 0) {
+		dev_err(tdc2dev(tdc), "Failed to synchronize DMA: %d\n", err);
+		return;
+	}

 	/*
 	 * CPU, which handles interrupt, could be busy in
@@ -825,6 +832,8 @@ static void tegra_dma_synchronize(struct dma_chan *dc)
 	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));

 	tasklet_kill(&tdc->tasklet);
+
+	pm_runtime_put(tdc->tdma->dev);
 }

 static unsigned int tegra_dma_sg_bytes_xferred(struct tegra_dma_channel
*tdc,
--- >8 ---

It also could be that there is more than the suspend ordering problem,
but for now it is hard to tell without having a detailed log which
includes I2C/DMA/RPM traces.

Lastly, it should be worthwhile to try to apply the WIP ARM32 KASAN
series and see what will happen using CONFIG_KASAN=y.

https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=230197
