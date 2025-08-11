Return-Path: <linux-i2c+bounces-12231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EEDB20339
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A400B1883F5E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2882DCF56;
	Mon, 11 Aug 2025 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/YHR24g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864968F49;
	Mon, 11 Aug 2025 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904234; cv=none; b=rdMRp0N4/g+w+U8odt3vWdOFa9GcTRfkQnO9aWYLuQXDJjAahwEiiPnpwaTClQ80cpBWhAr8q4RiG1cusNScibN+wBHymcM05O+w/Gt3MOedeZYWm6ppNfiZIYRkWrTCRQRwH4Gntoc8UhywWJdcU1k0NZczbsPOW04sDncLUfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904234; c=relaxed/simple;
	bh=q7ZBCCk/934wCLPZAgL6ABs3b79YZtaefBGps7ces+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+DRiFJGLG+xcwLTd2EeSyMZU20t7UW8uDM4ABVMPa62bFUHxIH7Wit1NmZIm66gX/2ffBCne1XhrEfiuhmBj5zwPlUcQnp0L/vjgGk/8jXmVF0aU0RfnQuEX6tgdv93nqPMbBODczAlNFVL4iQx0p3D4xi+im36iMfV1yh95qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/YHR24g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D156BC4CEF6;
	Mon, 11 Aug 2025 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754904234;
	bh=q7ZBCCk/934wCLPZAgL6ABs3b79YZtaefBGps7ces+s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R/YHR24gbNZe2ykLVSLpr6kKIlNi7JYEhI7/WsuGXiKqJ00AFGIZ8fdyV66Tt3wqP
	 r+JuUeRkd1iFtLhxD6TKswP6YK80A5gcIpUGexHcAIpFCGgv2ASnD/uJJlukoyaorp
	 ZZkb//nGrFJQNdoJocSW31dBrtdyb2iPI3IjwGNOT0m6FsUAB1q4EX2gU3Tq6HCUGz
	 8WVF3EVaYuzYqjXBq8IJQ89W3GOTX1+AMd/FjNC2Yop9BIF2jqHLoozgn2SuOnPWOc
	 ApuluZXsL0JpuTuGw3M9TXic/VsY3keAfnv1MoRue0vFCYNoz9tR45KwwZI2mxHco4
	 EQaFmvE3ri24A==
Message-ID: <3620126f-b6eb-42d7-bb40-f574e3c132dc@kernel.org>
Date: Mon, 11 Aug 2025 11:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: Add Intel USBIO GPIO driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-3-hansg@kernel.org>
 <aJmWyMP77X7j78Yi@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aJmWyMP77X7j78Yi@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

Thank you for your review, note this
is not a full reply.

On 11-Aug-25 9:07 AM, Sakari Ailus wrote:

...

>> +static int usbio_gpio_probe(struct auxiliary_device *adev,
>> +		const struct auxiliary_device_id *adev_id)
>> +{
>> +	struct usbio_gpio_bank_desc *bank_desc;
>> +	struct device *dev = &adev->dev;
>> +	struct usbio_gpio *gpio;
>> +	int bank, ret;
>> +
>> +	bank_desc = dev_get_platdata(dev);
>> +	if (!bank_desc)
>> +		return -EINVAL;
>> +
>> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
>> +	if (!gpio)
>> +		return -ENOMEM;
> 
> All devm-allocated memory is released once the device is gone but you may
> still have users. Could you release this in the adev's release callback
> instead?

All GPIO users go through gpio_descriptors which are seperately
refcounted. The GPIO core can handle GPIO controllers being
hot-unplugged since the end of 2023 and guarantees that no
calls will be made to the gpiochip driver after calling
gpiochip_remove().

Regards,

Hans



