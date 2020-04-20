Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6921B1932
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 00:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgDTWMp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 18:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgDTWL4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 18:11:56 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF6FC061A10;
        Mon, 20 Apr 2020 15:11:54 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id f8so9388244lfe.12;
        Mon, 20 Apr 2020 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=abFbgX87P6tAnngWJgvkhVgQGkIjr5+FFEpq/JTP/jU=;
        b=KD4n+qztQ6/5Q3z2PmENqx3lf2RXWCeoCdWGi+XO/88jmq5AHCnx0931o0pPnBWdsU
         Y59M/CMkSOO1PGPkbyESSKGJH2NTzWZ5x37Mn9kCM0N0NBwqhbAyrvWoOWsFlaNe4oi4
         4huij4+vpltW0vvwtnR1JmuJrIfKdsG6IsWeq35BBM9rYfIKKZ8NLh3FWCxUCpAAclos
         yPgqev310P7zkr1Z1snIOftQIzOpc4TJDuSS8zjCY9YulCkxoSGjmS0nfqwC5VbUDHFT
         rBVG2EbkN3TUmlISvWOtKIZCTZJzRnWWrIR5EF2HPJUORNUr3YnDM38kEBu5kw89kG/v
         VBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=abFbgX87P6tAnngWJgvkhVgQGkIjr5+FFEpq/JTP/jU=;
        b=KYZhnHZS1JIo6mzEQiDSCaRktkemt+B7f7f4Q//cNi/kCNWc8sW+942phHYT3wfEIR
         2wBHGW6Ff2hybezKki7GqrLoi4pvmCiMs1PcI+DTOcrucEC8WM1JRQisrs1zMdsZq8zT
         sDiyrE7+iCDWYCjfMAsIXQ47JMMdLUwDWXLN3/BSolfAlg3i4sZQwl5iMQ0pEdyLIiNx
         zIjAD6z/SUFCJmiHKpgqXn+APrLtcW3k7YMke47K5y+YsqKUBg8UPDEWKRxVnAzusvCR
         /mnhzk3E+/sBkzisbXw34iyN9XGubS3SdE+X3fCCd7ZElISijmDyiEedvufjQxkEdch5
         dsHQ==
X-Gm-Message-State: AGi0PuY4JgpxBRZrlDDRrmvFKLv4X1NwoN+JUd+Q0QhtiQmWN0OcVvS5
        gwfQYdWGEQs/gWI7zyjX2pTRotyF
X-Google-Smtp-Source: APiQypIqhUkyTJ1w3sh1RFsLXiR48di+nL25yPfMP5Doa+OZOE4dKNUFmcN+RedNEHh3sK+FktfHPg==
X-Received: by 2002:ac2:5109:: with SMTP id q9mr11684389lfb.145.1587420712928;
        Mon, 20 Apr 2020 15:11:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id l8sm497031ljo.5.2020.04.20.15.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 15:11:52 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
Date:   Tue, 21 Apr 2020 01:11:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Jon,

20.04.2020 22:53, Jon Hunter пишет:
> Hi Dmitry,
> 
> On 24/03/2020 19:12, Dmitry Osipenko wrote:
>> Boot CPU0 always handle I2C interrupt and under some rare circumstances
>> (like running KASAN + NFS root) it may stuck in uninterruptible state for
>> a significant time. In this case we will get timeout if I2C transfer is
>> running on a sibling CPU, despite of IRQ being raised. In order to handle
>> this rare condition, the IRQ status needs to be checked after completion
>> timeout.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> 
> I have noticed a regression on tegra30-cardhu-a04 when testing system
> suspend. Git bisect is pointing to this commit and reverting it fixes
> the problem. In the below console log I2C fails to resume ...
> 
...
> [   60.690035] PM: Device 3000.pcie failed to resume noirq: error -16

...
> [   60.696859] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: EMEM address decode error (SMMU translation error [--S])
> 
> [   60.708876] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: Page fault (SMMU translation error [--S])

This looks very wrong, the error tells that 3d hardware is active and
doing something odd. Are you running some 3d tests?

...
> Have you seen this?

No, I haven't seen that. I'm not using PCIE and it looks like it's the
problem.

Looking at the PCIE driver code, seems it's not syncing the RPM state on
suspend/resume.

Please try this change:

--- >8 ---
diff --git a/drivers/pci/controller/pci-tegra.c
b/drivers/pci/controller/pci-tegra.c
index 3e64ba6a36a8..b1fcbae4109c 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2870,8 +2870,8 @@ static int __maybe_unused
tegra_pcie_pm_resume(struct device *dev)

 static const struct dev_pm_ops tegra_pcie_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_pcie_pm_suspend, tegra_pcie_pm_resume, NULL)
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_pcie_pm_suspend,
-				      tegra_pcie_pm_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 };


 static struct platform_driver tegra_pcie_driver = {
--- >8 ---

Secondly, I2C driver suspends on NOIRQ level, while APBDMA driver
suspends on default level. This is also wrong, please try to apply this
hunk as well:

--- >8 ---
diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index f6a2f42ffc51..e682ac86bd27 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1653,7 +1653,7 @@ static int __maybe_unused
tegra_dma_dev_resume(struct device *dev)
 static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
 			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
 };

 static const struct of_device_id tegra_dma_of_match[] = {
--- >8 ---
