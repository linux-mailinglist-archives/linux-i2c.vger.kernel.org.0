Return-Path: <linux-i2c+bounces-12833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA9B51804
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F031C188D3A1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4E031079B;
	Wed, 10 Sep 2025 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd8YzN4z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964901BF58;
	Wed, 10 Sep 2025 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511399; cv=none; b=hFNkzxMKMt/3qzHVA90nKSbHfbR98ALjgfvxPSUcc0UdVMXRhp6PmpbwXwN9EFR0Kt0CAzxjNWavuXzFoEhesN1TNaylTEzciVjqL4GMAYvdDS0SZLBO0rF0Nfofoj2R0iT+tBZ0TQ3qN2tVYgvixLEsVMPuCJTGpK294TU253Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511399; c=relaxed/simple;
	bh=Rmmz0W1YezkmiOArAFJY2L0ckRfJRNnGANNFgHFpCkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlkIzs4HrtKceJ9UO/w2+3w9dtVdLYB0XwYvR/vx55FBESSgRK9CbgMGA2hmjvmgWlZ/vPE4+KUzW2f3idyeuMcKkjEF+52xpUOGBh/jZ4D+c+8/HsadYXp5GBUJkFRMxKH94L8b4P5MGnV1Vxvj+m+5scI9HYJUHPwtvBlX07s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd8YzN4z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B409C4CEF0;
	Wed, 10 Sep 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757511398;
	bh=Rmmz0W1YezkmiOArAFJY2L0ckRfJRNnGANNFgHFpCkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nd8YzN4zrI3cv+L0pcTB96L+Xvgn3Zfdf88h/aRu/YPwHlqa5N5LXOyK9NI4D8fOO
	 758CPm8AoHrUcbs5Qj/HwMncYb70RNMq+ZVUQw4r1R//1nFPMW3f+++7ZeXMld7Exe
	 opLKuTsoyr2K7SJdWul3EvQ2A8sEfZTlIV4ehkY8WMhUQIYKh/+J5gRrpAeAfpzWtP
	 xHa1ms1R3er18BQphxDuxKK+3iO7/i9SnOslVPJ1eYuxFocmaPs/2r5Yx7gbsIupuC
	 I45BPOZF+U9q/eI9ELVru9h2oFHE7zvtOFRFcfXVdENqQCpxpR6Qw2ld6nVU5Al4Jw
	 4CyDzF6C8db1w==
Message-ID: <dbfe2464-394e-46fd-9e4d-7e41b62069e8@kernel.org>
Date: Wed, 10 Sep 2025 15:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander
 drivers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Richard Hughes
 <rhughes@redhat.com>, linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250907175056.47314-1-hansg@kernel.org>
 <2025091045-expel-fiction-299f@gregkh>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <2025091045-expel-fiction-299f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Greg,

On 10-Sep-25 3:25 PM, Greg Kroah-Hartman wrote:
> On Sun, Sep 07, 2025 at 07:50:53PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v2 of the patch series to add support for the Intel USBIO USB
>> IO-expander used by the MIPI cameras on various new (Meteor Lake and later)
>> Intel laptops.
>>
>> Changes in v2:
>> - Split usbio-bridge mutex into ctrl_mutex and bulk_mutex
>> - Drop SPI support since this is not used on devices in the field
>> - Rework disconnect handling to be more robust
>> - Several different revisions need special casing add a quirks mechanism
>>   for this
>> - Stop using stdint.h (uintX_t) types
>> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
>> - Properly check auxiliary_device_add() return value
>> - Add a mutex to the GPIO driver to protect usbio_gpio_update_config()
>>   calls, which read-modify-write banks[x].config, racing with each other
>> - Adjust usbio_gpio_get() to have an int return value and propagate the
>>   usbio_control_msg() return value
>> - Various (small) style fixes from Sakari's review of all 3 patches
>>
>> The first patch adds an USB bridge driver which registers auxbus children
>> for the GPIO and I2C functions of the USBIO chip.
>>
>> The second and third patch add a GPIO resp. an I2C driver for the
>> auxbus children using the IO functions exported by the USB bridge driver.
>>
>> The second and third patch depend on the IO functions exported by
>> the first patch. So to merge this we will need either an immutable tag on
>> the USB tree, or all 3 patches can be merged through the USB tree with
>> acks from the GPIO and I2C subsystem maintainers.
> 
> Either is fine with me, patch 1 looks good enough for me to queue it up
> now.

That is good news.

> Let me know what you want me to do.

I've done a v3 of just the GPIO patch since Bart had some review-comments
there. Bart still had 2 more small remarks on the v3 GPIO patch. So I'm
about to send out a v4 series (with just changes to the GPIO driver
compared to this v2).

I hope Bart will be happy with v4, so then Bart can let you know if
he prefers an immutable tag, or wants you to merge the GPIO driver
into usb-next.

Once it is clear how to proceed with the GPIO driver I suggest that
we get both of them merged and then wait for feedback on the I2C driver.

Regards,

Hans



