Return-Path: <linux-i2c+bounces-5914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDDB9640AD
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E06F81C21F86
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AC018DF8C;
	Thu, 29 Aug 2024 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOTOS+/L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA618C93E
	for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925389; cv=none; b=FEziv/SgLFkDg6dgu2PYjGWU6KSvj5182eKX0pTOhcfjZMa+EKUKaMob0Xly8/t5qx4v8s9pioVdmar1RyiPoPBxhu5Qzz4PN/GDQ5YqInak1gPMVjuJYKg+Z9PSCdwxfaAApg1Fr4nNtQOeSxVxfLGOoWDEK5Lckya94Fvjskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925389; c=relaxed/simple;
	bh=z/jroExPu4YiG7hYt2JF3nZu8rG4QlkWnpSlweE7RM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIY6W+uUR6suGUoWyyoMIiHkSfnRZJHCDOp3SAUKV04euYN7b8OHWiUU1Bq+1LpgwsfCJqwHXXsWIXXX+v5gBtBio1TcqnwJl1b7cxFnux8IB9KJS3EbNwt9lsy53vcNzo20VvH5Hw9ACxgkMHpQsAJ9mbAQqWazxnZWe5tuDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GOTOS+/L; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c0ba23a5abso425284a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724925386; x=1725530186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPwwTaDN9yKO85WUsV52EH69A6ZWar7hV1r+9P2rJyw=;
        b=GOTOS+/Ljok9CZ6LFWNbEH4QxDpf9oYkkbonGFy7WXqSQ6C9O1UQlZ35q00OqqOKFL
         Fo/5bj5LUUlMbCCtjH/TuXpxFBPNsqyZ47xB40tzoeKeQkbwvCxBtgQM+j7ZrZrdTcp7
         ZYkR1XnVY3PhGlJbPixsWV5kbSxV9PnR+uNUTrhrFdM249I0TWywr0ezEo3QjbchzipU
         y44Gp1eHsk2no1so/6YFwvmoOvF5HGTBI0s4C2n65SUVTZoBLu3pSyfJ9FnjEGS29McM
         a/LqXvNpmmpXV3EKcwT8uKTQAPOswUAbHHJt0qJrwdOm6aRg8ArODVk+Vd+8H/wo9MGB
         +Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925386; x=1725530186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPwwTaDN9yKO85WUsV52EH69A6ZWar7hV1r+9P2rJyw=;
        b=DKGZWkH64zY0uDuJibQjgwA9fDWoINJ2liFsrDp7MUXzBDah8LMa/5sg2dEIDaY2hC
         Qw6wNwo2rCNW1tPmOTwkqoNSSiUf2jQptkXB81lpunvWxfrHZFtrzvx8cTd2LjEgfDb0
         ppkGBcB8oo6wE5a5ru8G7LMyUmlYATlyQW6jjGkQ5hmyMI4sxb3YvHfLbypyYWmhzWV9
         r4ZsTCLHMpKSqDJ4a9ZsHKMAoN/np57Cot3bQnzhBTN64TONjzbYqlciXxE/KO1R4EJZ
         8Zl8D70jQkPvadQbTCPQHIrgZ9/7jtnA7QhcJz32uCJwAUOsnfcjnlCJ5DUWe9YmmFRW
         dMiA==
X-Forwarded-Encrypted: i=1; AJvYcCUng1muLUJzp9Mh4EDzjiKoa0pIAnY+25kngN8EED7+OuzBMmrk4vWj3Dyfa5ARNHl6kYv5RMJ6PJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVrPWkxD7uAktDRj9+I7qy994XyE/yy4novmqjjUFx3JSiqWf
	wEP94TubHfOt+dSZjPweXypQ3/C7iXrP6IZMOSgu9eF85keWpgq81eSLym+LxYI=
X-Google-Smtp-Source: AGHT+IGr0oeGiZdteJWxwu1jGClZTGeR0UcOOGLomISMDiee6bl0lKq9+ap6M1FyMmpePXIzgF709w==
X-Received: by 2002:a17:907:2cc3:b0:a77:dde0:d669 with SMTP id a640c23a62f3a-a897fa6bb24mr167808066b.45.1724925386185;
        Thu, 29 Aug 2024 02:56:26 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d698bsm58087766b.145.2024.08.29.02.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 02:56:25 -0700 (PDT)
Message-ID: <9eed39f3-baf3-41cb-bd19-361d76207b09@linaro.org>
Date: Thu, 29 Aug 2024 10:56:24 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
> This Series adds support to share QUP based I2C SE between subsystems.
> Each subsystem should have its own GPII which interacts between SE and
> GSI DMA HW engine.

What is SE ?

GPII - general purpose interrupt ... ?

You have too many acronyms here, which makes reading and understanding 
your cover letter a bit hard.

Please define at least the term SE in your cover letter and in your patch.

In the patch you use the term TRE which without diving into the code I 
vaguely remember is a register..

- GPII
- GSI
- SE
- TRE

Need to be defined to make what's going on in this series more "grokable".

A cover letter should assume a reviewer is familiar with the basics of a 
system - no need to define what I2C is but, similarly shouldn't assume a 
reviewer is numerate in the taxonomy of vendor specific architecture 
e.g. whats SE ?

---
bod

