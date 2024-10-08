Return-Path: <linux-i2c+bounces-7272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3E9945F3
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 12:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EFFA1C226C7
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235DB1CCB32;
	Tue,  8 Oct 2024 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM3tMzt1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF81CCB33;
	Tue,  8 Oct 2024 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385154; cv=none; b=HYuzt6+ySnH+jWHvdTrtABKJR27qnXx0XywsGR2n2TY/GunfOAygfszk7J0rwoVwj2vgQfL00GP8CzX3vCbjt+g2qxiYqUDgqFMC/+nkBWAJg9C6etf68hb4mXH2Yh7b1Dz6udbITIt2KBaENoPAQQwn/rHVUso/eAx+Q3+LeGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385154; c=relaxed/simple;
	bh=HJfH5Gzqtqw5phokb7SIQ6zlfUq1plCpp/uDsmiGF3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y6LOA0M8lB4WlZmA4Ek3JGRW+IRDQV5uur3e9OQSQF8eUafR37mUR+ImItaS8pQvLeO0d492WQ3fPxnODpJLT681omVXwZqdwexymhcBZwAjU+7Wm+XkL7V3aN2ISm12Obfic6AfjYYg/uzj78fUKo76sXBGNvd47LSegySwbi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM3tMzt1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a993302fa02so379005366b.0;
        Tue, 08 Oct 2024 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728385151; x=1728989951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gpgbDGFpCj7kXT+i4vZZxPCyw7c7rcstLyGqLGNyxoc=;
        b=EM3tMzt1jNovn4t4rvhREWxPoqvl3vxtsxYlO8s4btSCx9Zh4pAgm7qzcyEtm5gI7d
         6jw5JtSnbQSp2YUdU2jinYqfo2lEDiVrGdfCHWIFZongDm7/CNOhNnhz4LASqYxRgIK6
         8o1wtwt2AVx/Y3i7YCpdhgktINCVfPx1NQzHPJN4q40J3Ex8doqvHaTotaI7dIN3pmMv
         iBvieM2rWj5q/FYWs26FOt2lrfA49Livz7Aanle/c8iLaBwcm6RbgcWgP9AFDu6//OYF
         fvW3HrVp3tGC7sE16LRYCOu5isU0dVuK9UJ8FVlweW1ZwkaMoE9ZoldW+jbPiBDvgkTy
         i8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728385151; x=1728989951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpgbDGFpCj7kXT+i4vZZxPCyw7c7rcstLyGqLGNyxoc=;
        b=FKu1BFP9+LH70BjNTXUEJ6DGevYq1AbXJOXAtrlDfyeRNUlzwzJemupE0UnF31yZ56
         kujwW2L4n8u2sw8oHzGQxuvFfRHBVlKxv6uLu1d1XG1lwA/1Mchg6gBXVaI37+8kt3Ch
         rILxCQfzzvYL5vOEeZkMH8KZGvnjmCfZIn4ENVs7wspARWip9cf4w9o5m3vIy8JdvoHY
         q/hPg4Str0KZO72+BQYg6vRPVSxz0Gj6/KGy9CRaWa7u+zN/abawtrceNivspJc4zaUO
         +jdsR8SaAZLuWudWQjc9X5ff3BXchf0d3hdfg4IKLzuqmpAPOytGzwor1QLwCsl6ftRH
         mDIw==
X-Forwarded-Encrypted: i=1; AJvYcCX0iB9vD/rpvH9a+0ia4YDd4tug4ySeyPolTi4DbnLMZ1uscOOyg8Q863obRHsMuuvMrzSV2suztbQ=@vger.kernel.org, AJvYcCXn55TPPlViJZwDUP162V2w1J6NWZexfbdfS41/WInIx3bDH8hYOg33RP4vEvqgYtTn755CqicEk7fSMBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyRWxhdyEhyJRMlEaCPP8ZzkTfpI9DBUaArpclxRg5Afs5O+0l
	9fx8wX49YYkPyw5Pr5r5WYh2K9Bm0lHPu1EKRqQZrq6Fq5g/Cboc
X-Google-Smtp-Source: AGHT+IH2MLnuIeP6tWOL2HjQ/XlgEv7zfbZ/JXALh+Bz4YZj8WmE+jqC3HC3CBA6QhwBx4sTnpzAZA==
X-Received: by 2002:a17:907:cb86:b0:a99:6345:7219 with SMTP id a640c23a62f3a-a996345736fmr325923866b.29.1728385151238;
        Tue, 08 Oct 2024 03:59:11 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a123:2000:158c:b0ce:e047:c1fa? (dynamic-2a02-3100-a123-2000-158c-b0ce-e047-c1fa.310.pool.telefonica.de. [2a02:3100:a123:2000:158c:b0ce:e047:c1fa])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9953f118d8sm258605266b.81.2024.10.08.03.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 03:59:10 -0700 (PDT)
Message-ID: <f17fde83-7dfe-4614-bf58-abe9aefd9b68@gmail.com>
Date: Tue, 8 Oct 2024 12:59:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: core: Remove obsolete members of i2c_adapter
 and i2c_client
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ddf1ac29-1fe9-4432-be76-574203d185e1@gmail.com> <ZwT0yuq2yIirzCY1@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZwT0yuq2yIirzCY1@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 11:00, Wolfram Sang wrote:
> On Thu, Aug 22, 2024 at 09:49:29PM +0200, Heiner Kallweit wrote:
>> After the lists of auto-detected and userspace-created clients have been
>> removed, we can remove now unused struct members.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Why don't you just fold this into patches 2 + 3?
> 
I'm always trying to reduce patches with functional changes to a minimum,
hoping this makes review easier. If changes allow for further cleanups,
I typically submit these cleanups as separate patch in the series.




