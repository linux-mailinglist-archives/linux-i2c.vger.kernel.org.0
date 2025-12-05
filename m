Return-Path: <linux-i2c+bounces-14412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4926CA6246
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 06:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89CD4307A312
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 05:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5AE2DC76D;
	Fri,  5 Dec 2025 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgTGrHEe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEDB1EB5FD;
	Fri,  5 Dec 2025 05:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764912095; cv=none; b=jAJCcFFPdQ0xZWC6MBywDTVHlriYqmRA7pOxFAjYwUjo7EDRBDDza4SmcomYodgPo7aBlr0Ex0tpaAT9+d1aBQ0nRXMbEYVdWTFl4qKg7y70mZXp9D/VfWiSsOQTWnS7ZTSXOcrGdczrfqJTbh24QT4XjFxSaBFW8Itogco0PGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764912095; c=relaxed/simple;
	bh=kk3c5j+t6WLHaRxlpgCNE3DhwIMxGj/nBfsPSzfsrFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQrVqJfWVAtzLF/juteQArlgO3vzq7EdT6o7gRP9WiXGHyzs4dmcMU/759WQjpStOvjO8EPTGURzeZ8uKX+q+6H9LI4/2HmxZxiT/T4AvG7d9DbmvWHEL4fo3w2t2NHHMPL+qxiS7415t7uc3myiaFtEAeVVA0ZhYmlfvDCiuDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgTGrHEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169C1C4CEF1;
	Fri,  5 Dec 2025 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764912095;
	bh=kk3c5j+t6WLHaRxlpgCNE3DhwIMxGj/nBfsPSzfsrFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UgTGrHEe+AHSiozlPOhnIb0pGxAu4KCnjTSYuFBQ2zs3Y/jtBHUb8yPWCvI3wByD4
	 JSmfeGYfQCwhqF69AWt1gqDzN1tPTl1EnnQ/UzzLxJymhgKHj/GKcxTDoP4rEJ2HkR
	 JUMSu7GFY6J9DsY/Tw3GO3/gLB59UIjSIwoh7GUvM66xmPDqb2PrUHjaK4VDOITyOg
	 XUMC3NSR+wQpgjeHN7szgQDfhymE7rx+qjytOdTfsvHb4B5yUFWahvi5p4skeBzVma
	 HN8TDkLo2DcEqt+VGjpp7xvj0rWYPzzlZowVryt7Ef4mip6SyW62PL3rJvMwCYoL0s
	 k6SQniaErQWww==
Message-ID: <8e3ae563-a058-40c5-a721-834d7bda141d@kernel.org>
Date: Thu, 4 Dec 2025 23:21:32 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com, andriy.shevchenko@linux.intel.com,
 bartosz.golaszewski@linaro.org, benjamin.tissoires@redhat.com,
 dmitry.torokhov@gmail.com, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 regressions@lists.linux.dev, rrangel@chromium.org, wse@tuxedocomputers.com
References: <f983382a-821c-40f0-a41e-ba9f47ae73c5@kernel.org>
 <20251205040141.1735580-1-safinaskar@gmail.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251205040141.1735580-1-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/4/2025 10:01 PM, Askar Safin wrote:
> "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>:
>> Random thought - is this happening specifically when the lid is closed
>> and you're applying "pressure" to cause the touchpad to click with the
>> lid closed?
> 
> No.
> 
> I already sent script, which calls rtcwake in a loop. This script reproduces
> the bug. I don't touch anything when it is running.

Right; sorry about that I forgot with this thread starting such a long 
time ago.

> 
>> If that's not it, I would check if you have the latest firmware for the
>> touchpad.  Unfortunately this isn't something "commonly" flashable with
>> Linux like is the case with BIOS and other components.
> 
> I already downloaded "touchpad firmware update utility" and did run it
> within Windows. So, yes, I have latest firmware.
> 
>> Maybe @DellClientKernel could provide some guidance.
> 
> Dell.Client.Kernel@dell.com was in CC all this time.
> 
> Also, I contacted support via web chat (and said my service tag, of course).
> (My laptop comes with Ubuntu preinstalled.)
> They said I have basic support only,
> so they will not look into the issue too deeply. We had lengthy chat,
> and in some moment they said that they will not debug OS-related issues.
> I. e. if I want help with this bug, I should reproduce it without OS,
> i. e. in BIOS setup utility. Of course, this is not possible, because
> one cannot suspend BIOS setup utility.
> 
> I sent them link to this thread and said that the bug is probably in firmware.
> But they seem to ignore this.
> 
> Also, they said I can send the laptop to them, they will try to fix it and
> send it back. I don't want this.

OK.  It sounds like you have exhausted relevant avenues, I'm aligned on 
a quirk.

> 
>> But yes; failing all that it's viable to make a quirk.  You can follow
>> any of the ones I've submitted for modeling how to do it.  Here's the
>> most recent one I've done.
>>
>> https://github.com/torvalds/linux/commit/23800ad1265f10c2bc6f42154ce4d20e59f2900e
> 
> Thank you! I will write something like this:
> 
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Precision"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.ignore_wake = "VEN_0488:00@355",
> +		},
> 
> I will test it and then properly send (hopefully today or tomorrow).
> 

This match it too liberal.  We don't have any evidence it applies to 
anything more than your single system.  I'd pick some different strings. 
  For example Product SKU is probably a good string to use because 
that's very unique.


