Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC68191367
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 15:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgCXOjb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 24 Mar 2020 10:39:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43446 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbgCXOja (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Mar 2020 10:39:30 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jGkiG-0003qD-3A
        for linux-i2c@vger.kernel.org; Tue, 24 Mar 2020 14:39:28 +0000
Received: by mail-pf1-f200.google.com with SMTP id h191so14064514pfe.14
        for <linux-i2c@vger.kernel.org>; Tue, 24 Mar 2020 07:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=olThx3NRWCqmpK/TmIWWUGZYC0Mn3E0rSf0fKwVxX7o=;
        b=SDJLOVrpzRHDj5gpvNWZ56WWwGMCj7P38B72CJfDGWv4KAJQnQNCqARE0iIbP+56bm
         Ky+VaYMIur4XK44RiRwJohRdNOR+37T9Adt5UWzd/XcqedN0Wzn+OzNpiEcdZcEbe1rH
         TXHhdmBcyEWIzMvpYvLE1qDZPwjgohVZ8krmsjsULFL2fCvOayCFcY+Kr3xEZD8PKyyW
         pcq1EihRRqvXOc+akz3HZN3BuemnBrbUT35oTzxzbS2S/Oo5X4f8A/7JCs4NyuMGnZiZ
         pMLSnPLRxlT+25VcpEw9yxXHkydUpR9rF58yfuQoq7QI1R6JpBnHgNyvGhw3NAnbd5Hm
         WFZA==
X-Gm-Message-State: ANhLgQ2Ij4iPnkFn2abYLrwckxAD2ZGplCC2QkU48fZrJWwZEAQ5v+iH
        rmObiKIqAVkrl1bjeGOPX/kywU5Hnk51sVDwTtefE8MTCp3131q7nBTslG1BY11EpVk0brJLIww
        xTzw2ObQ9h7Nq3MrynO06+8+wFdtvO4Xd89kMXg==
X-Received: by 2002:a17:90a:c695:: with SMTP id n21mr5744132pjt.133.1585060766305;
        Tue, 24 Mar 2020 07:39:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvUsIoUP8bwD6fmxkTSnpSBTMMDUBbvngGa5KE9+xnM+hNmrTdAQxjevFGk/KpoCFU8s4+isw==
X-Received: by 2002:a17:90a:c695:: with SMTP id n21mr5744097pjt.133.1585060765945;
        Tue, 24 Mar 2020 07:39:25 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id f5sm83318pfq.63.2020.03.24.07.39.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 07:39:24 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v2] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200324134124.GL1922688@smile.fi.intel.com>
Date:   Tue, 24 Mar 2020 22:39:22 +0800
Cc:     ajayg@nvidia.com, Wolfram Sang <wsa@the-dreams.de>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <AF4DCBBE-FF35-4B58-92EE-8BD804A502C4@canonical.com>
References: <20200324130712.12289-1-kai.heng.feng@canonical.com>
 <20200324134124.GL1922688@smile.fi.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

> On Mar 24, 2020, at 21:41, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> On Tue, Mar 24, 2020 at 09:07:12PM +0800, Kai-Heng Feng wrote:
>> Nvidia card may come with a "phantom" UCSI device, and its driver gets
>> stuck in probe routine, prevents any system PM operations like suspend.
>> 
>> When the target time equals to jiffies, it's not included by
>> time_is_before_jiffies(). So let's use a boolean to make sure the
>> operation is done or timeout.
> 
> Thank you for an update, my comments below.
> 
>> 	unsigned long target = jiffies + msecs_to_jiffies(1000);
>> 	u32 val;
>> +	bool done = false;
>> 
>> 	do {
>> 		val = readl(i2cd->regs + I2C_MST_CNTL);
>> -		if (!(val & I2C_MST_CNTL_CYCLE_TRIGGER))
>> -			break;
>> -		if ((val & I2C_MST_CNTL_STATUS) !=
>> -				I2C_MST_CNTL_STATUS_BUS_BUSY)
> 
>> +		if (!(val & I2C_MST_CNTL_CYCLE_TRIGGER)
>> +		    || (val & I2C_MST_CNTL_STATUS) !=
>> +				I2C_MST_CNTL_STATUS_BUS_BUSY) {
> 
> Bad formatting. But see below.
> 
>> +			done = true;
>> 			break;
>> +		}
>> 		usleep_range(500, 600);
>> 	} while (time_is_after_jiffies(target));
>> 
>> -	if (time_is_before_jiffies(target)) {
>> +	if (!done) {
>> 		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
>> 		return -ETIMEDOUT;
>> 	}
> 
> 
> Overall it can use simple tries since you already have sleep inside, but
> moreover, you may simple switch to readl_poll_timeout() this entire
> loop.

Yes that can make the retry loop much simpler.
I'll send a v3 based on your suggestion.

Kai-Heng

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

