Return-Path: <linux-i2c+bounces-9344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC116A2C376
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 14:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFCFF188D2BD
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 13:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1112E1E7C37;
	Fri,  7 Feb 2025 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9/Hi54y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAD31448E0;
	Fri,  7 Feb 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934744; cv=none; b=hPdRaW/TIulA7T3T6vWMmR1Tk2vVyq9MbApm1ZGM+NPshMWgFglzz7OIpC9IjN/hNAe7kkMkoK5vq1xx4HKdxvnTpZK1bMGFyeJtrocOInUoarhKURWyi74T0PTBCLMz/G0KL4QZ3L1ndjMJCxRLZqozvUZE5EVDeN63/j8SnC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934744; c=relaxed/simple;
	bh=tI2VL4/lv6UzHSjLg5AyeCErR8UhfaGbe3BGCPAxFaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iEmC5Nu9R/KjOTrvHL3MVroeu7aYSPdRQysT7ALU6xT499mcgAG61/JVcBuFV9xQOBwqKI84LBa+Nh0er8hbxxUzjypGXHZnGpLpcbnQc5qC3EBsBSGndGsF1TM3QS07EFngkUBmnCpW+KyJQbV7IQpDBAlAP68WQckYoy8Ou0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9/Hi54y; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab794ae3cf2so20962466b.2;
        Fri, 07 Feb 2025 05:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738934741; x=1739539541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xapbIRnX8xlcYsZfxy6s9pH3/J+JN1uuEXzR/x8ggbA=;
        b=j9/Hi54yPzgie0QiJtngBhVGzSGI+mD1nImsLU/GCi48HwDVAIwJEInt+kdKjBEGd/
         rAmZ4Zj/Ock+PjLA0/ReWn9G1Z83x4qC2myRV/MoWK42QHOJplXYtUQefyLp2S2E0f3W
         SYfzLE0/5mC/OaW5ar9DAIP2QyW7hYTDD0IHv3WWBjr44+ToVpueDr3YDSZImYd2u3AT
         +H9I8aD+CerI5DM7nkalKt20C8hMzhU2hJfxiNZVwhN8gENDxivpvjMX97/Oh0rOdM+R
         L85XkESUDx5r4CgmRVS9qE1zhMmM+2VRW4RJely+0j9aamqO6nxZR7BpGLkGkXb68dKz
         txkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934741; x=1739539541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xapbIRnX8xlcYsZfxy6s9pH3/J+JN1uuEXzR/x8ggbA=;
        b=LfrKrje1jdtJFFVuFnpnmdDI7eDpbPBttEBP/TvA71Zq6pOuu6UvDeIcA/fUt9qGuF
         A3D2noZD/22yUoDRxfrkHPxVRPiET0OGnP6TPaijyo9a2GbM4u+14ZZVD1vhGmgUz/pV
         4nmPqEoos4VWppy1/D9w/iH1sM+zakLatIz9aLTHmDQzD1Yt9JsckcHcUiXaBwUoFKzI
         V2FNLvtTh/mRXOf0TRDZRodzp1morseaULVGHlm8ish/ExdfyllocAIoQrbxqQqSUE96
         pjs5CDt9KTbk1JmaTikoHvQZ5F9ngfO09fdA2IXIIjtSlWJUklU/WaFBj0zmb0qwcJh1
         I45A==
X-Forwarded-Encrypted: i=1; AJvYcCUNeQahnTqO6j9FBoQpQfKuDn2tIaEhj8+couz9/luS+E7qkuUCBN6CFjZ0mGwm2hKnBYJ6w9RrVTY=@vger.kernel.org, AJvYcCV01KXIFmbEhCFvH8qqmS8rhlPzmbAdSxR3OgpbFFz+GAeY23OtLxyMIilOPRCoQCMIcErCCGX9C3HXKQZiaf1CBFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf/wMvR1DU4r8jR/OBBS0y2TQQfrSPYNehW5jXlV2ZdPXIKOtm
	iLUzsoa0eD4SzSgEupYsSp0luePO4olC77AF3mJwb09kA19Ne0jroCIvMo1X
X-Gm-Gg: ASbGnctr1/1cP/kvJ3MS+e0aqpdqexfgJw8HZd1wHhMqnU9bbQunldHckf1FsZ8G0MP
	RH1g2VYP9cfCFyEevfkWARQ4ajQEYcr0p4oZQdqEmURVcjWur4XqpVUp1pELjIRIoJdEad9vjxU
	PGowN6XlDSruhErcpl4dO0H5GavLPCnTv2JMUSsQHC9qWa/4QCHvj5Ude45RNJ+u65qZHjBXt24
	iSYLI1G+VEKPWW+HxHh54Low9MMhUUmSMBVx1rW8Q+SGIxnLjoeJGQb1ANDsWJHeheDO/7LManG
	uSWr3u6OQhFkYKjKD+Ab93BEVriurKa4PkApd/o6EKzHKlYesEl+HqtRUkBKm07vDVkpXolZCWT
	5xcTP2PNsz/825tVcBEvd4vwjZEpZgt+5pkTOHg+FiI9dAf+WvFxPgjKdnuMI6tMm8eKcuPTCrG
	OIWu2w
X-Google-Smtp-Source: AGHT+IGLndJioCCxaNTC9ddSqP+/5nYHwkIRXTS+h8jJr/n8qT9kR06TFLFSHJnSzkYQ/v2Rympsyg==
X-Received: by 2002:a17:907:9490:b0:ab6:36fd:1c8f with SMTP id a640c23a62f3a-ab789bfbafbmr311152166b.39.1738934741198;
        Fri, 07 Feb 2025 05:25:41 -0800 (PST)
Received: from ?IPV6:2a02:3100:b0a2:1c00:35a6:8f1:f015:d9ed? (dynamic-2a02-3100-b0a2-1c00-35a6-08f1-f015-d9ed.310.pool.telefonica.de. [2a02:3100:b0a2:1c00:35a6:8f1:f015:d9ed])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab773338952sm265993366b.133.2025.02.07.05.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 05:25:40 -0800 (PST)
Message-ID: <1a3c4e49-695d-4882-820b-d1501a776436@gmail.com>
Date: Fri, 7 Feb 2025 14:26:02 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i2c: revert flag based client handling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
 <87c4716f-d6bd-4a4e-91dc-70f73b9109dc@gmail.com> <Z6TqXGYIBUjhWtDH@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Z6TqXGYIBUjhWtDH@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 17:59, Wolfram Sang wrote:
> Hi Heiner,
> 
>> With RFC fix (v2) sent, the issue should be solved.
>> Would be good to have your feedback on the fix approach.
> 
> I had a glimpse, and the patch was too intrusive for a quick fix with
> changing the locking everywhere. So, I will still revert the original
> changes to buy us more time. In addition, as we overlooked one code
> path, we should double check that we didn't overlook another one in that
> regard, i.e. muxes. We should develop better test cases, too.
> 

Understood. How to go on from here? Bring the two patches plus v2 of the
fix to linux-next for 6.15?

I only have consumer hw w/o i2c muxes, therefore can just compile-test
the mux part.

> Happy hacking,
> 
>    Wolfram
> 
Heiner

