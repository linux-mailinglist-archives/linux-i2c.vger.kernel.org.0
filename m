Return-Path: <linux-i2c+bounces-4656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11CD9282A0
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 09:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 001C61C24320
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 07:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CF0144D34;
	Fri,  5 Jul 2024 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlSMt5zp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851971442F4;
	Fri,  5 Jul 2024 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720164424; cv=none; b=lYXgzQBGwb83FONQG2j58sIekLTY+XyhOjoNhB13ODP+seQ1gaBw7VJVB4th41h6fREmZAAntfBGrvyjMyQRiTdSSFkNJJWlmfg0nhJya0L2cwp8AVr8GWuFd8iyh3OxLVvspP32WObKv18R+SgIe4zKNEgiKSL9tYtzuzW7aww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720164424; c=relaxed/simple;
	bh=0e908banJdtOVrnU+58UjHTetdFl22i00mb3yrSUIgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmhCKnIxIjmtSv9RNpVAm0pvp5YNvrVJMdfssU5oosjB/VDXHD8qlaVJ+P6zbcWsSOeZZEKvPdtpavVAVbiFIRVw1GL0AEp+rYT5kPW7HaNE0betNavb3imd1D2AH0pxCxrsDcwAT2JqqOItxoedWRCLnMUk9pIvJBUzKqwiKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlSMt5zp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso1618846a12.2;
        Fri, 05 Jul 2024 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720164421; x=1720769221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lGhUbqzCKHE9u9KWskYmd0dSDBKEVCTm7UOYfmxhRD0=;
        b=ZlSMt5zpzMbVB7ltdYG8T6dUqc9EmtYHZq6F96cJlbEr4SXwwQawFIaJ6ERBiyy8Oq
         7VcYI9grAFCNhGe4z78+fpqZSUkbMOSSMT6ft7Qa3dzgL+//YCaZW+h1dM8gb4NS+tVg
         TXdPOFnZaJDjcrBiuHsFS7U251PbHP9iBhNC9xjtgp1jEYeJypc9GG9o3FYFP9UpeGoe
         OOGsZeuG/ZkwzHK44gkaVCHpyYIGhlz2fg7jrarf7L0gH2ecKRngJHyQRQZxLW/3dg4/
         hmIcFl8qXYtfaLaAiE03yga0u33busMkeNUyB9CmRkznl0G+V07YFaNAa6db2yOhdVQW
         uC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720164421; x=1720769221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGhUbqzCKHE9u9KWskYmd0dSDBKEVCTm7UOYfmxhRD0=;
        b=ac8K5A44PWH88jqlUiIFT6Cp+lOtNK/ft4wR0VRXJKsdsFY/mxz6DSAs2OOe91ptlh
         2seY2iQLusLhDKMf+8EX2Iv4In/y+4icW+/ykac+F++B9S6fvfzHMPvneX+ov9cRFCvh
         t975RTwXD8HyWwQQ4Twiu3tWPuls6IjOeGfQ1ESWqWmS8dUiBo0NlERUGHGbMjESMrLt
         kZUZ9zv3/VAYRIfZDBOrx6uUgxZJDUIhfKC7VxeZy3cOt2za65kbR/V+q3mNhGZrU8a4
         7KtBqj4OhdL2LJaDwJ+RU+FK842Y+Dia9hDKnyVzFtf+bjslB8mkZMtRs2k+Ys9kAN8S
         8x1A==
X-Forwarded-Encrypted: i=1; AJvYcCUE29uN60ebFH72QZAXTxPUCqx7+EDYgaqxSnQdnVmXrQIcbbyrJTm4fDOvbyWZ0doXNgvfs2/57hADO6xk5///yIZIur9vBZM+paY0XTx+rKCSnB3vvj5numj0Px0T3lkDdkjKJWSw
X-Gm-Message-State: AOJu0Yyfgf6SI13rYBYuc5dnGCBKnewVf26XCutkiFimCb7ipAhC27jG
	N6rD7lL7rIM4nROzH3ehRsLTF2WRZlTwztNPdN6CUTp4NwI05/Xr
X-Google-Smtp-Source: AGHT+IGutsWGNzf4h8Fv287oYxUYiBWnN5YveZOrtfEiC05aXhYDEV56j/KGDxgc51GpGRH1L54jyw==
X-Received: by 2002:a17:907:7e89:b0:a72:40e7:c6e1 with SMTP id a640c23a62f3a-a77ba48d504mr285360566b.44.1720164420445;
        Fri, 05 Jul 2024 00:27:00 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0ad:5100:b8a2:3094:789e:6f23? (dynamic-2a01-0c23-c0ad-5100-b8a2-3094-789e-6f23.c23.pool.telefonica.de. [2a01:c23:c0ad:5100:b8a2:3094:789e:6f23])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a77cf0b9181sm22389866b.99.2024.07.05.00.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 00:27:00 -0700 (PDT)
Message-ID: <1ef2f602-e12a-4fd5-a106-003412cc34bf@gmail.com>
Date: Fri, 5 Jul 2024 09:26:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] i2c: smbus: only limit max banks to eight
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-1-617ce47b8ff4@weissschuh.net>
 <2mtehll54bpuozsjswynp2xron3dfxknsixnouovby2nxlnrun@3sxdqqbvfr22>
 <7a70c707-6a57-4f0b-a068-7efefd679088@t-8ch.de>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <7a70c707-6a57-4f0b-a068-7efefd679088@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.07.2024 07:55, Thomas Weißschuh wrote:
> Jul 4, 2024 23:57:36 Andi Shyti <andi.shyti@kernel.org>:
> 
>> Hi Thomas,
>>
>> On Thu, Jun 27, 2024 at 07:48:11PM GMT, Thomas Weißschuh wrote:
>>> If there are less than eight slots in total,
>>> only probe those.
>>> Now the code matches the comment "..., then limit slots to 8".
>>>
>>> Fixes: 8821c8376993 ("i2c: smbus: Prepare i2c_register_spd for usage on muxed segments")
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>
>> I don't see the need for the Fixes here... was there a bug that
>> has been fixed?
> 
> More addresses are probed than are possible.

Later in the function there's the following:

for (n = 0; n < slot_count && dimm_count; n++) {

With dimm_count being decremented with each instantiated DIMM module.
If a system has less than 8 slots, then it also has less than 8 modules
and we finish once all modules have been instantiated.
Having said that I don't see any excess probing.

> Which is a change from the old behavior and also
> contradicts the comment.
> IMO it's a bug. Probably not a big one and I'm not sure if user-observable.
> Surely nothing for stable.
> 
> But I'm not hung up on it and will drop that tag in the next revision.


