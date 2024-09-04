Return-Path: <linux-i2c+bounces-6181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C6896BE38
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34132815E9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C581DA627;
	Wed,  4 Sep 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZTNG3ml"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA01D88DA;
	Wed,  4 Sep 2024 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725456019; cv=none; b=idn+Ezh6RhDaiNKbUetCjJZA9PoDujXb7/jqdJXzebD2+1L2KkGYj9kl/rgM3QgLSdI5kOF9d32VEi2lXQsyI10Ai5alHSR85aCc7V5F3wOU7935cE8vfuvIF7lef8nUvmlaRpxeMb9Ohi3bpbjW0cmG2YyVv47QeKyFJQc3ky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725456019; c=relaxed/simple;
	bh=ji3ee7bEt2Ak5byQ+v6Y2EgVTfP+Cys2lyvNsofcdoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fcfmn1IhOuxbIqQpFAGaczpIgl5XziHWxFSjOx90H8IZQePvQ8FdJNUakOeakW2Y6XjiLDn6GKB7FXMsBZKt95JXTgeFGi1UXF7rxL34C9wjys+ERB9Ih5Z1qFtx81cS5BNgYkyDAcA4Xgv0xHnTMXo1T+un62P3NqtDX+WBzz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZTNG3ml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A20C4CEC2;
	Wed,  4 Sep 2024 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725456019;
	bh=ji3ee7bEt2Ak5byQ+v6Y2EgVTfP+Cys2lyvNsofcdoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZTNG3mlNHjLFyRUe+aJGbLfCjMrZHGnPiJXxH3DOSQkSOUGQs4G1MqXKAQkZyMrD
	 MTPyenlX1AWmw2AOBy1sY7GVkv2BU9rJk8HM/lpS91WTlZqVQP5UBe4apMEgMTkBdf
	 +WorKXTE07Nv0zr+NiGRnLGLkHQo2dbYIeDRA0hGWXQeuYP32Zm6wNXmTw3f3nzQFM
	 EGDXdyY99qaV0ua7gq/OR8v8iaiyQl0QIXNbsNzLCHif1FGPXRiaVI1r3VvPFgdKoo
	 OK9iF56M4geqQmx8wHFNK5Phqh8UhvZxUHYcRHuDw2Vs6HAAVlsFlMyvkE14qOJqJE
	 nrgxHXpA3wpww==
Message-ID: <3529c7ef-95e1-42b0-93c3-6ac4266c4b19@kernel.org>
Date: Wed, 4 Sep 2024 15:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] dt-bindings: i2c: document support for SA8255p
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 viresh.kumar@linaro.org, herbert@gondor.apana.org.au, davem@davemloft.net,
 sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
 will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
 cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
 wim@linux-watchdog.org, linux@roeck-us.net, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com,
 Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-16-quic_nkela@quicinc.com>
 <xtguaoof7iblrtd2idsa2k4ml64qkttgliyijbeqw5thkdcbx3@jnm75a4wmbqd>
 <06968d9d-0428-4fe8-8526-c91db3d9f0e7@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <06968d9d-0428-4fe8-8526-c91db3d9f0e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 14:41, Nikunj Kela wrote:
> 
> On 9/3/2024 11:31 PM, Krzysztof Kozlowski wrote:
>> On Tue, Sep 03, 2024 at 03:02:34PM -0700, Nikunj Kela wrote:
>>> Add compatible representing i2c support on SA8255p.
>>>
>>> Clocks and interconnects are being configured in Firmware VM
>>> on SA8255p, therefore making them optional.
>>>
>>> CC: Praveen Talari <quic_ptalari@quicinc.com>
>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>> ---
>>>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 33 +++++++++++++++++--
>>>  1 file changed, 31 insertions(+), 2 deletions(-)
>>>
>> I don't know what to do with this patch. Using specific compatibles next
>> to generic compatible is just wrong, although mistake was probably
>> allowing generic compatible. The patch does not explain the differences
>> in interface which would explain why devices are not compatible.
> 
> I mentioned in the description that clocks and interconnects on this
> platform are configured in Firmware VM(over SCMI using power and perf
> domains) therefore this is not compatible with existing generic compatible.

It is not obvious to me. I doubt it is obvious to others. Commit msg
does not say they are compatible and usually difference in
clocks/interconnects is not reason of incompatibility. So why suddenly
here we would understand it differently?


> 
> 
>>  In the
>> same time my advice of separate binding was not followed, because maybe
>> these devices are compatible? But then it should be expressed...
> 
> Sorry, I missed that. You want me to use 'oneOf' expression with this
> compatible?

I proposed separate binding file. But your commit msg suggested these
are compatible. Lack of driver change is also proof of that.

I don't want to keep discussing this because it does not lead to
anywhere. We keep repeating the same.

> 
> 
>>
>> You have entire commit msg to explain what and why.
> 
> Will put more details in description.
> 
> 
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> index 9f66a3bb1f80..b477fae734b6 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> @@ -15,6 +15,7 @@ properties:
>>>      enum:
>>>        - qcom,geni-i2c
>>>        - qcom,geni-i2c-master-hub
>>> +      - qcom,sa8255p-geni-i2c
>>>  
>>>    clocks:
>>>      minItems: 1
>>> @@ -69,8 +70,6 @@ properties:
>>>  required:
>>>    - compatible
>>>    - interrupts
>>> -  - clocks
>>> -  - clock-names
>>>    - reg
>>>  
>>>  allOf:
>>> @@ -81,6 +80,10 @@ allOf:
>>>            contains:
>>>              const: qcom,geni-i2c-master-hub
>>>      then:
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>
>> So it is required here?
> 
> We are removing clocks from generic required list and enforcing rules
> for all compatibles other than sa8255p.
> 
> 
>>> +
>>>        properties:
>>>          clocks:
>>>            minItems: 2
>>> @@ -100,7 +103,21 @@ allOf:
>>>            items:
>>>              - const: qup-core
>>>              - const: qup-config
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: qcom,sa8255p-geni-i2c
>>> +    then:
>>> +      required:
>>> +        - power-domains
>>> +
>> And possible here? I assume with the same clocks? The same for
>> interconnects - same values are valid?
> 
> I guess I need to put here the same description as in the cover letter
> to make it more clear. We are not using clocks and interconnects in this
> platform in Linux. Instead, sending request to Firmware VM over
> SCMI(using power and perf protocols)
> 
> 
>>
>>>      else:
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>> And clocks are required again?
> Explained above.
>>> +
>>>        properties:
>>>          clocks:
>>>            maxItems: 1
>> Eeee? So now all other variants have max 1 clock?
> 
> I will make if block for sa8255p up so else is not applied to rest of
> the platforms.
> 
> 
>>
>> Nope, this wasn't ever tested on real DTS.
> 
> This is tested on SA8255p DTS and I ran DT schema check on SA8775p DT as
> well.

You just affected all the DTS everywhere. It's your task to check all
DTS everywhere. Not ours.

Best regards,
Krzysztof


