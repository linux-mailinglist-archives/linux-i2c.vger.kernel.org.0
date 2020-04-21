Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807121B1ACB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 02:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDUAc0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 20:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDUAc0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 20:32:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFF8C061A0E;
        Mon, 20 Apr 2020 17:32:25 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b2so6635409ljp.4;
        Mon, 20 Apr 2020 17:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=apq/RLfjYv0YDyu8GBqv1exLqtHkHXnWr/cJuRiuvS0=;
        b=ACFOzSBnckddFmnEK5mTW7ybKw5Jvv5LyXrZAMJ3GuUhEXnYlo6ALwtIg9SKuKwgI2
         M/dhaVRx+yZr9rZp+miE8NgNpj2V1EHo20vx5CaYmu5XE+P86OYxUhAfqRUwqusl6c00
         gwY8L19ghkNTIpn+WIv7I0ojlE9SW+idBZrwUpZuUES0cSw19tAD8W8r6Tx2zKDcNYA2
         lgNQ3pLpkr4NFjHtJ7GrgJm+3M3GSx2AfdM4rs5BUoLiWV7YfKJ0yZs3LO/J4YfGHrwu
         tFIN6elpTCHV1SeD1U0Igwn3aeJELO5vDD4R0fQZ0r7X9D0o5q337y1A0jEqWjKLlbGj
         sETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=apq/RLfjYv0YDyu8GBqv1exLqtHkHXnWr/cJuRiuvS0=;
        b=F5fZ2HCxdbCiTjbpDHd3ZJF1YUdjPBfMDNM8xea38XphvcNYX6slrSgj1D0CMrPYGv
         COQ46IreLbfexZhIhw9G/n3ymxwmC0hNfmktYmNtu5iNLG2VmDfXGIcPICCaj3X94ibd
         DpEPu0n99QABIlgVMHNqq1cRu++VQuvHt/p+9ZVTOBhvSliKRuebzjo2sqYU3GatrPdD
         5/ilxjlHOAsSEmCbGwF6qmBR/PGHlv+7QHVoc3ghPlq2bz1h4U2cQ5GEPQ7F4DoRjcEf
         X66GqJeVLrAZFaCDWdj/oukgcpz2mUA5qPh8nKykXJAIAm+qa8InAVqkgH0jVj3vRuJT
         31Fw==
X-Gm-Message-State: AGi0PuYy52RH4c3SKEFHqfx7Qa9z4lewXd3yYIIs70krpD7vIQTWn83D
        GuIxdh64r2SKY0LtW7mvGVQ1HzdU
X-Google-Smtp-Source: APiQypI5pGCewSX9QhoeXjxD2fBti+MHlL1aznoOLACMyJDHxENhxXPfejR6n89b5x7e/LZHGY4yeQ==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr11498097lji.31.1587429143633;
        Mon, 20 Apr 2020 17:32:23 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 78sm638526ljf.76.2020.04.20.17.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 17:32:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
Message-ID: <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
Date:   Tue, 21 Apr 2020 03:32:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.04.2020 01:11, Dmitry Osipenko пишет:
> Hello Jon,
> 
> 20.04.2020 22:53, Jon Hunter пишет:
>> Hi Dmitry,
>>
>> On 24/03/2020 19:12, Dmitry Osipenko wrote:
>>> Boot CPU0 always handle I2C interrupt and under some rare circumstances
>>> (like running KASAN + NFS root) it may stuck in uninterruptible state for
>>> a significant time. In this case we will get timeout if I2C transfer is
>>> running on a sibling CPU, despite of IRQ being raised. In order to handle
>>> this rare condition, the IRQ status needs to be checked after completion
>>> timeout.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>>>  1 file changed, 15 insertions(+), 12 deletions(-)
>>
>>
>> I have noticed a regression on tegra30-cardhu-a04 when testing system
>> suspend. Git bisect is pointing to this commit and reverting it fixes
>> the problem. In the below console log I2C fails to resume ...
>>
> ...
>> [   60.690035] PM: Device 3000.pcie failed to resume noirq: error -16
> 
> ...
>> [   60.696859] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: EMEM address decode error (SMMU translation error [--S])
>>
>> [   60.708876] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: Page fault (SMMU translation error [--S])
> 
> This looks very wrong, the error tells that 3d hardware is active and
> doing something odd. Are you running some 3d tests?
> 
> ...
>> Have you seen this?
> 
> No, I haven't seen that. I'm not using PCIE and it looks like it's the
> problem.
> 
> Looking at the PCIE driver code, seems it's not syncing the RPM state on
> suspend/resume.
> 
> Please try this change:
> 
> --- >8 ---
> diff --git a/drivers/pci/controller/pci-tegra.c
> b/drivers/pci/controller/pci-tegra.c
> index 3e64ba6a36a8..b1fcbae4109c 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2870,8 +2870,8 @@ static int __maybe_unused
> tegra_pcie_pm_resume(struct device *dev)
> 
>  static const struct dev_pm_ops tegra_pcie_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_pcie_pm_suspend, tegra_pcie_pm_resume, NULL)
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_pcie_pm_suspend,
> -				      tegra_pcie_pm_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)
>  };
> 
> 
>  static struct platform_driver tegra_pcie_driver = {
> --- >8 ---
> 
> Secondly, I2C driver suspends on NOIRQ level, while APBDMA driver
> suspends on default level. This is also wrong, please try to apply this
> hunk as well:
> 
> --- >8 ---
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index f6a2f42ffc51..e682ac86bd27 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1653,7 +1653,7 @@ static int __maybe_unused
> tegra_dma_dev_resume(struct device *dev)
>  static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
>  			   NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
>  };
> 
>  static const struct of_device_id tegra_dma_of_match[] = {
> --- >8 ---
> 

Although, I'm now having a second though about the APBDMA change... I'm
recalling that there are some complications in regards to PCIE driver
suspending, requiring it to be at NOIRQ level, but this should be wrong
because PCIE driver uses voltage regulator driver at NOIRQ level, while
regulator drivers suspend on default level. The current behavior of the
PCIE driver should be wrong, I think it needs to be moved to the default
suspend-resume level somehow.
