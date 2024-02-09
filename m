Return-Path: <linux-i2c+bounces-1679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F984F7BE
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 15:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B08B21C23377
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 14:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8E36BB2F;
	Fri,  9 Feb 2024 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZP+vmwU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BF544C83
	for <linux-i2c@vger.kernel.org>; Fri,  9 Feb 2024 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707489711; cv=none; b=S8TH8lwpcWYEw1dggsxf4nTQsTTv4odHd3a8D6IwWSIy61xEr7nxan3xFwwnVZjhtc6uATgRMdIXU8JhtUfQKH3cIaYG2foVByB5rDDgJFPTifu5NamJ3Qcwdgq/oZBppWDBDNiP3NNGvRvqoD9b4vazkcx0e7cDpWzc0XvW9BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707489711; c=relaxed/simple;
	bh=O3fPupjybPNP/dAIj6BFB3nob2bLvZX2H43dvr8aJ7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rdi3xKrOsuSlZBV1kIdDgUcC7Hz7o3eMsieTLbfAgYdC8byZMe0vZBkrY/0q5ZeSog3a9fHfo7X/d28k0ifMU+YH2AAf6yhCoryeTsolKXz0pSW2glG0AndZSqZ3EyMrx0DdUSK1/YlYL8uKLkcEBNcR7KbaUHBC1+FpUZbZzQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZP+vmwU; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3c00c98d32so64285466b.3
        for <linux-i2c@vger.kernel.org>; Fri, 09 Feb 2024 06:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707489707; x=1708094507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sHcakeR8gPCEeI7V8ObSzY3NEW4IWCujMtndFKNvu38=;
        b=PZP+vmwUkhlIFZxJlGrnn4bnIvEUblcfumX2OVdD8j4SR07btrcQzatqBkz4aToFZF
         v8CVTxb08j7VRoTpHb6LxNv8I4TsAPIj1rUjwbg8yUVO7RkhuqweVhodLNu5LFZ/6mS8
         IhCt53XXzlhf2RbcqnkEEacFrGz3nKojtwYR8EePfH7KJEYdkAVbT9Fou1cUuWcCn3Tc
         Iv8rYbeOlJRp8QhY+dZcIBtGYjNMnlwqUWQy5SJnhCD31iL7d8iJblE1puiBjUNHWd9D
         GL9wQMO9XSQDMTInlQ9/FU+ndGJslGz+VQLvp/P8Ybiuc6NoiQYDVEtIw6rjHOFWtX8T
         73ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707489707; x=1708094507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHcakeR8gPCEeI7V8ObSzY3NEW4IWCujMtndFKNvu38=;
        b=KdmhXcZCFK5xqqk+1WdOwYkHkOwOjZXuyI2m0ynYAUJx4+t5aYqU+mnijsOXKfgwtR
         spWYsK+sUstPgwy5qVkMq4kzMRy82qPSeV1Js/CQuuwdYbGvOdk024WXag3hXshHPAYx
         49QpMn61yJVDFbPy94sE8dq0GZvZvRH+XPnzoj72KaMyKmCVLndSnCMJSlZjII9ULN1G
         e1hrqWCgVzHeGIKY2glYEyt4fKF4B/8hMdHoDuMu6j6pr2xfIIO+9YUPvvA4Nz7+Qc8c
         z+ExB7vMM/Y8kZSoK1ahnASeidKrpHGarFa7GVFE6lFf9crfufkLvS/EEAomGouY6G8c
         IXaw==
X-Gm-Message-State: AOJu0Yz9+DUsDkhU5vM8EIOYOlOS4y5GdpK/4pjG+V4JtpYe5Je8ahWw
	UxdVgFyz1Lsn9xY5Bb8NMirF5rFE9yDYf3d3fsYZf+nTjrhtrHRoguvXVBPnhwk=
X-Google-Smtp-Source: AGHT+IFPSqvMuQ7qRahNz276ExL9mkaHwlnaG19hlPXL0sWl9KvvkSgcsTGOPjwNhiOcDbbFCba3ZQ==
X-Received: by 2002:a17:906:fa14:b0:a3b:ea1e:c395 with SMTP id lo20-20020a170906fa1400b00a3bea1ec395mr1215338ejb.28.1707489707353;
        Fri, 09 Feb 2024 06:41:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/JYp/TUOFfArAHs9PgPg3ZetUV3f8hxfFPsKUwP/60xcfd5NQoc9u0sZq+2USXNgXmpA5X/AtCHcSoKyN2a1Ql92xg1/XFmkm+OIYTklYuHZmdRxL0BAah9qJdFnBPsTzAK6NagPzY7mN+jFCsm4rv/mU5kUZFwVxTCiyC1f43/faHtLQ4C/KJXsEO6SgXfrivgi84qJJb9oiyTZU1mvFcZL6AUPK9HU8wndvpBn6vJ7KYjQZLhHY73mstEnBI1/xohoiYEvudhJVq+7iwDB8DSLXP7wAfZXLK4lXWdYO0idIBSQ7rK7RPiw570KbS+7NImLKIJSdSjJ5UskJyE3z3gAK+RU+VG2NxAjIOnTNUtAjTgAkYwJmRJCjxvNjiy1IbASHsltaMYQ++fUwmzo0+scsksaPoporqnAEaJ9sbRzEng/B5DY54zKdzBJSMwD0gdLfVnVtkAE=
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906521300b00a3bb098ffcbsm827300ejm.89.2024.02.09.06.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 06:41:46 -0800 (PST)
Message-ID: <aa7a28a7-59c6-4783-a6de-9a46721a8bf6@linaro.org>
Date: Fri, 9 Feb 2024 15:41:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
To: Andi Shyti <andi.shyti@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, quic_bjorande@quicinc.com,
 manivannan.sadhasivam@linaro.org, bryan.odonoghue@linaro.org,
 quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
 <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
 <60b5e755-352b-476d-8c6e-2170594ae80d@quicinc.com>
 <uswznu3h53gcefpdc4vxozz32ecdcjvzmr7admwc4h54o27bfy@qqoevrl3dcyt>
 <CAA8EJpqzdp4xYSp+JCExP+Oeu9KhLpsXNUbDxfZ0g+C07xR6dg@mail.gmail.com>
 <cvzyvgb6vahlmrhaijsuyaosdl2p4q5cxhipmu4tujnkpjlbpm@6yu3sbpqha4m>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <cvzyvgb6vahlmrhaijsuyaosdl2p4q5cxhipmu4tujnkpjlbpm@6yu3sbpqha4m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8.02.2024 12:59, Andi Shyti wrote:
> Hi Dmitry,
> 
> On Thu, Feb 08, 2024 at 01:04:14PM +0200, Dmitry Baryshkov wrote:
>> On Thu, 8 Feb 2024 at 12:02, Andi Shyti <andi.shyti@kernel.org> wrote:
>>>
>>> Hi Viken, Dmitry,
>>>
>>> On Fri, Feb 02, 2024 at 04:13:06PM +0530, Viken Dadhaniya wrote:
>>>>
>>>> On 2/1/2024 5:24 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>>>>>>
>>>>>> For i2c read operation in GSI mode, we are getting timeout
>>>>>> due to malformed TRE basically incorrect TRE sequence
>>>>>> in gpi(drivers/dma/qcom/gpi.c) driver.
>>>>>>
>>>>>> TRE stands for Transfer Ring Element - which is basically an element with
>>>>>> size of 4 words. It contains all information like slave address,
>>>>>> clk divider, dma address value data size etc).
>>>>>>
>>>>>> Mainly we have 3 TREs(Config, GO and DMA tre).
>>>>>> - CONFIG TRE : consists of internal register configuration which is
>>>>>>                 required before start of the transfer.
>>>>>> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
>>>>>> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>>>>>>                 of the transfer.
>>>>>>
>>>>>> Driver calls GPI driver API to config each TRE depending on the protocol.
>>>>>> If we see GPI driver, for RX operation we are configuring DMA tre and
>>>>>> for TX operation we are configuring GO tre.
>>>>>>
>>>>>> For read operation tre sequence will be as below which is not aligned
>>>>>> to hardware programming guide.
>>>>>>
>>>>>> - CONFIG tre
>>>>>> - DMA tre
>>>>>> - GO tre
>>>>>>
>>>>>> As per Qualcomm's internal Hardware Programming Guide, we should configure
>>>>>> TREs in below sequence for any RX only transfer.
>>>>>>
>>>>>> - CONFIG tre
>>>>>> - GO tre
>>>>>> - DMA tre
>>>>>>
>>>>>> In summary, for RX only transfers, we are reordering DMA and GO TREs.
>>>>>> Tested covering i2c read/write transfer on QCM6490 RB3 board.
>>>>>
>>>>> This hasn't improved. You must describe what is the connection between
>>>>> TRE types and the geni_i2c_gpi calls.
>>>>> It is not obvious until somebody looks into the GPI DMA driver.
>>>>>
>>>>> Another point, for some reason you are still using just the patch
>>>>> version in email subject. Please fix your setup so that the email
>>>>> subject also includes the `[PATCH` part in the subject, which is there
>>>>> by default.
>>>>> Hint: git format-patch -1 -v4 will do that for you without a need to
>>>>> correct anything afterwards.
>>>>>
>>>>
>>>> At high level, let me explain the I2C to GPI driver flow in general.
>>>>
>>>> I2C driver calls GPI driver exposed functions which will prepare all the
>>>> TREs as per programming guide and
>>>> queues to the GPI DMA engine for execution. Upon completion of the Transfer,
>>>> GPI DMA engine will generate an
>>>> interrupt which will be handled inside the GPIO driver. Then GPI driver will
>>>> call DMA framework registered callback by i2c.
>>>> Upon receiving this callback, i2c driver marks the transfer completion.
>>>
>>> Any news about this? Dmitry do you still have concerns? We can
>>> add this last description in the commit log, as well, if needed.
>>
>> I was looking for pretty simple addition to the commit message, that
>> links existing commit message to the actual source code change: that
>> geni_i2c_gpi(I2C_WRITE) results in the GO TRE and
>> geni_i2c_gpi(I2C_READ) generates DMA TRE. But I haven't seen anything
>> sensible up to now. So far we have a nice description of required
>> programming sequence in terms of CONFIG, GO, DMA TREs and then source
>> code change that seems completely unrelated to the commit message,
>> unless one actually goes deep into the corresponding GPI DMA driver.
> 
> Agree. I can't take this patch until the commit message has a
> proper description and until Dmitry doesn't have any concerns
> pending.

And please, please, include the word PATCH in the square brackets in
the subject, it's landing in the wrong email folders for a number of
folks..

Konrad

