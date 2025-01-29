Return-Path: <linux-i2c+bounces-9228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3EA218C3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 09:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284523A5E06
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 08:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7692B19E967;
	Wed, 29 Jan 2025 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0NSwaiG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1536F19DF52
	for <linux-i2c@vger.kernel.org>; Wed, 29 Jan 2025 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138697; cv=none; b=tW1FB9YajkjGY+0TG7HJ5kpd3Vos/G4l4vfcJqsr82qa6IyMOAFClfsDVzJ45gsJ8aC2n3LOdnfXV/1sml7d24NFw86PykB6XoMZj2BF0Fq5mOJjSk+pipnP4NN4O/8YfDfXFEwXKvbmkD+mTC6nbxw6A2L9BZGK6pOKLVxqchM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138697; c=relaxed/simple;
	bh=JAUNlRo/49aOPcWPPmQpBteXZiQc8sauVnFcdeZIqog=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dUYvyYn4cwUdfF2mjB8BCCqhoNGAX2cUqHGN0ht76mdnbnvb5Qzdn8ZyXrZSeM+G1EXd00ufTBdYaE0NTshrA6to5RnZVp7NhSbo4hAPeZEoXrCGw764Hsn4JXAfdX6czSncgkXVo4+wTJfyua8JKVChfLz6cFsGFUbQkxpIZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0NSwaiG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43747505e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jan 2025 00:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738138693; x=1738743493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfneqZ09fpE7vuU9dC3md/9SEzPK5RAQz2WAVJr2eMU=;
        b=t0NSwaiGBbkk9TMjRk2eDPhUUXByvScjHp1LmpbZ/+clIh4dwjS/+rNnypBv3oMbFr
         3ocUz52NjeBz9uMCjf53WSg1PUgRQYdRgM0IqKPHW71pShCdQU1jJgrIZG8kIfbq39Ua
         QeEAMhVg06DhqYDX+ZtkssgfwdEzH/REESKmFzmKs1HWDYGZFZ4sjzxXZ5ovhoVtTXso
         V4iSLVjHwvfuv2v5z4Cqn1MJtfem24rrb7bqohmakKpvbQ+TrI4ybUNZcuquOPI0geye
         uM4ZJ/khlzmH9H5daMoly0S6H/Dq0Gd89g7tTYfFS1k5TmXPsKlofsf4+o50qtIOSphe
         7q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138693; x=1738743493;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gfneqZ09fpE7vuU9dC3md/9SEzPK5RAQz2WAVJr2eMU=;
        b=CcFvLBBCKJ+Ceqn2s4CG7mUDUBu4kDcTXPauT3BWzhJbF1r1P7K9HC2+A6TMRs1+J7
         /RsmT2HJ+2kRRcDGmMFHXw77dra6I7SAJf2jzYQW2G/0q0jEzvESElmbXZASCT768cGA
         cbQ2AjTZFGmOFjfw1nuW6VlbsmR2K0KckclUVyXaabN8zNwITW1bfietC8FAWGU1EHjv
         ypxkW9NaVeAPf/rBuPpf55ElCXzGDRFuMivUXmY6hNtxWwGWFYAfh0K4nz31Ej4tUDXo
         0nRQAaXu1bwuNSw9I9bX260PQcmXo041f8NgoVPLlw++3KLbC8aPKoCe7C6G4gNJQ3SS
         DaXg==
X-Forwarded-Encrypted: i=1; AJvYcCWRGwW2BYiA3C3fI/v+EKwZTYth9VIpLLKnxF5nDIHsV68nOTdjDVXALR+nTw/drP4ebiwnHoLWcpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjY46vs/7tbRkWBvTUoB1VsU0geOaLUFr7SCcnVklxXoZrsWEF
	LHrvAFwJ6xMBaiartSWnifYnt2GPAx2YXkMVvGL0xS44sqRGAGEiQST8/x+wzsQ=
X-Gm-Gg: ASbGncuiRZBqioB0GHPiOfg8SAscI7wxsC6KJVCBeLRGopfMXoeGbjzGEh0V10B1ZtG
	lReoWfFsSFohy7HcWHlL/9X6236NdCZbSPWSDWwdKjp9BrvIEBMYoPux8nBkas1hRIDXUkR5izT
	Mh1Z8SKBzqpnh+2sNG70CMGjF6sK4CwKpQxP+S/aqwdLj5PN4P7N/tlsMpIgL9lqJBbEd/EKEwx
	k3SouTpmouXRTSppd8gcN9OGlVd9sDeh+Q8VTMRD9cukPaaHKQzhpP40wGrH28JYogcu2NkjEwt
	Q/ikFIjXQEWYaidv8+5+pyIzuzGqZpoHhu5IsuoptkXlLqoNHWQEKnrZxZx/7+bfLdS3S0pZ61z
	yXE4=
X-Google-Smtp-Source: AGHT+IF2ZgZ7S5jEnCwwf7DK2bDt4i+WxxExFODfv5xGl9BUdplPY6RYFBHupc2L2FOHMIGp5IWFWA==
X-Received: by 2002:a05:600c:348e:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-438dc3cbb7cmr17147705e9.14.1738138692889;
        Wed, 29 Jan 2025 00:18:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc11d2asm13945465e9.7.2025.01.29.00.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:18:12 -0800 (PST)
Message-ID: <5f710113-08b0-468e-940a-2c65e8b42486@linaro.org>
Date: Wed, 29 Jan 2025 09:18:11 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
 andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
 dianders@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, quic_msavaliy@quicinc.com,
 quic_anupkulk@quicinc.com
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-5-quic_vdadhani@quicinc.com>
 <10060d39-87a4-4565-a2a6-80c93ac2266a@kernel.org>
 <dudqd2y42wy6iq2k73aphd5ol4mtq7z4c54zhd27rl745rrw5x@p3oummf2jke7>
 <374e16d6-46aa-4bdf-85e9-bc2e33c38057@kernel.org>
 <v5n7wn3saiymi2ncgi35drzdjfeaa4ng2ftia6ggex6oh74ocg@7vuskxosh726>
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
In-Reply-To: <v5n7wn3saiymi2ncgi35drzdjfeaa4ng2ftia6ggex6oh74ocg@7vuskxosh726>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2025 03:21, Dmitry Baryshkov wrote:
> On Mon, Jan 27, 2025 at 05:24:21PM +0100, Krzysztof Kozlowski wrote:
>> On 27/01/2025 15:27, Dmitry Baryshkov wrote:
>>> On Mon, Jan 27, 2025 at 08:02:12AM +0100, Krzysztof Kozlowski wrote:
>>>> On 24/01/2025 11:53, Viken Dadhaniya wrote:
>>>>> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
>>>>> developers from modifying the transfer mode from the APPS side.
>>>>>
>>>>> Document the 'qcom,xfer-mode' properties to select the data transfer mode,
>>>>> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
>>>>>
>>>>> UART controller can operate in one of two modes based on the
>>>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>>>>
>>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>>> ---
>>>>>
>>>>> v1 -> v2:
>>>>>
>>>>> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>>>>>    qup common driver.
>>>>> - Update commit log.
>>>>>
>>>>> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
>>>>> ---
>>>>> ---
>>>>>   .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml | 8 ++++++++
>>>>>   1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>> index dd33794b3534..383773b32e47 100644
>>>>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>> @@ -56,6 +56,13 @@ properties:
>>>>>     reg:
>>>>>       maxItems: 1
>>>>>   
>>>>> +  qcom,xfer-mode:
>>>>> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
>>>>> +      The default mode is FIFO.
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    enum: [1, 3]
>>>>> +
>>>>> +
>>>>
>>>> Just one blank line, but anyway, this property should not be in three
>>>> places. Do you really expect that each of serial engines within one
>>>> GeniQUP will be configured differently by TZ?
>>>
>>> Yes, each SE is configured separately and it's quite frequent when
>>> different SEs have different DMA configuration.
>>
>> Well, I checked at sm8550 and sm8650 and each pair of SE - which shares
>> resources - has the same DMAs, so I would not call it frequent. Care to
>> bring an example where same serial engines have different DMAs and
>> different TZ? We do not talk about single QUP.
> 
> Well, I don't have access to the latest sm8550 / sm8650 devcfg sources.
> I checked the RB5 ones. As far as I understand out of 14 enabled SEs
> only two are configured for the GSI DMA, others should use FIFO / SE
> DMA. Same applies to the SM8250 MTP devices. Checking the RB1 / RB2
> setup also shows 3 out of 6 SEs being set for GSI.

I think selecting GSI DMA is only for devices needs high speed streaming to the
device, like the touch screen, using GSI DMA for random small access is a non-sense.

But the thing is, in the TZ world the configuration was static so we had no choice
of using GSI DMA when configured, but now we have the choice so we could totally
reconfigure the SE with the transfer type (FIFO, SE DMA or GSI DMA) as runtime and
drop this attribute.

So instead of hardcoding this, add a way to dynamically select either of the 3
transfer types when firmware can be loaded from HLOS.

Neil

> 
>>
>> Anyway, if you need property per node, this has to be shared schema.
>>
>> Best regards,
>> Krzysztof
> 


