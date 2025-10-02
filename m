Return-Path: <linux-i2c+bounces-13350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA8BB3D6D
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 14:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51DE1C5EFF
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 12:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C6E2F1FCB;
	Thu,  2 Oct 2025 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgHB8bqf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17902D8360
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759406642; cv=none; b=IfHSHHFF9VAppiAr/MlnXq4tkoYe0hn1s9NWhn/FoRPaLyuWeapm1WXbWuppE9zAVSrXbE/Rz+FcrbA/VE3+SvIpXRjyC/vaf+OwS5tGfMTVXS0tvpyjuCcPC7FzdDLYhmftCkLTTFdws1tvEnr14kt6wCMRYN6s7etU3K5QnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759406642; c=relaxed/simple;
	bh=eyfl8uMaPOiXWpRuBMzBPPbHmUQm/AHFB3HIAkqutyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0f33PJMHj2/UhbceG19Kx0IGKQ1NiBFD55DQ24xs75kP5TUmuSTzfE3WB0oI2OpdYqweowq/M/pIMrujB4kITmEcaY/a9EYEQ/TtGvrohvAV1HSgPzMfWx5BOpnP7zcds5zAtGqyc/7CcdJpjSbPQ5mwEbp0BM8eNUTto3dq7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgHB8bqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191FEC4CEF4;
	Thu,  2 Oct 2025 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759406642;
	bh=eyfl8uMaPOiXWpRuBMzBPPbHmUQm/AHFB3HIAkqutyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZgHB8bqfrxoJWW7m55wl6z9juQwPxQUfJN34eVH78jOITy3A8os5reMfbzBACd57B
	 0vn8n5CbaRex6ycTYvvxEMnE0qISuuS6+eMcSKNuipo+kXky1FrWKJ84JfSvOaqzHQ
	 aTcWIAyB/qZr+fSYwd8C2sDGdweqbM7iegDf5jedqGH8QE/tsZfq7mtiHLmgiWfLu0
	 7z9T49tuthzj81VG+3SxUPa2s8mzTI9pmCC6gO1h5haqBeWXjAWUHW2xru9DC3VA0p
	 ignt1T3dbCnmxR5ZxIGIKdYow20cT1XLvS/lCLO1DVF4jtp9olXZNOYIY0YqfGA2OY
	 CDwFMtu9Q2Xuw==
Message-ID: <41c2ceb0-b78a-4de1-ae19-42617737cfd6@kernel.org>
Date: Thu, 2 Oct 2025 14:03:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
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
>>
>> First of all I messed up the git format-patch command,
>> there is no second patch in this series.
>>
>> (at least not for the i2c subsystem. There is a similar GPIO
>> patch but I send that out separately)
>>
>> On 1-Oct-25 11:58 PM, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Wed, Oct 01, 2025 at 11:23:10PM +0200, Hans de Goede wrote:
>>>> Add "INTC10D2" ACPI device-id for MTL-CVF devices, like the Dell Latitude
>>>> 7450.
>>>>
>>>> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
>>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>>>> ---
>>>> Note this applies on top of the addition of the new i2c-usbio driver which
>>>> is being merged through gregkh/usb.git usb-next
>>>> ---
>>>>  drivers/i2c/busses/i2c-usbio.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
>>>> index d42f9ab6e9a5..e7799abf6787 100644
>>>> --- a/drivers/i2c/busses/i2c-usbio.c
>>>> +++ b/drivers/i2c/busses/i2c-usbio.c
>>>> @@ -27,6 +27,7 @@ static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
>>>>  	{ "INTC1008" }, /* MTL */
>>>>  	{ "INTC10B3" }, /* ARL */
>>>>  	{ "INTC10B6" }, /* LNL */
>>>> +	{ "INTC10D2" }, /* MTL-CVF */
>>>
>>> INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
>>> an actual system that uses USBIO and this HID?
>>
>> Yes, see the Closes: tag which points to a bug-report which such a system:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=2368506
>>
>> Let me also reply to your other comment here:
>>
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

I only had this laptop for a short while since it was using LJCA + IVSC
it was not really an interesting device to hold on to. A Red Hat colleague
of mine has the laptop now.

I'll inquiry about getting ssh access to it to collect acpidumps
and also to directly get the used HIDs from sysfs (SSDTs now a days
are often unreadable because of them dynamically assigning HIDs
based on BIOS config variables).

>> The way these Intel uses these HIDs is really weird they seem to
>> simply mean "I2C" on *a* USBIO expander with this generation CPU.
> 
> I can assure you I have nothing to do with this ACPI ID usage scheme. :-)
> 
>>
>> Where there really seems no reason to change the HID for CPU
>> generations, where as it would be a good reason to change the HID
>> if the actual USBIO expander is different ...
> 
> That's indeed supposed to be the case. Also the _HID should always reflect
> the actual device and only _CID should indicate it's compatible with
> something else. But that BIOS is already out there so there's little that
> can be done to it anyway. :-\

Ack.

Regards,

Hans



