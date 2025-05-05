Return-Path: <linux-i2c+bounces-10781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17227AA9DA3
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F86417F3D5
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 20:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7567E25D213;
	Mon,  5 May 2025 20:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="Iq4Yd+f+";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="KGjBSdM5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6815680;
	Mon,  5 May 2025 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478672; cv=none; b=ejReQ1cNPx0G5igu8oQ3zK70BQ5jIdcjPrGy/sGpEw2/yuar10Lu6eQ/gDNiolZpwp8OScAQV/P3epvIs09/NM5EX6wIVQ2Cg8+Cjzf4URV1iioj/jiOrVz0BZOk6kSBI3AeXOwimkANZd0shGYYCgQoIE2/2NBwxUgRMvZQuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478672; c=relaxed/simple;
	bh=stC0MOvWH9Ue8a2otPISJ5Vdj7ATBnDHk7dXr4Ai2JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XTXbGLto5jtLgtkQOIA0eU4lVF4pJFsVYPWVvsMlWG2h9/ESJy6FrSuWW+p91KqxRMQVmZQtbJ0K/y6eDHhAWkpXVagUKvGNiz25AySSh76gPfL7KltuXeShRlTqZG3s1/OCSX13vjODaDY17GkC9fCbuRSwb3hvxBsLfHn0NZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=Iq4Yd+f+; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=KGjBSdM5; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1746476462; h=In-Reply-To:From:References:To:Subject:
	From:Subject:To:Cc:Cc:Reply-To;
	bh=BqXOjIBwe+J3YiXs5L21gzfuopeqO07iCQhZSE0tefQ=; b=Iq4Yd+f+brpa5nDC8Fv1t9ynIw
	9YeEJCd7PnTgJwYuit47z4uz0dTGuuCYfM2E2+FrRFKJEfFjvJGgROV/Vfh6KNyb6d4I+nvKvQdhX
	miCjgjAcqYXid6Oet9+SAned7vHyJlduJiwAelqchItVL+A4HIh8zPL7kE2obRuctNO5zafAy5D9X
	Xw1BRH53SB6Nbp6QpqyZsI1UFSPOKK9N59Yn/kXwIL843TT2SlKdrJyNoUhVZSnq8+fl5RvXcMUZu
	mykJ9ng79/Lt456I6cfhjrw47ySSyzr2rgdrOLS+QabKavJum0qkfZKcW+8R5aBduf9soLGJSpMsG
	kdN89LwQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1746476465; h=In-Reply-To:From:References:To:
	Subject:From:Subject:To:Cc:Cc:Reply-To;
	bh=BqXOjIBwe+J3YiXs5L21gzfuopeqO07iCQhZSE0tefQ=; b=KGjBSdM5BaiN1c5nm6X3h71m3x
	LvB6E6WV8wrhNDmYA7ZOsTm6YN8HmxEm+0j/ljAjWhXnNWIEHHea0eed20O1spqg+rdSnYf0qCSjg
	FjXvMYlJwn6T+yB+9V2MOkOdsecR99AzWl2ZIiclsCAf4KA0jk3XNemWuQl+uyAhC33imd8ALtPMa
	0C7PfSd44fFqYoYAiFC2KH/5fBfAUMO1IcjvFOAdq9siRmeO+7e2fvWRIVMn6zQtqM1f4I9G4cphh
	kwE0Q1kqR6HmDk9WV2WPhg5wUHyg50QMTBrhbw0VeYMKMwlGXKWigBaJHbg0CiypjUG7mSuW87T+e
	ey7xT58Q==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1uC2si-00CHpl-2G;
	Mon, 05 May 2025 20:57:44 +0000
Message-ID: <bc9a14b5-8b10-436f-a791-28df245465e6@mattcorallo.com>
Date: Mon, 5 May 2025 16:57:43 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: PMBus memory overflow
To: Guenter Roeck <linux@roeck-us.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>
References: <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
 <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
 <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
 <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
 <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
 <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
 <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
 <aAtEydwUfVcE0XeA@shikoro>
 <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
 <e0e789b3-24c2-4ea3-9c79-fa815d801d83@roeck-us.net>
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <e0e789b3-24c2-4ea3-9c79-fa815d801d83@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/5/25 4:50 PM, Guenter Roeck wrote:
> On 5/5/25 13:41, Matt Corallo wrote:
>>
>>
>> On 4/25/25 4:16 AM, Wolfram Sang wrote:
>>>
>>>> Wolfram, what do you suggest ? Fixing the cp2112 driver is obviously necessary, but
>>>> I do wonder if a check such as the one above would be appropriate as well, possibly
>>>> even combined with a WARN_ONCE().
>>>
>>> How annoying, there was still an unchecked case left? Sorry. Yes, the
>>> core can have a check for a short-term solution. The long-term solution
>>> is to support SMBUS3.x which allows for 255 byte transfers.
>>
>> Thanks!
>>
>> Any update here? I guess we already have a patch so no use in me trying to write one. Would be 
>> nice to get this in a pull so it can head through backports.
>>
> 
> Not from my side, sorry. I am deeply buried in work and don't have time for anything
> that isn't super-urgent :-(

Mmm, shame, its kinda annoying to leave a buffer overflow reachable from a malicious USB device 
sitting around (okay, with the default hardening configs it gets caught, but still). Can we just 
land the above patch from Wolfram to check the length before writing the buffer? Happy to clean it 
up as a formal patch submission if its easier for you.

Thanks,
Matt

