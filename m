Return-Path: <linux-i2c+bounces-6631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB58976FA1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 19:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DECC21C23926
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 17:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B971B9832;
	Thu, 12 Sep 2024 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="IzlJ/TGU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E11B375F
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726162652; cv=none; b=kBfjPA+vAgol7Jz2sGptkA7akbyNnYg4iPnpUsgf67D+tpbD5DW9yi6KEv70rsZsiH1ceiSjufQJScCHhiVF18JdndfTHr4NUCT1183J3OnhNpWpZvDDV2dM1ulJfoWays429dPSR+9HmDB9r7FCZdQ/NGR9ZgI4S9EXCHikjhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726162652; c=relaxed/simple;
	bh=glg2UfXfjxi1K+gnh0UqHI3avqdbOH9DqjXefWtRLns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4Mvrib8OLjPwjbPqBhlEZ7kyKlly2sORPrhn6ccZztIKGE8x/HCeYUOg0kp5ApDqs5o1V5DUELa8b6XS0/I+GUcYOukMfr7yfGCsZft7DHUDsHqnMsLzCfRPwskXZ0xdRtcfq0SxZf3qf/Lv72i/NcZgSCB7MQMtua8ImZp484=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=IzlJ/TGU; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id onkwsnwVe84dOonkwsX4WV; Thu, 12 Sep 2024 19:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726162642;
	bh=9V0LiK+3T9Sa6G2HcSMQtaO768ib4++IOLvMY90IceI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=IzlJ/TGUQTjNWe1EI4McrF25DUEfmaBKDCVra9oqLfYFcNw2PBmGk8ww4cTkFnB8P
	 IwthNbx7MPszLYT1jYsAAHvLGHbce27+t9VfG2mWWyIjFRNRuXBRSX/G5rliJYiGua
	 AB+JLNmuihZhEMMp4JiWDsIwa0KBUuG2EElUJtQo60P4hyqetOO1q3bxDHvFPgIAJv
	 XWv0nYcVxFvt5RReHty0K47YuT/scykgMYK8qym1xYRPfZiLH1NMDm+8Qy3ZOFWnet
	 x0SMYtLSIp0ITWoErI4pRDHyJBvV2GPmD5mZyZRe4pjDoxw5sC4TanCefbQ/b5XcjC
	 Y90JLFUAfohUw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 12 Sep 2024 19:37:22 +0200
X-ME-IP: 90.11.132.44
Message-ID: <4b15a9d3-23a4-43fe-a275-c9af11c6c8e1@wanadoo.fr>
Date: Thu, 12 Sep 2024 19:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c/synquacer: Deal with optional PCLK correctly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-i2c@vger.kernel.org,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kernel Janitors <kernel-janitors@vger.kernel.org>
References: <20240912104630.1868285-2-ardb+git@google.com>
 <5ed76217-c30e-4b9a-9462-0dbd859b2a79@wanadoo.fr>
 <CAMj1kXEYpD4LdZ9jQebyViWW98ogX7=tKzQNLNZxdBUORgpnQg@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAMj1kXEYpD4LdZ9jQebyViWW98ogX7=tKzQNLNZxdBUORgpnQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/09/2024 à 19:12, Ard Biesheuvel a écrit :
> On Thu, 12 Sept 2024 at 19:11, Marion & Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> (trying to merge t and cc fields from Ard's and Andy's messages)
>>
>>
>> Le 12/09/2024 à 12:46, Ard Biesheuvel a écrit :
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> ACPI boot does not provide clocks and regulators, but instead, provides
>>> the PCLK rate directly, and enables the clock in firmware. So deal
>>> gracefully with this.
>>>
>>> Fixes: 55750148e559 ("i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()")
>>
>> Hi,
>>
>> If that matters, I'm not sure that the Fixes tag is correct.
>>
>> IIUC, either it is a new functionally that is added (now it works with
>> ACPI...), or if considered as a fix, then I think that it is linked to
>> commit 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C
>> controller").
>>
>> I don't think that 55750148e559 introduced a regression. The issue seems
>> to be there since the beginning. Agreed?
>>
> 
> No.
> 
> The original code used IS_ERR_OR_NULL() to explicitly permit the case
> where no clock exists at all.

Got it, this is not related to the removed _OR_NULL, but to the change 
of logic I've introduce.

	if (!IS_ERR)
		do_something_and_continue;
	if_NOENT_was_returned_we_still_get_there();

which became:
	if (IS_ERR)
		return;
	we_can_get_there_with_NOENT_anymore();

My bad!

CJ

> 
> This has worked fine with ACPI boot for many years before this fix was applied.
> 
>> If yes, then it may be needed to backport it in older kernels too.
>>
> 
> No, it used to work. The fix is what broke ACPI boot.
> 


