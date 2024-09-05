Return-Path: <linux-i2c+bounces-6251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B496DB9D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 16:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D410A1F27689
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 14:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB371990AB;
	Thu,  5 Sep 2024 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3SxArMm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7792C19CD11
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545955; cv=none; b=VyTVAq50PfJTywpYGb83d606/KxdAQfhwOWwmYBkxfHdpaILD4fzHUbrMu3kwfxTwq665QW/ZvfAHXxiIG7waUSIwOycLc5tvy18tEDoJTQAIcvML1MA1+VI6MnLK1Y9BXQrZkhWpob6wnIUVzC1w742bWiGRyyxbYwaaiP2Sno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545955; c=relaxed/simple;
	bh=Ud4dErg7kUeYKM8I36u+Hb2zRUhNAByigclHGaJbarY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A2RwQaN+Wmlw+ZwImR47iZzON2lfkVCtMAQhT3u5DAtJ8CwIBt5mtGr1q/uyDlUUXYxCFx53ZTkgVy2FmhCPMY+GobJIBXuJrFeyCuGplrcIejB4tT+rmOwQ37ETecVtMek4Mh2JWt+SeqdNDnaHQ3TAsFdUE7nMLYoXSP5uIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3SxArMm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53654d716d1so62377e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2024 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725545952; x=1726150752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxVu4PuIdpnH7Y7EIddXVWOHJTc9XnXktin7tU2lfUQ=;
        b=P3SxArMme93WQe45oq9WkqXOTjPrEVZUjRW9KqinfqRUUxpPSG6PyJDtB4k4rZXj3C
         rzEOFCqCWZxCkE1vDqoups+YnUBACL10HNC1aE+nsxjawm/6HWkN6Jc7KcgejyltnF9N
         sVvnxiCbAf2+Ml5aaDtTkM5x7tR5OpEXwRBEtVmEdFSDbZgOykMU4e2+kcUyqd7iDUn5
         nFs132uVuDE2nvuz0M+PlD/KD6hgIpXoOO26JZL59Az0pQBXqLmELpgImH6kUov4JYgu
         t97qUCCHxtkmKLiAdJLkSSJSK79qu072ryH49daAWMiITrxqCmAQFrU4ukouFkfFSEI5
         eAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545952; x=1726150752;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxVu4PuIdpnH7Y7EIddXVWOHJTc9XnXktin7tU2lfUQ=;
        b=h6GEEF3nv3R5iM3BuiP7vu5mzaYj5DWD1AL3wFWElvE8NX6bsqAmT1SEsL1uWr3cOf
         Ivsz0HR75rRs3JHKJ1Ds6DaPLmuXefYOGOFoNQBx0Zp4VnA8/0VkHw7mVbgjUzpwAmQp
         C3lTfdfYp85Pe3GLOesznLObRvL/17h8HkqmhXKqnvJmLVLBPTQSryi81vXnS5wStU4E
         4/w8MaF0jgBgTHxxtU7OUdhqZ+b+y6H4nOlcTovUpWa+IeoNBORfv1DCBYMAXfRg728L
         W6+u4G6wCy/MzN74/lkxQm2C5SguMCCykfmsy2zLwnuJjTDBVZJ3LvcPIz5XjEhW35XJ
         oFig==
X-Forwarded-Encrypted: i=1; AJvYcCV+mC/QD/Up7qQZtYYymittGecBjcw/HZ9J03goRcBw2UiHlZS8vRz7+0CSGpzrUUlQ/778YuKWhC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/e5FO0Sh3XFnA5XcvFJM2084E7tAEQ447ES4+/sJP9H7+gfA
	of0+dlL6vPQDtkM3zMZ0Uaqmm377vSzN+is0tO79ZQjRp0/wR099xwVtgoVdCgo=
X-Google-Smtp-Source: AGHT+IEPzvSfGbGRlHZcDR7zpj9bpmHt/0UXxWTZxE7FgbeOOJdYj80lQwxR//F8qBJ5xma5kh03fw==
X-Received: by 2002:a05:6512:33c5:b0:52e:9daa:25f4 with SMTP id 2adb3069b0e04-53546aeaadbmr8347316e87.2.1725545951494;
        Thu, 05 Sep 2024 07:19:11 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5356a28c01csm356135e87.271.2024.09.05.07.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 07:19:11 -0700 (PDT)
Message-ID: <c494152d-d4d1-45db-941a-df99b0f11e77@linaro.org>
Date: Thu, 5 Sep 2024 17:18:50 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] i2c: qcom-cci: Stop complaining about DT set clock
 rate
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-12-mailingradian@gmail.com>
 <917917cc-3e78-4ab6-8fa4-82d9a6fe3fdd@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <917917cc-3e78-4ab6-8fa4-82d9a6fe3fdd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad,

On 9/5/24 16:57, Konrad Dybcio wrote:
> On 4.09.2024 4:04 AM, Richard Acayan wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> It is common practice in the downstream and upstream CCI dt to set CCI
>> clock rates to 19.2 MHz. It appears to be fairly common for initial code to
>> set the CCI clock rate to 37.5 MHz.
>>
>> Applying the widely used CCI clock rates from downstream ought not to cause
>> warning messages in the upstream kernel where our general policy is to
>> usually copy downstream hardware clock rates across the range of Qualcomm
>> drivers.
>>
>> Drop the warning it is pervasive across CAMSS users but doesn't add any
>> information or warrant any changes to the DT to align the DT clock rate to
>> the bootloader clock rate.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Link: https://lore.kernel.org/linux-arm-msm/20240824115900.40702-1-bryan.odonoghue@linaro.org
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
> 
> I.. am not sure this is really a problem? On some platforms the core
> clock is only 19.2 Mhz, but e.g. on sdm845 we have:
> 
> static const struct freq_tbl ftbl_cam_cc_cci_clk_src[] = {
>          F(19200000, P_BI_TCXO, 1, 0, 0),
>          F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
>          F(50000000, P_CAM_CC_PLL0_OUT_EVEN, 12, 0, 0),
>          F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
>          { }
> };
> 
> Shouldn't this be somehow dynamically calculated?
> 

I believe the problem fixed by the change is an unnecessary dev_warn(), in
addition it's unclear why the CCI clock rate shall be strictly 37500000 for
all "CCI v2" platforms.

If the latter is a necessity, then it would be better to set the rate
explicitly, however since it's not done for any such platforms, I would say
that it is not needed.

And if it is not needed, or a default and universal 19.2MHz rate is good
enough, then I would suggest to remove everything 'cci_clk_rate' related
from the driver, and this makes the change incomplete...

--
Best wishes,
Vladimir

