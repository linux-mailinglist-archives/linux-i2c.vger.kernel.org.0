Return-Path: <linux-i2c+bounces-11274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A248AD0DA5
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jun 2025 15:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65C5172DFC
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jun 2025 13:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA40221276;
	Sat,  7 Jun 2025 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="eHfgdyQw";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="eV8vOwAp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5EBA45;
	Sat,  7 Jun 2025 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749302761; cv=none; b=q4gp1RBdb7O+hHi1c5/n0160cSYYqE0P3fW0C6cy+iFpiBCb69EZidFCoZzOLawPZS+NSb4m90Vxn2RsewchuvRGperNU3yOoe83J9cupUe9lPi+5Lyp7OesECQwJzcjChtweyCxivUyTwvJtL4V0O63sFd+MdzUzFZcLGX/yI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749302761; c=relaxed/simple;
	bh=UitASiqBN/c/urT0jP3co3I9rOl9L4ZY3chvtLrHywY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KphpFi2sU9uHM5jYusIRziE2mSctxXp3WMmJJyIUZJLlbuYJCPt6XJ05sFQJZxkFgwGB/Vm/vKkRb1zMD2CArpWmQ433tcu3xehqZbfzbv7pcUjm34ueb2j9DWpwj+ipJ0mMFET08n/EPEb7oZt9s+J5qYcoXzSrmW08GmZA2rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=eHfgdyQw; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=eV8vOwAp; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1749301262; h=In-Reply-To:From:References:Cc:To:Subject:
	From:Subject:To:Cc:Reply-To; bh=Mo557fFHlBiVyrfE6W5QUmAfTVNMfKYKS1f5xqw5kyU=;
	b=eHfgdyQwfDUZRbI0K2+6dXexRE4+YhhMfWUhARobvB3d/NEZ1TJ1k6qKyRiwlGML2zOn90meIll
	4yQCDa7Ed6u43iGuibCzeTDkwPUCL/iy4IjFlxExFWG0x4F/0sWMbNnXWPps9I7URbZIMtbIXdufR
	OI1PtXAwAtwFLuVEZT6vCZm2fEFHMXd71Xo6eqOtN6SPPTc3sMcUypjl1n5IXosRmYRNrXgP+k72W
	nOY9aixh4eC8JSsUTyUR4kFTX9sU7c7DIugD323VCNcQYtt+tQuJLZKVZ3CjzasEl0rGMvBB2KC9D
	YjosxdWpnAmmwRUVkVwIkNErCoX1tnJ9emWA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1749301265; h=In-Reply-To:From:References:Cc:
	To:Subject:From:Subject:To:Cc:Reply-To;
	bh=Mo557fFHlBiVyrfE6W5QUmAfTVNMfKYKS1f5xqw5kyU=; b=eV8vOwApfatu70dhWKt1c814wd
	iT+0pJcG8SK+Qvx2Jh2g0E0TY4xhq5bUndwU7PwwlshmXcTOhqpwBEpOU+VWZdF9tkNiev8pDiaL5
	bZJspCjHK2gS9lMKAiglfrISvXe7N5L25PBsHV43TbATQ+nB8BqbFUzBGXY70hWGN2uY3OwAuY5BC
	huQ/qkVWbV9M+Z9VbZZMilcja0hqWDfKhvs9AOCYbEpI07cX3uLZu9fO4b1sNZSZ6AS01RzxkBgYR
	ydjE72p8tbvnPjLDS3PtcHuQ3/Y+nGFulgEgAg0dM9E7afT5lAGhRGi5oxh6EwuwtHciFN/L9uhkw
	0CrCEF5A==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1uNtYQ-000KmJ-1I;
	Sat, 07 Jun 2025 13:25:46 +0000
Message-ID: <695ebdae-7292-4a83-8aff-763da184921e@mattcorallo.com>
Date: Sat, 7 Jun 2025 09:25:44 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: PMBus memory overflow
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
 security@kernel.org
References: <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
 <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
 <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
 <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
 <aAtEydwUfVcE0XeA@shikoro>
 <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
 <e0e789b3-24c2-4ea3-9c79-fa815d801d83@roeck-us.net>
 <bc9a14b5-8b10-436f-a791-28df245465e6@mattcorallo.com>
 <4e198aa1-527b-4ad8-abc5-e7408296bfbd@roeck-us.net>
 <03da7997-74f4-4435-a6c5-6aa5aea2f6d7@mattcorallo.com>
 <2025060749-attendant-trout-d2c8@gregkh>
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <2025060749-attendant-trout-d2c8@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/7/25 4:19 AM, Greg KH wrote:
> On Fri, Jun 06, 2025 at 04:57:37PM -0400, Matt Corallo wrote:
>> Adding security@kernel.org cause probably they should make sure this gets fixed.
> 
> That's not how security@k.o works, sorry.  As this is already public, no
> need for security@k.o to get involved at all, the normal development
> process happens here now.
> 
> So, submit a patch and people will be glad to review it!

Thanks, figured I'd ask. Sadly there is a patch that folks seem to be okay with to fix a buffer 
overflow but its just sitting.

Matt

