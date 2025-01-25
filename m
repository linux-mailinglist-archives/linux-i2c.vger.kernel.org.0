Return-Path: <linux-i2c+bounces-9198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D86A1C58B
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 23:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A8D3188885A
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2025 22:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE40207DFB;
	Sat, 25 Jan 2025 22:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJp8/ZHQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D71DE4EA;
	Sat, 25 Jan 2025 22:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737845639; cv=none; b=RcvTjyV2EGOnXKPeCV/N0xF8Z+LuI8wO+aieohzn6qhPIEzBPaxSLlRirxgv42vQVO0CQADHqCEuxOyZafmPBajneEPKNyEs3LR5lIojKrGRUpdUadUPj74NZ8c3tT5cI++PbS6SfRTlxC09X8oBr6FHhcfHHLBeoKEHTtCYcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737845639; c=relaxed/simple;
	bh=079ZkkPojA/4nCt6/G+6Q1ME2ZYxJYJImXh5BjoLiVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNjeyFN4hybdG7zjncTTwUETVWj+cTJRDhEayPKcdB+0ryVA270WOzHkWzN/zZEP5DYKzHPCXZT4Kf1VRfD6bVMkZ5kccJMMmj3BL8TeSYB8hIsTdn2NnerGeYrCsWgVVHe30k4BM6kH91UFKflwVIw+Vth76MnW/ey6saYEu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJp8/ZHQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21636268e43so70941485ad.2;
        Sat, 25 Jan 2025 14:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737845637; x=1738450437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NAUWUwSSlL0PN1bO3H9JMFaSpWTaiLHHIsvs2Nm37nA=;
        b=hJp8/ZHQMSu9jXhjkza0Tqsf+8n72ujQOH4qDZwZkyR/7roo97SXhFQ5jAJ5wdKEFw
         JVA00M5irn0nS5dur3V19ZzBPlPy7+qvhvsu1dr3Ffx9ydbp2UZs3iVgDgQjeqpuPtiH
         UtkM0g1xIibeHNOiU98OFvqUTsFgwUr7Djht0lfB4UH1f+o8FRknDax0x5e9KS4j+jk8
         TdkYUaDOGAmjvnVRduxSk2/TNoJWNXYC6o1pmeNtB5QdP8u19nKSPU+AIqmt56nwgacY
         iIVuXkOGqhaLIrlhXGATVKrHOeR3+rm4eLUEevyzpnfUqSq0sq+joOn6VunKVO1oELiG
         dXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737845637; x=1738450437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAUWUwSSlL0PN1bO3H9JMFaSpWTaiLHHIsvs2Nm37nA=;
        b=qOUZ805r6gkkcrdiucsvRzCvY84V2s9yFMel9ek6MW+0gj0VFBbjsbkVV5mgRzyPcq
         QXhcs128cZXRoHH+CFGhv+GkLFA+FUrSCBAzWWBWlfhMegG8HSfXf0T6VIEsAj+JmHJo
         F9b1Kaaw6VqCheaNyOwNTuZvwrE8cw7oel85Ax9KcVQYkpL2THShKpJs9wFw/TIGKpde
         yLQfNxo6qyuO1xriAXn+YCz8M82uBsryVtrKcadeXx6SzTfWWbdpXyBl7ZDyaOP94/+U
         bu/zoHd5m3tPna8M2jP2jE/SWPkEGsvmlj3XMzbHDkD7pmdIsOD2ZXNmR8s9WUXLZCcV
         qAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1kBSA9h1f6jKMocknnrVnE/mKLjG+VYXdUvsZb4wmgu+UyuVdcgc1KtuA9zSK0sOyKoNyhaBid3u/94s=@vger.kernel.org, AJvYcCUw/PbcdpWccYQa9gx3z288pYXtaSkbTFOktYclhyQdcCQ/sfC+wNDDwVsszEsvfjWqNxH251EPQ488mOWK@vger.kernel.org, AJvYcCVo0UFlNYuUNqmPo+mG+dlPfdInCHTuMhUHmtIATdCq7hKTGbEqBcJol2PhDmJ79IO7Q+cRk38i7B8M@vger.kernel.org, AJvYcCX7LAzyi2dQmRG2yxdU5P/15/LMttaQqBckDUh92srP5KArmRSh4wB8hsaTVELPgnciz7u0Blb3uZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzybIM87ogIxfQIEuX8pOCBWmVDPD/MV1X38FVle5pBw0Ns70gr
	mP62RF6gQkIvUN1BSO6sf0icxNfDlEgM9m+tU44CNPvMApRUUZjO+RTVQw==
X-Gm-Gg: ASbGncue1vGLXvIXxOwP0pFzhlEY6TQ6uqYnLcGgZHnfQJeIQ2XgSWHabgzQBOxiE2G
	0QOBNj11chwG91S0eZ3wXB76X2+guX3nxjjbqknGC1EUj90r+TBG6CjesJSCAUrWXM0y6cPjaLb
	DP2Ne8rwW5eVSkSYNKzCrkqkfa2Z7wlDeiaGo+KSmCaxFob/933sMaI3yAySAP3XYSIwmYlxWkW
	E7CMiull8nJLkfbeDlUu0ItlSTci/1s/4aPytWeLzLoXbO8m9cADMo1rPcx/vW2dctOry2/sP/v
	78dAM51bXq0+zXcNrHXwu2nKCNfc1VRtXYTact5ouk5+lhlpXVnZkA==
X-Google-Smtp-Source: AGHT+IE1RAhrVx08LphMCZwIXlRim4s56J9Z0B/pks4iV0AAuMP309QU+TpjPZXQrH2iKsW5n1saiQ==
X-Received: by 2002:a05:6a20:4303:b0:1e1:b105:87b with SMTP id adf61e73a8af0-1eb214f0f6cmr52708097637.23.1737845637399;
        Sat, 25 Jan 2025 14:53:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78f18asm4306188b3a.177.2025.01.25.14.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 14:53:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <710736df-98fd-44d7-a51f-07923d72482f@roeck-us.net>
Date: Sat, 25 Jan 2025 14:53:54 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
 <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/25 07:39, Cedric Encarnacion wrote:
> Add hardware monitoring and regulator support for LT3074. The LT3074 is an
> ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
> serial interface allows telemetry for input/output voltage, bias voltage,
> output current, and die temperature.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
....
> +
> +static const struct i2c_device_id lt3074_id[] = {
> +	{ "lt3074", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, lt3074_id);
> +
> +static const struct of_device_id lt3074_of_match[] = {

Needs __maybe_unused

Guenter


