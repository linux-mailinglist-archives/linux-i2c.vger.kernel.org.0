Return-Path: <linux-i2c+bounces-1503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC383FA29
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 22:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA3E028243F
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 21:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8953C466;
	Sun, 28 Jan 2024 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y16J6rg/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4BEAD0
	for <linux-i2c@vger.kernel.org>; Sun, 28 Jan 2024 21:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706477891; cv=none; b=kYADOHXpiTEVvXw+LF3kdl95Zxk6i9+8lKJzwQUmItuwUlKJV5HA5w6E/IiQiLtPkg9HXj1VZiUilqQZJjfVlfC8fAPaluK0oECXqtBR1aEPRi2t2jqXmW7zSioUPJrGZj3Eoi38DK4i2NZEiPlerHSM9HbHQBBrH+qRD+Ww4Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706477891; c=relaxed/simple;
	bh=hgf42ekb7S0qgaPkfDTVhN7fNS1Y3Cwjawkj9c3CVvU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K5AZ2XRFjQk3Wi7S2IEImEaYiFvaPejn2dY7b5sxtY4E0RpPvHbgVK72jFUiumIokk3/DbCJEiuLpP/7xADpNMcccquRzcXZ5UWTZyG2Nnr2sCCSqsf/OtpEeuSExVXQnGw58KQwJFZDIq+nIm7lvabWwClON1IO/ddUO2Gx/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y16J6rg/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ef75adf44so1518825e9.3
        for <linux-i2c@vger.kernel.org>; Sun, 28 Jan 2024 13:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706477888; x=1707082688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FY4lGg+s3q7hgVqOW6g/PaiLuLGXFeI8aJI+scAtPB8=;
        b=Y16J6rg/sXwRWwzUzAtjv0yQZ/Yw1QxteMyjFrZ4e/OKl+TeY7wRdFmT2r497rfqpR
         XYnCFq7iF3ofU6tMHqA5jH3lE089rBf96BqaqEPgga3V56XOOyYaLPFejgXslhPaTsvr
         5Twm14iBayPfMl8doKx+XDv71GUD1/Nrq6Kd42JX0dWurVhrvE8Byq6X9/2hisGqtM6M
         2XYGSTb/srMV7XCAOh8FFg0QXQTsXBOiN9OZ8bIt7aVYzf7XkJ7CYde5n2ukr4jIWznE
         uFNyluZNt0iKkRp07qing61A+P1u0SZxdYyvQ+qn6zgJg4LC4S0yFYd6iOK0ghDbcDXy
         0cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706477888; x=1707082688;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FY4lGg+s3q7hgVqOW6g/PaiLuLGXFeI8aJI+scAtPB8=;
        b=hzpcX5l4EZRM71e0ThQoHjeTbEvmLmXD8mxylX0XbOLyArpjXEpEh3DDSBnrvul/ZS
         GBsvnFsJ6kXUH0Y9DLD0e2p9mGkw/GsjhPpr9j3pMcYk1DRhlQoTRljDI9pUXpcbudUE
         aTCLt40ghaURbp4CBen7e7UNiRbW25PKZoJb7Lks8UCVvlB7ZWuXD5pKJw4kFFYiMZwe
         UL7ymxQYs9pqxhZMgqw+3g7rGHFR4tPiPn2QXEo1WjZRXA6QmZNB0CRhLS1ife6CI/ay
         A+5xCdEHJcD/rd8GyR6mRKVujmZXkIevyXWO17mQOMuYVjTDIoklsnoK2zyxMZKyWAtv
         pIGg==
X-Gm-Message-State: AOJu0YxsA6cC1TQS3ql/S5eULhk9nEx0249P47uGFAhVcfqoK8iq6/gv
	4d80WBcm/aywAamyq6xvmCdna8qhUnSKuniveBJuLhHB3uBAMLOtwDLD9JFA
X-Google-Smtp-Source: AGHT+IERo6Qld+/lNl6znF0yUV7/APsFht47Pi2FJAIXpSKgk/ZDDl2rTV0PxUJvBjDYzR8+/yZjKw==
X-Received: by 2002:a05:600c:4e8c:b0:40e:ab76:fd87 with SMTP id f12-20020a05600c4e8c00b0040eab76fd87mr3759322wmq.25.1706477887392;
        Sun, 28 Jan 2024 13:38:07 -0800 (PST)
Received: from ?IPV6:2a01:c22:7abd:9b00:204a:9436:1489:6133? (dynamic-2a01-0c22-7abd-9b00-204a-9436-1489-6133.c22.pool.telefonica.de. [2a01:c22:7abd:9b00:204a:9436:1489:6133])
        by smtp.googlemail.com with ESMTPSA id jx11-20020a05600c578b00b0040e8d59d24bsm4656144wmb.1.2024.01.28.13.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 13:38:06 -0800 (PST)
Message-ID: <5a698b3c-543b-4461-9057-eb1f522c7566@gmail.com>
Date: Sun, 28 Jan 2024 22:38:06 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] i2c: i801: collection of further improvements /
 refactorings
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.09.2023 21:32, Heiner Kallweit wrote:
> This series contains further improvements and refactorings.
> 
> Heiner Kallweit (8):
>   i2c: i801: Replace magic value with constant in
>     dmi_check_onboard_devices
>   i2c: i801: Remove unused argument from tco functions
>   i2c: i801: Use i2c core default adapter timeout
>   i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
>   i2c: i801: Add helper i801_check_and_clear_pec_error
>   i2c: i801: Split i801_block_transaction
>   i2c: i801: Add SMBUS_LEN_SENTINEL
>   i2c: i801: Add helper i801_get_block_len
> 
>  drivers/i2c/busses/i2c-i801.c | 216 +++++++++++++++++-----------------
>  1 file changed, 106 insertions(+), 110 deletions(-)
> 
This series has been sitting idle for quite some time.
Any chance to get some review feedback?

