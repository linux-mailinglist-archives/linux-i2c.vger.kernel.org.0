Return-Path: <linux-i2c+bounces-4136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1951910B13
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 18:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8D91C2444F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 16:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1371B1412;
	Thu, 20 Jun 2024 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="kUNaXTgE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F201AED4A;
	Thu, 20 Jun 2024 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899546; cv=none; b=Ps4NUwBghh80UEwKYqiSolVsmPdz7odQCgVERzmoHX35FXKQ4+25xUHU4ukzuxLewfeOXtOXt/sFRgoVPY123tsyJUhQRUzYop8CaHpYTOehPeJuve+hSazBpAbfZmroDAgcrJgamp7+or+9gjEIKelErzbEzTFWr8yGNUIpr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899546; c=relaxed/simple;
	bh=I8P/7EyMvo1PyKFXdlHL8qD0YzEwcyWb8BAXZCIkGFU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EA04FtqcRORNX9OlHDWynBoGl2onDhAb9oJqiCizpv5P1ixhV7ylCvXMdwnJTSrcf5RQKAapEL1v9xkvIrP5jdJcia+9bQfNFX7vJWmH/Fvjl4VdjsGN5EwYWyEw4vL+j13fZY9DdmCDmo/7iPdWm4c0DZ6LKLbQKFUQsn6Uxqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=kUNaXTgE; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.200.198] (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5240820B7004;
	Thu, 20 Jun 2024 09:05:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5240820B7004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718899544;
	bh=eBh4eEfIPTweT3LwENS1NWLDQbN6FWSFGkO0Zm8TBQ0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=kUNaXTgEer7r/+vCyEdssQ/PjYcDRGCOXY1wCD9NTVTv5KXbBO29t6mb7SB7HHZiE
	 drJPx+qrXgSzae38/tD6Cl2pMzkyiMf7W9ivZRWzCA/Ia07N2w47E8DiOlQhfV+GTC
	 g6mF8Hycttmz8uW0zlLcTDgpB/217+eCUzRn/By8=
Message-ID: <0f95bbc5-c1d6-4557-b401-90fcfe541df0@linux.microsoft.com>
Date: Thu, 20 Jun 2024 09:05:43 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
 <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
 <7d5f800f-fc65-4fbf-adad-616d51501c62@linux.microsoft.com>
 <boehtgry7j7ulhrw7tenkmzxujahmxfn25imvb7zw2ibtmebbk@u3jryw4v2y7h>
 <cu2mkl42byhce6eytcnw7yseogbnypgtrkoirlezakwg35egdg@vjjye4ca7yey>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <cu2mkl42byhce6eytcnw7yseogbnypgtrkoirlezakwg35egdg@vjjye4ca7yey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/2024 12:10 AM, Wolfram Sang wrote:
> Hi,
> 
>>> "Synonyms" from patch 6 does say that controller/target is preferred but
>>> couched it in the caveat "If speaking about I2C in general" and
>>> adapter/client when "discuss[ing] implementation details." I was trying
>>> to give space for an unambiguous recommendation.
>>
>> Exactly, this is what I referred to in my previous e-mails.
>> These two statements sound a bit ambiguous to me, as well.
> 
> Okay, here is my proposed update:
> 
> ===
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index 90f46f1504fe..579a1c7df200 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -67,9 +67,9 @@ Synonyms
>  
>  As mentioned above, the Linux I2C implementation historically uses the terms
>  "adapter" for controller and "client" for target. A number of data structures
> -have these synonyms in their name. So, to discuss implementation details, it
> -might be easier to use these terms. If speaking about I2C in general, the
> -official terminology is preferred.
> +have these synonyms in their name. So, when discussing implementation details,
> +you should be aware of these terms as well. The official wording is preferred,
> +though.
> 
> ===
> 
> I don't want to be stricter than "preferred". If someone still wants to
> use 'struct i2c_client *client' this is fine with me.

I'm ok with this. I'll let Andi decide if he wants to have
adapter/client refactoring now or in the future or at all.

Thanks,
Easwar

