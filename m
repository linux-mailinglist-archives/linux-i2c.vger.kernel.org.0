Return-Path: <linux-i2c+bounces-13347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92137BB35DB
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 10:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44DD3168836
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 08:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC84E2F360E;
	Thu,  2 Oct 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVW5wgeK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BACD2F3C20
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395411; cv=none; b=H8wv621l+Qoy2HFJyaGfB7K6xolcFGEvsFo0uIIgug28bMfKWMcRMCO3NRteF8gvoceDGfmUAuLpBHJv8jYRR6ie5mF468zb3Lo5hUepZQiHD64scML3SyfClNLFwRAu4My2azrTkRPHCBUD/iKDz8Cmzkw1AvvmejlMMFNd3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395411; c=relaxed/simple;
	bh=yPoq1HPXC8PoCXQlxeKIMiUUbNviIUL/0n1I9d94w5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAgm2w9J548WDB5CzMQk2ZYRkrPGuGCwTmZChH/qTzKhA9gy/JugtJQn/VLNkVweJNW2i1PSo2ePz5x+SsNbrG8c3gdYylR886JMdQUXnUr6pxJ4hkWHLSqH7BHVHv9mXP7qoN0pelfxrIXUcz8RTT6c9O54tQNmukXl6fPFws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVW5wgeK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F54C4CEF5;
	Thu,  2 Oct 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759395411;
	bh=yPoq1HPXC8PoCXQlxeKIMiUUbNviIUL/0n1I9d94w5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SVW5wgeKPnpDKaAShqd2fzTroposBXfzj3EmvnQTnlAVGAYojR18aFgH+kncW46GU
	 9jMw6k6Z0yUiFv6nHGPLi38GrtIomBOd0196V6GW9cWjNWWFroXNEwlxVpMDkCRwcA
	 CEE3CXEM9ED9oACPK7XAIHzI8GW2c/tlMwm9M5Zh6pynMtYH++4xk4T5FUIH7Hs3af
	 EHmIqwANTvdikLdp4YTGyDoi4nxU8QBAWpAZUBszejVw3lYZn+cKLLXdbjWyBEdBqm
	 sL1Jr1RrRxP2SRd+eI7x/Ha/eoAYtcDU5f7Hh19dfnAR/a2G38tcaY2qjJBiJka0qY
	 VYwigL62X4r+A==
Message-ID: <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
Date: Thu, 2 Oct 2025 10:56:47 +0200
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

First of all I messed up the git format-patch command,
there is no second patch in this series.

(at least not for the i2c subsystem. There is a similar GPIO
patch but I send that out separately)

On 1-Oct-25 11:58 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Oct 01, 2025 at 11:23:10PM +0200, Hans de Goede wrote:
>> Add "INTC10D2" ACPI device-id for MTL-CVF devices, like the Dell Latitude
>> 7450.
>>
>> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>> Note this applies on top of the addition of the new i2c-usbio driver which
>> is being merged through gregkh/usb.git usb-next
>> ---
>>  drivers/i2c/busses/i2c-usbio.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
>> index d42f9ab6e9a5..e7799abf6787 100644
>> --- a/drivers/i2c/busses/i2c-usbio.c
>> +++ b/drivers/i2c/busses/i2c-usbio.c
>> @@ -27,6 +27,7 @@ static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
>>  	{ "INTC1008" }, /* MTL */
>>  	{ "INTC10B3" }, /* ARL */
>>  	{ "INTC10B6" }, /* LNL */
>> +	{ "INTC10D2" }, /* MTL-CVF */
> 
> INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
> an actual system that uses USBIO and this HID?

Yes, see the Closes: tag which points to a bug-report which such a system:

https://bugzilla.redhat.com/show_bug.cgi?id=2368506

Let me also reply to your other comment here:

>> INTC10D2 is apparently already claimed by the LJCA I²C driver. Do you have
>> an actual system that uses USBIO and this HID?
> 
> Actually it looks like i2c-ljca.c shouldn't list this HID. The same
> probably goes for all 10CF--10D3.

I would not be so sure of this, there are at least some Dell systems
which use a combination of ljca and Meteor Lake and I believe these
do use the "INTC10D2" HID with LJCA for the I2C part and the same
goes for the GPIO / SPI parts.. One example of such a system is
the Dell Precision 5490.

The way these Intel uses these HIDs is really weird they seem to
simply mean "I2C" on *a* USBIO expander with this generation CPU.

Where there really seems no reason to change the HID for CPU
generations, where as it would be a good reason to change the HID
if the actual USBIO expander is different ...

Regards,

Hans



