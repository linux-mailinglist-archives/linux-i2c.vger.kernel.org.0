Return-Path: <linux-i2c+bounces-11289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2CBAD2073
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B00543A48A4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 13:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B498025A2B4;
	Mon,  9 Jun 2025 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="nV4Z+Xcb";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="aLPL4qWU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636224EAAF;
	Mon,  9 Jun 2025 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477481; cv=none; b=SJe2XkSpkGpx9aj7m4FJS1QIjuOK5M67kgUY7o51/dq0eYczzGQH/QMSPOOcNWGh0phgliQFgh0QzGuUBzxV6EFf8P/glHkJmSlijCYyNPngt3fdrQ08cWJN2QjbWTozf2LFArIVF58c2a3YvJwl/79WhitW733XdsbEG9+bWcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477481; c=relaxed/simple;
	bh=BtovotolHG9Svuq6RCqOt2EurRirtBwfNGFVJZviXuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvznaFJnR0cxIc/48uTV9CWUxHs7kMQ0K5ox3IShieqctgTKUsUULAiLJ/iP/pETUXoOBxI4b/Rqtm1ak2NS9/0jSMZpVQtNMqfZIyyk8aFTuhGl4svHfr/pOhkPADa1mQFLB0+ew0sfZ0QyAfJ0h6sK4QPOHydcDBl6ZrVMx1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=nV4Z+Xcb; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=aLPL4qWU; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1749475262; h=In-Reply-To:From:References:Cc:To:Subject:
	From:Subject:To:Cc:Reply-To; bh=uLPWen2g0QSouNWJIssRbh/qZR5BE75DLPUyZ5Nxows=;
	b=nV4Z+XcbthZtySaQJkNGBN4DbV+LzUdNMMPfnlKqU+TamvCHGs0v/lyaw69CYb4aX1FZEkAx0Jc
	j9tIJkAWG/Xty3GJIEBHy7d0ljAWO9awwDkxEd5sTocPj6ZgtImHrJ/CVZR6+ZQ0DIKXnNCWllNwN
	hhhG3HgvCBLcqXXoAnLJSSTVebGzcrLXC4L7vEOlkabQ5hpNC3X+E2FZahwxpggaRKWA1DZfyVTkO
	A7K87BFYbJjf2GrcQpEHhbapN20XAh8z2LVeuobChNrVUbKeUFT1PtXEkM1+bpAYAGvGzlSQV455J
	Yarr/hC6QHqEFAr34/LX1a/PmWC6+wQr9MOg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1749475265; h=In-Reply-To:From:References:Cc:
	To:Subject:From:Subject:To:Cc:Reply-To;
	bh=uLPWen2g0QSouNWJIssRbh/qZR5BE75DLPUyZ5Nxows=; b=aLPL4qWURR2fH7DTbnJ6kZWIuJ
	vMl/vQUQf5bqlU2m9ruSY+MRMjfv/hBjLsfmpr9hHJjTVSMiH6unFbjXLs3okFkJwi1TP6V4dlYLQ
	5s7lhgvutNh2pGXAd6C7s2/oUe9AdKMGFUlN5J8YWgcylNaQTxlh/6YnxoinWGXutKY++CCK4UgCs
	RPtdUmcBpKUWUUFQmKvu7wKVCmtpmZz3rCWA/5iDUWCDkKD0+P7ctVM5vNUa5Y177hT2V5koexOc1
	/WtKy6BmiV1GnSYXrvCxXaXQbNvf3EOhIECkORfKspl/BDHOCrgl9uhyh9sdCvJvsKnCJXKqyOgpf
	kAq+CMRA==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1uOd0Q-000dwK-0F;
	Mon, 09 Jun 2025 13:57:42 +0000
Message-ID: <d16cb075-f924-4bd4-adec-8eaba589a3f2@mattcorallo.com>
Date: Mon, 9 Jun 2025 09:57:40 -0400
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
References: <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
 <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
 <aAtEydwUfVcE0XeA@shikoro>
 <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
 <e0e789b3-24c2-4ea3-9c79-fa815d801d83@roeck-us.net>
 <bc9a14b5-8b10-436f-a791-28df245465e6@mattcorallo.com>
 <4e198aa1-527b-4ad8-abc5-e7408296bfbd@roeck-us.net>
 <03da7997-74f4-4435-a6c5-6aa5aea2f6d7@mattcorallo.com>
 <2025060749-attendant-trout-d2c8@gregkh>
 <695ebdae-7292-4a83-8aff-763da184921e@mattcorallo.com>
 <2025060848-reset-recovery-f67a@gregkh>
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <2025060848-reset-recovery-f67a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/8/25 3:14 AM, Greg KH wrote:
> On Sat, Jun 07, 2025 at 09:25:44AM -0400, Matt Corallo wrote:
>>
>>
>> On 6/7/25 4:19 AM, Greg KH wrote:
>>> On Fri, Jun 06, 2025 at 04:57:37PM -0400, Matt Corallo wrote:
>>>> Adding security@kernel.org cause probably they should make sure this gets fixed.
>>>
>>> That's not how security@k.o works, sorry.  As this is already public, no
>>> need for security@k.o to get involved at all, the normal development
>>> process happens here now.
>>>
>>> So, submit a patch and people will be glad to review it!
>>
>> Thanks, figured I'd ask. Sadly there is a patch that folks seem to be okay
>> with to fix a buffer overflow but its just sitting.
> 
> Have a pointer to that patch on lore for the maintainers involved to
> review?  Note, we are in the middle of the merge window, so no new
> changes can be added to our trees until -rc1 is out.

A proposed patch was posted by Guenter, and tested and confirmed that it fixes the issue by myself, 
at https://lore.kernel.org/linux-hwmon/284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net/ . Wolfram 
suggested this patch was acceptable at https://lore.kernel.org/linux-hwmon/aAtEydwUfVcE0XeA@shikoro/ 
but that's the last he chimed in on this issue.

Matt

