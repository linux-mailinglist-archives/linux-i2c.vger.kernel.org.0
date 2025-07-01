Return-Path: <linux-i2c+bounces-11731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B45AEF8AF
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD4304A80F3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247E62741D0;
	Tue,  1 Jul 2025 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="masvGR71"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E7273818
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373296; cv=none; b=N1gTJH8bu0ogEOENELEUNuv0jh30XNHDtISTjr9uxSqtuvyIvfTsJr9VMptPRt5vwbng+YwD2UBvZMrQWf2iORljFK+pZj83k/p0OOg6dNH5zXUppIwMSn4MM02g+2faYvL2WRrMW5BDlSBW/xS184ALQUYph4RkogSxafbnvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373296; c=relaxed/simple;
	bh=wNImbEu52gPdTxM6sZIEeOKycZUbsl83aNcybF4Zqgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImLVOHkNtK3w9WidPDWgo6/uObsVYGYiyVO7FAaCHVYznlz5iEA/oGIVW2ywnB/TlHB8iIkoO1iqdIoSiZ5WSJTI67odhJA6YLpkKw2QRJWIru2UhuKbzeVFwmybNQ6C5VFoKawJhI7bL7wKTGcIx4eCOIbml3zQQtHV23HJAMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=masvGR71; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453634d8609so39654735e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751373293; x=1751978093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNImbEu52gPdTxM6sZIEeOKycZUbsl83aNcybF4Zqgw=;
        b=masvGR71j6+9tFv3+wA1kC56GDF8I6ZK0AH8fg/zVBR7ZlgzKGd0f+rg7bH6h80Qba
         msqisxH9Xr8hyOcwCaPbKjrBoPn1UMH6U3bTBur7jeVWkEIzU00t67O5HjkVjHiYbrQc
         rMWhjfwrriyI0KkWdHbNuTrcpUyByS3Ou3u1FyzOwYvwU4TpuMjCXhkUEaQQIu9mGw2C
         7PidnwaQJk7oU0tA8myNTH5nP1aluOgTWwGmQMgQkLxYQHtpcufKnBFZQP9fu2w8yaiR
         0nZgFF0ZLLQ9DvRqsX9Uvq2Qb/0mQJkOcH3Hx7VuAbAPoH/cABlFiHGIjHw+Z75JN2C+
         UcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373293; x=1751978093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNImbEu52gPdTxM6sZIEeOKycZUbsl83aNcybF4Zqgw=;
        b=eP6DaFDMM0PRbpx8o9ZoZv+eXE6ZRSPVIC9/f7ScyRAo3nsGAHNTItIFEBzCfFIKvB
         nIjrDQhKeD1VyVvwKu+h2yQ5DinAC7dR8UTWiNk0gug4jHpXL5wP5ItKfceFrqq+KFGD
         yV+7SIBrpqCmLQexXilaBC1NKszjJrd+czZpxLQ2BU6jBPGL81/ATaWI8rvP2cEYKfV/
         6kFN6Ndbg7h1X22VBe4Nr6qawGpt7vJul3u2nnsmptccuRtIz5zpZnrWj4Nasp69ibg4
         XzZLL147pvN0REa0UBndECjrgnbNpyRo3PMIkIW6jIWHa7RUyUg64aNJkVjt/uxRpMny
         GhWw==
X-Forwarded-Encrypted: i=1; AJvYcCUz7ZV9V9XcxeDrFkWjhVuniKPn5y+Md+oH1d36DGn9R6z1HL9N8bbImpNzfcQ0tyO8x2UxwdwbNwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkRkD7vD6/90hj/bsHtfASj5X4W9vPCj2ZJKzyBY4CQCZ7/rfb
	I1TrlZ24OATstMCMxFB7VK/5sWbPxFYA8v13sIKNKR6Z2r4urPxToFOS
X-Gm-Gg: ASbGncsduHojlNsPfc5OZqaJY2xbXUw+RlpC1u2uwSYIzoUJZvBOxIDw3r6DzLE3Rdy
	KCFd6XAJSgiJAa6MJVWO2tXMPlxCZNHxgMt4bHinCcJSmZL9YpTGY4d0XCfbgrX01CXMzwb5zn0
	v2n+ApzcshnlyHaalBPsaFTloafANOor3guVV32UFbzr9OJ3U286W89i+JFnlCvp3/qCCiYoBOX
	0b+gSHUkMphw+7g/yqR8wwBMRY3Igmg4Xb0STQTxke9u7PtNGhmQSGxtb4wCACt8xUUikVDKAZg
	Pc9rW/U+MAAHUm93sYubvI3aU55g9SYn9+rknarRCjIDaHBUyIo/FgINuZZgPfoZrLjpkhyOCrC
	+XAvzGhgTWOQAVXQPzOypdLEuMb1uGPUurAa5V2D5xUY2JbVgsfY=
X-Google-Smtp-Source: AGHT+IGbJKNsEDev9AFvmAPHKcq931n72swL24FYoKtFqqjasVCkCrV+Hh4tRIKWtm3qbYhcPJoLng==
X-Received: by 2002:a05:600c:1d9f:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-4538ee8c2acmr196973565e9.15.1751373293223;
        Tue, 01 Jul 2025 05:34:53 -0700 (PDT)
Received: from [192.168.255.3] (253-8-142-46.pool.kielnet.net. [46.142.8.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5979dsm13098633f8f.75.2025.07.01.05.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:34:52 -0700 (PDT)
Message-ID: <b1d63a7c-e01e-4c1e-8923-2f2044ee3e21@gmail.com>
Date: Tue, 1 Jul 2025 14:34:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
 <20250701091737.3430-4-jelonek.jonas@gmail.com>
 <40654033-68be-4c80-b3a7-9567c4677138@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <40654033-68be-4c80-b3a7-9567c4677138@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01.07.2025 13:35, Krzysztof Kozlowski wrote:
> On 01/07/2025 11:17, Jonas Jelonek wrote:
>> This extends the dt-bindings for the I2C driver for RTL9300 to account
>> for the added support for RTL9310 series.
> There is no driver here in the patch, so message should not reference it
> at all. Describe the hardware instead.
>
> Also, bindings come before the user (see submitting patches in DT dir).
>
> Best regards,
> Krzysztof
I'll fix this too in v2.

Best regards,
Jonas

