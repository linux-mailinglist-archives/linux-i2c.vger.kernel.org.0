Return-Path: <linux-i2c+bounces-10782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E6AA9DD6
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 23:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF21A17F8F9
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734DA2701B4;
	Mon,  5 May 2025 21:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="jGY3MJlz";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="IAoWBOUV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C5D202C31;
	Mon,  5 May 2025 21:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479256; cv=none; b=bnBOvU3NvBDKLvtS53HAZYPl/cOe1cRgVAaFOOx6tpW+zmFNzOGSBsK5KrdHzbRiPOyFaYUN3Kjrno5deT143ieXuXBopSstx8wb8k/RkW8zeveVMUJoC94YydTOGUdDQqK1KDCINEo9ta1lsohhOOEbXiNUj0VlST0jbrSOqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479256; c=relaxed/simple;
	bh=OeKSYQM0y4acgK9Dg3KckFONPyAn/+wg5t5V/RDgh3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b9rlcXuUL2ovQYdQi4Oz6sdCI3ATDzzwkdfYgsNGCTLceT3lBuarwZoVtiRE6MDfexhK8IhBWfymn3q7psxhQPNpEWVNiMhD8BmxbH5p5vU14qwdWoFMeaaOgubfH3fUCYwfwPRyP8IBHDafOYpKXOW8/fvkw5amTcmq+lfqq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=jGY3MJlz; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=IAoWBOUV; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1746477663; h=In-Reply-To:From:References:To:Subject:
	From:Subject:To:Cc:Cc:Reply-To;
	bh=kvFNPuKhYHPYwuvjJeByf4oFzEWjO5/uCzgmJyvUC2s=; b=jGY3MJlzH1ZLOEC4J+8HeADl6N
	NUCkE0kXqjhrOP9y+cvLdb41kYSfKm8Zw3SaBxZ7vzVcXUSbySd4eqV1pllSMmGcUBBR2fHc2U1mB
	Ft6a8wGE+H5Bq5Q/p+kl8MbrWMNF2GaAzGOx9au4j09AayAvWbKXQwjvlSf2Lk63O5EvA9xPXqXeq
	d3/YFriuwu6qEUKJQwPxRXek+tWBgbATiePxowW40yriZLMQ2PnST0gasXAMB+tJQvMzvhoHygAnI
	DLEx9eEU2w2xxKnReR13/8N+TZ8PdBXAEx06MycE85zttMpHmYU8bWlTDsV4Uut8pd79kwnFBs+m6
	B5mvzZAA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1746477665; h=In-Reply-To:From:References:To:
	Subject:From:Subject:To:Cc:Cc:Reply-To;
	bh=kvFNPuKhYHPYwuvjJeByf4oFzEWjO5/uCzgmJyvUC2s=; b=IAoWBOUVppqL6f/UhCJMh6z8if
	WYXPaMBvjD/wQtSmeb7VarcMHuHjfNCVt188sjlIcId7GTO3dDu+rh1YQ3AKx2zEltIb2UGw6/x3/
	ZUATrfy6XgZwHBxY7hlpUTc1aHbJ7nIuvvLXdr7y/ZLyHEZrYNTZYUVs40bvEWYF0el51T1lyxTFj
	5x7ic25bPX6DXObYmWgxYp7nKNfQie8j+POjUXfWVVMV3MRa/640/7y1oKASk2gGNBoiQMrL3L0om
	cYsG/PGUv8KEIjAdm7/mf0sCt5/Q75AoBUvHXN2S/R/l/F0QdGArvuQfEvGtxKW2fEg1+vW4/SaFt
	FPaISjAw==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1uC2ch-00CHmI-1D;
	Mon, 05 May 2025 20:41:11 +0000
Message-ID: <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
Date: Mon, 5 May 2025 16:41:09 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: PMBus memory overflow
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Linux I2C <linux-i2c@vger.kernel.org>
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
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <aAtEydwUfVcE0XeA@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/25/25 4:16 AM, Wolfram Sang wrote:
> 
>> Wolfram, what do you suggest ? Fixing the cp2112 driver is obviously necessary, but
>> I do wonder if a check such as the one above would be appropriate as well, possibly
>> even combined with a WARN_ONCE().
> 
> How annoying, there was still an unchecked case left? Sorry. Yes, the
> core can have a check for a short-term solution. The long-term solution
> is to support SMBUS3.x which allows for 255 byte transfers.

Thanks!

Any update here? I guess we already have a patch so no use in me trying to write one. Would be nice 
to get this in a pull so it can head through backports.

Thanks,
Matt

