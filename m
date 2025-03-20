Return-Path: <linux-i2c+bounces-9934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B98A69F12
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 05:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F46C464D82
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 04:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836A61D88A4;
	Thu, 20 Mar 2025 04:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjlR2iQz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23FA1DFE8;
	Thu, 20 Mar 2025 04:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742445147; cv=none; b=gZKseFHrSu9L/jsIo/QPOdh6k9UcKTSGyF3IuRh7PgqKWXFlgTiU/xJXbWNKmqLZYaHuupsEng4qQgmUa38TqG4j+vHw8AVLxq62dfEJjGhfb4ysXWvHHN08s/sil242MPEMTQZt3aAcBHRmgIozASV2hesPnDUbLu4JRNRiGSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742445147; c=relaxed/simple;
	bh=UqtoJz4+voFD4qHjqUljV0LevTwvKoBW/EB5vSdcpSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqRQ3H/HKvoTvIRk3D8dFpU0TVgDBYZrxdcb/VTfko8h+X28R2KnnjSrfIv/zvo9dbUpG2nhgFqTZ1/0heY2RfaAzsIxpaTivT54JXcja1RQ5770yIz7zPJ+RmN7yzmFEuK0+iQ6EzAbQ8j4SAaZ5YPaJlomSzepK13FWZ2TVjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjlR2iQz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223594b3c6dso5230545ad.2;
        Wed, 19 Mar 2025 21:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742445145; x=1743049945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H0c/SXvgHNMhOZuuuu9xdQXruNCMli2FyNv5fzPicd0=;
        b=BjlR2iQzjISf9temnMDMqSRV6ynv18n4CwaaAPL4B2DF+T+nzJgtfoHaQtgNkC6F5d
         bkn25xkoYfO/5bj4Rsq3CoyMENexpkvkNm5nNjH7ZW1eat5vQ7wi/D//2zj9hRKbGZmW
         8jCNpSzJdV6GrOyjsG8PjB6fPt9MaaX0vjmDnYV7tm/cjyGF7pUITl48W3pH4O6ZC0Ju
         Hqb2SResfWnEdOYnLCx3fvhw/HErGGeIUfiLlVdnidGNMtgckNiSwowBAXyRrFi4h/Ys
         V6AF4WOmG/Oak/ZOlGmdv7//UqM+pSIUPlFR4laHGs17ZaUo/921q0ymRi6sl3B0hl4l
         WWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742445145; x=1743049945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0c/SXvgHNMhOZuuuu9xdQXruNCMli2FyNv5fzPicd0=;
        b=VQlZrm8Tq46fX1vYIAh8hysc2J1DEIu912n8VKYBlIDuBYIBT9geCSFAp50Bs1VXMx
         prNHN0/6ZO2ReR51yRD8NKuu1PLZZTbz/VuC49m95UuFqNVG31Xy1YNmI3h7SxNlWNhF
         xCEVme07RD+8b7DcH1xU2fXb+6LQInmU+ApSTgo9grGiU9M/O7x5QuhNRUASicb0gNQ3
         j9JK507OdPii6QzI/xZ1Kbw5UuLRD2HJIpH004ezJ7OBiW/VsrkIlcrHrh/WNb/eTDsS
         +v9YUindsa07FjvMcZ7dvXbpUkpWd6Q8OAbJGCpxg47owTr+so+enWobIo9F/flO7/X9
         ZMdg==
X-Forwarded-Encrypted: i=1; AJvYcCUB053dQvvQavOm6IwaNOIxFqjWhE4clzzrDLnzVvD4J4f3+4MSS3XnjE+N6etenQRHOuoQnArk+qdDszsa@vger.kernel.org, AJvYcCUv9VNi4b3j0Vq1NDtA2bu+fdwDYeIzv1kYBhdS6VF6S/oBdlNAwEff0fPhiIvEbZpeMd+CoeMJzDNb@vger.kernel.org, AJvYcCWo7L1Q3MAsngjXiDHuGPSviuyjn7yzOLkC6n4l4nvQRGeKAd4CIsE5UEzMrIL6bJ7M5V/t+Is3LA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWeNEW7QZZKUNSx7UFVaQAjWcxAZf4gffAWJozU09TMkAyI7+
	NjTcxYP5F4C0l6WwMrBnc/lxRyjJAwm8Ppzl6CeOJDwLMZ9m5Tni
X-Gm-Gg: ASbGncvFHrK2FeKpYEGNgkNF3VvBMt0ZLDa9D4S/0DruDnQXGxH+R1X1L73715shk8q
	qLAA4ZjIxRCs0EHKlIOk2Tyox0pqJshp4A6ySvauzwye9BsgxiFI91xIboy1v00bHwW7I7FX/Y7
	ZCqvUYC6ybkrtJbnCVr+Bg9WzcWeiSMKRsGDQfHNYyEaY7h9HNpLsBdsSQpi7SNMwb7/8T4f1t+
	Bd855GRe013Z/tVpv7u5TIg5u5VEMsK5Q2AWSq7qQfZhRNSbnZ+dxYPKCJirT8LW1EOtG8gtTNF
	gvIUOZKxXSw/w9+5p7wpELhVtaoQR695KGyIwq10O2b3eeLt6nI837jdlYUa6oJEAmJ3aUscWgP
	jqDmAgWctUnaxuqkCOw==
X-Google-Smtp-Source: AGHT+IFyv8iT2NLAWxBrAqQq8iA5R/TzxJmsOutT38sXITQ7DHd7zPHllxh381KOPBtHSSFJ64vZkQ==
X-Received: by 2002:a17:903:41c8:b0:220:d909:1734 with SMTP id d9443c01a7336-22649a2ee21mr83338885ad.14.1742445144767;
        Wed, 19 Mar 2025 21:32:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5da2sm124501135ad.254.2025.03.19.21.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 21:32:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4c45ed61-5f9e-4e60-9458-3ad1274d0cf6@roeck-us.net>
Date: Wed, 19 Mar 2025 21:32:22 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max3440): add support adpm12160
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250320-dev_adpm12160-v1-0-8f7b975eac75@analog.com>
 <20250320-dev_adpm12160-v1-2-8f7b975eac75@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250320-dev_adpm12160-v1-2-8f7b975eac75@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/25 20:55, Alexis Czezar Torreno wrote:
> ASPM12160 is a quarter brick DC/DC Power Module. It is a high

ASPM12160 or ADPM12160 ?

> power non-isolated converter capable of delivering a fully
> regulated 12V, with continuous power level of 1600W with peak
> power at 2400W for a limited time. Uses PMBus Configuration.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

I am not convinced that this chip should be supported as part of this driver.
Unfortunately the datasheet is not public ... or, rather, the chip does not
officially exist. Sorry, this driver will have to wait until I can have
a look into the datasheet.

Guenter


