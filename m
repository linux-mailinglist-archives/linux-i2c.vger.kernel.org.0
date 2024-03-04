Return-Path: <linux-i2c+bounces-2180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C7870B6C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 21:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2427B231F3
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 20:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D5D482DA;
	Mon,  4 Mar 2024 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld/MB61e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8753347A6C
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709583624; cv=none; b=FEsgEDlMzX+C/MvHvS5Krcyperf+8rz/h2yUzh49jgT3756FzKQAEoGOrXgMuh3x2X8hjQzVTsa6E5bFH45rm/gpKEwXd+0VWJ/MP1pwls7k3p5VTJdsVa+fYIyeG6487GS2zfvzKa4e53aZxokDB9avSSjPrzsv6+ZT0krInKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709583624; c=relaxed/simple;
	bh=unEbdlS0gfE5yDWftyvVkK9BRXW5ZuMgJInWSvd+5ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hX9OsRPsyrDNZc06YioDPbl2OGrjRe6uVYIxEtGa6eFXnr+76MUCiAuTxx+hr6op48Xwj0IGtezPH9MkPN8OMj+/8xm2ZeqJIzRDG3CcAAAAefCgBM3K91gJnmYz0H1Z9X4B6BluHF9DRDX+MJCN7eFcX98AXsZCbnFPeFW6auw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld/MB61e; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d275e63590so69577831fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 04 Mar 2024 12:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709583620; x=1710188420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7YMJaXw8cDkXO95TCQgkGK9v5RqbX9UoDSaplaBUGU=;
        b=ld/MB61eJxh4Inqcoa2LbGcYDuRx2tQgAVstjS02OiV/IGj14Jr/5AaKbWUhcPvqPi
         aRDPKKpMSifrmLnbVHchET3cjMliZ8Z/mj9a0+TQW1i/TdBEhJe3CYYP4bANBE/E/tBZ
         hOjDic06l8GCZer4ayn7k01jtKxfh8AJRZK6peQgiBIXYe86q8yhy7N478qpEJdtToFC
         xquIhCYoWOWv9rwK9bJZDFKw8scBjZXvxX6Y5TjSwK3PGoLA2bJmU94iFdc+zYiHI+z0
         DxohD4tSD+tL/B0FipY1ya9pfQcrDld0sg6T+KixMdPm1g8z+A1utCfVYlBqgrLGVm3R
         LmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709583620; x=1710188420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7YMJaXw8cDkXO95TCQgkGK9v5RqbX9UoDSaplaBUGU=;
        b=iU5ptlvxvrZly3Y2dekrP4gFW8aHwv8TL6d0ujzMI4RIL0Xi4kfsnTlvGUn/KJ/4qz
         aEaybUNBaTFyFYSvEk00y2pxH5Bz6guQE2I63I1RqiImQ25RprEuv7JtYpNE71duol9P
         3LwMQFCZQ1I1+Qq1PSaTmqW2pnsw+7gsSq+7FyzU1oIQC8UPsVYZGF0RRn/x2pD5lEUV
         Jz6gCthZe9Vf55E87qqgbBaRHlnIoUlWqhI7R3+3LjUcXsusVOdwofq4T1S6ICYzTLWA
         c6xRJCCT7q7rgeV0XpAhNal2guzs8/Yo/l3tRKPC4UQavWc6WIoH8O2103lolXZDwqtv
         Eang==
X-Forwarded-Encrypted: i=1; AJvYcCWpXo9LISSt3bXVlpA9a58YNr7lNwxv4GrVqNGqnzg9YoPBxhJkagbcvlfd1bm3h12nyey+I2dSOUq1EGgEh0xHKWWo+D5SFoGy
X-Gm-Message-State: AOJu0YyZ34DayQx1sYAs+QjdkaMvgXRIcFBW0eSH9DnCqcOWG8MWRDjj
	QGCezW1zoGmnbAN6bNs04Z5SPf7S4C1Jba/gbvcWGKFBeja2qi6tRmjbi6L3
X-Google-Smtp-Source: AGHT+IFfvGg6XM6Yn2WnkuhBQLbmxwrZLWCALtI6dahSEhPe+E9UXyUNy1JZohT2TXkXnHY3oVFPvQ==
X-Received: by 2002:a05:6512:2812:b0:513:1ca7:87b1 with SMTP id cf18-20020a056512281200b005131ca787b1mr8312529lfb.1.1709583620070;
        Mon, 04 Mar 2024 12:20:20 -0800 (PST)
Received: from ?IPV6:2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64? (dynamic-2a01-0c23-c411-1a00-49f1-9fda-4d1e-4f64.c23.pool.telefonica.de. [2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64])
        by smtp.googlemail.com with ESMTPSA id a17-20020a170906671100b00a454438091fsm1583803ejp.70.2024.03.04.12.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:20:19 -0800 (PST)
Message-ID: <ed7b0ebf-a1a5-4e63-bf92-8f37811decb4@gmail.com>
Date: Mon, 4 Mar 2024 21:20:22 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <d0b4aa2e-8b5d-4c27-8aab-164a089d95bd@gmail.com>
 <ZeV8Oi-j8L7ugyhR@ninjato>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZeV8Oi-j8L7ugyhR@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 08:46, Wolfram Sang wrote:
> Hello Heiner,
> 
Hello Wolfram,

> 
>> +		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
>> +			 dimm_count, slot_count);
> 
> I am still in favor of removing this. I don't like the inconsistency of
> the printout depending on the bus being muxed or not. We still have one
> printout per device instantiated.
> 
> If you agree, I can remove this while applying. If not, then I'll apply
> as is. No strong opinion here on my side.
> 
Yes, please remove it. I'll submit a patch for adding this message to
drivers/firmware/dmi_scan.c. Let's whether DMI maintainers find it useful.

> Happy hacking,
> 
>    Wolfram
> 
Heiner

