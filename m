Return-Path: <linux-i2c+bounces-4841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4356B92D3D8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 16:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B370B218E3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 14:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A807193454;
	Wed, 10 Jul 2024 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI1jVKVd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503E118FDDE;
	Wed, 10 Jul 2024 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720620575; cv=none; b=RmBabrou4iTI6IwWKVp6A8SOpK2YzHe7B74VrlSq1+FwJRS1AWZUlfkLNV9nQKW7Q7sMxKZ0aHjt2NishQ6UUxan/98XODqoD6JCp9neUhMoXstSM8bgL5UqAG2VQcB62n1LKIpR4tTbxSEyn6YEvCq+h2lakwDWDaMybpyHfd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720620575; c=relaxed/simple;
	bh=m9NqhzYNEewTdoiqw6DDP+BWLMx2BMOe6DnUp4U8zZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx1cd8hwK56W9AKJcqN1erInytMaLa1jtgxrumzkOfeWsWZ69j59qDDPe5AOblVRnvYv+KZSRRPDbnNj4DlnFvQqyzLDsZ2SX6pXNxtm0ExDMI+ouEBeutooE/m4QwN9no1nt1653Nh/USOFIBOU1m+PS3XAtYOJZ8IYQOCgu+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YI1jVKVd; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c9a8313984so4312700a91.2;
        Wed, 10 Jul 2024 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720620571; x=1721225371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=igztmPoSWmD4pm3kLhf0T6TrBHm06GEPeDYdSfelg8s=;
        b=YI1jVKVd5y8gwv93Y9CN4aORmynZV/O6oQPaTUlZPfSZXb2O9EkkijDKAZk/k/JwB8
         0Gd9vq1Hb0P4fwmwNYiGucSzX9ILyVoj6zmEH0zVLsqh98JVb5wPw/RhRdJVaOTJdYsT
         vN6f4EPkjk27N18zskebfrqHsxzd75P94wTtIdEC6xMheTbKGwAyfy814qLprJfyg+/b
         c1QsMtRFrJS1R7ewaIYkQq9nHjJ/knf45PbsJa7JkpedhIWEqoIQaBwiUdhPYq5gdMSS
         zOAAeLNGIh2XRosNvfvB8BUPb0zkF5ja6oezqDDU5+IFCdeuGlVwoFRsnaQguWgjPASi
         SbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720620571; x=1721225371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igztmPoSWmD4pm3kLhf0T6TrBHm06GEPeDYdSfelg8s=;
        b=fOXnPkBmZGtHhWyNDHV3nkaUWboyfLIGYiVaK/DMZUo5+HG3RnmYOt7o8Sutlyvh+a
         2+z+jh01Py5mU7iCh8QI9TQiBSD8BgzwyjD5goIElZ6Ltp2mr0/Bw2rWCFd8a3Dtvd9N
         y+XdnwHvsaDPvEGwPKZSaD90/cN1VKZ0XmEJlZQ05H/VJyWLwSIVPQZHsBLmG82F3Fko
         izXGdZ/qmjuupSCm7/kVT9ON6LcZe2ebEHLGGqJsNo5Dp82WXeCV/M3NoUXvWo8nr/RF
         KwNDt1bk/crmqodg3ACHMzJWg7oVN1RXmKCL56VWPsB5UPU+fSZWQDxkJJkic6CY/41g
         QmIA==
X-Forwarded-Encrypted: i=1; AJvYcCUwHe/hYWmbnaof+SDv+fz0cKkNUnkwfKj/muY2a5OWMRGuwGemvHNNmQOhMH+E/bVYMa9mA6Q3sIquhdNZ3j76U/2cH26gDwESDik=
X-Gm-Message-State: AOJu0YxlLD9k5HcJA6q1zEGy2obTYunAV1Q3zC06MJkWqIs1H219egBn
	Ahl4/JqwQmecbYkB4Wb02FRNZ+TEo3NQdn41H+R5RTs18o42dyYiI3rXiA==
X-Google-Smtp-Source: AGHT+IFOkFQXrsEaypFnL4cDjLRXdeYHjtXa/JpSP2GLn45mUvLGNjeU7aphna4BqT8o36Mh196Y/Q==
X-Received: by 2002:a17:90b:4a02:b0:2c7:83cc:991 with SMTP id 98e67ed59e1d1-2ca35d58b13mr4494335a91.44.1720620571225;
        Wed, 10 Jul 2024 07:09:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca353cb232sm3792466a91.51.2024.07.10.07.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 07:09:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c98be2fa-bc08-45cb-bed6-3efeeefa8754@roeck-us.net>
Date: Wed, 10 Jul 2024 07:09:28 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pmbus/ltc4286) Improve device matching
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
 <cf49bf8b0ba4e50e71e0b31471748b50d7b1a055.1720600141.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <cf49bf8b0ba4e50e71e0b31471748b50d7b1a055.1720600141.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/10/24 01:35, Uwe Kleine-König wrote:
> The devices supported by this driver report the model name in their
> register space. The way this is evaluated allows longer strings than the
> driver's model list. Document this behaviour in a code comment to lessen
> the surprise for the next reader.
> 
> Additionally emit the reported model name in case of a mismatch.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>   drivers/hwmon/pmbus/ltc4286.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
> index 9e7ceeb7e789..2e5532300eff 100644
> --- a/drivers/hwmon/pmbus/ltc4286.c
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -95,13 +95,19 @@ static int ltc4286_probe(struct i2c_client *client)
>   				     "Failed to read manufacturer model\n");
>   	}
>   
> -	for (mid = ltc4286_id; mid->name[0]; mid++) {
> +	for (mid = ltc4286_id; mid->name[0]; mid++)
> +		/*
> +		 * Note that by limiting the comparison to strlen(mid->name)
> +		 * chars, the device reporting "lTc4286chocolade" is accepted,
> +		 * too.
> +		 */

This is misleading; the desired match is LTC4286 and all its variants (LTC4286[A-Z] and
whatever else the vendor can come up with), i.e., it is supposed to include all device
variants, and ignoring case since it is irrelevant. Referring to the odd string just
makes that look unnecessarily bad. I am not going to apply this patch, sorry.

Guenter


