Return-Path: <linux-i2c+bounces-13353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED1BB3FA7
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 15:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABEAE19E02EA
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 13:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE502EC0B3;
	Thu,  2 Oct 2025 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHOjVmPq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4329ACC5
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410273; cv=none; b=kj5NNFoqZkGqD2X7/cO4jCEflZymnlNDe6bTpQZ9Ht2dYx+vQgoB4mYsHCo5GNj0B44AaRW0VhsJLazJumGhxEExQPodbTvB+6aZioPgTy/KTRSugmJgSPqrZ/CTwVQj05z1Iq2IcejI/3bJ4fHMO/HZ/QJzq08/HWAzVxzTllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410273; c=relaxed/simple;
	bh=P2W7ZTwy09JYm3mlAlWu8qAtYXvLfi55aNxaW5TrMM8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BY0r9tbVe5PIs+MmneUNh5ye2QUwin30JlK2pfP7UAMimIY0zo34B8QrEodN0JTuFzMqm1SBW0s0uGRAujqb/4555ypxmNNgeztAARbR67sBFCgMdznnUzR0APiVL8pjglIUbmckPV1WTgRweUCE6egLAgsJvCsUxEIdm5WQqr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHOjVmPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA7CC4CEF4;
	Thu,  2 Oct 2025 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759410273;
	bh=P2W7ZTwy09JYm3mlAlWu8qAtYXvLfi55aNxaW5TrMM8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=AHOjVmPqWSleGExDXUXh+VEmNnu6z0jXB572EpcGV54G0XsxCoBVCmENK8JQH/ElG
	 0c/FyONUM15/c45pJGu7Z3xDYNqMIbrEICQNVKOd8c0Tk1Z4bF05CeA8GfoN5Rffb4
	 3yQ0Le7ABQWZKg4OkGqwVqAfmtvr5uEwvHPEmLY0rWBYXPYJ4qgOi5B0f9+degmOAC
	 WRuFdz946blIAarWPqQjfrjMO7/tDmkehHL6NVD38YRmDhm4JDP6xLCGH0drhtrpZz
	 LZNTMUtIMuOEa1RGesRc7KXRRJFAURAElkbxPRO0DmRdTpvFXl8gfpX7AVm1UJ4KBu
	 +A66nWD9n1JiQ==
Message-ID: <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
Date: Thu, 2 Oct 2025 15:04:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2-Oct-25 11:18 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Oct 02, 2025 at 10:56:47AM +0200, Hans de Goede wrote:
>> Hi,

...

>>>> INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
>>>> an actual system that uses USBIO and this HID?
>>>
>>> Actually it looks like i2c-ljca.c shouldn't list this HID. The same
>>> probably goes for all 10CF--10D3.
>>
>> I would not be so sure of this, there are at least some Dell systems
>> which use a combination of ljca and Meteor Lake and I believe these
>> do use the "INTC10D2" HID with LJCA for the I2C part and the same
>> goes for the GPIO / SPI parts.. One example of such a system is
>> the Dell Precision 5490.
> 
> LJCA on MTL is supposed to be 1008. Do you have the *SDT so we could verify
> this?

I just checked this in a ssh session to the Dell Precision 5490:

hans@prdel:~$ cd /sys/bus/auxiliary/devices/
hans@prdel:/sys/bus/auxiliary/devices$ ls
intel_ipu6.isys.40      intel_vsec.telemetry.2  soundwire_intel.link.2  usb_ljca.ljca-i2c.1
intel_ipu6.psys.40      snd_sof.hda-probes.0    soundwire_intel.link.3  usb_ljca.ljca-spi.0
intel_vsec.telemetry.0  soundwire_intel.link.0  usb_ljca.ljca-gpio.0
intel_vsec.telemetry.1  soundwire_intel.link.1  usb_ljca.ljca-i2c.0
hans@prdel:/sys/bus/auxiliary/devices$ cat usb_ljca.ljca-*/firmware_node/hid 
INTC10D1
INTC10D2
INTC10D2
INTC10D3

So as you can see this really is using the INTC10D* HIDs and these
are thus duplicate between the LJCA and USBIO IO-expanders.

Note this does not really cause problems since we have the USB driver
binding by USB VID:PID first and only then the code looks for
the ACPI HIDs for the GPIO/I2C/SPI children so at this point we are
already in LJCA resp. USBIO specific code-paths.

I've also asked for an acpidump, do you still want that once I receive it ?

Regards,

Hans






