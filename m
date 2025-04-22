Return-Path: <linux-i2c+bounces-10525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E9A971B6
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 17:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7BA01894FC8
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 15:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB7C2900BE;
	Tue, 22 Apr 2025 15:53:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A24927BF7F
	for <linux-i2c@vger.kernel.org>; Tue, 22 Apr 2025 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337210; cv=none; b=lTXZbA7/g0/MFBi12wgu+shjPOUaZDA9NFFgf9u9LawdUmizbD33Cn3gsADVYDbs7l6XYZRcaR/2Ci3wrrNVw2HHewsOcWTPDLvn14xK/AmYUJx2+hbXe7TLhFCFRw5lSyTMNau/Si6YDNVK0/gjBgDnTYpRTIbg80gEqwM4LOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337210; c=relaxed/simple;
	bh=CM6qDJtqmBbei3DOlADlrv4ZtQji60qcZQFUuL/gBpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVPXh1GATaW1jZqKqtfRKAGCvqhbZwheFACcsHURnvLtT7BjULDUovC5GPH+Rf1dwfAbvHElj1HDqXunx2Xt7ELhNwomCGrtNdXC1WeTOh0HmtNXUkgdKSx5uFLDCwXSIHVxKuJiUg+zFoI1RU60aGjg6jFbbOensshnfM5aDbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u7Fvs-0000r5-Mv; Tue, 22 Apr 2025 17:53:12 +0200
Message-ID: <54d062af-40ff-47b7-baec-c7e883defea3@pengutronix.de>
Date: Tue, 22 Apr 2025 17:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
To: Troy Mitchell <troymitchell988@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: imx@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 linux-i2c@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Yongchao Jia <jyc0019@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
 <20250422161213.0000597d@huawei.com>
 <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hello Troy,

On 4/22/25 17:26, Troy Mitchell wrote:
> On 2025/4/22 23:12, Jonathan Cameron wrote:
>> On Mon, 21 Apr 2025 13:36:38 +0800

[snip]

>> In this path the patch changes the lock release to occur after
>> i2c_imx_master_isr(i2c_imx, status);
>>
>> That may well be safe; I have no idea!  You should talk about that
>> in the patch description if it is.
> You're correct that this change slightly alters the lock release timing.
> 
> However, both i2c_imx_slave_handle() and i2c_imx_master_isr() can safely be
> entered with the lock held — there's no requirement for the lock to be released
> before calling them.

Why would we want to hold a spinlock out of all things longer than
absolutely necessary?

> Using guard(spinlock_irqsave) simplifies the control flow by ensuring consistent
> and automatic unlock, which improves readability without affecting correctness.
> 
> I'll update the commit message to clarify this.

Sorry, I don't think that this simplification is worth potentially
increasing the time we spend with preemption disabled,
i2c_imx_master_isr() even has a loop inside.

Guards that don't increase critical section size however are fine by me.

Thanks,
Ahmad

> 
>>
>>> +
>>>  		return i2c_imx_master_isr(i2c_imx, status);
>>>  	}
>>> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>>>  
>>>  	return IRQ_NONE;
>>>  }
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


