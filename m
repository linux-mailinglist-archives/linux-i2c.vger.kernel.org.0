Return-Path: <linux-i2c+bounces-5981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD7967BF8
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 22:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA6C281BCC
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 20:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2BD6F2F3;
	Sun,  1 Sep 2024 20:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQodEhB1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AD37171
	for <linux-i2c@vger.kernel.org>; Sun,  1 Sep 2024 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725221280; cv=none; b=ncIbH3BqIhDZj0aHlFYtwQcO823KUt7wfuSec8cJONdncplrVLAIRyzfQP905iJn55woyennM/QzzIUD/l/KEtzAPn9I6Di/jDfpG0P+XzcYSRhRG7KJ8onXo8gHrZmYzbbpmNrwZrDIXBLunle3iEreHsLJoI856bC7hwzuBt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725221280; c=relaxed/simple;
	bh=vo6vN1mzrHk51R3QntZHzUeylOIOwQOBtYhJK87Bn2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H1mK/rJ3thRB+BGsV0YmQSV/O5l+DPUgmgdSmQ8D849lj3EdpAA48SWx1Tz1naaoo7oBZ06YLcJzXxkZHpzp600FBHO73VDWSjx3sKHjWkNKRDgHf0VJMLdetmD/cY7gtDvUzvboyXGeq0H426ZXizNDC5v/GxbIzsQICwV8vms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQodEhB1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86c476f679so408638766b.1
        for <linux-i2c@vger.kernel.org>; Sun, 01 Sep 2024 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725221277; x=1725826077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7olbAU6zPt1D06xM6iOrRYMA46lWZT9CDLv4ajAvX0=;
        b=CQodEhB1uX7DQX7yDI0VrMLlH0HbKOR5jt0i9B74E/r+jvBZP8g3XLNs24+S896Xcm
         UjKq83xgf3a5TbqeoInh9GqV88PW/Hnso70cwUq0CDkiNiRsIAFsk56xNnlDHCE4ZKfU
         UuX172XhVYAOVWBNdPUzvPuDc4KjMaE39G1PY43ckLio7WmtPLlscFJdNidBpHs/bMf9
         HXKMCtVvqrYyebTLmyhSjOA307vszMaJa7uJiSlJWVIOBbddDVk3UfbmFV4Qxy75soWe
         32WoGUVmEaol4zTZ3npCvlwqKP+fI5uVIb38qHJ3ftAB04AwuwuhxhuCSmgwR3Q85A64
         QD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725221277; x=1725826077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7olbAU6zPt1D06xM6iOrRYMA46lWZT9CDLv4ajAvX0=;
        b=W24MPNAUIzdtDgyDgqn7cTJB6gSorXAETxqmKUcSTugwnSaOOi7dZIO/MIEw7XV+1Z
         WIXR9xXl9kGan3yE4vmJVZqmDwxVuoPLaTiybw7vEAtwgL2jAzYW7uZa7NppfSGLPpYB
         uKVOa8j8YPonXgOPUZdkcSiwNCAUofZ5MMqcM5WyuUuExtHFMnW4hfai+N5do86UCv2v
         Wm0hGw+Xkyay9lsj+7T5z0/xu2vRNgix3SkmIFsz49TOkGPwvY3gQTrpwlsjCzn++i1K
         x2jbNVkEsO5Jbf9DpvjnqKBVUTt7cph7xrPh0Bxxn7DZ7bppEKRVLnKX/mdD7aOEf99V
         MR6g==
X-Forwarded-Encrypted: i=1; AJvYcCWyQMbPiN/9YB9ZTAHbxAWDW/mqksCkfovOhwTzWancXPLuUcL0yRzk143aX4rAGoi8kHGeHUWNqUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXNhuR7555uRHnyTfrBEAImqNPanzghnfBzzvcO7IPVXuzrJw
	SZJ38Q5fq9ak4CgAcM6H9S/Egr7mq/NB1N9DW5OUe0ePSqn3l0WZ
X-Google-Smtp-Source: AGHT+IEVROIO/FuhrOabJj2Prr68dR2GVaLun7nn+qVYqUkYblgfwuV7tOyEFpkMy8auvopOZSM0kQ==
X-Received: by 2002:a17:907:3fa0:b0:a86:9176:ea1d with SMTP id a640c23a62f3a-a89b93da12cmr403106466b.7.1725221277025;
        Sun, 01 Sep 2024 13:07:57 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9c81:5a00:ed3a:5232:3874:6e94? (dynamic-2a02-3100-9c81-5a00-ed3a-5232-3874-6e94.310.pool.telefonica.de. [2a02:3100:9c81:5a00:ed3a:5232:3874:6e94])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8988feaf3fsm470891466b.40.2024.09.01.13.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2024 13:07:56 -0700 (PDT)
Message-ID: <b41c44d9-75f9-4c45-ad95-e896179a6249@gmail.com>
Date: Sun, 1 Sep 2024 22:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Remove I2C_COMPAT config symbol and related code
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>
 <ZtQueK8Y9x0FCWD1@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZtQueK8Y9x0FCWD1@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2024 11:06, Wolfram Sang wrote:
> Hi Heiner,
> 
> On Wed, Aug 21, 2024 at 10:13:04PM +0200, Heiner Kallweit wrote:
>> This code was added with 2bb5095affdb ("i2c: Provide compatibility links
>> for i2c adapters"). Commit message stated: Provide compatibility links
>> for [...] the time being. We will remove them after a long transition
>> period.
>> 15 years should have been a long enough transition period.
> 
> Well, in general, I totally agree.
> 
> It seems, however, that this slipped through the cracks. My Debian
> kernelconfig has I2C_COMPAT still enabled, so I am reluctant to remove
> it from one kernel release to the next.
> 
One reason may be that the default for I2C_COMPAT is still y.
We should switch this to n, even though it doesn't help in cases like
make oldconfig.

> I wonder if we need some printout that it is really going away for a few
> kernel releases.
> 
This may be a compromise.
However I wonder how likely it is that somebody uses the latest kernel
and hasn't updated his userspace tools for > 15 yrs.

> Opinions? Jean?
> 
> Happy hacking,
> 
>    Wolfram
> 
Heiner

