Return-Path: <linux-i2c+bounces-9417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F80A33E4D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CAB4169589
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 11:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E338F20CCC8;
	Thu, 13 Feb 2025 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii7Ylh+f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37551227E88;
	Thu, 13 Feb 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739446952; cv=none; b=Cthm7rdlaBvDVLAvW1llBMXsrinbJwUPKpt5uvR2jHfmT2C5CvM4Jxj9SY+7TQbnalEnE/UBnoznJu9iPaI4rqyPR4ph8MfMvlamY+WjKP39cu68j/mfug7Mm8bDPTT18oHI5BCoVV5p8erF0iFCFzenIuNwKd0zmC7lZ5RkZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739446952; c=relaxed/simple;
	bh=udgH35Nk8YRTOAuZyiOUBgnQs2/9qUyVbjD+qfiKOF8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sashN/93sco83ekDOQmYqlQUCSBUcinZloMaQY5oxLYZFJtGi6p4e5Cd0YvfgO1csfYT+VuAfYMOjCi+E0HlPI0vw8dUEXMHJiA6YE/qQXhWGv5aNw6fjvT5TSGAx1CZo4Cs1hpU1lwSa5+0YMJDg7Ndus/tmLzUKMc3XU8fUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii7Ylh+f; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220d28c215eso9784815ad.1;
        Thu, 13 Feb 2025 03:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739446950; x=1740051750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ojdEZyCKA9R+RW2rn8MW8hNuDT302evxkJ2MsqjvPQ=;
        b=ii7Ylh+fNNDEGPIPPIGjlNvKUFqoQhxFmI3JQActzTair6KWDq3taLtkmkWOB/xDE7
         KE53Au3pfYbf0zcPIyqg/3NF9u62ZPjXZjEKPD6FcdtZm7IY6Ouxr52yxMzNIYwwNWYj
         /DIQlBZP47tJfCPLnD/UZsbgbpUODRc2ZDnRaapKjS3Vy4WurRmLLZ/GTlZxlFIvtzeR
         ORtew1fMdqtYSNNxKaXPfXjtUefL7/fVjYweKuiPURNa5GsczH5zBEuIwBgO/AHCeJp8
         gYC9/WeIOwHfWohyuq5OIrQCFy+eipeiLUADpvYmRS/lwNDzl6MA60DpothNFSpkSUus
         VhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446950; x=1740051750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ojdEZyCKA9R+RW2rn8MW8hNuDT302evxkJ2MsqjvPQ=;
        b=NVNRvm0YRujctI8r114qYWHMl4EFS4grgwL4mNQGJMJQPEgNKLikHS73ZQ/HIDi9l0
         gVorifGnlJizs5XRnlkLIiB7q85LkW4EHOnM7qCADrNBRgH1ND0hGXbwYwUcVMGUKOyr
         ovMmGQYPtqmgmaZrzAKrWEb+794MPSOtG8ArSm7j6gaGXNvT1vk0mIqg4nmaUrKLpJKX
         HFxtPPDIlN1Sh7yx4NKkfxWSbjsJGuMNHWbPCU7uM4JIpQdtdxnQJL+KxU1VPdfSvSjP
         i1mwwuE0TgwQNzr5vg9XsXa4iRNe7GRv4tRN0HkXAp2YlkAWmqs7ID/MLAnOpjsv1fIO
         OHfw==
X-Forwarded-Encrypted: i=1; AJvYcCUY7LE9HO+B6u/Nv1+5CguYCSc/LQaZ+hRjJoXaLVEBFPSOV++QB8EKQb9wfx1zDgJR9H8PRFqsirkfvKEc@vger.kernel.org, AJvYcCVmArBvScIFQqu6AgePUwnFrw+YTO4tVWHZN2YvBMYJ2J/+JFAzz0miqqGJAq+UzGk3lS30Y8769tPl@vger.kernel.org, AJvYcCWuDYTneuKZ2kbb9RWieyGtcBH61kfreFnDRyq/ISty4P3PMQixhHOFUw4C/fQZxTjE3EbBcUeEoPtp@vger.kernel.org
X-Gm-Message-State: AOJu0YyC27ciJVeD4jYmKuDC0Lk+06gJZ3rVy/3+hk5dCMC2yONFHjGb
	A1UF+IBlLwYkZwVlBz+TyipqnY0fUjZkT7zZQL85Xp7lhHnIKVjf
X-Gm-Gg: ASbGncsTR6ueg0CqoGnwp0G7bi6WdSsVCBS7bwugf0CCbH2BarccqPXfKsG39QWPzVX
	4pdmGpc/Qg5xOhYQBgft0JXbEy5m+i+RvxPr5SS7VMTY8k6oEfd9DePo+wCn7TmxaS0WHWA4AxY
	afejLe8A4qCZEcRHkmxUS2WyIshnraXLXhZW2wFD/9yysjfsty/ScdHZQE+VRnhAVMTf/B2XgFg
	nmSrYWOaEgt/Ydlfee5bzuUkm3RCzhn6DvqeIze0L1VvfMXbuKRhoWbJzUMLfO+ERKKkbDO+18=
X-Google-Smtp-Source: AGHT+IEJgTUzMsTy5tza8GLT9Y3QszGc+72E5WKWmWleltnhdgQxDLQGjdRlQFiRylF1LwOh4jyFdw==
X-Received: by 2002:a17:902:f60b:b0:216:6283:5a8c with SMTP id d9443c01a7336-220d213f2c5mr47871185ad.39.1739446950331;
        Thu, 13 Feb 2025 03:42:30 -0800 (PST)
Received: from [127.0.0.1] ([2407:cdc0:8010::ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d07dsm10570955ad.138.2025.02.13.03.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 03:42:29 -0800 (PST)
Message-ID: <f5f0c18c-f6a3-4189-aacd-71c7e26590c7@gmail.com>
Date: Thu, 13 Feb 2025 19:42:22 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
 <20241125-k1-i2c-master-v4-2-0f3d5886336b@gmail.com>
 <mwpaontcdzmzwjay66cqknkxv4xzv364d4vm433pazajhbu2si@epzgjj77clrj>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <mwpaontcdzmzwjay66cqknkxv4xzv364d4vm433pazajhbu2si@epzgjj77clrj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2025/1/4 08:34, Andi Shyti wrote:
> Hi Troy,
> 
> sorry for having kept this patch unanswered for so long. I had a
> quick look and I have a few comments through the lines.>
> ...
> 
>> +config I2C_K1
>> +	tristate "Spacemit K1 I2C adapter"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on OF
>> +	help
>> +	  This option enables support for the I2C interface on the Spacemit K1
>> +	  platform.
>> +
>> +	  If you enable this configuration, the kernel will include support for
>> +	  the I2C adapter specific to the Spacemit K1 platform. This driver ca
> 
> /ca/can/
I will
> 
>> +	  be used to manage I2C bus transactions, which are necessary for
>> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
>> +	  devices.
>> +
>> +	  This driver can also be compiled as a module. If you choose to build
>> +	  it as a module, the resulting kernel module will be named `i2c-k1`.
>> +	  Loading this module will enable the I2C functionality for the K1
>> +	  platform dynamically, without requiring a rebuild of the kernel.
> 
> This last paragraph contains more information than necessary,
> please check other similar cases and keep the same format.
> 
> (E.g.: "This driver can also be built as a module.  If so, the
> module will be called i2c-ali1563.". People know already what
> compiling as module means :-)).
thanks :)
> 
>>  config I2C_KEBA
>>  	tristate "KEBA I2C controller support"
>>  	depends on HAS_IOMEM
> 
> ...
> 
>> +/* spacemit i2c registers */
>> +#define ICR          0x0		/* Control Register */
>> +#define ISR          0x4		/* Status Register */
>> +#define ISAR         0x8		/* Slave Address Register */
>> +#define IDBR         0xc		/* Data Buffer Register */
>> +#define ILCR         0x10		/* Load Count Register */
>> +#define IWCR         0x14		/* Wait Count Register */
>> +#define IRST_CYC     0x18		/* Bus reset cycle counter */
>> +#define IBMR         0x1c		/* Bus monitor register */
>> +#define IWFIFO       0x20		/* Write FIFO Register */
>> +#define IWFIFO_WPTR  0x24		/* Write FIFO Write Pointer Register */
>> +#define IWFIFO_RPTR  0x28		/* Write FIFO Read Pointer Register */
>> +#define IRFIFO       0x2c		/* Read FIFO Register */
>> +#define IRFIFO_WPTR  0x30		/* Read FIFO Write Pointer Register */
>> +#define IRFIFO_RPTR  0x34		/* Read FIFO Read Pointer Register */
> 
> Please do use a prefix for all the defines here, e.g. SPACEMINT_
I will.
> 
> ...
> 
>> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long time_left;
>> +
>> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
>> +		i2c->cur_msg = i2c->msgs + i2c->msg_idx;
>> +		i2c->msg_buf = i2c->cur_msg->buf;
>> +		i2c->err = 0;
>> +		i2c->status = 0;
>> +		i2c->unprocessed = i2c->cur_msg->len;
>> +
>> +		reinit_completion(&i2c->complete);
>> +
>> +		spacemit_i2c_start(i2c);
>> +
>> +		time_left = wait_for_completion_timeout(&i2c->complete,
>> +							i2c->adapt.timeout);
>> +		if (unlikely(time_left == 0)) {
> 
> no need for unlikely here.
I will drop all unlikely.
> 
>> +			dev_alert(i2c->dev, "msg completion timeout\n");
> 
> dev_alert is a bit too much, please use dev_err instead.
ok.
> 
>> +			spacemit_i2c_bus_reset(i2c);
>> +			spacemit_i2c_reset(i2c);
>> +			return -ETIMEDOUT;
>> +		}
> 
> ...
> 
>> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +	/*
>> +	 * send transaction complete signal:
>> +	 * error happens, detect master stop
>> +	 */
>> +	if (likely(i2c->err || (i2c->status & SR_MSD))) {
> 
> I don't see a need for likely here.
> 
>> +		/*
>> +		 * Here the transaction is already done, we don't need any
> 
> ...
> 
>> +	ret = spacemit_i2c_xfer_msg(i2c);
>> +	if (unlikely(ret < 0)) {
>> +		dev_dbg(i2c->dev, "i2c transfer error\n");
>> +		/* timeout error should not be overridden, and the transfer
>> +		 * error will be confirmed by err handle function latter,
>> +		 * the reset should be invalid argument error.
>> +		 */
> 
> Please fix the commenting style (refer to
> Documentation/process/coding-style.rst).
> 
> Besides, please, do not shorten words (err instead of error), we
> are not in urge to save comment space. Please reword this comment
> to be understood.
I will.
> 
>> +		if (ret != -ETIMEDOUT)
>> +			ret = -EINVAL;
> 
> why do we need to change to -EINVAL? Doesn't seem like a good
> practice
I will fix it.
> 
>> +	}
>> +
>> +	return ret;
>> +}
> 
> ...
> 
>> +	spacemit_i2c_disable(i2c);
>> +
>> +	if (unlikely((ret == -ETIMEDOUT || ret == -EAGAIN)))
> 
> is unlikely necessary? What if ret has a different value?
I will drop all unlikely/likely. It's not necessary.
> 
> Andi
Thank you Andi.

-- 
Troy Mitchell

