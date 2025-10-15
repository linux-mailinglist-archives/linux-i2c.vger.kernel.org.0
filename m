Return-Path: <linux-i2c+bounces-13549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18FBE08C0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 21:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 716D71A22D0F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 19:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3383081CA;
	Wed, 15 Oct 2025 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObYaBkA0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82732D2499
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760557961; cv=none; b=kqN7nAn0V8bCTgQhPDZgBtWycfqMsRVbm+dcWQluUxEI9LFs+gLu2j94Wrigko74DzRhaggpT95TonM7wzdulXVq5SB+W1ZTbw+qLh3diHOwZceG5qaoORqXPbFHNJoNRSN/RLjqp5YE0BoSADbZAsZe5CWW8hu+ioP+4rPKs2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760557961; c=relaxed/simple;
	bh=af8Xe6TRc+JzmwAuvgEbc4JHLFA1oiSBVP44j7jh3EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWiPqMVkI46TvrXm6yDu2jO7UD8mV5qKpINlMFlCXe1t49HR4oPAE9JcaVPhIKEIam5BG6cqwuNj7EzYG9W16F2M2ZmInKnG3HgeqlaCNS8v6QMot88ElTpoPHrBQwo7cT+DVFxgUcmLbcpnahn4HS1tSzPstNdpI3iHDkWh5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObYaBkA0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471076f819bso7075865e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 12:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760557956; x=1761162756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GS1idVixeI5e2i+7QHqAFbRFPE0KaUN0lsPmnrv+9w=;
        b=ObYaBkA01lQyxQhQ8kKSQS/RPGNqcvyHVTldqN5eRNylfz7gCGR5SvaQoP/MB4iNVT
         3DchSRkM+24PNgUiYDUXTMT/dNu9OEwYdp3YbvMvEtQad0m4DRNZ3PZZbl3z//pLOWSw
         kjfknvKRcAs40ttBipcx0cvgoj1ZQ/0Yd4fPYEn2+XLSettgAgu7H9aagLhvuIavhXb9
         U+6Uxv9GLmntVcWFMCsZDezMt6fqklBHMw5dEBa6+G6SG7LBEIqh0lrp6qqexrUGLzMY
         9P7CRhdbq+Q4XA+0KtpcOy5MrztJB//q8ay1nAAPwNgHAuzxeMfAEWchvccMoKrOVQR0
         h3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760557956; x=1761162756;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GS1idVixeI5e2i+7QHqAFbRFPE0KaUN0lsPmnrv+9w=;
        b=BzfH820iwr8G5HvskpLD1cW0QDvC+lU7VVYcPgpmapk8HcynhyggYvyw2RtavJO2j7
         zRrDSrwug0O0o9cKo6Y1IRYms5Ag6ukxLoAC2YIKL32A+eDB5ecL5cAuMyDZT0Q/OeOJ
         krl1ciOAzC0JkudcWDaTAZRM2/9eZk88+4kg2SgIWpReIwimPUeBTJCCxNaHMgtOP0Ff
         SZwDAZFgxyq5h2Q67UX8UB+wKUKM8rH0EeZKma01LhwNUi5DdauTqQ1jBzoYnehYly/6
         3GpZXyxkFd3OcZak99vtXi0k75npgnAkN7SWHehXWJIUbNSjzqIuZRCjB8hP6yLsU+M7
         eoUQ==
X-Gm-Message-State: AOJu0YzdHgyoJUkb2aUGY/zg8Le17YlA+I8KJ9nHcMrFFcaBXJyLPzLC
	eWy7C1Ar61SPkjlZ3Fepu/qPqj8fMRyqkK4LxtfCNL7kbv/fsfMM0HwahlNL0VHulZU=
X-Gm-Gg: ASbGncuxqQnSYGWc6GLcq9zwartqMSZy9Fuh1/VpJHiwFmLOjC3M4G7LuRFwlAf65Dw
	GdTYrsIskkndZj4mJW/V8Tf0RVKT9J8d2CB43PT2brvTKJPYivrriL3YHBdPZfg75Bm8cwyy1Ku
	tC2MS2Vai/RZPDsHqM6SWCtQJKPbtjc79jGJ5SBdCRt7PZsNiuq9AQcfACjJv7kxo4dbbazrOzj
	arGSKzCQJD/cBFvfNb4qHhZ04emFEETJ9LTRXuxrvH2roZ4uXKu9KlCdqb6zt5CW8HVdQ0puOZ9
	0SvAOPtzYYhJiu/TZpMTQNKJgtuISFCq/2+yqDL4YWGwnvamX8NtKJ2MDz0XjIi4yRcjtyjWADK
	hMe4q90WGnjbEDz3kmN5dzEOoknQJnIQjsdAVbrr7DAkbmJ3VNJn+4qeKOztpn7jE9uUV1y9zDK
	v44mw7kig5WR9hkg2Xk0KFILhG3PAzhKbsreS9YWcD1Wlhm25/liheyDJpK0iKlne4cRA=
X-Google-Smtp-Source: AGHT+IGkZ6+GeFJQTzXCmHptwwr4bo+TRjYBptncrFFbipQ1Aojn7DOqu6C8j1sCaiyxrTrPkDJUeQ==
X-Received: by 2002:a05:600c:a4a:b0:471:672:3486 with SMTP id 5b1f17b1804b1-471067234b4mr23258485e9.15.1760557956297;
        Wed, 15 Oct 2025 12:52:36 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c2359fsm48647285e9.11.2025.10.15.12.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:52:35 -0700 (PDT)
Message-ID: <aae11951-35c2-48f8-b919-e32393279c79@linaro.org>
Date: Wed, 15 Oct 2025 20:52:34 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
 <62da6efb-24d0-4a6b-9a52-c8f981f09d30@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <62da6efb-24d0-4a6b-9a52-c8f981f09d30@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 20:22, Vladimir Zapolskiy wrote:
> On 10/15/25 05:42, Hangxiang Ma wrote:
>> Replace the hardcoded buffer count value with a macro to enable
>> operating on these buffers elsewhere in the CAMSS driver based on this
>> count. Some of the hardware architectures require deferring the AUP and
>> REG update until after the CSID configuration and this macro is expected
>> to be useful in such scenarios.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>> This change use a global macro to specify the initial buffer count. It
>> meets the requirement that some hardware architectures need to defer the
>> AUP and REG update to CSID configuration stage.
> 
> Both the commit message and the explanation above brings no clarity on
> the necessity of this change at all.

I don't agree. Removing a hard-coded value for a define is an obviously 
correct change.

> This is a dangling useless commit, if you'd like to connect it to
> something meaningful, please include it into a series.

No. It is fine as is.

---
bod

