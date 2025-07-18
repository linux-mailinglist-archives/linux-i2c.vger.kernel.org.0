Return-Path: <linux-i2c+bounces-11966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C5B0A6FB
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 17:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0748C1C45234
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 15:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468162DCF77;
	Fri, 18 Jul 2025 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5rACPPi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD41C8610;
	Fri, 18 Jul 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852021; cv=none; b=FKvElMrYppPkDuisLtV9uYvpC57kFXCNFwyEFqf+9CbNDv7lO4WnOX9PfjvE17tqbPWM3ekC7uUTnKC1TLn03pRf/tpE2+c22ejmOl0JxkwAI/4p09Mj2O3f0ZG3xVhzZ0Q+VswjShhrLkHPhWGpn5jIrY/bJQdqmNuz0D3UnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852021; c=relaxed/simple;
	bh=BmGkU7v8BAThTINykDYD2vQ7zEBSXJ270qquLCbAUcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdVrrhp/WgQ/SvbVNrPTG1HGxvKTzs7mNLk+ZkhzKuWaOBZqoMPWj338iLApwa7reFoVlZdspxjPcFXgTXG/g7EFBSFso7wPwbKslLhALm/CLIJAtbO+UaCdY1amqY9Hc0DBZ1f+ZoSB1aFnXqSBHMAOQfkdPjw2TnPrM8uj+bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5rACPPi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F70C4CEEB;
	Fri, 18 Jul 2025 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752852020;
	bh=BmGkU7v8BAThTINykDYD2vQ7zEBSXJ270qquLCbAUcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B5rACPPidNkSshBiD3ikqPXOcUAx4KQoausVIibqDXeUiad54EPpDhwf5+UQllZOm
	 g8QJQJ8DNH8e4lRFkRs3dAyq3z3/C9qEJENXEIypZGajl49a8FKa6ZFNH8lLidICyK
	 4fYtRpVIh/jQae3n7q/KFpbvBBkBFyDAPaodPjZt3JLtrTcEwcLe/oAFUtXIhhXI4Q
	 1U1Dm3mKnPcFFXW1VqoMs/4izUKsrsa6/fZHtiWCO/7JbGsFKha5tTu3A915KehtXU
	 Sfk7cTfKBAup71xlo3SwQiuVTgOXqMP4P7UE5Ij9umz/L+sGjX7yoYwbHSX6kfsN5G
	 BEfbqD/Y4FqVw==
Message-ID: <b8ec91d0-1c87-4bcc-8dec-49d6864fff23@kernel.org>
Date: Fri, 18 Jul 2025 10:20:18 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Werner Sembach <wse@tuxedocomputers.com>,
 Askar Safin <safinaskar@zohomail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux i2c <linux-i2c@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 regressions <regressions@lists.linux.dev>,
 DellClientKernel <Dell.Client.Kernel@dell.com>,
 linux-gpio <linux-gpio@vger.kernel.org>, Raul E Rangel
 <rrangel@chromium.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
 <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
 <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
 <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
 <1981ab878bb.122f8227039020.1935112937005363340@zohomail.com>
 <14737334-507e-41b2-8d3d-88a3f7a02b04@tuxedocomputers.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <14737334-507e-41b2-8d3d-88a3f7a02b04@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/18/2025 10:13 AM, Werner Sembach wrote:
> Hi,
> 
> Am 18.07.25 um 01:29 schrieb Askar Safin:
>>   ---- On Mon, 30 Jun 2025 22:40:28 +0400  Mario 
>> Limonciello<superm1@kernel.org> wrote ---
>>   > Looks like your interrupt 14 is ACPI device INTC1085:00.
>>   >
>>   > Some quick searches this seems to be an Intel GPIO controller.
>>   >
>>   > Andy,
>>   >
>>   > Any ideas how to debug next?
>>
>> So what?
>>
>> I will repeat: similar bugs were already fixed here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?id=782eea0c89f7d071d6b56ecfa1b8b0c81164b9be
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?id=a69982c37cd0586e6832268155349301b87f2e35
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?id=4cb786180dfb5258ff3111181b5e4ecb1d4a297b
>>
>> So we just need to add similar patch. I. e. something similar to this:
>>
>> +        .matches = {
>> +            DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
>> +        },
>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>> +            .ignore_wake = "ELAN0415:00@9",
>> +        },
>>
>> Remaining question: how should I get these strings on my system? 
>> "NL5xRU" and "ELAN0415:00@9"?
> 
> DMI_MATCH(DMI_BOARD_NAME, *) will match to /sys/class/dmi/id/board_name 
> (/sys/class/dmi/id/ also contains a lot of other strings to identify 
> your device e.g. /sys/class/dmi/id/sys_vendor which can be matched with 
> DMI_MATCH(DMI_SYS_VENDOR, *))
> 
> How to get "ELAN0415:00@9" is somewhere buried in here https:// 
> gitlab.freedesktop.org/drm/amd/-/issues/1722#note_1725104
> 
> Best regards,
> 
> Werner
> 
>> -- 
>> Askar Safin
>> https://types.pl/@safinaskar
>>

Before jumping into quirk development I think we need to know exactly 
what GPIO is being tripped and that needs to be matched against the Dell 
design (or Intel specs if it's an "internal" GPIO).

That's why I was hoping Andy could help advise.

On the issue that was linked there we knew the GPIO was tied to the 
attention interrupt for touchpad/touchscreen causing the issue so it was 
easy to look at an acpidump and figure out what it's supposed to be.

