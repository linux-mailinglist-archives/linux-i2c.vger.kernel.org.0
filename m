Return-Path: <linux-i2c+bounces-1435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CB8389DC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ACD71F21C0E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 08:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E9957878;
	Tue, 23 Jan 2024 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfB2TZ96"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E65E51C54
	for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000386; cv=none; b=XsYUoFqUu/Nc7syJ7Q812m2ZVhOLAwJulX794a6I1Nh9//oSHcClApFIGDFW02wIG6Il9gAsa3G4Hc5KAluLZUIeFftmzlOZT6LPAJREXJ12k4/dRvYIUGzM39jFFj2eDp12sJH8wPZr9trlWuDGNAIjO2kdAIe9CmB6SLOpNuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000386; c=relaxed/simple;
	bh=xLSqcMT1h8K4n/TY0BDzF32SPrOU8bGfFVRZJKErR8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeiVxNVD+0CTp/xH6GO7EPsqkWcENW5OkvoCWxFBw9IPUi0nnDMHUbxPnprXVynIMlbdJ7ibWMJqNzf8QeHfIghuk6xM4hurh24mAALNvloaI6yF017GKbY0INNoglaIuGBsMCunBU9ChgvipVaH9J7Z5LzCk5bLqIPgRBN1HDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfB2TZ96; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e87d07c07so51618195e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 00:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706000383; x=1706605183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9U30og0hu8i4oPLnJ1qghUjw2wEDIj1e74P1+b3Sa/k=;
        b=KfB2TZ96bONepJlCHJVfrVnr/PS/CdaD8WFkNvA6LDfl/A4RdHxk85P6KrXRQ7N2Rt
         2HIRFzkCt8Hz4/4wjnbRLNwpPQiVDFtJZxAkWHX5v74LAg+Twtb2TsmYjEZOEGysUCgK
         EI0nxG/9gIMSgzVlWOLabej9Ne8rGeKi/XgxrhN42bb18Pp2pMn97P755sKvH+D1Z2R6
         /EEe169KW4MPFPDv3+fBq+CK5TSlEs5rB+HXKJR+mMsr+nE/d2wEcfTngtxcPyosrZCr
         MagL6yUMVHRrW2TWwD92Fvg9V5Dp4pPbZIYfpMZUVSJkuW779CV9bhHvQJii9Oku8RjL
         POjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000383; x=1706605183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9U30og0hu8i4oPLnJ1qghUjw2wEDIj1e74P1+b3Sa/k=;
        b=MbLfeN9Ad/WamhlC+FAXAj8DrzW7n7v4Xrnudyr8AmA2lrt/b+WysWM0hcIfhkNTEH
         /9q0bYHxerbFcxFjCpMfc1VR2NLuWTZMIUrtPj2V9FEmCMEEDMVBYhKnkYwn22na76Tx
         4nEK0UuY1h8+ZxAQwzzPKtP8ka17bUQPVI8fSlwWi3jUsVzUVKHsg1snoCrMtlRl2wNv
         FEVFJ+TcJ8/rbmim28Eie0bteSQUlKE3p/jedVArBun3DMTRLOvAFHPwBn/kpXK5Nk4Z
         Yh+xwTGZcyTdnHFHqMGE0/RhwjNUQE0qcQhdE6znujpEkndjPj9fpfLwP7ipiDM3yE71
         9EjQ==
X-Gm-Message-State: AOJu0YzflcpYa3cx2SQr4kNBvT0O/061Sczv7+eLcqyQlMeZUfFlXKDf
	y4YC6hr5iAt8GZRhbFg461nV/E+wbNeQyDPBlKmVWJFSLI/Id5yw59Iny1nSN6k=
X-Google-Smtp-Source: AGHT+IF8j3dCxDqFsG3LtJCB61heEggPj5OMPLmXf1IjmTb1sNL86Sy+zId72Gx/Y3TDxuz+7a0k2w==
X-Received: by 2002:a05:600c:20cb:b0:40e:5435:bb9e with SMTP id y11-20020a05600c20cb00b0040e5435bb9emr367919wmm.81.1706000382966;
        Tue, 23 Jan 2024 00:59:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ek15-20020a05600c3ecf00b0040e8e358f82sm18577602wmb.19.2024.01.23.00.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:59:42 -0800 (PST)
Message-ID: <bf651183-9321-4dd7-b8b4-4cd635760f31@linaro.org>
Date: Tue, 23 Jan 2024 09:59:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8 with I2C
 configuration
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 andre.draszik@linaro.org, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-8-tudor.ambarus@linaro.org>
 <9d12f4f9-1892-48f3-b8d1-8f59788cc91d@linaro.org>
 <6ddbf20c-6929-4cb0-9fdb-570cc7170b9c@linaro.org>
 <7fdc00e1-0a93-43a6-8fb6-c447ad8aef64@linaro.org>
 <a2c64a9f-4467-44ef-a13d-0af80abf4dfd@linaro.org>
 <9d5249a6-5838-4af1-be18-3b9a9e34a937@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9d5249a6-5838-4af1-be18-3b9a9e34a937@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2024 09:57, Tudor Ambarus wrote:
> 
> 
> On 1/23/24 08:44, Tudor Ambarus wrote:
>>> However I don't fully understand why that dependency - except patch hunk
>>> context - exists. You shouldn't have such dependency.
>>>
>> Let me try offline, I'll get back to you.
> 
> The dropped patches depend on the dt-bindings patch that you queued
> through the "next/drivers" branch:
> 
> b393a6c5e656 dt-bindings: clock: google,gs101-clock: add PERIC0 clock
> management unit
> 
> We need the peric0 bindings that are referenced in device tree, that's
> why the next/dt64 branch failed to build.
> 
> Please let me know if there's something on my side that I have to do
> (now or in the future).

It is useful to mention this in cover letter, so I will know how to
apply the patches. I understand therefore the dependency mention in the
cover letter is not accurate, so I can ignore that aspect.

Best regards,
Krzysztof


