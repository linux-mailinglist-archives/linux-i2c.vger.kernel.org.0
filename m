Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45B73FD3BF
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Sep 2021 08:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242300AbhIAGXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Sep 2021 02:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241794AbhIAGXV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Sep 2021 02:23:21 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B26EC061575
        for <linux-i2c@vger.kernel.org>; Tue, 31 Aug 2021 23:22:25 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id u15so1039778wmj.1
        for <linux-i2c@vger.kernel.org>; Tue, 31 Aug 2021 23:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N7Sg2sFJgtrz5/v9CyqrRp57xCfJLA2CiQDWsTxacP4=;
        b=k6FUE6FvYoBkS9/+PSYKW7Tf5XqNZLsQdTTwX3QM1u+ml8m60Q94cjIZy60jENLpil
         DueLhiplRUGN9zumH4VyVNMelatiKcm939Iw1v/2rVYPOFO6JGaqEa8EGczgNKBEv5SV
         DFDRtj/0m3+qvywDCiEmCPDu3t2/LymA4EHFbtetKP3QBTIOkdHS8cCXxGCjIPgDeUeJ
         8vPnRmICoIfD7OvMr0uJkBZw9Tm9ph9C1fS/7T2xAVAlN6xQQitBRuYFgzsEYgDSAo8e
         QxflvUu0NZc+jCmsUiKigaAS9xxVnWWqNj9dA5FKL2iDA6QzDpDAItBF48GRf93Y+8hj
         /S/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N7Sg2sFJgtrz5/v9CyqrRp57xCfJLA2CiQDWsTxacP4=;
        b=B2UF9FU2RxmTN1bp8tkk3vmuvteipdfLHTnZf9SHtrKyHnXnMhiK1JSdzC1u4gpxU0
         dtBochyTYUi6hDPYig0g+/j4ix24cz+W4QeM1BCDF/asd0ESTWFGEFa9kBCALDNIwJo3
         /h+UxgOAglGRl46oHsARhF0kT0O45oYUauydjrZyWb/PvTiXGsl9w+CTIx1kQClwn/8Y
         /2jC0HMEN2qLTg1j68QZQdECABQaL7zuhJUvQwE5qxsZvPGM1puqEeQO2aCRyLdNBsjz
         ZP3TFB6qlRzRvLyq0II45xeBcWyD979bAdabLG7y30JznbGljcJXawlB+aCyZV2B8+fS
         MqQQ==
X-Gm-Message-State: AOAM532nYCGjsECQW55hjhzvI4BQiFLeJlG0BgChu26iLskRsJOXlSRu
        H9hmzQdpAcA7Eu+JCwX0vT4=
X-Google-Smtp-Source: ABdhPJzUcW/N3F5m2+xVALybnnm0+WjTk/RP0cXKs3h+v+6AV5LOxqigZF+iBAUXlZWN5rMtsZ8qXA==
X-Received: by 2002:a05:600c:4ca2:: with SMTP id g34mr7999703wmp.46.1630477343983;
        Tue, 31 Aug 2021 23:22:23 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f08:4500:d186:d6c5:870c:59fb? (p200300ea8f084500d186d6c5870c59fb.dip0.t-ipconnect.de. [2003:ea:8f08:4500:d186:d6c5:870c:59fb])
        by smtp.googlemail.com with ESMTPSA id z6sm4407866wmp.1.2021.08.31.23.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 23:22:23 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <10690555-2317-4916-70b8-870708858f9b@gmail.com>
 <YRPvtPid3EeMylSr@smile.fi.intel.com>
 <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
 <YRTubuupevq0JMbW@smile.fi.intel.com> <YRwY/q2y3eIjc/nr@kunai>
 <20210826160021.67b7ed92@endymion>
 <41456674-800b-a4c2-3b2c-d5af18c58e61@gmail.com>
 <20210831132609.201c37f2@endymion>
 <75bca654-48e5-9bf4-56c9-9821d0c139e8@gmail.com>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <af6453c5-e462-c91f-3bfb-c56633ab6425@gmail.com>
Date:   Wed, 1 Sep 2021 08:22:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <75bca654-48e5-9bf4-56c9-9821d0c139e8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31.08.2021 22:43, Heiner Kallweit wrote:
> On 31.08.2021 13:26, Jean Delvare wrote:
>> On Tue, 31 Aug 2021 08:05:41 +0200, Heiner Kallweit wrote:
>>> On 26.08.2021 16:00, Jean Delvare wrote:
>>>> If pm_runtime_set_autosuspend_delay() is not suitable for the task then
>>>> maybe we need a better API. I will admit I'm at a loss when it comes to
>>>> the many pm_runtime_* calls, I'm not going to claim I fully understand
>>>> what each of them is doing exactly. But don't we want to simply call
>>>> pm_runtime_dont_use_autosuspend() here?
>>>>
>>>> If not and there's no suitable API for the task at the moment, then
>>>> better do not apply this patch, and instead ask the PM subsystem
>>>> maintainers if they would be willing to implement what we need.
>>>
>>> To follow-up on this: This patch has been applied already. Therefore,
>>> if decision is to not go with it, it would need to be reverted.
>>
>> Technically it's not in Linus' tree yet ;-)
>>
>> I'm still interested to know if pm_runtime_dont_use_autosuspend() is
>> the right call to use in this situation.
>>
> I don't think so. It disable auto-suspending, but leaves "normal"
> runtime-suspending active. Calling pm_runtime_disable() may be an
> alternative.
> Or we use the following to re-establish the old behavior with a little
> less overhead. Getting the mutex isn't needed here because the PCI
> core increments the rpm usage_count before calling the remove() hook.
> 
Just figured out that what I proposed wasn't fully correct. We should
only access priv->acpi_reserved once we're sure the ACPI io handler
can't run in parallel.
Small disclaimer: I'm not fully sure how acpi_remove_address_space_handler()
behaves if it's called whilst the handler is running.
IOW: Whether we can be sure that after the call to acpi_remove_address_space_handler()
the handler isn't running.

On a sidenote:
At least the call to pm_runtime_forbid() isn't needed because runtime pm
is disabled anyway and the calls to pm_runtime_forbid/allow don't
have to be balanced.


diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1f929e6c3..6394c8340 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1623,7 +1623,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 		 * BIOS is accessing the host controller so prevent it from
 		 * suspending automatically from now on.
 		 */
-		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
+		pm_runtime_get_sync(&pdev->dev);
 	}
 
 	if ((function & ACPI_IO_MASK) == ACPI_READ)
@@ -1890,9 +1890,6 @@ static void i801_remove(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
-	pm_runtime_forbid(&dev->dev);
-	pm_runtime_get_noresume(&dev->dev);
-
 	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
 	i2c_del_adapter(&priv->adapter);
@@ -1901,6 +1898,10 @@ static void i801_remove(struct pci_dev *dev)
 
 	platform_device_unregister(priv->tco_pdev);
 
+	pm_runtime_forbid(&dev->dev);
+	/* if acpi_reserved is set then usage_count is incremented already */
+	if (!priv->acpi_reserved)
+		pm_runtime_get_noresume(&dev->dev);
 	/*
 	 * do not call pci_disable_device(dev) since it can cause hard hangs on
 	 * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)
-- 
2.33.0

