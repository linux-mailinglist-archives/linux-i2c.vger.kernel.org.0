Return-Path: <linux-i2c+bounces-5533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A321956FDF
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8EB31F256E6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 16:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04CF16C87B;
	Mon, 19 Aug 2024 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IXgg4bLr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE216C6AD;
	Mon, 19 Aug 2024 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083899; cv=none; b=juAD6wZ8JAQU6BA5cy4vd3pHrgRypHxVIme8HiDMwMEXN7JFRddZW+PZWqIyHsMkJCFRiDpvqhKIrieAqu49onJjgOgUd15iJKJqvIS54FpepVxCseXJhSHCJl6nseKVIhMgq2kcOH3jpfndadGFovKgbzEzO9rY353SunR2ktA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083899; c=relaxed/simple;
	bh=GEoB++LDqQSoQo9jeGJ96QCwTXEp7CmnnqVXdqid5wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uymVZK6qW0ndTZs3pNsKmxkvcHQdMcXPrjyCgIcQs8Pi9hXtQ+96dbALhXe/do4fAh/zijRqKUkY2ZMCKf79nzBRJqzKJlHe1ExjxGlvwjHb8ggxNxur0HcTf31epDF5w26svNfZx1jwIvWl09N6UKHG8ZJJjTQPjZmoFtAN/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IXgg4bLr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2807720002;
	Mon, 19 Aug 2024 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724083889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfR9GdkWJJ+vheJl+e9402TxhERmDcjDDdvXV2mDGus=;
	b=IXgg4bLrkJjhdtK5+1PV57T+G7rR7E/fzwrgt67rIO1toQ7tP++tofX0PhD0eeuwxmcQmX
	UFd7subavNSQnrWmFlyUm0IyP9tMt8Nx6hhYYAOUCkpeiQLFIjvOwmIrC9UxUcimB/jMUI
	hQQf/73QAdY0vUyPZfAOIcDOqYcqfSU9nsl/Z2AFIl44xlvAmEEMlaDS8bnfgfpbuNt0+m
	vIS93bLSKxRq5Xq/CK55rHCCwDDVG+qy0aKhwQlGASMugVfSUqAcTx5ZumlajRviRor0K/
	DfxRcDBNbLXS+ObZvc9fa9A5uC/yE1Ot8XonqzmNRxWWjKqvNdn0adT9f1nZbA==
Message-ID: <34ba62f8-dc90-4a8a-914d-30df35d2956a@bootlin.com>
Date: Mon, 19 Aug 2024 18:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] gpio: Congatec Board Controller gpio driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-2-fec5236270e7@bootlin.com>
 <CAMRc=MeC4q3BGxycxnOZCC8nD7p=8AO9rQasb5Gd4T1E+aKvHA@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMRc=MeC4q3BGxycxnOZCC8nD7p=8AO9rQasb5Gd4T1E+aKvHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

>> +static int cgbc_gpio_get(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +       struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
>> +       struct cgbc_device_data *cgbc = gpio->cgbc;
>> +       int ret;
>> +       u8 val;
>> +
> 
> Can you use scoped_guard() here and elsewhere?

Hi Bartosz,

Thanks for the review.

For the next iteration I added scoped_guard() in cgbc_gpio_get(), and
guard() in cgbc_gpio_set(), cgbc_gpio_direction_input(), and
cgbc_gpio_direction_output().

> 
>> +       mutex_lock(&gpio->lock);
>> +
>> +       ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 : 0, 0, &val);
>> +
>> +       mutex_unlock(&gpio->lock);
>> +
>> +       offset %= 8;
>> +
>> +       if (ret)
>> +               return ret;

...

>> +static int cgbc_gpio_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct cgbc_device_data *cgbc = dev_get_drvdata(dev->parent);
>> +       struct cgbc_gpio_data *gpio;
>> +       struct gpio_chip *chip;
>> +       int ret;
>> +
>> +       gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
>> +       if (!gpio)
>> +               return -ENOMEM;
>> +
>> +       gpio->cgbc = cgbc;
>> +
>> +       platform_set_drvdata(pdev, gpio);
>> +
>> +       chip = &gpio->chip;
>> +       chip->label = dev_name(&pdev->dev);
>> +       chip->owner = THIS_MODULE;
>> +       chip->parent = dev;
>> +       chip->base = -1;
>> +       chip->direction_input = cgbc_gpio_direction_input;
>> +       chip->direction_output = cgbc_gpio_direction_output;
>> +       chip->get_direction = cgbc_gpio_get_direction;
>> +       chip->get = cgbc_gpio_get;
>> +       chip->set = cgbc_gpio_set;
>> +       chip->ngpio = CGBC_GPIO_NGPIO;
>> +
>> +       mutex_init(&gpio->lock);
> 
> Please use devm_mutex_init() so that it gets cleaned up at exit. It's
> not strictly necessary but helps with lock debugging.

Fixed in the next iteration.

Regards,

Thomas

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


