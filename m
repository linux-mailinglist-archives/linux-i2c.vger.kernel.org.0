Return-Path: <linux-i2c+bounces-14389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D20CA2076
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 01:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8FD03002E82
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 00:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2BB16A395;
	Thu,  4 Dec 2025 00:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StwBcJGL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342C386348
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 00:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764807602; cv=none; b=ForJ9HloTeSh+fQAU3Vvugys8FVpnEK6FAcaxGbe8UjJSqyppW8OLDBZufTkWt0qoSGr0JyNQVOBgE4qUobH3FSC0GwVKHylc3k76Hp0P/EbaixHaAmA7Z/b7nXoayX2oqkShgUgziSOzPzMS/9sz5le1RmmRo7TdP4PcVuqmfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764807602; c=relaxed/simple;
	bh=W8JDpJ0cszJ31H/pDOqCniqWJfMlgyzvY+vNNyzFof0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIAFI5OQmPXVvGcvuEmr2NexsT/iR9k0Rw0GQd5ldTl/MbbS/bvlZeIGjX27Q4hEJoLUwLdZMXt4xwThbNrcJfWzVw9uOF4jcF2GQLpQzp8DzXLmOrSNtZGE9ho45OIuv6UP3BaDU52zWDp7kwxe0gc7iseq9rtL+lkUtmUWEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=StwBcJGL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso3174015e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 03 Dec 2025 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764807598; x=1765412398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sy/9CGo8NUcxokw+wp92Xk3pkZwIb1w5SdSGUoemftk=;
        b=StwBcJGLcJfxTssaWb8uykX/xbNE8K89oLTIURWcXQswGIujc+q9L7GDbTeunhGmq/
         LBF/LmqaIkHhSQKSUPUVxe4cKnbs2EZvPYKikUjehxJoKYxZHim0cofRSvIc8NHMcu/s
         UhLlYJ6IN3zRbWIOw2vMiX21NULxRNnUiKkzTYFurXir/b9WoiXv1Q9Vyr2mpG8zaBeL
         FrwoCw72h2ucp/cBrLQJf7KBekH32J1IwAVFuYjc32hxOWQoSf2ojQ0L1YS0L6iUosPW
         5wXk0/BvsO1CjGWAI1StK6IuJWJOJk2jR0t/HMHUNJNDpxO13bodEXI5BR0Q1QayNblD
         +QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764807598; x=1765412398;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy/9CGo8NUcxokw+wp92Xk3pkZwIb1w5SdSGUoemftk=;
        b=UCf1BAdQx/TpiPdtHmKFJ/sMUW3Pobuwj67cYLNvpVqRq9eAazfhPj1EKnf888bZ2V
         2dLmlCRlK9hk8N4qUldHo+SFxNvV5HxPaxBfr4WXaAJ02J7Ks/xiNiUrx0TI0Pa7D+4b
         2cvfMFqvRJ4AnQ4+I/mcHtxAyhgKGOXmzMp8naenr47IyPB/tWXrNCE6vAZb/4g8AQFY
         KF6AZ4Ok8ykioBTs7zjhOznvwqDdaa3+xnsVu0kAc9JL/SNBN0ot322xwyepRBUGpS8v
         vzEt4D4S1lm1KW3ozq6u5HX3jbkFhmqbmKVCMezG+6ATEOlpdix3c2P55Tz+iCXZdMLV
         /TCA==
X-Forwarded-Encrypted: i=1; AJvYcCXVBL7IZsxb4/iPcWHj8CKS2nYEfTW7VpF7FidBZu9UM9PxtSivQVP/wkCI0VJNJ5fcTJ6y3IqWsyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9olYy/c259V8DCSqDnmQDyXOsXfGWXeWn6wuSMb/wv2A3tVyG
	plqM/p9zFZJv13WE7cUCIbivn8yt9XS4ddS9AnaUb4dzaWFPccS6mKXXjQKh+qokyqs=
X-Gm-Gg: ASbGncv9giBsP1VgVQQXPM/rOHRZpuDcGi6d1idJaUk3912KaHK7cHy1nIsCvlViA+c
	L7oUC8tkAscULHaMgjoBgC35RYyuPDOJ6q1wQiFeyKGT3sBBchODS75ZnOG0hxIzzDlxHkU06yL
	W0x8AqijtVRwQOTQaqU/foWazHoo5uM6i0n6iNB+8upPOUi/aqfPMkNuslumORNDwBoIi22oUaT
	xvtk8287G/xGD7nAFidvJOk8qpjfDuzJ817Hjw8c9OcNAdpvkkJBmkkK03+fyclVxB1w3dig0+u
	CYqPVpH8RibfLrIgw01Lr/7Bxwx2z2tmhl3aUbWQbC3GSuiLO866x80R8MoNZvVUNGInR+eA/ZA
	FGi4k/UQR9+exTVy2jaL1sTXRch9dokvi07K49s99yDnElSoYMnIsYOpnxAXL7AgtI3fXAbLv4o
	3phKeMdP5jGBfp9y9ijpNY7jOe5MyiZYlDh1iqzSFQr64o2Pn2hAqW
X-Google-Smtp-Source: AGHT+IGctIUBDJ4B++ZPZwfzieuoC6rE0jEla7NQRIEMiwCpYVYx+DGWozaw5tUyDHsHwHr4Gj1ARQ==
X-Received: by 2002:a05:600c:190d:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-4792af43c8amr45511535e9.35.1764807598460;
        Wed, 03 Dec 2025 16:19:58 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930d70806sm2382045e9.13.2025.12.03.16.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:19:57 -0800 (PST)
Message-ID: <65414d04-3db9-4dc2-bf1c-1e260713b818@linaro.org>
Date: Thu, 4 Dec 2025 00:19:55 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Andi Shyti <andi.shyti@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
 <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
 <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
 <577ece85-adf1-41c9-b7a4-ca65e27e6c75@oss.qualcomm.com>
 <n3w3lvw2tnqjcu74eesuo7sr7nbe5tqlufii5zsvvpwtapxd2p@6pbrr46cc26j>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <n3w3lvw2tnqjcu74eesuo7sr7nbe5tqlufii5zsvvpwtapxd2p@6pbrr46cc26j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2025 16:57, Andi Shyti wrote:
> Hi,
> 
> On Mon, Dec 01, 2025 at 06:18:51PM +0100, Konrad Dybcio wrote:
>> On 12/1/25 3:48 PM, Vijay Kumar Tumati wrote:
>>>
>>> On 12/1/2025 4:20 AM, Konrad Dybcio wrote:
>>>> On 12/1/25 7:25 AM, Hangxiang Ma wrote:
>>>>> The current value of '0xb0' that represents the offset to the status
>>>>> registers within the common registers of the CSIPHY has been changed on
>>>>> the newer SOCs and it requires generalizing the macro using a new
>>>>> variable 'common_status_offset'. This variable is initialized in the
>>>>> csiphy_init() function.
>>>> "offset" + "common_status_offset" is confusing
>>>>
>>>> Let's maybe add some platform data where we store the actual offset of
>>>> the registers in question and pass a csiphy ptr as an argument
>>>>
>>>> Konrad
>>> Hi Konrad, may be I didn't follow correctly. This is consistent with the way we maintain the other SOC specific reg offsets / data in the CSIPHY driver, in csiphy_device_regs, isn't it? I seem to think it's clearer this way for the reader to see all the offsets at one place. No? Thanks.
>>
>> I thought this driver was a little more complex.. anyway, big
>> changes that will make this prettier are coming so this works too in
>> the meantime
> 
> After this short discussion, in order to get it in, can someone
> from Qualcomm ack/r-b it?
> 
> Thanks,
> Andi

I'll pick it up per nomal.

---
bod

