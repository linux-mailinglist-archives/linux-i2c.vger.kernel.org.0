Return-Path: <linux-i2c+bounces-12178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF9B1F518
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 17:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9AFE56369A
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 15:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535CE2868A1;
	Sat,  9 Aug 2025 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naulVuZo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD031E515;
	Sat,  9 Aug 2025 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754751942; cv=none; b=tfY4yPMbqezs32oT4JFzvjZBsjyLxdyNPaWmJOhwuUl+QvjSx4jfe16a9V2RLzkXgkLlrttj1YPvB5nFmZIMIWbaFzyX5HkgszOKXPkU62GrAhYKwZy6t8eXQ8Oe9SKdtahvr8wEU1oUOiQ+bmIpg2hWDqStrH+W4FgnJcQARDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754751942; c=relaxed/simple;
	bh=YGHBFhz3+GKcr2f9b2Z/DcjT1BGMj9gGWjvqGBrttds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsjQlXvLbYQpIMfp4VFeB+RkGP5X2B4vYcjVRkOh8il5VU+yNEOWBCOxnl8iCt45YOkgStKNvJ8mAlK7RzG+cCyF1erWgBUDyvlZ0zUIe0/6p4p/TbuSqP188fX9HTgBwC/XeoUi15ug7tlyLMnGVyXU/w4XJX9LOEdL71waSh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naulVuZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB81C4CEE7;
	Sat,  9 Aug 2025 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754751941;
	bh=YGHBFhz3+GKcr2f9b2Z/DcjT1BGMj9gGWjvqGBrttds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=naulVuZodL6L5DgRIoZ6/XCfY42TdIcBRVNxoZIezsCrBNVZDzrxM0LfVppeejrZU
	 ajxdK9g26OKWjTb/CLW7oSxZo9gg1sJB4uBDO54yv6lXvdlSRGJbWam0vm3a6OrLWL
	 6kiblEcqwOaAQLB54iajyepvTKcAXRCAun7cEH0G4VuEWDlRFPme6FJWW2Is1i0Msu
	 UZjcZpJZ3qQI0dhQg8AgQ3n+RntCZEERwBl4SjFAC1iXSzd7VujurQyUzBq6L2EdDo
	 ajzI/bofjfForXvV1JHv2Mb7utf+mXVpxeKOc+l69Mf+6akPq7JQ+qMnO9gDk2GJpk
	 3gIHl3rY/wHnw==
Message-ID: <5b550b88-229e-427b-bdfa-d0e156d18330@kernel.org>
Date: Sat, 9 Aug 2025 17:05:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org> <2025080947-stoke-movie-ee4d@gregkh>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <2025080947-stoke-movie-ee4d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Greg,

On 9-Aug-25 4:28 PM, Greg Kroah-Hartman wrote:
> On Sat, Aug 09, 2025 at 12:23:24PM +0200, Hans de Goede wrote:
>> +struct usbio_protver {
>> +	uint8_t ver;
> 
> Nit, but you do this everywhere.  Kernel types are "u8", not "uint8_t",
> that's a userspace C type.  Please use the correct ones when writing
> kernel code.

Ack and also ack for the mission endianness on
the bigger word sizes.

I'll fix this all for the next version.

>> +} __packed;
>> +
>> +struct usbio_fwver {
>> +	uint8_t major;
>> +	uint8_t minor;
>> +	uint16_t patch;
>> +	uint16_t build;
> 
> What is the endian of these u16 variables?
> 
>> +/* USBIO Packet Header */
>> +struct usbio_packet_header {
>> +	uint8_t type;
>> +	uint8_t cmd;
>> +	uint8_t flags;
> 
> Are these crossing the user/kernel boundry?  I think so (same with
> above), and so shouldn't they use the proper types (__u8)?

No these only cross the kernel <-> hw boundary. This is not
uapi. I'll switch all these (everywhere in this driver) to plain
u8 / __le16 / __le32 for the next version and use 
le16_to_cpu, etc. to access the bigger word sizes.

Regards,

Hans






