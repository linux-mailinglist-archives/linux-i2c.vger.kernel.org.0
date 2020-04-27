Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808EE1BA641
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 16:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgD0OVe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 10:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgD0OVe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 10:21:34 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F5CC0610D5;
        Mon, 27 Apr 2020 07:21:33 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k28so13970579lfe.10;
        Mon, 27 Apr 2020 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=os2wxZikCHk4lPPRcIN9xVfK7EnF40hJmqoZHUeqBOY=;
        b=bWY/9b/uhSCLnSDkq28VEce1KtybvL18fneE2G2vRwvbKulIH41aQZ4ij8IXun7ndq
         6Nc6Ik+S8lETHonsvv/b2Wkbsejp9wjup0Ibuen07M+gOg9aTVvtDOs5DAAj5cDP75eq
         AUqZkkymzmjuHx8B7zjlR8VMptalKypZOCK/oksi+M+r73Azs5htA1cJIdIEKmjmN2e8
         E3UzQO8VnX99fnl1/gq+wbrkLcOicbg6xmD9sfLiE5PjNcTntqhoKHKiF4glt3XheyVO
         kZhztvFtS7MVPrW409Kom0YT79hNRk/JOQOEyUv4ETSHV8UOgULdft5S4ZRQkW0lm2Bd
         +Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=os2wxZikCHk4lPPRcIN9xVfK7EnF40hJmqoZHUeqBOY=;
        b=tynDOgAyk3viRiQQx9c2BwsCAhFhXpfujbcRYRzDrOnLwqXlUw37UeoFwV/b55WXzX
         CJ+zY5+mCrlnatebqgdjo5B0QomR1EB0YDHsiHoVzegJC+kyvgtjlbblhyMHCvSfVGjn
         837B57m7NfEhxC8WI0/6DtVUAnTl9h6BaH4YAhHHPKts1ZzT4Fez1aW64hcgmROt8vZL
         M2dMa0PW/R9Va1pXaQ0V0y27o1fOHXE2FfQmF5SOTqxdFa9lhLfZ7JoBOkrGTHSGmdRT
         oIDAwHc4gVBxPDxhNcjsaPAGvLYA11WYi1AcVtzP1KKiRZK565tZ0cIelgaZ6yfOanNY
         2IDQ==
X-Gm-Message-State: AGi0PuaiSY9K3iIOhoC/w4GrmpmawW9ROLMty+4/7H2ubcksWpnf7i/Y
        Vf4wo2xsZGk2Xa8y0GyGur1BR4df
X-Google-Smtp-Source: APiQypL5OkoT4ADX8Bbv2QCrYArfeVp/ykSHUymJxiZOPfBpqlBKw71QcvtRp5LTZ3VI06hm7KXA4Q==
X-Received: by 2002:a19:ae06:: with SMTP id f6mr15508793lfc.97.1587997292185;
        Mon, 27 Apr 2020 07:21:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m18sm11287611lfj.10.2020.04.27.07.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 07:21:31 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
Date:   Mon, 27 Apr 2020 17:21:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427110033.GC3464906@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 14:00, Thierry Reding пишет:
> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>> 27.04.2020 10:48, Thierry Reding пишет:
>> ...
>>>> Maybe but all these other problems appear to have existed for sometime
>>>> now. We need to fix all, but for the moment we need to figure out what's
>>>> best for v5.7.
>>>
>>> To me it doesn't sound like we have a good handle on what exactly is
>>> going on here and we're mostly just poking around.
>>>
>>> And even if things weren't working quite properly before, it sounds to
>>> me like this patch actually made things worse.
>>
>> There is a plenty of time to work on the proper fix now. To me it sounds
>> like you're giving up on fixing the root of the problem, sorry.
> 
> We're at -rc3 now and I haven't seen any promising progress in the last
> week. All the while suspend/resume is now broken on at least one board
> and that may end up hiding any other issues that could creep in in the
> meantime.
> 
> Furthermore we seem to have a preexisting issue that may very well
> interfere with this patch, so I think the cautious thing is to revert
> for now and then fix the original issue first. We can always come back
> to this once everything is back to normal.
> 
> Also, people are now looking at backporting this to v5.6. Unless we
> revert this from v5.7 it may get picked up for backports to other
> kernels and then I have to notify stable kernel maintainers that they
> shouldn't and they have to back things out again. That's going to cause
> a lot of wasted time for a lot of people.
> 
> So, sorry, I disagree. I don't think we have "plenty of time".

There is about a month now before the 5.7 release. It's a bit too early
to start the panic, IMO :)

Jon already proposed a reasonable simple solution: to keep PCIe
regulators always-ON. In a longer run we may want to have I2C atomic
transfers supported for a late suspend phase.

This should fix yours problem and it should go into stable kernels:

--- >8 ---
diff --git a/drivers/pci/controller/pci-tegra.c
b/drivers/pci/controller/pci-tegra.c
index 3e64ba6a36a8..6ac76323ca70 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1533,8 +1533,16 @@ static int tegra_pcie_get_resources(struct
tegra_pcie *pcie)
 		goto phys_put;
 	}

+	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
+	if (err) {
+		dev_err(dev, "failed to enable regulators: %d\n", err);
+		goto irq_free;
+	}
+
 	return 0;

+irq_free:
+	free_irq(pcie->irq, pcie);
 phys_put:
 	if (soc->program_uphy)
 		tegra_pcie_phys_put(pcie);
@@ -1545,6 +1553,12 @@ static int tegra_pcie_put_resources(struct
tegra_pcie *pcie)
 {
 	const struct tegra_pcie_soc *soc = pcie->soc;

+	err = regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
+	if (err) {
+		dev_err(pcie->dev, "failed to disable regulators: %d\n", err);
+		return err;
+	}
+
 	if (pcie->irq > 0)
 		free_irq(pcie->irq, pcie);
--- >8 ---
