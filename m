Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2679318FB4D
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 18:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCWRUk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 23 Mar 2020 13:20:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34693 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbgCWRUk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Mar 2020 13:20:40 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jGQkg-0003Un-Bx
        for linux-i2c@vger.kernel.org; Mon, 23 Mar 2020 17:20:38 +0000
Received: by mail-pl1-f197.google.com with SMTP id t12so9956775plo.4
        for <linux-i2c@vger.kernel.org>; Mon, 23 Mar 2020 10:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Zx0KomqRTYvc6pXrEo2bYZekXYeaWEOzo7AcOuoGI+k=;
        b=SPeve0hGkt2X/ue4s8LDM/glIU1fPjOedmilcrVET+n2RJ8yjpXPH8cI6cZFH4TPEX
         O9Pt4BdL07gLejPiiYk7hkklOuVrfoHuHCBgGEkltiAZYfRE4PSZJW21JHkd3rLSRgSR
         31axlTQLL2O0iW4PqG1/ST6EYhteGes0a9oCP+Zk2s6hF3JBLkIeMX2ltGlVT1kRcMGS
         3cPHv9dTyv7Lxfh6R066w72OK0CjcZa0NS2u8j6YRGz+n5E4qFh2Na1Bo1FQzo00sQKR
         948evUZZ8rCtIKiUiaH2NiF/oXYTUmCw7Sv9fVt7cgXROk38eopxp4457erEFu30612P
         kL9w==
X-Gm-Message-State: ANhLgQ25qCamVlhXaj7ELRz3EbNWjFEWrCeDldEqdJX5hICvMyL5TjxP
        kqKsdIslYDwmHZ3OvrYviiL2LU8Bkc+W7cF5r59A6j2de5IbzF7jqm4yQqpstkS94144WehlkCc
        SncGTA9WEWppjYxhDmXFMiNZHQWRS+rccJpvafQ==
X-Received: by 2002:aa7:9467:: with SMTP id t7mr25106321pfq.97.1584984036736;
        Mon, 23 Mar 2020 10:20:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsqafGIbLkFudXunp2qcJvxG7Z4YdPMUgTtvqiau/inS/Bpu4KFpOdcz1VYoy63CGIS59K1Mg==
X-Received: by 2002:aa7:9467:: with SMTP id t7mr25106304pfq.97.1584984036373;
        Mon, 23 Mar 2020 10:20:36 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id g7sm153345pjl.17.2020.03.23.10.20.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2020 10:20:35 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <BYAPR12MB2727B1862E56594E4B6A3E0ADCF00@BYAPR12MB2727.namprd12.prod.outlook.com>
Date:   Tue, 24 Mar 2020 01:20:31 +0800
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <E6C41EAE-C56D-4FAB-969F-0842F4FF5C18@canonical.com>
References: <20200311165806.12365-1-kai.heng.feng@canonical.com>
 <DA56E103-CAA7-4C28-9528-9EAFF2C717CD@canonical.com>
 <BYAPR12MB2727B1862E56594E4B6A3E0ADCF00@BYAPR12MB2727.namprd12.prod.outlook.com>
To:     Ajay Gupta <ajayg@nvidia.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ajay,

> On Mar 24, 2020, at 00:47, Ajay Gupta <ajayg@nvidia.com> wrote:
> 
> Kai-Heng
> 
>> -----Original Message-----
>> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> Sent: Sunday, March 22, 2020 10:38 PM
>> To: Ajay Gupta <ajayg@nvidia.com>
>> Cc: Wolfram Sang <wsa@the-dreams.de>; Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com>; open list:I2C CONTROLLER DRIVER FOR
>> NVIDIA GPU <linux-i2c@vger.kernel.org>; open list <linux-
>> kernel@vger.kernel.org>
>> Subject: Re: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
>> gpu_i2c_check_status()
>> 
>> External email: Use caution opening links or attachments
>> 
>> 
>>> On Mar 12, 2020, at 00:58, Kai-Heng Feng <kai.heng.feng@canonical.com>
>> wrote:
>>> 
>>> Nvidia card may come with a "phantom" UCSI device, and its driver gets
>>> stuck in probe routine, prevents any system PM operations like suspend.
>>> 
>>> Let's handle the unaccounted case that the target time equals to
>>> jiffies in gpu_i2c_check_status(), so the UCSI driver can let the
>>> probe fail as it should.
> If status is not seen in 999.5 ms then I don't see any reason why it will come
> exactly at 1000ms. In fact,  we expect status to be seen within 160ms as per
> I2C_MST_I2C0_TIMING_TIMEOUT_CLK_CNT (16 cycle) and 
> I2C_MST_I2C0_TIMING_SCL_PERIOD_100KHZ (10ms/cycle) programmed in 
> I2C_MST_I2C0_TIMING Register. We already have enough extra time to look
> For response.

This is to handle when there's no response.

When the while loop terminates because of "time_is_after_jiffies(target)" (i.e. target <= jiffies), we also need to to handle "target == jiffies" case in the following if clause to properly timeout.

I don't think I2C timings here can affect jiffies.

Kai-Heng

> 
> Thanks
>> nvpublic
>>> 
>>> Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> 
>> A gentle ping...
>> 
>>> ---
>>> drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c
>>> b/drivers/i2c/busses/i2c-nvidia-gpu.c
>>> index 62e18b4db0ed..1988e93c7925 100644
>>> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
>>> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
>>> @@ -88,7 +88,7 @@ static int gpu_i2c_check_status(struct gpu_i2c_dev
>> *i2cd)
>>>              usleep_range(500, 600);
>>>      } while (time_is_after_jiffies(target));
>>> 
>>> -     if (time_is_before_jiffies(target)) {
>>> +     if (time_is_before_eq_jiffies(target)) {
>>>              dev_err(i2cd->dev, "i2c timeout error %x\n", val);
>>>              return -ETIMEDOUT;
>>>      }
>>> --
>>> 2.17.1
>>> 
> 

