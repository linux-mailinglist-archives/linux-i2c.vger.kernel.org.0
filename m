Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82DE1B787E
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 16:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgDXOp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 10:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726900AbgDXOp6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 10:45:58 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE7FC09B045;
        Fri, 24 Apr 2020 07:45:56 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t11so7889760lfe.4;
        Fri, 24 Apr 2020 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iH8/qrJUxibm5hpteaDetiyg70O8GZ3/bRpeHyBvoXI=;
        b=f6wIq6Wk8kdhjuc3xofRYuEZ7+tzwG8wSG/EE3Nn4aAROdSCN9Pm+WbRLPz44JiiJB
         6aN7qvcmIoI6wxSXCjGZSvQnrPD+erMdDrQ+EPpKBdxYg6Un57s/GnQWSu8EoK48ck5t
         XgAFvWXYqaVCeZjOQi8TZsSq/gTlBecGXVNUmahhCMSOrUr0ifdDsFUP4OzD/nI6xknF
         hHJ19kdg3TYvT9c4YAaAbyFqIatcQ/KX7cGwx0e3lJXMlIVGA+y1Nr/PIqQRWQPIueUO
         wz0PFLpoz2kYPwBstpM9K5BZK5c35lVHR8PBAc8LW5uN+O6HQAhGXgWj2IRKc0p57i3K
         Cu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iH8/qrJUxibm5hpteaDetiyg70O8GZ3/bRpeHyBvoXI=;
        b=nUUS7NiYUX80p+vqFvJXVXbjwynzFooO47b9udkkdRZMvIYkt5n8nUglOGBj8q1iiU
         vYgj5sFDwAk6ypwAQy099cMkGJjrzXgf/GAKsRB5laQt7nSJz02aVNsFJEi8Ya/FEbNW
         kyPKjOZVxy9ufTosrlWKAwjwXAlz6WInHAMb4t1YKBqTg4wcM/x7dwkBG942lXkGeRWb
         xl0oITqtHZA/KzmFy7+CNaYEGfh2/5lFXveGAENHT+xKWcpAYh2TPTLiO1qpaCcP0OMH
         4YjiWThOzhMDrREZhnGD+uSukbwaA7Kad8U5QwuGCqCcRU3KsagSLkCmS58frnQsuoi3
         ibQg==
X-Gm-Message-State: AGi0PuZ0dhzvirljkuu4U3BsH4R6XxDVv7n6ycmdn+ML29G8hQrj2hi3
        Y9zd3j8ahG8ITIcFV2CvcgiK9EzS
X-Google-Smtp-Source: APiQypL7gVL6/UUdwYXz5Cw3+FkoespAOslKOehWov9NzOrKa0wNhB8XxfWO5o9Et+pdntpDReBXtQ==
X-Received: by 2002:ac2:5b92:: with SMTP id o18mr3036957lfn.140.1587739552624;
        Fri, 24 Apr 2020 07:45:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r206sm4596060lff.65.2020.04.24.07.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 07:45:50 -0700 (PDT)
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
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
Date:   Fri, 24 Apr 2020 17:45:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.04.2020 10:10, Jon Hunter пишет:
...
>> Could you please clarify why pm_runtime_get_sync() can't be used by the
>> I2C driver's in NOIRQ phase?
> 
> Yes take a look at commit 1e2ef05bb8cf ("PM: Limit race conditions
> between runtime PM and system sleep (v2)").

I2C driver now uses irq-safe RPM since ede2299f7 ("i2c: tegra: Support
atomic transfers"), and thus, the RPM's workqueue shouldn't be a
problem. I guess RPM should work fine in this case, don't you think so?

...
>> Yes, keeping PCI regulators always-enabled should be a good immediate
>> solution.
> 
> I was thinking about that, and I am not sure it is. I don't think that
> the failure to send the I2C command should break suspend.

It shouldn't, but looks like it should be a separate problem.

....
> So I confirmed that DMA is not the issue in this case. I tested this by
> ensuring that DMA is never used. However, it is a potential problem
> indeed.
> 
>> Could you please try to apply this hunk and see if it makes any
>> difference (I'll probably make it as proper patch):
> 
> Per my tests, I don't believe that it will as disabling DMA does not
> resolve the problem.
> 
>> It also could be that there is more than the suspend ordering problem,
>> but for now it is hard to tell without having a detailed log which
>> includes I2C/DMA/RPM traces.
> 
> I have taken a look and I don't see any issues with ordering. I2C is
> suspended after PCI. This did not change.

Do you see a "completion done after timeout" messages in the KMSG log of
the v5.6 kernel?

Could you please try this hunk? Although, I'll be surprised if it
changes anything.

--- >8 ---
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 36d7114823ce..7196084b15fd 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1028,6 +1028,13 @@ tegra_i2c_wait_completion_timeout(struct
tegra_i2c_dev *i2c_dev,
 						  msecs_to_jiffies(timeout_ms));
 		disable_irq(i2c_dev->irq);

+		/*
+		 * There is a chance that completion may happen after IRQ
+		 * synchronization, which is done by disable_irq().
+		 */
+		if (ret == 0 && completion_done(complete))
+			ret = 1;
+
 		/*
 		 * Under some rare circumstances (like running KASAN +
 		 * NFS root) CPU, which handles interrupt, may stuck in
--- >8 ---
