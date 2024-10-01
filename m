Return-Path: <linux-i2c+bounces-7132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D798B8AF
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 11:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FE001F249CB
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 09:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF8A19F110;
	Tue,  1 Oct 2024 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+gJ8Mft"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80C2BAF1
	for <linux-i2c@vger.kernel.org>; Tue,  1 Oct 2024 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727776445; cv=none; b=BYfSu/NDiM2e9ystsCFd784ICp+W5ezt1Zqukmvy31Nx1dnZUo8Nctv3NFecFJYn6Trurn6vDkbNWwkMAW8naH8vn39lJLGZ9fOxT6hm/Yp6gsFLRRfPUjBVNd2MM+TEEhzcvVAc6+MYwYLgUK04jOY+Fnxiolb/tku2Z1j+s1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727776445; c=relaxed/simple;
	bh=qhTAdx4eIfmHPAR3JH2WGt41RjDWDL1ZRiRjkJ5GAZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcB8MBI8W7xT4UkEi4QVjrf5ud9DfnljWffKJtvS/LkhXhzOf8oaMFkXl0XSVDlot4DT5Ic0xRZfaMa2BwAkiZuiZdyZFfdl27V3mV3dzqgcQ1WhGykZU7DEkGpssK25OUCqIZxZ+6aS3LcN3kKwmmRiMoPqC/t9s63uw4NylMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+gJ8Mft; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so881883266b.0
        for <linux-i2c@vger.kernel.org>; Tue, 01 Oct 2024 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727776443; x=1728381243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9E+Kp5/p2D43RyigGsyne2CVkFVSUbJjEtYYyU4Uws=;
        b=A+gJ8Mftbq4UnahpJmWJ2xovi2jBbrNYH+1a1GN7vI+EPWpg4KY597uF8s+toJ3VdU
         4Zt76o2SLAfy+VebyxRxAy1Z0dgja00fXB65H3L+FPvEdbV7fKVw0zS1Nk6V3WR4cVkE
         XTHrx3cdcRV352fVGcOysTx3DWrgyKy8MMb83dJNid6C8ds3fzeB8kee+Iun8jIIy7fO
         XYptaUgjdtRRRUAyHznx2JAbyWkacfIGeiaMFWbtFmQagFyjQbr12OfBp/YNB0f2ZN+t
         ljyDbstyHuY7YejdEu9VILGHr7AAxi42gFFMeHo2Wu9pCfDLlXX3jyZZXsb891G1Ajyv
         oSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776443; x=1728381243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9E+Kp5/p2D43RyigGsyne2CVkFVSUbJjEtYYyU4Uws=;
        b=oe1qQkYtleEvBBDzF7lWry/3yKMePWtGD7M+K/eFFYzP8hCrUl4Sn455srFksW2ozx
         Y5LVQIfpXL85RuGGJHoxeSfb+ADz7iSobWgEXo61kCK2yaB+e5RnP4Y5a7SPOmQ3+UH9
         FOn+Y1yS35S8Xup1Lff5FbtyieGD6k8MB5VJW4BpE130H54EdanNuSmN3lIe2FdDjZND
         Bx47046IMUZ6NmZOVSmTU4ybRHar4+uGpnUAwSIFs9BiL7URl8l3ok8ZLnCMjx3byU5s
         X4Zng4RwHoyOyTyYAGvpGK+w/23cMN3Wz9yFDMz/E8uXOmEu4C98HOrFH+TxEhAxoMLU
         tuww==
X-Forwarded-Encrypted: i=1; AJvYcCUMmeR5XVNfCA3Y3FHHdQl9jwpYwbVEA9oez+st/Hca8dwFgH2clyvBSgVfsYbi/LGTw6yXHXTmrTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8aLJSzDscuLch/9HcPaVU4eNQvlfQpn5zCtm/D9HidwqozL1w
	8sOn+0z5gQaxwSa5QJEEJYwqHSRsUFcyToVcx3RbhfG5AnxckvG2V8ibvHRvyXA=
X-Google-Smtp-Source: AGHT+IGjZV6E3B3GeLat9/PcfgjscVGr8XQ2l9Aj+Dgjg7W1W7CTfRYCXSZBLsPLOku4DnNH4zCBQw==
X-Received: by 2002:a17:907:9284:b0:a90:c411:24e0 with SMTP id a640c23a62f3a-a93c4916d9amr1830582066b.23.1727776442590;
        Tue, 01 Oct 2024 02:54:02 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27770b4sm675459366b.42.2024.10.01.02.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 02:54:02 -0700 (PDT)
Message-ID: <652b3b74-65d0-479c-a863-7e8f32be7fc9@linaro.org>
Date: Tue, 1 Oct 2024 10:54:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241001023520.547271-9-mailingradian@gmail.com>
 <20241001023520.547271-13-mailingradian@gmail.com>
 <aleot5kegf5xvlvzmws6tmxcqxw3gnmxndclkb7rdzcxnmehel@varsfzbmiszm>
 <306b0806-70c5-4dfb-b7e3-5614a20699d2@linaro.org>
 <094a889a-497d-4569-9798-04918cea63e7@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <094a889a-497d-4569-9798-04918cea63e7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2024 10:47, Krzysztof Kozlowski wrote:
>> These are appearing in address order, which is preferred over reg-name
>> ordering AFAIU.
> First time I hear about such rule. Where is this ordering preference
> documented? We always ask to keep the same order in each file.

Eh evidently just my impression because we sort nodes by address.

Yes, definitely agree both the regs and interrupts should be sorted the 
same way, its inconsistent to have one set sorted by address but the 
other sorted by name.

---
bod

