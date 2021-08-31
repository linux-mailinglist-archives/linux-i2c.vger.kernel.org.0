Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331393FCEBD
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Aug 2021 22:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241082AbhHaUoh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Aug 2021 16:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241038AbhHaUoh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Aug 2021 16:44:37 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF70C061575
        for <linux-i2c@vger.kernel.org>; Tue, 31 Aug 2021 13:43:41 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id m9so1162225wrb.1
        for <linux-i2c@vger.kernel.org>; Tue, 31 Aug 2021 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hxbel6Lqxe/OJhdypSPvYkFS2a24vpTEE5DqTbXAGOQ=;
        b=TrYhWKr7u0kTCKFDs0mSIuCW5wWoEfJ5bswqVnkyZfHhwTnWpgM9r0DsV5mKxzh1qV
         i/CgSiPjCYk0NyAD5lmqnbO4N/d4a5OvT4OmFLt4stIcGqyQlZEDQmERMaLni4/C3xhL
         7g1qUK9SnR5m7JVgsk4VNWr5q0r3XO1dG155KUEDnL++aHnoaa42T5C46drd7k1GXf3W
         lAp231gEL3uwgH3UkU9AEhv50yomP+Y0w6KOFTJ/bHnEB7FMgRCEK0lnnIoQrqeDjZCD
         AEjKCeem+4peLPARb/B498NoAGOm2X+nd2RxNow23Epx05ZOveXx8k1bkfCdjaA5wYnA
         vdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hxbel6Lqxe/OJhdypSPvYkFS2a24vpTEE5DqTbXAGOQ=;
        b=ksjnWSv9BVHvDvBs9Fe+hbwqC8FltLj3hHValx039A2hUJyp6HcHW1JDe6kxAgmUec
         hg9ix7lmvMLLufYPZkX9aKW7n6hQ8ngyANnYK8uxmCik+XV7qgH/HITzSXTvDj2K8GsW
         nKw+L2s2VHxc5qOo9IUYSnnUKIx/RpOfQNAKr6Fm3s0w83F1EMX5qtYLc6OPNbkrijUs
         ewGXsuVA6zJHkLBU/4mhRDO01lhSc6ydlR/9rqKho+ASt0r2psSop4muEAsSif7Z0Y++
         MC/r9PKPzkR3KSHHsh6LrvTBFFbntgoWMjEQX53y/+LFt4+zGIBvcvtJHwALYps4p7Ys
         S8lg==
X-Gm-Message-State: AOAM531vkwx1QCf9HE0wfqR+4MpQv/w5+CMPLGSiHC58c/9sCXWEITzC
        WsXy44i8GW9OaquH78d0heo=
X-Google-Smtp-Source: ABdhPJzih+DDHQlefflQCqgc54CvzpNgfVBOnLhYHPv/ic0TgJKl06PI+D5RnAKBh84O2JDFyizmFA==
X-Received: by 2002:adf:9783:: with SMTP id s3mr34400885wrb.349.1630442619971;
        Tue, 31 Aug 2021 13:43:39 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f08:4500:ad5d:6a29:527b:c2a3? ([2003:ea:8f08:4500:ad5d:6a29:527b:c2a3])
        by smtp.googlemail.com with ESMTPSA id s14sm3221973wmc.25.2021.08.31.13.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 13:43:39 -0700 (PDT)
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
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <75bca654-48e5-9bf4-56c9-9821d0c139e8@gmail.com>
Date:   Tue, 31 Aug 2021 22:43:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831132609.201c37f2@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31.08.2021 13:26, Jean Delvare wrote:
> On Tue, 31 Aug 2021 08:05:41 +0200, Heiner Kallweit wrote:
>> On 26.08.2021 16:00, Jean Delvare wrote:
>>> If pm_runtime_set_autosuspend_delay() is not suitable for the task then
>>> maybe we need a better API. I will admit I'm at a loss when it comes to
>>> the many pm_runtime_* calls, I'm not going to claim I fully understand
>>> what each of them is doing exactly. But don't we want to simply call
>>> pm_runtime_dont_use_autosuspend() here?
>>>
>>> If not and there's no suitable API for the task at the moment, then
>>> better do not apply this patch, and instead ask the PM subsystem
>>> maintainers if they would be willing to implement what we need.
>>
>> To follow-up on this: This patch has been applied already. Therefore,
>> if decision is to not go with it, it would need to be reverted.
> 
> Technically it's not in Linus' tree yet ;-)
> 
> I'm still interested to know if pm_runtime_dont_use_autosuspend() is
> the right call to use in this situation.
> 
I don't think so. It disable auto-suspending, but leaves "normal"
runtime-suspending active. Calling pm_runtime_disable() may be an
alternative.
Or we use the following to re-establish the old behavior with a little
less overhead. Getting the mutex isn't needed here because the PCI
core increments the rpm usage_count before calling the remove() hook.

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1f929e6c3..b5723d946 100644
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
@@ -1891,7 +1891,9 @@ static void i801_remove(struct pci_dev *dev)
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
 	pm_runtime_forbid(&dev->dev);
-	pm_runtime_get_noresume(&dev->dev);
+	/* if acpi_reserved is set then usage_count is incremented already */
+	if (!priv->acpi_reserved)
+		pm_runtime_get_noresume(&dev->dev);
 
 	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
-- 
2.33.0






