Return-Path: <linux-i2c+bounces-13667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300BBF04B7
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 11:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ADAA3B45AB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18052F6578;
	Mon, 20 Oct 2025 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRDbG4au"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F92F6191
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760953290; cv=none; b=iYMhuBx97RmTESn+7rZSUhSJPlgIH6gbG5w8jGMi9pWNf8FqIVAwPjdRDGyvrtz83yxhV3VlYuLbyOhMHQTFu83z8toUHoGGC1S2URSndOUI/C4IFbHQNwL2e5eRjIE1HK31VA2EGFMURh7feIEAt9cHr/M3AcXkmevJ9w7T59I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760953290; c=relaxed/simple;
	bh=uJ+GkmbjAi/F1168GKscdW3UxhRmGs0C+L2h7Y6lGGE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=U1TkcESl7obSCEfsEkf0YZPSsx5iRkaaH3cm8vNfV9NSOD5PLBUT4qsBUtQ2WTbMIGZNfqPSFC9c90Z2FycnNZhie5Hu/doN6RPO1JGjOuVO7nq7K0uYM6wUEnjqUJHzzzNOXwzUFVZ+0lI+v7Ls28w/bOIx4jKaFrmcFSEtIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRDbG4au; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045D5C4CEF9;
	Mon, 20 Oct 2025 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760953290;
	bh=uJ+GkmbjAi/F1168GKscdW3UxhRmGs0C+L2h7Y6lGGE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=tRDbG4auxY9vM30hsNVDCWNWozsmyqLfnQvvPfnLdTAr6zIeOyaGjfxvsu0utcUdH
	 Bd737kKnu9GO1SGDDH2W2iESBxIzv0EPxP+vXCb8ZXjgSxZEinXLJDlJxKYFvgjP+o
	 5akORaMVk+BisSVKSOSp0LuTWuBOv41ayjhHrIiXx8yWFkZyZZStZd0zZjlzKmtkzk
	 BN2EeMF19kNpqYsS7090vWM+0bngD+jt/EOeTm6S7Se/6JPrCT2+WypYaZOZuQWvG/
	 aIEDcqu5v9dkxp4jHCLRFP9p6X+EL8KGyZKvRfkEDykT+Q5n/69ziYnnEVWJXGNwEL
	 6aAJgC6Xd7VlQ==
Message-ID: <9293b12f-1fbb-407a-b838-ca18a6cd7fa6@kernel.org>
Date: Mon, 20 Oct 2025 11:41:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <aO-KuJ_T9cXsNpIh@ninjato> <aO-kZUwqcoqnFfTh@smile.fi.intel.com>
 <a776e232-d26b-405c-b468-0e449296becd@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <a776e232-d26b-405c-b468-0e449296becd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2025 20:17, Hans Verkuil wrote:
> On 15/10/2025 15:40, Andy Shevchenko wrote:
>> On Wed, Oct 15, 2025 at 01:51:20PM +0200, Wolfram Sang wrote:
>>> Hi Hans,
>>>
>>> lucky you, I happen to have a board with that controller on the table
>>> currently :)
>>>
>>>> This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, but for
>>>> the Raspberry Pi 5 using the designware driver it fails with -EINVAL and these
>>>> kernel messages:
>>>>
>>>> [  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid target address
>>>
>>> Confirmed.
>>>
>>>> Looking in i2c-designware-master.c it seems it cannot handle consecutive messages for
>>>> different addresses.
>>>
>>> I agree. I leave the final judgement to the experts (Andy, Mika), but I
>>> already anticipate that I need to extend the existing
>>> I2C_AQ_COMB_SAME_ADDR quirk into a more generic one. And set the quirk
>>> in this driver.
>>
>> May I ask a dumb question? Why do we need such an awkward transaction
>> to begin with?
>>
> 
> That's how the datasheet defines the transfer. And in turn it is based on the VESA
> E-DDC standard for reading display EDIDs. By doing it in a single transaction you
> ensure that the bytes are written to (or read from) the correct EEPROM segment. If
> it was split in two commands, then someone could change the segment inadvertently.
> I.e., you set the segment to 1, then someone writes to it as well and sets it to 2,
> then you write the EDID data to the EEPROM, which has now selected the wrong segment.
> 
> For now I have split up the transaction into two independent transfers in my driver,
> one to the segment address, one writing to the EEPROM. This works, but it is not really
> how it is supposed to be done. And I was actually surprised that it worked, since a
> write to the EEPROM without writing to the segment pointer first in the same transaction
> should write to segment 0, according to the cat24c208 datasheet.

Actually, my hack didn't work. It behaved exactly as the datasheet describes: if it is
done as two separate transactions, then when writing to the EEPROM will actually write
to segment 0, not 1.

My test was buggy, and after fixing it I could clearly see that the segment write and
EEPROM write must be part of the same transaction.

Regards,

	Hans

> 
> I couldn't tell from the designware driver code whether this was 1) impossible (HW limitation),
> 2) possible, but not implemented, or 3) a bug. The comment in the code before the
> "invalid target address" error was rather vague.
> 
> Regards,
> 
> 	Hans


