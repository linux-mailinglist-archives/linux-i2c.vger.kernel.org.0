Return-Path: <linux-i2c+bounces-6471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 872AD972F8B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 414B1284698
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7006F188CC1;
	Tue, 10 Sep 2024 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BM3CD/YK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E909186E4B
	for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725961966; cv=none; b=FV8DgnIT5NpBxhFe8Wjw5KZZDjkvTAHyHR4qbqNJKkvK0RfoN0h8PAuroriUJIp2zfOexlPzAvoRdaWLplTaSUAwsfSv0NhTgQyVJT0mi+ju9kg9BWF3Am7qdhE1798x2vudQemILOv5K8SkkU5pmG5/ypi+ue6cGKDL1BHObpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725961966; c=relaxed/simple;
	bh=j4NKCK4tfvmG7e6KDzPg428c5ABg6cR6FUuX9QrByJA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dtewVCQYioqm7/0sck4uxm3VTAXQBhGxQpdcaI1muNLtZuQ445W+7AQCuPu4TcvNDqeMok86g9/NRedTLMvAUxNvrbEIbRjmq3aYNYcAl8FVKRHm/hrlJfX0FFATYNv+T1J1G77qAu65ZRm1veKbLu+u72RVfmMCrOopZKDW/IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BM3CD/YK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374c1120a32so387651f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725961963; x=1726566763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWV7f44BZF87ElCZ6bcjCdMpF39SsfwinbKIs9L/OnI=;
        b=BM3CD/YKRJV9yzt+9+9k5OGKnRQfNcvS/QF6mybc6votJJYC07ZtgwIQXHW1TyK03Z
         ZGSsum3jFhmsmZe0NwjiH4Wn1r5J8ZeLFDGfQecBcK59CU2TUrSzcyHFTPAcx5XI4YFR
         SNbBl+oi6umhX2x+w/o+xBBGLKuQl3BXrSQxUUhEQuKWVng1V7FJUpDAVMc8Ns7dmf1K
         FmBUaq8x7j/ewzvmBXrrYAo0+PUIfg9UgRj7io8WGUtzgiIcUmenarAGV+U7DhOcJ3WC
         ZfU6B+XYnWtvOFdFy7VgsZ9nM1KkU2wCEykPrZ3WGd5NORxiKHwywF8GIJaNV6rc3hNG
         IZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725961963; x=1726566763;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GWV7f44BZF87ElCZ6bcjCdMpF39SsfwinbKIs9L/OnI=;
        b=bQtmyslJh6CbiWXLXH2pmXkLwgKteOjJ1seqRZdgRDuYNGKsnPstMqzgjHSg20HsEV
         yh86pzquueWuyb2kpGFSapSaBusnd9Mscm3WR/67SHWt5Y0A8hFJ/tkFz1vG+GAXa5kn
         +382QmXUmgRqowYRVJUtxgKUw/Rvtc+ElPGr29ksVmBIX8ot7jkO8h8SXOKqiFgq5qkl
         qeiWO9L4ryz+FISqG50EnWFevCA5wDHbQqmy/M9nuMsCIvGFlfkw0KZEnGw2/RnRecU4
         zXB29DEsdFOELNxBie7OoG84FJuMYGU201Du/CKzlYaLXQ2GzmsEer0Cs7jkR2bJkxcZ
         fZUw==
X-Forwarded-Encrypted: i=1; AJvYcCX9ERwZGVFfwBdC0x4oo3NUiwmjmffeeSADM0whTLxry1BKDe1nKBxm3GgBH1baA5GvG5nNlj1HzHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweNcqXA1LZSLL7nYKIzREKgf2R84op6NE7Qkt5DrNilO6MDj4m
	hlx/TcjN15KJnae1YdN6WUsSsv64EYFHth7YlJv2v3DSNouKIjsIKXvuDSiFyPY=
X-Google-Smtp-Source: AGHT+IEcOkFGWuqfJN/l7xiWJMNPUxRQqUeqjzQ8ZQ3UP0KZlVQXoCTqcOwigy+JhoJfM3GOcGt+xA==
X-Received: by 2002:adf:ab1b:0:b0:367:96a8:d94b with SMTP id ffacd0b85a97d-378896ac4b2mr8730764f8f.57.1725961962462;
        Tue, 10 Sep 2024 02:52:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:44b1:5873:83f4:c201? ([2a01:e0a:982:cbb0:44b1:5873:83f4:c201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895665517sm8573245f8f.36.2024.09.10.02.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 02:52:41 -0700 (PDT)
Message-ID: <ed0c3d9c-82d8-47db-938c-4e60e8ebed77@linaro.org>
Date: Tue, 10 Sep 2024 11:52:40 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
 Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
 <b3a5dd54-90ba-4d75-9650-efbff12cddeb@linaro.org>
 <3bd27b6d-74b8-4f7b-b3eb-64682442bbda@quicinc.com>
 <3dddd226-c726-434e-8828-c12f76a71752@linaro.org>
 <687db538-1a41-4353-89fd-d1869d960a12@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <687db538-1a41-4353-89fd-d1869d960a12@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/09/2024 11:15, Mukesh Kumar Savaliya wrote:
> Hi Neil,
> 
> On 9/9/2024 6:34 PM, neil.armstrong@linaro.org wrote:
>> On 09/09/2024 11:18, Mukesh Kumar Savaliya wrote:
>>> Hi Neil,
>>>
>>> On 9/9/2024 2:24 PM, neil.armstrong@linaro.org wrote:
>>>> Hi,
>>>>
>>>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>>>> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
>>>>> Use  "qcom,shared-se" flag in a particular i2c instance node if the
>>>>> usecase requires i2c controller to be shared.
>>>>>
>>>>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>>>>> GPI driver to  take lock and unlock TRE there by protecting from concurrent
>>>>> access from other EE or Subsystem.
>>>>>
>>>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>>>>> Unlock TRE for the respective transfer operations.
>>>>>
>>>>> Since the GPIOs are also shared for the i2c bus between two SS, do not
>>>>> touch GPIO configuration during runtime suspend and only turn off the
>>>>> clocks. This will allow other SS to continue to transfer the data
>>>>> without any disturbance over the IO lines.
>>>>
>>>> This doesn't answer my question about what would be the behavior if one
>>>> use uses, for example, GPI DMA, and the Linux kernel FIFO mode or SE DMA ?
>>>>
>>> Shared usecase is not supported for non GSI mode (FIFO and DMA), it should be static usecase. Dynamic sharing from two clients of two subsystems is only for GSI mode. Hope this helps ?
>>
>> Sure, this is why I proposed on v1 cover letter reply to add:
> Sure, i will add in cover letter and code check combining with fifo_disable check.
>> ==============><=====================================================================
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index ee2e431601a6..a15825ea56de 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -885,7 +885,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>           else
>>                   fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>>
>> -       if (fifo_disable) {
>> +       if (gi2c->is_shared || fifo_disable) {
>   Should be ANDING logically, as we need to combine both check. Shared
>   usecase possible only for fifo_disable.

Could you elaborate on that ? GPI DMA is totally usable even if FIFO is enabled,
it's a decision took in the driver to _not_ use GPI when FIFO is enabled.

Neil

> 
>   if(gi2c->is_shared && fifo_disable) {
>>                   /* FIFO is disabled, so we can only use GPI DMA */
>>                   gi2c->gpi_mode = true;
>>                   ret = setup_gpi_dma(gi2c);
>> ==============><=====================================================================
>>
>> Thanks,
>> Neil
>>
>>>> Because it seems to "fix" only the GPI DMA shared case.
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>> ---
>>>>>   drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++++-------
>>>>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>>>> index eebb0cbb6ca4..ee2e431601a6 100644
>>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>>> @@ -1,5 +1,6 @@
>>>>>   // SPDX-License-Identifier: GPL-2.0
>>>>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>   #include <linux/acpi.h>
>>>>>   #include <linux/clk.h>
>>>>> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>>>>>       struct dma_chan *rx_c;
>>>>>       bool gpi_mode;
>>>>>       bool abort_done;
>>>>> +    bool is_shared;
>>>>>   };
>>>>>   struct geni_i2c_desc {
>>>>> @@ -602,6 +604,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>>       peripheral.clk_div = itr->clk_div;
>>>>>       peripheral.set_config = 1;
>>>>>       peripheral.multi_msg = false;
>>>>> +    peripheral.shared_se = gi2c->is_shared;
>>>>>       for (i = 0; i < num; i++) {
>>>>>           gi2c->cur = &msgs[i];
>>>>> @@ -612,6 +615,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>>           if (i < num - 1)
>>>>>               peripheral.stretch = 1;
>>>>> +        peripheral.first_msg = (i == 0);
>>>>> +        peripheral.last_msg = (i == num - 1);
>>>>>           peripheral.addr = msgs[i].addr;
>>>>>           ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>>>> @@ -631,8 +636,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>>           dma_async_issue_pending(gi2c->tx_c);
>>>>>           time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>>>>> -        if (!time_left)
>>>>> +        if (!time_left) {
>>>>> +            dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
>>>>> +                        gi2c->cur->flags, gi2c->cur->addr);
>>>>>               gi2c->err = -ETIMEDOUT;
>>>>> +        }
>>>>>           if (gi2c->err) {
>>>>>               ret = gi2c->err;
>>>>> @@ -800,6 +808,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>>>           gi2c->clk_freq_out = KHZ(100);
>>>>>       }
>>>>> +    if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>>>>> +        gi2c->is_shared = true;
>>>>> +        dev_dbg(&pdev->dev, "Shared SE Usecase\n");
>>>>> +    }
>>>>> +
>>>>>       if (has_acpi_companion(dev))
>>>>>           ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>>>>> @@ -962,14 +975,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>>>>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>>>>       disable_irq(gi2c->irq);
>>>>> -    ret = geni_se_resources_off(&gi2c->se);
>>>>> -    if (ret) {
>>>>> -        enable_irq(gi2c->irq);
>>>>> -        return ret;
>>>>> -
>>>>> +    if (gi2c->is_shared) {
>>>>> +        geni_se_clks_off(&gi2c->se);
>>>>>       } else {
>>>>> -        gi2c->suspended = 1;
>>>>> +        ret = geni_se_resources_off(&gi2c->se);
>>>>> +        if (ret) {
>>>>> +            enable_irq(gi2c->irq);
>>>>> +            return ret;
>>>>> +        }
>>>>>       }
>>>>> +    gi2c->suspended = 1;
>>>>>       clk_disable_unprepare(gi2c->core_clk);
>>>>
>>>>
>>
>>


