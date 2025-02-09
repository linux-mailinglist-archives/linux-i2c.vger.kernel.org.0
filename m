Return-Path: <linux-i2c+bounces-9355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893EA2DC28
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 11:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823D23A6EAD
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 10:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F091B0424;
	Sun,  9 Feb 2025 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TX8kVoaF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9F18871F;
	Sun,  9 Feb 2025 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739096375; cv=none; b=MQweVYmw5vnkzCaAFQmlEHqrlPzXZA1TXALnNDeeO1XwMmXbx2H7lyPULz9btmbDKd+DRv5w+UtAjsiJSbAN2CqsVmbqhv+T5ptFh1Tch8TVi7ugtucOa0DUznHnOyvYPPNKcLf93ASi/jXhqwF5wqWcW5hjpZrc6IMPqTOKpZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739096375; c=relaxed/simple;
	bh=UohZtJxXrZjyWBOMewDHu9Mq6/KbWKNEaqqmMlqIJr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=So09p5ioTqi+nyi5AZeT02EoO8iCEAsk3557WKj9NyvVAVwXsO1/DHDKMgMbd3Fi73EMGhS77ZJ2UsmUl9/2WxLgw+BRCsGylzbdmrljTJkOWFh4kAUG1HRdG9c+hOzaFazn/i511k5gDq8YOANJEJuLNtlD0djHDAzuBc1/raM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TX8kVoaF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD542C4CEE6;
	Sun,  9 Feb 2025 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739096375;
	bh=UohZtJxXrZjyWBOMewDHu9Mq6/KbWKNEaqqmMlqIJr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TX8kVoaF98bM1P9Fs9X1NnMeCgEqgQrXrQbWMXeUrkgn0OJHcL0wczEf4qpeXNy45
	 Fqp3xa8doAr3bna8kLs2du9EBvAvAIUgt7cJ/xMhj5MB4fHPlltk6V1WTCePCXmrIg
	 r7GCtVTbTNXkQIoqpjtUG4YJrrP+i5SUvEcg0TRHsOt9PPUt0NTDeR778zGLmy46Pz
	 HN2KjFhWFqBqKnZVNVW6XJseIkvadYbqJTu/S8jd5E9rWl2InTRUUwDPKHz7GjqGS/
	 WqOi7MHS/WsSAqWitngANZoEqiJdODGagwmVP3uWnq1Ou8JJkXIYQu44Xgh95wYInp
	 yYy/5pYHY9pyA==
Message-ID: <0efa70c3-dee4-4d0d-b106-d7083b5e68c3@kernel.org>
Date: Sun, 9 Feb 2025 11:19:22 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, neil.armstrong@linaro.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
 johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-5-quic_vdadhani@quicinc.com>
 <10060d39-87a4-4565-a2a6-80c93ac2266a@kernel.org>
 <dudqd2y42wy6iq2k73aphd5ol4mtq7z4c54zhd27rl745rrw5x@p3oummf2jke7>
 <374e16d6-46aa-4bdf-85e9-bc2e33c38057@kernel.org>
 <v5n7wn3saiymi2ncgi35drzdjfeaa4ng2ftia6ggex6oh74ocg@7vuskxosh726>
 <5f710113-08b0-468e-940a-2c65e8b42486@linaro.org>
 <01362821-ac7f-41d7-a4c1-b1f675e9f644@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <01362821-ac7f-41d7-a4c1-b1f675e9f644@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2025 11:11, Viken Dadhaniya wrote:
>>>>>>
>>>>>> Just one blank line, but anyway, this property should not be in three
>>>>>> places. Do you really expect that each of serial engines within one
>>>>>> GeniQUP will be configured differently by TZ?
>>>>>
>>>>> Yes, each SE is configured separately and it's quite frequent when
>>>>> different SEs have different DMA configuration.
>>>>
>>>> Well, I checked at sm8550 and sm8650 and each pair of SE - which shares
>>>> resources - has the same DMAs, so I would not call it frequent. Care to
>>>> bring an example where same serial engines have different DMAs and
>>>> different TZ? We do not talk about single QUP.
>>>
>>> Well, I don't have access to the latest sm8550 / sm8650 devcfg sources.
>>> I checked the RB5 ones. As far as I understand out of 14 enabled SEs
>>> only two are configured for the GSI DMA, others should use FIFO / SE
>>> DMA. Same applies to the SM8250 MTP devices. Checking the RB1 / RB2
>>> setup also shows 3 out of 6 SEs being set for GSI.
>>
>> I think selecting GSI DMA is only for devices needs high speed streaming 
>> to the
>> device, like the touch screen, using GSI DMA for random small access is 
>> a non-sense.
>>
>> But the thing is, in the TZ world the configuration was static so we had 
>> no choice
>> of using GSI DMA when configured, but now we have the choice so we could 
>> totally
>> reconfigure the SE with the transfer type (FIFO, SE DMA or GSI DMA) as 
>> runtime and
>> drop this attribute.
>>
>> So instead of hardcoding this, add a way to dynamically select either of 
>> the 3
>> transfer types when firmware can be loaded from HLOS.
>>
>> Neil
>>
> 
> Yes, GSI DMA mode is required for specific use cases only.
> 
> Dynamically switching from GSI mode to non-GSI mode is neither possible 
> nor useful. For each SE, the use case is fixed, and based on the use 
> case, the developer can choose the mode via the device tree property.

No, it cannot. Do not describe downstream as something set in stone.

Best regards,
Krzysztof

