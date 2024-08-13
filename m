Return-Path: <linux-i2c+bounces-5340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B7895091C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 17:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 593C1B2296B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 15:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678ED1A01D8;
	Tue, 13 Aug 2024 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6oA+cQO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47619D886;
	Tue, 13 Aug 2024 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723562921; cv=none; b=nLoqmO/fP4OKO4eSqPZnx9rDy9rS0DhCXLE3XiAyMSFcApk4w+3aw0CdS5M9wA3Alszl1uqfOlGo5y4UoJn2/Bw46+qnlB5OuuPvNXqA9w7kcSPJFie7pTjywpem6256nvvc0IMfD/Yy4glr/VADFqF6XL4DgICrIeRHoqcoS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723562921; c=relaxed/simple;
	bh=Ovr/D785l5BYc8W6iV5RgkT5O87h86WSv+qFh+XHzKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gD8jTYeJI6L0Sq+xb65/em9S7XhdRJM61XF8XXApesgUSVTlJKLBiJ62LMyxQVtNBWIOT48yDn5S55NTAQSHejsj09yLVrpC1peRTxzdtE9TiPgA+bznZND/zu2+YzJ8jwA+lj1qEvtktwWBmiVEaJn5QSfH7yCTeZ5ROB4iBX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6oA+cQO; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso61198091fa.3;
        Tue, 13 Aug 2024 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723562917; x=1724167717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Az5RaI5b63ud2RixYEXJkMIxZwNm3gKEQ9Iv2ve9pLI=;
        b=e6oA+cQOMNDqoeHFwqqDdU8jtJSYTqv00KjGivfXPY+FGNMzA1GCRCWxUKQ4shsMEF
         sxCqfxYRPLKsd0lG/Of+fnQPwrzQMRgOctzyqoAhs/UvVBm/+Zu+Z3gSfea1FvVMLOxI
         wXwYlTSV4yNr24XwwtOsYI9fKrXEecW32xMHkm2SUPgccFm9hgd2euJXAf4/Kpzy023C
         ijbXX/fzTvb4SIuRKeJPLQgv6olLhhpoXn2NrJRAY/5DS7BYJ43yc4dia2UI36or36QS
         QRsauUFUlP2ll3pbKd/UGR6W0SF+ycFhjP3Y9/1vL11Dkh68pPpBc9rlIGwjeLf6BPBX
         qMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723562917; x=1724167717;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Az5RaI5b63ud2RixYEXJkMIxZwNm3gKEQ9Iv2ve9pLI=;
        b=ukk12gK8/PYbJ6uP1bknOJNQ6/wUgIGg/hF9HB6b1CBOFcWvnUzKRcIPZtHNWoj7QF
         OuC8l/uTR6Tmfl/mVQtknlug2wT3jTnZEd17dQQCRSBOUQMrKGcYRL5N2fDwQ3KJPW3O
         fYOL+70Tdpa66CFDQMMwpMSF5KRzFN2xruBzoJ420uSTqzTDA5Pxdf+9T0Vv6gFMOmc9
         1qy8jQvN0sPliziHEj94uFrI18cEWt3Ivgvdgjlm5Tq4BPZ+WItSmcR35dVc+/PZUIZ1
         QNHsyqQolxwaBfQAbU4MqyqvNtlF7cRqxIgG6x4Prx/E1boQvhf6E/nZMOdwnoH0kanY
         kI4w==
X-Forwarded-Encrypted: i=1; AJvYcCXG/DVQIxh1FvO7j+OeHeqc3Qt83iW9GWgL5YXmnsKTwt1uO75Yp+dEHglYCHqUaQrH0s8i3oS0Cncf9xu0Nh9G+wniHcVHmXVJ9Es7fHz9tprU+/v2/jFFZVaLezEjyAnMRCMgOBjXH2V6C22wIvYvb1+haZ5WHADqjkO5K2/VlEwEYe0=
X-Gm-Message-State: AOJu0Yy2YpX1Hr1vfHmVWGy65fPlkAzmlKBHnd62iUhCBvhI6WDcpcPo
	cqn6AUGMe6J9E6qzcpTsE+vZCAN134FJwe/CjJdMj7VrPmAuERdpYaX9gJUw
X-Google-Smtp-Source: AGHT+IFJRLK1J7OBinMaGVyi5AHKztjR/0deAHLi2xkzUg7sJUQlSb9CP9w81gztjoWEeSttmEIygg==
X-Received: by 2002:a2e:be87:0:b0:2ef:23ec:9356 with SMTP id 38308e7fff4ca-2f2b712f827mr35129951fa.8.1723562916946;
        Tue, 13 Aug 2024 08:28:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-149-85.dynamic.spd-mgts.ru. [109.252.149.85])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2f2ad92caddsm5475441fa.62.2024.08.13.08.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 08:28:36 -0700 (PDT)
Message-ID: <cf2d6ff5-dfea-4e25-8eee-e4e8c9cb1e7e@gmail.com>
Date: Tue, 13 Aug 2024 18:28:35 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
To: Breno Leitao <leitao@debian.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dmitry.osipenko@collabora.com
Cc: Andi Shyti <andi.shyti@kernel.org>, Laxman Dewangan
 <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
 Michael van der Westhuizen <rmikey@meta.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240808121447.239278-1-leitao@debian.org>
 <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
 <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>
 <ZrtgfkzuCbNju3i9@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <ZrtgfkzuCbNju3i9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

13.08.2024 16:32, Breno Leitao пишет:
> Hello Andy,
> 
> On Fri, Aug 09, 2024 at 02:03:27PM +0300, Andy Shevchenko wrote:
>> On Fri, Aug 9, 2024 at 2:57 AM Andi Shyti <andi.shyti@kernel.org> wrote:
>>> On Thu, Aug 08, 2024 at 05:14:46AM GMT, Breno Leitao wrote:
> 
>>>> The problem arises because during __pm_runtime_resume(), the spinlock
>>>> &dev->power.lock is acquired before rpm_resume() is called. Later,
>>>> rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
>>>> mutexes, triggering the error.
>>>>
>>>> To address this issue, devices on ACPI are now marked as not IRQ-safe,
>>>> considering the dependency of acpi_subsys_runtime_resume() on mutexes.
>>
>> This is a step in the right direction
> 
> Thanks
> 
>> but somewhere in the replies
>> here I would like to hear about roadmap to get rid of the
>> pm_runtime_irq_safe() in all Tegra related code.
> 
> Agree, that seems the right way to go, but this is a question to
> maintainers, Laxman and Dmitry.
> 
> By the way, looking at lore, I found that the last email from Laxman is
> from 2022. And Dmitry seems to be using a different email!? Let me copy
> the Dmitry's other email (dmitry.osipenko@collabora.com) here.
> 
>>>> +     if (!IS_VI(i2c_dev) && !ACPI_HANDLE(i2c_dev->dev))
>>>
>>> looks good to me, can I have an ack from Andy here?
>>
>> I prefer to see something like
>> is_acpi_node() / is_acpi_device_node() / is_acpi_data_node() /
>> has_acpi_companion()
>> instead depending on the actual ACPI representation of the device.
>>
>> Otherwise no objections.
>> Please, Cc me (andy@kernel.org) for the next version.
> 
> Thanks for the feedback, I agree that leveraging the functions about
> should be better. What about something as:
> 
> Author: Breno Leitao <leitao@debian.org>
> Date:   Thu Jun 6 06:27:07 2024 -0700
> 
>     Do not mark ACPI devices as irq safe
>     
>     On ACPI machines, the tegra i2c module encounters an issue due to a
>     mutex being called inside a spinlock. This leads to the following bug:
>     
>             BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
>             in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name: kssif0010
>             preempt_count: 0, expected: 0
>             RCU nest depth: 0, expected: 0
>             irq event stamp: 0
>     
>             Call trace:
>             __might_sleep
>             __mutex_lock_common
>             mutex_lock_nested
>             acpi_subsys_runtime_resume
>             rpm_resume
>             tegra_i2c_xfer
>     
>     The problem arises because during __pm_runtime_resume(), the spinlock
>     &dev->power.lock is acquired before rpm_resume() is called. Later,
>     rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
>     mutexes, triggering the error.
>     
>     To address this issue, devices on ACPI are now marked as not IRQ-safe,
>     considering the dependency of acpi_subsys_runtime_resume() on mutexes.
>     
>     Co-developed-by: Michael van der Westhuizen <rmikey@meta.com>
>     Signed-off-by: Michael van der Westhuizen <rmikey@meta.com>
>     Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 85b31edc558d..1df5b4204142 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1802,9 +1802,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	 * domain.
>  	 *
>  	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
> -	 * be used for atomic transfers.
> +	 * be used for atomic transfers. ACPI device is not IRQ safe also.
>  	 */
> -	if (!IS_VI(i2c_dev))
> +	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
>  		pm_runtime_irq_safe(i2c_dev->dev);
>  
>  	pm_runtime_enable(i2c_dev->dev);
> 

Looks good, thanks

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

> but somewhere in the replies
> here I would like to hear about roadmap to get rid of the
> pm_runtime_irq_safe() in all Tegra related code.

What is the problem with pm_runtime_irq_safe()? There were multiple
problems with RPM for this driver in the past, it wasn't trivial to make
it work for all Tegra HW generations. Don't expect anyone would want to
invest time into doing it all over again.


