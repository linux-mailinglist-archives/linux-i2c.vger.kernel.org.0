Return-Path: <linux-i2c+bounces-9310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE5A28D95
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 15:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCFB83A9B43
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1DA154C1D;
	Wed,  5 Feb 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEApsKiW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5495228;
	Wed,  5 Feb 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764055; cv=none; b=GwG+f+5C7narr1jt4LbDgq1neny5s9ZnLuwmELNAdVWD1EoYmt54c2UV31gOxAEkWc4ZbQqi7SxVQbpN8koStxbS/ktBl7nBINVc024h0ElkXN5+mfQd6xuRufUU85QjMP5l/couVMS5IOUAthuA41j0xw7F4tQhWc/ul1HSvvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764055; c=relaxed/simple;
	bh=BFFTcFkX/wzHm2d1NrgN0bmhIRFrfxbuhphUB6l8XOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ivf+oQ3kh8XjlxQYtteMVy8Hph4BL1tenqaUpc947W4fDrnCZ/xgQbJK1VHfAhDMkQVX0E+DpOnGq2CLwK9kuDOEdBJ2F5I5OcRBYn5ZxYycTIFAj5xTa5bORR9naPOl+7oIBwf2Z7BS+s1mxoElf/eY0JoJsos+yo421/ymZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEApsKiW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1975916a12.0;
        Wed, 05 Feb 2025 06:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738764052; x=1739368852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bH1eaizn0aPUKCjEIKOdPtGUEy+w3C4lhP/b2zjqzvo=;
        b=OEApsKiWBkwEXFRyYsv8U2kZ9cXlMwIqcf2lF2qKj4kaW7xEaW/jsy5J6j/3CJogVH
         Qf2ewfa2HtYKVc2VpIHJaZ6//Wg+SV6x8EtfFE63xUU7uefMoPnqAUkdP5WMWqvrdY9p
         E8R9WXryMMzCRHTvTNuOPr3+sIFzR+yvhuIlR1o9/Hj+CfO9cRANal9blbndJ/Nft77L
         kmjYZH1G1Xa2NZfoYAlSHYgWpfnUYIf0lU2aPDY9zno9uzzMSN8PMwysBcYNb+v8AHcT
         s0g5tYwgLQCpXReh6BvQ5ahqWj+FZ+8cRALk3fOQlY7Fnhg7Lqns8a3LJJl10L4KhCdS
         pDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764052; x=1739368852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bH1eaizn0aPUKCjEIKOdPtGUEy+w3C4lhP/b2zjqzvo=;
        b=uQu+FKoVEWeCzOjUumqcP8tUJUaS1TwcnXMmhs54+M59J18swbSgoFcWcSjI102gyy
         U3UYTBGX3Ujfrq1KSHXF33XcFiRBJ/H3YVdhBB3XzRZLejNQMNog+QELE7egRtKGWL6t
         yiS0JpPm9oK6cym1quUvPnIQKcZ2igqd9qdSAJQ3UoXBIt0XhTig3X5MGVo3CNl7sYFx
         5zQrAbuXrB79e0v2Bln02zfe7/BWnphb2wbYI+0Mwh97TQjSq4m3+phCTUPpJIJUuRwS
         +UpNgOnrHTf3O8ZBw+bbtis30EQVQF7C8AyOqvZaY5fScCfiFd3Dn8KRRT7cwBUArTY4
         668Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVJ8lJye3cy0RHxZZGo2knDfKwQtZve/hXnWegFAS8SSCDjQsIVl9bYbPkSeDJ8LzBS24p2X8glAhUgioecNSuOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysWjWOWku81MPFtAKjDzLeJf9WrU+ySqFDGuhOm9e9QPCxUCP3
	5z3Binpko3gJJRmO7LmQuQdI5dGmQCRmwmEWBvKgD35CgQFfTn7n
X-Gm-Gg: ASbGnctg7GHlgNmyGBSoiSk+uRJ0UjA8jr4VL+L/3uZ6S9Mt6yrbNKIZe0zbJP5XTcE
	m2JfNTp7/6r4nM7i3znxmtPubYyRTX1o3r6h/puPI+6r+IU0dO+ZbEq30OBBL89YbtJRvKvU1dm
	mlZXw9csIZLOHjR1+TadaYikWCYGjtEAXnIby6Ld1FaN+jtj/sJYxd8V8UIt4kdQCdPBrfLO6fN
	qccfqbzLRoHn1RuD0xMM4rU9c9LLX5ILZAs7u8f6hNopavzII33ve6j8cp/KfCRaJ757g5Q8VxX
	sY19gzeF91+O239QJjQYTt4Mc36u1JV+Pz/H+t031r/HAQM1q7YVcqnN1PeW7Jys+sObDGCrFXX
	/9u++cDZ+65AGTrfc0O4N5hGi1kybpiaZHft/I7GogteXKKzmB6mgEGRsE4rGyg7mUvE7Ik6luJ
	t6EwNXZzs=
X-Google-Smtp-Source: AGHT+IHMbdCYStyYgHcGpaSZYt9nkc2/EgtjLxNzrsySaIwE/4V9t463o1TarIhT+NWFdlFDpfsRFQ==
X-Received: by 2002:a05:6402:26ca:b0:5dc:89c7:3cd6 with SMTP id 4fb4d7f45d1cf-5dcc15aef29mr8127361a12.12.1738764051492;
        Wed, 05 Feb 2025 06:00:51 -0800 (PST)
Received: from ?IPV6:2a02:3100:b14d:3b00:3c96:9472:d1b6:5cc4? (dynamic-2a02-3100-b14d-3b00-3c96-9472-d1b6-5cc4.310.pool.telefonica.de. [2a02:3100:b14d:3b00:3c96:9472:d1b6:5cc4])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c93d9sm11387682a12.68.2025.02.05.06.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:00:50 -0800 (PST)
Message-ID: <87c4716f-d6bd-4a4e-91dc-70f73b9109dc@gmail.com>
Date: Wed, 5 Feb 2025 15:01:09 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i2c: revert flag based client handling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
References: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 14:42, Wolfram Sang wrote:
> It turned out the new mechanism does not handle all muxing cases. Revert
> the changes to give a proper solution more time.
> 
With RFC fix (v2) sent, the issue should be solved.
Would be good to have your feedback on the fix approach.

> 
> Wolfram Sang (2):
>   Revert "i2c: Replace list-based mechanism for handling
>     userspace-created clients"
>   Revert "i2c: Replace list-based mechanism for handling auto-detected
>     clients"
> 
>  drivers/i2c/i2c-core-base.c | 113 ++++++++++++++++++++++++------------
>  include/linux/i2c.h         |  10 +++-
>  2 files changed, 83 insertions(+), 40 deletions(-)
> 


