Return-Path: <linux-i2c+bounces-13630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4270BED7A0
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 20:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C26D4048FE
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 18:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E436224234;
	Sat, 18 Oct 2025 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJDzIEdO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBEB1DDDD
	for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760811460; cv=none; b=DnM44vei8MowSFtox/ee8lOJru80kxPJd3xrS7xekUeR0HH+QeOwNYoKCHUBlzcAw1ZoE0VJGOgXqHHr2idKqZ2kDtiT8O8beG+0kEEc4RBS6wDcycrSq23BJThF/dAlUkN8RpaQSfA5m9d9UVCVNpdb1VoVjWB9VWZb6CSOq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760811460; c=relaxed/simple;
	bh=XCJUSVujFjlCSG5/DPxYhoqiSdJoIFJ9JwOOVsaAuhw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OfdVYkzE/XQkIcleOk6HoI1CI7xNLpmj5Uj63odjbkh65r5rRYSK7n6kzJrz8x0l8UU9peRiZk3hhaF/k+GXdSHQPwMxSoB/Rk5OP9gOdQnU7kFqQIXBQs/omtw1oZcWlSpx0jNU7jNL79t8XdqKaGI0/MV2vSPD5l89Y0Ps4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJDzIEdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DB8C4CEF8;
	Sat, 18 Oct 2025 18:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760811459;
	bh=XCJUSVujFjlCSG5/DPxYhoqiSdJoIFJ9JwOOVsaAuhw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WJDzIEdOnl1MysGLIs3eIuA4m2J9ah/eCV6f1bo1pl4steN4fcoLzv/M+6NS6S+Dg
	 d4ISG505kWasEtH2R7SpS0+jdRTJ/qoQN4YYkfnloYSnsRecEoyBtki/xxAL96fKZ2
	 qIcpF3XvmJdplYF/EQeuh4Bqy23fywJalYqW+ht+ZLNm9LZc5rUO3nhajDBCEDWXj6
	 50vbZjS5ghCOJtHqo8g6AOqbQH4tQawPpdt3DnNNqGcO0/dgeoNYXKlb6Xn4pFj2OA
	 BbUZWGuRFCr4ISOeEJetiQvKSxa2nZbUmaU6RsCUWBplW31h14jVTopgZ+MZKTVJVS
	 9PvdUj8HU0GSA==
Message-ID: <a776e232-d26b-405c-b468-0e449296becd@kernel.org>
Date: Sat, 18 Oct 2025 20:17:36 +0200
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <aO-KuJ_T9cXsNpIh@ninjato> <aO-kZUwqcoqnFfTh@smile.fi.intel.com>
Content-Language: en-US, nl
In-Reply-To: <aO-kZUwqcoqnFfTh@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2025 15:40, Andy Shevchenko wrote:
> On Wed, Oct 15, 2025 at 01:51:20PM +0200, Wolfram Sang wrote:
>> Hi Hans,
>>
>> lucky you, I happen to have a board with that controller on the table
>> currently :)
>>
>>> This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, but for
>>> the Raspberry Pi 5 using the designware driver it fails with -EINVAL and these
>>> kernel messages:
>>>
>>> [  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid target address
>>
>> Confirmed.
>>
>>> Looking in i2c-designware-master.c it seems it cannot handle consecutive messages for
>>> different addresses.
>>
>> I agree. I leave the final judgement to the experts (Andy, Mika), but I
>> already anticipate that I need to extend the existing
>> I2C_AQ_COMB_SAME_ADDR quirk into a more generic one. And set the quirk
>> in this driver.
> 
> May I ask a dumb question? Why do we need such an awkward transaction
> to begin with?
> 

That's how the datasheet defines the transfer. And in turn it is based on the VESA
E-DDC standard for reading display EDIDs. By doing it in a single transaction you
ensure that the bytes are written to (or read from) the correct EEPROM segment. If
it was split in two commands, then someone could change the segment inadvertently.
I.e., you set the segment to 1, then someone writes to it as well and sets it to 2,
then you write the EDID data to the EEPROM, which has now selected the wrong segment.

For now I have split up the transaction into two independent transfers in my driver,
one to the segment address, one writing to the EEPROM. This works, but it is not really
how it is supposed to be done. And I was actually surprised that it worked, since a
write to the EEPROM without writing to the segment pointer first in the same transaction
should write to segment 0, according to the cat24c208 datasheet.

I couldn't tell from the designware driver code whether this was 1) impossible (HW limitation),
2) possible, but not implemented, or 3) a bug. The comment in the code before the
"invalid target address" error was rather vague.

Regards,

	Hans

