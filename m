Return-Path: <linux-i2c+bounces-7643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F99B4284
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 07:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F7A28396D
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 06:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA5820125C;
	Tue, 29 Oct 2024 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJalhDP0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EFB20124E;
	Tue, 29 Oct 2024 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184273; cv=none; b=KIdMJ5CWhVk6ce4Z+hTLB93qxMF9l/GSigTKCYnYEXmh1IaEU/jHuY88lON0bcqVXr8dFBRUYgQk39tyx8vqVmCnl/zyZY9Wef33zhIVzMuJwMUq/ajs4vhfVC74Dy2IrBRpNmZ3aWmWHgvCZsCb7TvCwSfVjVs3503IIOMNdZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184273; c=relaxed/simple;
	bh=zNyJFWtpl2w8YCj4LHTYzFrIf//aYw+RjNS9MLbWR0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dhaYhnd4WEBC86hKuHAcmhsgBZFsaJj3T0QN15asUq1rPz8UhKPx/34B0gKHJy/a83Snb8j+dmyGgVHznkv3Wx7emeRzrJyuIbokwpsfCSSj3/LIPZz9ziXQdOXdXXhgyDmYayRB2IUQiFHMh2x6xAGnV7Ytas6fAQ9hsxc4lM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJalhDP0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a4031f69fso683266866b.0;
        Mon, 28 Oct 2024 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730184270; x=1730789070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KF33I6LL0plBpfJCeQAFsiAalwkQ1koC+IV5jnwywDs=;
        b=hJalhDP0ANsPY7tyh4SIro8IuMrl0KJl3LvujJ3SzB6+4F+jb+FrJ0sJs/LF0/EF9h
         MHwz5xiWwilN/fM9u3aC3JFzLXEtc2clVAHysBYloGs5HZQiBHLg7z1C7u6XtxT2SCLt
         XzjgWrROBHEuN4yaQpCg04LhvsHa2IX/IDpBTyPJiP1+GYmPDeoIJq2Voknjd923MIvn
         4p80ecbYN1DO9kOqvOH6rwOeUUTChvbOpLnxpTuZ/tEK6Vlw8KIti5GcMwzgp+OVHukD
         NQpCWixk8h4imbqqfQ5OAVszZZwZJAmvwjYMltPKeU1JtD+D6GTD7jZ1Ysfs22r7qgtH
         TgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730184270; x=1730789070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KF33I6LL0plBpfJCeQAFsiAalwkQ1koC+IV5jnwywDs=;
        b=Xmw3HIyjrozDAsuJWi8bZn1sDQI3XSo76CLQR1C6bcLQGkOxi7hUC/fqFzZc5u2PEX
         JQstJPnURcVHHv+lT5pJibrRiqBsXmsJ9fiBmU4DRMDk1EYF0U8uD/Xup/HiYdwFpISg
         +a2l0a7SwjyXvvF8mLH0YNfXSzVuIdPDcwvInEF79XNpcH5mn+e1QcICyWbBGJAu8XGw
         X2dY5msyDvmJ8d6fB4IHRpkD7IsaJFSjLHK0jT2ENIrQs3OvMUThd+nfyZnjqa3hWQjt
         1IKN9EtllNrNe3UEyUI0tEYI7vaYjJpjCUutidl8yZWZbDu8FgGY1UuS8gphlDwm4QIg
         2LIg==
X-Forwarded-Encrypted: i=1; AJvYcCVNXSJLZPGZFPX8aQKtcCT9SEhXhZ/BSIkRxh9j3axTsv1sWtFWbxlQ+XwUpkCu4YUmn0Agoey1SOgWg1s=@vger.kernel.org, AJvYcCWStaUSDVRbhD+bqgiEz7ZaJUHjavtu3wGafOnKk50ITjvOXUN0D6bJ/g+dGePItObZ72ACT9YiU7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qSPTDO/OTyd7fG9nCHhr9KOKBuw0QuAdE+YcpVUGSutX8gy8
	7M7RH6NKdWl5HxCcyqSp7afguqoaVRmn3xbzSiMZFpu9WP+Bfuas
X-Google-Smtp-Source: AGHT+IHh+j4+rxanFd7EZ6tBK88ErLDSNzAI21beWahCriBRRnGuBZFG5mjYR8dKloioBhaOfVL7NA==
X-Received: by 2002:a17:907:7211:b0:a9a:ad8:fc56 with SMTP id a640c23a62f3a-a9de6167c81mr900404466b.44.1730184269538;
        Mon, 28 Oct 2024 23:44:29 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a47b:200:b85f:7509:b335:fc6c? (dynamic-2a02-3100-a47b-0200-b85f-7509-b335-fc6c.310.pool.telefonica.de. [2a02:3100:a47b:200:b85f:7509:b335:fc6c])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1dfbde87sm437490366b.23.2024.10.28.23.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:44:26 -0700 (PDT)
Message-ID: <77d8326d-b8f7-46b0-b66e-3f53fee8db12@gmail.com>
Date: Tue, 29 Oct 2024 07:44:26 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] i2c: Replace lists of special clients with
 flagging of such clients
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ZtQ0KMWUk9iAUCCl@shikoro> <18306ded-6451-4880-9f74-6bceb0f26dea@gmail.com>
 <ZvqEhntonE9qWnPF@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZvqEhntonE9qWnPF@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 12:59, Wolfram Sang wrote:
> 
>> Now that 6.12-rc1 is out: Are you going to push this to linux-next?
> 
> Yes, hopefully this week.
> 
Now we're at rc5. Is it still something for 6.13 or better postpone
to have a full cycle in linux-next?

