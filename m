Return-Path: <linux-i2c+bounces-10524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CE6A9709F
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 17:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 847E11B612C7
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 15:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAFB28936D;
	Tue, 22 Apr 2025 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UR1dT9vk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145672857C9;
	Tue, 22 Apr 2025 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335575; cv=none; b=ArJ22RByhhK18O4eVKGNvMm13PmvfOhde/ervBvyyzY89DOyBXjhW01R3kBgFvulE6mgrIyvFXjWwGmKoBkmf0x3o60kZhJOpNn0jtL7hDVAJFwy3+MEl/t/ZTeWXyCMRmUybvLED5RazT7jxd+FE9xZU1nUQzlKzbb0TCKDlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335575; c=relaxed/simple;
	bh=V3EF+LAVoz+bP3kXGeKG/AH/Wx+8WltG6QBGmJY1phk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YIyBehZsLoMJk/W2gGt/5Bg7Dh9Ab7S7jD9MXBzEMOyeKG9Z/tz0k0Mhu3t32/dvAjbWP4axlCubhvQ63qRaPYSornp+6QytU5AxOfveHN9c6DlN4j3QoLZcKAZ7bpUeB53atinqaxXVUevzU1r+dk6pyHD5yu1zxn47hLtoFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UR1dT9vk; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-224191d92e4so52369065ad.3;
        Tue, 22 Apr 2025 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745335573; x=1745940373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky0slvl2m0Skj+7SoImzSsZ0KF7nAf3DtsbkUIFEsgs=;
        b=UR1dT9vkJo0+QbygmttEXYcBzfaY/ZKwF1vGB/KZxk9WeOUUEN1TvD8DXHvDxEzJP+
         zk1IHJsObPESQ9LxWF/LGgwV40jmDhvPBh/+4IAhPAXnctLDoGxxE/z911KjRAn+yWrt
         g34AAf3g7NTw0+20zia5rP4EgThUwrJakme80096oTsq2OQj8SKUoKvJsck2snyAr4qS
         akRnmZnXQNvO8jNXkSbM3ZgLJ6Bf54c1Tr3ZX4otaj/4U1XwvZUpxqm4vhDaWRpOPKvS
         UWQau12dy07fzUNHqHeTXoveiDjgfYQHcWZkI+sVdITSNV1Cac6tmoVqENFFJ9MUJwTF
         Oczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335573; x=1745940373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky0slvl2m0Skj+7SoImzSsZ0KF7nAf3DtsbkUIFEsgs=;
        b=gBwpu2l7ghc+siOtoq02uY3w7PmTfD04zcX6qJP16mU8FaMTysBjxQJl/avLPjPcdp
         bSu2fjf0BCM5XRIoR4EUoKNXA/8aiVgQd+4oU5Ue8QfNqLXW0RaXQINY8B9h3yUlDfgb
         1xgaagwCEWh0ZpgY833ef1yPPeDBZ34Fe7sgbMMn1Uww1nbHL2PV9RbS7/JkQj0/nwNn
         Rou5mXf9K2dLNbIk212CQgkNE1X9IUb8LVy9LcgYwdNe+sYHHI8WGYPK4NUu49UfZVfV
         Cv9o+8lzwk8TgYyyFty4poQBPDOJEvKrfWVS5Kckdqo9sz99yS4OC+hOzz8opDfufS2P
         9HcA==
X-Forwarded-Encrypted: i=1; AJvYcCVm8wW3zj60xJ8Vk78KNgw2tR62MyXztLO9igtWzoVs2Im9jvxJbg0ciTxpg4CRVDa+qmwhqgxQJd+HvWCP@vger.kernel.org, AJvYcCWKw4KGIeCvwJTh7z1hgOTOMQahuVHUOBBPd84e9EGFVOPu33lyZgO+uI1lj5GYFwa2rR/SvXCBrlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2nXv5wWwdv4MZtEMlf7L98say69Mdgz6atMMuhN/pmDRr5R8
	2jk6SEA8JBJgJTZo02gfRC/oM7xPSoL1qcPjmpeiNnnlssTztZLL
X-Gm-Gg: ASbGncuEeus7JaPbRRCUbFb1V5vcf74y9QAYuMow/jy1euFwTw3Bhyik0ZIeOVIvOE8
	W6y2QmDJqEUgc3jDIDnpi58TVmMYSoKoi3gtn2uDyA3jYbA+QDE2lA3uViaGnLe/n/qlktn1f5X
	eAnusGcPfpR+c2NHL7fBDl3w/O+w/cchXOBbXWJKXUNIAcCmGu3y90u7/dSewlHQ9MU1QqA4dkE
	dIK178Vu1Wzk3LJ5UAJIsihoFwVLFEbw5odkOu4noZg3AYYkxbLbiFW5U47pD622H9EHkk0kY9U
	OSzrLYuLK0i02/f8YIwkyO/g/oxHaQ==
X-Google-Smtp-Source: AGHT+IHYPLeKGWL1fyxBzXyLrmUfwx8HCx9qyTTP5pFdjq3MaUZ0+J0RZxkXJTfIv6je3bWU3Fj+qQ==
X-Received: by 2002:a17:903:228a:b0:21f:5638:2d8 with SMTP id d9443c01a7336-22c53620bdfmr218015115ad.53.1745335572548;
        Tue, 22 Apr 2025 08:26:12 -0700 (PDT)
Received: from [192.168.5.101] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf16b1sm86663765ad.89.2025.04.22.08.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 08:26:12 -0700 (PDT)
Message-ID: <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
Date: Tue, 22 Apr 2025 23:26:04 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yongchao Jia <jyc0019@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
 <20250422161213.0000597d@huawei.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20250422161213.0000597d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/4/22 23:12, Jonathan Cameron wrote:
> On Mon, 21 Apr 2025 13:36:38 +0800
> Troy Mitchell <troymitchell988@gmail.com> wrote:
> 
>> Use guard to automatically release the lock after going out of scope
>> instead of calling it manually.
> Drive by review, but this changes behavior in a subtle way so we
> should have more commentary here...

Thanks for your review!

> 
>> Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
>> Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index 9e5d454d8318..cb96a57df4a0 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -23,6 +23,7 @@
>>  
>>  #include <linux/acpi.h>
>>  #include <linux/clk.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/completion.h>
>>  #include <linux/delay.h>
>>  #include <linux/dma-mapping.h>
>>  
>> @@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>>  {
>>  	struct imx_i2c_struct *i2c_imx = dev_id;
>>  	unsigned int ctl, status;
>> -	unsigned long flags;
>>  
>> -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
>> +	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
>> +
>>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>>  
>>  	if (status & I2SR_IIF) {
>>  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
>> +
>>  		if (i2c_imx->slave) {
>>  			if (!(ctl & I2CR_MSTA)) {
>>  				irqreturn_t ret;
>>  
>> -				ret = i2c_imx_slave_handle(i2c_imx,
>> -							   status, ctl);
>> -				spin_unlock_irqrestore(&i2c_imx->slave_lock,
>> -						       flags);
>> -				return ret;
>> +				return i2c_imx_slave_handle(i2c_imx,
>> +							    status, ctl);
>>  			}
>>  			i2c_imx_slave_finish_op(i2c_imx);
>>  		}
>> -		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
> In this path the patch changes the lock release to occur after
> i2c_imx_master_isr(i2c_imx, status);
> 
> That may well be safe; I have no idea!  You should talk about that
> in the patch description if it is.
You're correct that this change slightly alters the lock release timing.

However, both i2c_imx_slave_handle() and i2c_imx_master_isr() can safely be
entered with the lock held — there's no requirement for the lock to be released
before calling them.

Using guard(spinlock_irqsave) simplifies the control flow by ensuring consistent
and automatic unlock, which improves readability without affecting correctness.

I'll update the commit message to clarify this.

> 
>> +
>>  		return i2c_imx_master_isr(i2c_imx, status);
>>  	}
>> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>>  
>>  	return IRQ_NONE;
>>  }

-- 
Troy Mitchell


