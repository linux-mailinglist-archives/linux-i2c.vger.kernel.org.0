Return-Path: <linux-i2c+bounces-11268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382CCAD0955
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 23:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00B8B169838
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 21:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A920221F1F;
	Fri,  6 Jun 2025 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="ipVhB3pI";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="ES2fhaDp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA6221CA03;
	Fri,  6 Jun 2025 21:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749244057; cv=none; b=aqiextdTsS3eomuJ/QA8zkgRZVWMoPrV+hpR2I+TrfH2GWPCwfFYinVtNMYy7PQLoZ+zvlYQjiIXgFTHGC9sNzfe2OZ/QgZOCsSE34P4NMh9BMPM+//xzoIpcNjps6J7e0aMqx3ow/MVXocVdVVXVL35hdCRa5j2CXHF8RpyRW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749244057; c=relaxed/simple;
	bh=UM+vRO5hSydtuoeDrU+ex28r71pECYQGzzhBILiPAJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YElnSJu4k5QpfV6pb+J5S35UW+TpVP7AqEZb8XeeU7ONpZfBtCTjpKfJU2Wj0RAqdHdBQ4iVWV5uZjEzfh4UfTxxmvSwvCH+N1dXqerb9uNKUfW1LZ9RhtPjCbXoZxrCq39X2KBupuHW8b+0KtPbAKrFaHD4AK/y30uMaXikeoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=ipVhB3pI; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=ES2fhaDp; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1749242463; h=In-Reply-To:From:References:To:Subject:
	From:Subject:To:Cc:Cc:Reply-To;
	bh=uX+SmtXFw2vm97wnzVAxVc1ps9775QcFr3R+1Xmhi7U=; b=ipVhB3pIhsSZPdDjR2Tawiqam5
	Ms9cpnO5PqQgmXmZDW58mStfhAgKVFNskY6OaKVNC5II/jHu5gmb+O4vBNOkxNXqKMmTi5UsK9gqV
	LbUodKHn0FP5kPzWlAulqIKwa4ZnhifA2Sd3kRjg+NHo6gvqR8B5QJgu3VXUNlLUr3LsHpIvvMg6O
	YQdypP+p2GogSi5lJx6jyQbYpHoIFQJ1+nDie7XZKNAmNRxiUwUf14H9xccd+WEBR4VdTpVH3J2hL
	dDs/i8ihgJskjsCRP+xOYrfnrouyYVW13PyDuFRg05ioo3OOPN5r3GBTyvRH1BSm0DZ8ShjLPZyeH
	gdCuMRTw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1749242465; h=In-Reply-To:From:References:To:
	Subject:From:Subject:To:Cc:Cc:Reply-To;
	bh=uX+SmtXFw2vm97wnzVAxVc1ps9775QcFr3R+1Xmhi7U=; b=ES2fhaDpRNAC4t0gdRYaV3xYDL
	whC+jGwtvKn+d8EDLkHuvzngBkfEKa0joHJYs8Y+DxiFlhdg8mehm3AsGRj5XQ95k3y9cQZiQqtL5
	tjanVijdSdQnOfdBuGnD+QDHrqoNuyMnZzKKZSKm2P/uj5haZ45iR0gSo+mlTol8IF8Gar3YbAqry
	J2mASx0hsywBtgzZxpiPIxZQq1osUsontK59fQEoHa5OaczmtZxvOVz3cXG+ynsxTOx8ucXqLDlwc
	ri69ifYMXuIHaGGXnF52voMILW+RcDjsrnp5DOkPguDCwNr4oGafASqzpW1NJbahuTxawKFUWqjtW
	d14TiKcg==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1uNe8B-000EHH-0V;
	Fri, 06 Jun 2025 20:57:39 +0000
Message-ID: <03da7997-74f4-4435-a6c5-6aa5aea2f6d7@mattcorallo.com>
Date: Fri, 6 Jun 2025 16:57:37 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: PMBus memory overflow
To: Guenter Roeck <linux@roeck-us.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
 security@kernel.org
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
 <bc9a14b5-8b10-436f-a791-28df245465e6@mattcorallo.com>
 <4e198aa1-527b-4ad8-abc5-e7408296bfbd@roeck-us.net>
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <4e198aa1-527b-4ad8-abc5-e7408296bfbd@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Adding security@kernel.org cause probably they should make sure this gets fixed.

On 5/5/25 9:39 PM, Guenter Roeck wrote:
> On 5/5/25 13:57, Matt Corallo wrote:
>>
>>
>> On 5/5/25 4:50 PM, Guenter Roeck wrote:
>>> On 5/5/25 13:41, Matt Corallo wrote:
>>>>
>>>>
>>>> On 4/25/25 4:16 AM, Wolfram Sang wrote:
>>>>>
>>>>>> Wolfram, what do you suggest ? Fixing the cp2112 driver is obviously necessary, but
>>>>>> I do wonder if a check such as the one above would be appropriate as well, possibly
>>>>>> even combined with a WARN_ONCE().
>>>>>
>>>>> How annoying, there was still an unchecked case left? Sorry. Yes, the
>>>>> core can have a check for a short-term solution. The long-term solution
>>>>> is to support SMBUS3.x which allows for 255 byte transfers.
>>>>
>>>> Thanks!
>>>>
>>>> Any update here? I guess we already have a patch so no use in me trying to write one. Would be 
>>>> nice to get this in a pull so it can head through backports.
>>>>
>>>
>>> Not from my side, sorry. I am deeply buried in work and don't have time for anything
>>> that isn't super-urgent :-(
>>
>> Mmm, shame, its kinda annoying to leave a buffer overflow reachable from a malicious USB device 
>> sitting around (okay, with the default hardening configs it gets caught, but still). Can we just 
>> land the above patch from Wolfram to check the length before writing the buffer? Happy to clean it 
>> up as a formal patch submission if its easier for you.
>>
> 
> Please go ahead.
> 
> Thanks,
> Guenter
> 


