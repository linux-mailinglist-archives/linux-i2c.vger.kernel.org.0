Return-Path: <linux-i2c+bounces-13675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B458BF1389
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 14:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7B1D42324B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 12:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A3431282C;
	Mon, 20 Oct 2025 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWdKtgvt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27103126DF
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963374; cv=none; b=uJ/oqGwmKu+qOMDSRzVK4/ya946WmKFtXRYSsk0E3GSegmL65yN88V5uYc1o8CbyQbhaWPTg6E37sLaLi8jIfvQM+hPLB3TIsjwUWILnxG+b3q5cCp7rQmRilVUCVo7lb0Wos5EQEzbqlNF0lbNTPFB9KUJluisNWAuZrfTC2TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963374; c=relaxed/simple;
	bh=lPB0alGlk1ot/lil+uB3TJ/L99mqpQUdxhosrCZbZ2A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=si4HFiKcSzpxxoLl6ib9Qu3MpyoaoGvb9uJ8HftgavJIXpbi/ETPUsqCFEybxR8BLhwv4VdXKbrnLoVxj3BaJbWoM+1+Fa2Q1BKlndFcZ1regAq/XsdczotlForGW2VsqPQOIYT1gGy1sTIdQUOBkkjro3vO0BBN/odFKsnIn1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWdKtgvt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A88C113D0;
	Mon, 20 Oct 2025 12:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963374;
	bh=lPB0alGlk1ot/lil+uB3TJ/L99mqpQUdxhosrCZbZ2A=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tWdKtgvtBFaXTDyaGD4l8ez2gl0lZeQbcq0JhyBKEUVy9d2oCLHLMGsW1Ft/YoLl5
	 m6oQxsJ20sa0prnvU10RsWeEnsokiy1Bloyjh28X3iZ0eiZ9Z7kXwERiSqHhC9LFSS
	 HDmUqNjEwQJkEBAFtpjM/INgwKAr+pPVJcDaUJvZ2qGCBn9ryImVU33HSb6hEb+io0
	 i7z1vdlbcgwK/t2P/dMN+VfzmT3vogxWaFP+eX61KqyqCPtCtbqpSnKqeGAElppLsW
	 MMo63Q6brBkEKO+Pj3ScbgcdT2nGAMcPwtqqJoWMcqBLUOQOtqA9ArV99VQTaSIDLa
	 VNDXwCC4N3I0w==
Message-ID: <90d52cf9-e3e3-437e-ae00-fc2a2bfbb0a9@kernel.org>
Date: Mon, 20 Oct 2025 14:29:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 review list <kernel-list@raspberrypi.com>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <20251020115959.GM2912318@black.igk.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20251020115959.GM2912318@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+CC kernel-list@raspberrypi.com since I wonder if the RPi devs are aware of this.

On 20/10/2025 13:59, Mika Westerberg wrote:
> Hi,
> 
> On Wed, Oct 15, 2025 at 01:25:02PM +0200, Hans Verkuil wrote:
>> Hi,
>>
>> I have this code in a driver (writing display EDID data into an EDID EEPROM):
>>
>>         struct i2c_msg msg[] = {
>>                 {
>>                         .addr = state->seg_client->addr,        // 0x30
>>                         .buf = &seg,
>>                         .len = 1,
>>                         .flags = 0,
>>                 },
>>                 {
>>                         .addr = state->data_client->addr,       // 0x50
>>                         .buf = data,
>>                         .len = len,
>>                         .flags = 0,
>>                 },
>>         };
>>
>>         err = i2c_transfer(state->dev_client->adapter, msg, ARRAY_SIZE(msg));
>>
>> This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, but for
>> the Raspberry Pi 5 using the designware driver it fails with -EINVAL and these
>> kernel messages:
>>
>> [  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid target address
>> [  272.305788] i2c_designware 1f00074000.i2c: controller active
>>
>> Looking in i2c-designware-master.c it seems it cannot handle consecutive messages for
>> different addresses.
>>
>> The i2c device I'm using is this one:
>>
>> https://www.onsemi.com/pdf/datasheet/cat24c208-d.pdf
>>
>> Is this a hardware limitation? Or is this a corner case that was never implemented?
>> Or just simply a bug?
> 
> I'm catching up what has happened to this driver since I last did something
> for it so please excuse me if I'm stating obvious things ;-) Also was on
> vacation last week, sorry for the delay.
> 
> The Intel I2C DW datasheets say that the I2C_TAR register must be
> programmed only when the controller is disabled (I2C_ENABLE=0) or no
> initiator mode operations are active.
> 
> I think this explains why the driver does what it does.
> 
> Since this is I2C EEPROM, pretty standard I guess. I wonder if you have
> tried the at24.c driver instead? If I read it right it splits the chip into
> multiple "clients" per segments thus avoiding limitations like this. IIRC
> this works fine with Intel controllers at least.

It's not a standard EEPROM, it's an EEPROM specifically meant for storing
display EDIDs. The host (in my case a Raspberry Pi 5) can write an EDID to it
over i2c, and it is also connected to the HDMI DDC lines so a video source can
read the EDID using the E-DDC standard. So the cat24c208 has two i2c ports,
one towards the host, one towards the HDMI connector. We use the cat24c208 to
emulate a display so we can easily debug various EDID issues.

It all worked fine with the RPi 4 and the Broadcom i2c driver, but not with
the RPi 5 designware i2c driver. It took a while before I noticed this since
most EDIDs are <= 256 bytes, and you don't need the segment address for that.

So is this a hardware limitation? I.e., there is no workaround and this simply
can't be supported?

If it is, then I will have to look for alternatives.

Regards,

	Hans

