Return-Path: <linux-i2c+bounces-4068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90590B729
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 18:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD54A283439
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 16:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B81B168482;
	Mon, 17 Jun 2024 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="NP1eyFLy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D97161B6A;
	Mon, 17 Jun 2024 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643433; cv=none; b=OLFex3V/kJBkPEa9xalkTEhWdia07Y+GvS+C6x50w70YgTrPsSscCdVZpdahT2lKNR+aIm59bKpgGwKJFbhrZvHFDzzT1tKXD2tBMIHBsn1voqyG7G+hdUlzKbh1ufWkIROklf0VuaJ7lBPNjKjNBdnFT4JVRH6LaB1XIK0o7Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643433; c=relaxed/simple;
	bh=n+1y+E9hLwnclKdeZG42L3zqKhdxvs9cOOLpFzB4YqM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=L+KORXstr29tGdbXfa1cT1eN5LPiHLF02z2S85BAFZmt/Q4rPu4eXoGbAMpgXTS5tRxaPofOUNzpM4bdSbDDnN2jE7lfMuK+bhfPxLtlsFzUwLZ7I+AFTcx4tOeksWkq4skl0zOR1lZu8JIpmV3M7hJrNW1ao9GXTS89G1hwgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=NP1eyFLy; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.192.170] (unknown [20.236.11.69])
	by linux.microsoft.com (Postfix) with ESMTPSA id CE96820B7004;
	Mon, 17 Jun 2024 09:57:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CE96820B7004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718643432;
	bh=MgHT8Z4HUIE9ezW/auV6wWbDrDM4WPcrEGledglcTCo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=NP1eyFLyCc4Y4s2fAcJMhWMHNWs7U2TWcth3d4RkSAzZEKf8KFu//cZOhJ2AM9jZS
	 0IjukHycG+vWof36cxv90it7Q91ISv0qWWCeqkrA1WjENnRCLymD95hp8hRHSkb86C
	 vqfqwY35x2OJHzFxLdk1AHvrdduRDxApgR7bc6Eg=
Message-ID: <7d5f800f-fc65-4fbf-adad-616d51501c62@linux.microsoft.com>
Date: Mon, 17 Jun 2024 09:57:12 -0700
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
To: Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
 <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/2024 4:58 AM, Andi Shyti wrote:
> Hi Wolfram,
> 
> On Sun, Jun 16, 2024 at 09:14:40PM GMT, Wolfram Sang wrote:
>>> I am not a big fan of the use of the word client. It's not used
>>> anywhere in the documentation and it's too generic as a name for
>>> giving it a specific meaning.
>>>
>>> I've seen already some confusion amongst reviewers and
>>> maintainers when Easwar sent the patch in drm.
>>>
>>> If it depends on me, I would stick to the only controller/target
>>> and render obsolet the use of the word "client" in the i2c
>>> context.
>>
>> Have you read the paragraph "Synonyms" from patch 6? I don't think we
>> can obsolete client because:
>>
>> $ git grep 'struct i2c_client \*client' | wc -l
>> 6100

> at least saying that "target" is the
> preferred name for what was called "client" until now.

I'm in agreement on obsoleting "client" as well. On the pace of change,
I'll defer to you. I was trying to elicit a recommendation on future use
of "client" when I asked:

===
What's the combined effect of this documentation update in terms of the
recommendation for switching over the Linux kernel? Are we to use
controller/client or controller/target?
===

"Synonyms" from patch 6 does say that controller/target is preferred but
couched it in the caveat "If speaking about I2C in general" and
adapter/client when "discuss[ing] implementation details." I was trying
to give space for an unambiguous recommendation.

I think we are on the same page here if we just remove the caveats.

Thanks,
Easwar


