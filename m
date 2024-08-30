Return-Path: <linux-i2c+bounces-5959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F434965DB3
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 11:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFBAE1C23176
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 09:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF53017B4F6;
	Fri, 30 Aug 2024 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzt2dnQy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3303713C3D5;
	Fri, 30 Aug 2024 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725011944; cv=none; b=Sk+pODQQWgmGcEkPGNuwf6H2toSWYtDFU007acTJx5H9rZNbgQtXxvAaHcEy+0O6uxaY62rkjcBtpZja6VBa5I/0XDXgtoUPl+4JZAQGI9n1vVwWWDTsJJtT2brwuOzhOi5li5U6AAUdueEZT60/zj7yeuk+9csyVUkufmKxIMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725011944; c=relaxed/simple;
	bh=Xz3mDx21E4z9kKk8sJRWgbNnSRev+LlOgd7/CHZsUyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GW3T1euEndA7OQgQlcfw/GgCuEbAz4bw+li+BZbYZVKZQBZnLQ+1SvkR7rNbK+GCY+BAJn3GdquExeB2s7fXTYE3CFbdSnMqC4+pwrX90ynJw9WACap+y0CIb92CeBo/p5c+qaiX40k9pKGFOUD4RqQjDR/7smmvZorl+ve5q+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzt2dnQy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BC4C4CEC2;
	Fri, 30 Aug 2024 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725011943;
	bh=Xz3mDx21E4z9kKk8sJRWgbNnSRev+LlOgd7/CHZsUyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tzt2dnQyr/MecVXaYBLbiTTYVMo8Zle/mFym6vwsQUSCF5qsHklhlf+BjdAGlttON
	 Bj3FbtZe/v5C+3lxbvCnJTLo8M9RBGAJhhZ4EscfzpE/pbRvu8AmuevVse5P2FUzX+
	 cGyAAoCMEHxO1DIalRsjcDkG/fg9zulo+PGkYgvPoISPA1NfGqss+83D7+JVj12UG8
	 qgZHyn4l4svQ2m184V1MrEml0jQAU87AdIeYJnGbOOJ8Ze4GRBfQ3ScsNTm+oM7a7L
	 8K1hSo8rjzye3qQr6RLLDVhXY84haWX7IIvzFxCesm0HMSQhwyUKqiNummKOCiy+0M
	 mAhzY+yM2YkLQ==
Message-ID: <1941ebf9-8bcf-49f5-bf69-cb2c66435b9b@kernel.org>
Date: Fri, 30 Aug 2024 11:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] dt-bindings: qcom: geni-se: document support for
 SA8255P
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 viresh.kumar@linaro.org, herbert@gondor.apana.org.au, davem@davemloft.net,
 sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
 will@kernel.org, joro@8bytes.org, jassisinghbrar@gmail.com, lee@kernel.org,
 linus.walleij@linaro.org, amitk@kernel.org, thara.gopinath@gmail.com,
 broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
 robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com,
 lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com,
 agross@kernel.org, bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com,
 robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com, quic_tsoni@quicinc.com,
 quic_shazhuss@quicinc.com, Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-17-quic_nkela@quicinc.com>
 <zzznoxebkrksnpzmk55cff3wz5lhb7dd3qzcvtzkjjv2usmvbr@ebmlirkmahoj>
 <5ce821d8-ebf6-484c-9f0b-e78c227d799c@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5ce821d8-ebf6-484c-9f0b-e78c227d799c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2024 16:23, Nikunj Kela wrote:
> 
> On 8/29/2024 12:42 AM, Krzysztof Kozlowski wrote:
>> On Wed, Aug 28, 2024 at 01:37:15PM -0700, Nikunj Kela wrote:
>>> Add "qcom,sa8255p-geni-se-qup" compatible for representing QUP on
>>> SA8255p.
>>>
>>> Clocks are being managed by the firmware VM and not required on
>>> SA8255p Linux VM hence removing it from required list.
>>>
>>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>> ---
>>>  .../bindings/soc/qcom/qcom,geni-se.yaml       | 47 +++++++++++++++++--
>>>  1 file changed, 43 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>> index 7b031ef09669..40e3a3e045da 100644
>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>> @@ -22,17 +22,16 @@ properties:
>>>      enum:
>>>        - qcom,geni-se-qup
>>>        - qcom,geni-se-i2c-master-hub
>>> +      - qcom,sa8255p-geni-se-qup
>> Same problems. If you decide to use generic compatibles, it means it
>> covers all devices. Otherwise it does not make any sense.
> 
> Hi Krzysztof,
> 
> SA8255p platform is not compatible with generic ones. At the time
> generic compatibles were added, no one thought of such platform will

That's kind of obvious and expected yet these were added...

> appear in future. Please advise what should we do in this case?

I don't know. We keep telling - do not use generic compatibles, because
you will have something like this, but people use generic compatibles -
so what can I say? I told you so?

Can we get agreement that using generic compatibles is a wrong idea? Or
sort of promise - we won't use them? Or policy? I don't know, we can
move on assuming this was a mistake 8 years ago, approaches evolve,
reviews change, but I am just afraid I will be repeating the same to
several future contributions and every time come with long arguments
exhausting my energy - don't add generic compatibles.

If devices are not compatible, I suggest different bindings.

Best regards,
Krzysztof


