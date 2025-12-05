Return-Path: <linux-i2c+bounces-14410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C5CA5EE9
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 03:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C13F306C2DE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 02:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7709246332;
	Fri,  5 Dec 2025 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA7fgfFX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611977E0E8;
	Fri,  5 Dec 2025 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764903124; cv=none; b=DXiwG7yEEHIiKnJGXxjB1KFmmT3rjiWhgPZbM/vJckuehzzTqMJ9qXzADoRdLtc4MNhZcLZfIFXFA6gyXEShgQ9qph3xNEDzYxOq97d11F95LzVX8huhp1DMwtE44iSClOrxJnXmSXAv1mwCqI4iSTUV7E6udkihJ3R1m8mIyvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764903124; c=relaxed/simple;
	bh=lLEITMTn65IIvzU4WXcnpjMaNc6Wj0csyop+NZ40fdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YH7Dt1Q2fu36zGl0/mS8UDFo49UEHrO0bV6FhI7gT4IUWhJpO1E7ROkzBLetqSIdchix2/JzkAe67xDPLg+FyOidQPAYePivBKWkN1dd3MLFuOLuUO4tdM6NRX40aJEVBCbHOjrbDPxH8ZS2IOm25kiBn65Zw+DoSC6Ao8qyp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA7fgfFX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3292FC4CEFB;
	Fri,  5 Dec 2025 02:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764903123;
	bh=lLEITMTn65IIvzU4WXcnpjMaNc6Wj0csyop+NZ40fdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YA7fgfFX43DAPhxLuuhEClLZMWU5ySss3LjGUa5Z38n0ZDRlQ1G1u1uT5G/LOBSwx
	 Kp9kU6A2I0Xx9YCEqO5W7Oaz0RHSZdoTmtsWLbi6NxsdXLoAJZK6ccl/19ZFtEIXbW
	 FjJA11C8Q2yLpoFWzI6IsQGJ+qKNflA4WSXAuUWRlXg53fS6C1sl6Z8eB1iiRiq/B1
	 UKyynIhhcK8jsxpIdIRYCCHhTDhopCgyxGhHaSmAWLXSduzNk99W2hCoEc3lLfHLJz
	 tSk5aVHbrcjcEngvgFG6/wsQOJyO7ODBCnHWmrcmPuDjApxGAZNlBwD71U5MK4rJH4
	 uD880Kd7iEGbw==
Message-ID: <f983382a-821c-40f0-a41e-ba9f47ae73c5@kernel.org>
Date: Thu, 4 Dec 2025 20:52:00 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Askar Safin <safinaskar@gmail.com>, andriy.shevchenko@linux.intel.com,
 DellClientKernel <Dell.Client.Kernel@dell.com>
Cc: bartosz.golaszewski@linaro.org, benjamin.tissoires@redhat.com,
 dmitry.torokhov@gmail.com, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 regressions@lists.linux.dev, rrangel@chromium.org, wse@tuxedocomputers.com
References: <aRDml95nMPeknmUM@smile.fi.intel.com>
 <20251205021616.1570442-1-safinaskar@gmail.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251205021616.1570442-1-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/2025 8:16 PM, Askar Safin wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
>>> Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
>>> try to add a quirk to prevent touchpad IRQ from waking the system. That should
>>> help I believe.
>>> Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
>>> If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.
>>
>> It might be actually the touchpad controller name (as I see in the quirk table):
>>
>> 	ignore_wake=VEN_0488:00@355
> 
> It worked!
> 
> First, there is no option "ignore_wake". Correct option name is "gpiolib_acpi.ignore_wake".
> 
> I tried "gpiolib_acpi.ignore_wake=INTC1085:00@355", and it didn't help.
> 
> I tried "gpiolib_acpi.ignore_wake=VEN_0488:00@355", and it did help!
> 
> Please, somebody (maybe Mario?) author a patch.
> 
> Thank you in advance.
> 

Random thought - is this happening specifically when the lid is closed 
and you're applying "pressure" to cause the touchpad to click with the 
lid closed?

If so; it's quite possible that the touchpad attention pin is still 
serviced when the lid is closed.

If that's not it, I would check if you have the latest firmware for the 
touchpad.  Unfortunately this isn't something "commonly" flashable with 
Linux like is the case with BIOS and other components.

Maybe @DellClientKernel could provide some guidance.

But yes; failing all that it's viable to make a quirk.  You can follow 
any of the ones I've submitted for modeling how to do it.  Here's the 
most recent one I've done.

https://github.com/torvalds/linux/commit/23800ad1265f10c2bc6f42154ce4d20e59f2900e

