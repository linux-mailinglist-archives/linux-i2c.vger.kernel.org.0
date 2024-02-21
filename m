Return-Path: <linux-i2c+bounces-1884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF285D65A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 12:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8CE1F24013
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 11:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87E83F8DF;
	Wed, 21 Feb 2024 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XN2ZfXNc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A33A1A2;
	Wed, 21 Feb 2024 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708513315; cv=none; b=I31353WXohwBCUo+xZdNscnt+/BGhPM8DE+Jn90YGOi1aKYhUhd2/b6zGt0m7xrKi5O3XYhydmBM2Z5UFjIj//7RWVrLePNcTWoQ/64fEaNrmx4MkduTahu3ohaqECyiCrr3Ob1GoVBuyDXDm4lw5YvujdBrwrK+9dLXQ/1jJF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708513315; c=relaxed/simple;
	bh=dRk415UzsgzDNWkIDPhHwFDgyKW9PXo6eI6QQRKIUbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M804e3JIL34nYtaYaY7GeNbOVM59BeGtZLykSNIQ/lyVxZuodRd6xpuqFWkjYiA50/Xom8Lex6c0PLUL9OdhzjXe8Su/CvpmoiIzODFhcfTWFuymZSwQSrHDqjEKa7JvHOvWTrjFNvcm+80ttFL7aVZgUXeWG1Sfp/ijjC8p+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XN2ZfXNc; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 441241BF209;
	Wed, 21 Feb 2024 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708513307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vInAPH5p+e8119+v06ulfZ5lvJvXTu8ss9P3JzvQTHY=;
	b=XN2ZfXNc0o0/ZL9aDDvYuX0tX/X+cAUOjEyPjjYOeuCHaYl1rlDr1Zo2s5XyriovJpzcap
	5ZjBJwOO30nd09Epax4Smr0EKKs2MnvZ6Q3CHnOyYM6NwMgAUWRW4U6CmpYsOp6wOCBm6e
	Y4luy+dNbIH4qMXu7QFPc4ol2jaCvPTZ9WhoCrLsokTohJ569FN6n4JNHtW33M7bro/a6F
	PKuVY4qRveAwriMN481ITaN546VAyU3LywwhyzfSs6aURNBCIxVNE/C/trMpsclq4Q7hAZ
	Jc3HcZu+GwQDdXz9UFfQrUzBF5NmVJHPQyOh6pylNe/TMxTyGPghV8PG2xYDpA==
Message-ID: <a2c3c5b9-79a3-4793-892c-b1ab79b71c7d@bootlin.com>
Date: Wed, 21 Feb 2024 12:01:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] pinctrl: pinctrl-single: remove dead code in
 suspend() and resume() callbacks
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-2-5c2e4a3fac1f@bootlin.com>
 <Zc4tedAhqYX3bQcw@smile.fi.intel.com>
 <78add459-a96a-46c6-83ff-e2657d4d3db4@bootlin.com>
 <Zc96dSff5Y-dufrJ@smile.fi.intel.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Zc96dSff5Y-dufrJ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/16/24 16:08, Andy Shevchenko wrote:
> On Fri, Feb 16, 2024 at 08:59:47AM +0100, Thomas Richard wrote:
>> On 2/15/24 16:27, Andy Shevchenko wrote:
>>> On Thu, Feb 15, 2024 at 04:17:47PM +0100, Thomas Richard wrote:
>>>> No need to check the pointer returned by platform_get_drvdata(), as
>>>> platform_set_drvdata() is called during the probe.
>>>
>>> This patch should go _after_ the next one, otherwise the commit message doesn't
>>> tell full story and the code change bring a potential regression.
>>
>> Hello Andy,
>>
>> I'm ok to move this patch after the next one.
>> But for my understanding, could you explain me why changing the order is
>> important in this case ?
> 
> Old PM calls obviously can be called in different circumstances and these
> checks are important.
> 
> Just squash these two patches to avoid additional churn and we are done.

You mean invert the order instead of squash.

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


