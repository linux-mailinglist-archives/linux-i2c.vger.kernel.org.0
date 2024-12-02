Return-Path: <linux-i2c+bounces-8281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4B9DFB01
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 08:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2BA162EBF
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 07:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264671F940A;
	Mon,  2 Dec 2024 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuWQD75t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D031F8F10;
	Mon,  2 Dec 2024 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733123972; cv=none; b=oshXV57UCopWRaOIAXh86zDXi8a9M7ENB2DwSCCEp4wqsLZ4tMglI2uNNVsSJt9Yu5rVtMT8tRERxep599v5wSsdYi6vIOxrT5ID3S6mdaT0X5wQatRzlVYO7LNBSuo1j9eu4EgOAc3pU/HcDnYBRsNz23qJGE+YATZhAej7RLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733123972; c=relaxed/simple;
	bh=/tlgtK7JjfxgaGxdUXckjbndy/MvCZ5JS02jgL2F4tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+59leWSzi8ePio/PNi8tI4Ais1xWr9Inc25oKEdd5WthYwPDr0D7GdYZsB39g+cTi7tHhJcQ7C7mrqYg3Cwy0B6x4tvrc202AQL3irjJZStJgyO9ihl3MktckcNYdZPs18ZjJSE9e1Z1Dl5chTKiokuB7Lw5+Vxg0bUx4Tfwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuWQD75t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC9AC4CED2;
	Mon,  2 Dec 2024 07:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733123972;
	bh=/tlgtK7JjfxgaGxdUXckjbndy/MvCZ5JS02jgL2F4tY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DuWQD75tMUHZxM2tvrZXS3O4zFJz9l9V9IazfY1a3YWdYlf7+72kel91ViGtVCodF
	 yoiWqR1VXnaemtZbtaiBkucEwrFeCXoaUerGCOgc4MxJaq834fBN2e9nm69caMycNY
	 J+uqP7RZeYQKtGuN7hY4HNM6yUDdYgrWX74f6OzeHbQP2QH1lvyz4HNY1r2dtOanrx
	 FkVUuxmZc5uoU6gZ7pUKgzrq1lnsLPkFfFap4gdV3raMUtCNTeYAezDfYLLtEMnOTi
	 0TnAYooAJjtw6Hv4HIdhivf42dzjCtyFxc8V47cSgBgOuTNBT7/aD/lkOtRpq34bqx
	 6oh4m0LDtEvvA==
Message-ID: <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
Date: Mon, 2 Dec 2024 08:19:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
 Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
 krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
 <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
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
In-Reply-To: <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2024 05:00, Mukesh Kumar Savaliya wrote:
> Hi Krzysztof,
> 
> On 11/29/2024 8:44 PM, Krzysztof Kozlowski wrote:
>> On 29/11/2024 15:43, Mukesh Kumar Savaliya wrote:
>>> Adds qcom,shared-se flag usage. Use this flag when I2C serial controller
>>> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
>>>
>>> SE(Serial Engine HW controller acting as protocol master controller) is an
>>> I2C controller. Basically a programmable SERDES(serializer/deserializer)
>>> coupled with data DMA entity, capable in handling a bus protocol, and data
>>> moves to/from system memory.
>>>
>>> Two clients from different processors can share an I2C controller for same
>>> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
>>> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
>>> can perform i2c transactions.
>>>
>>> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml       | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> index 9f66a3bb1f80..88682a333399 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> @@ -60,6 +60,14 @@ properties:
>>>     power-domains:
>>>       maxItems: 1
>>>   
>>> +  qcom,shared-se:
>>> +    description: True if I2C controller is shared between two or more system processors.
>>> +        SE(Serial Engine HW controller working as protocol master controller) is an
>>> +        I2C controller. Basically, a programmable SERDES(serializer/deserializer)
>>> +        coupled with data DMA entity, capable in handling a bus protocol, and data
>>> +        moves to/from system memory.
>> I replied why I NAK it. You did not really address my concerns, but
>> replied with some generic statement. After that generic statement you
>> gave me exactly 0 seconds to react and you sent v5.
>>
> Sorry for 0 seconds, i thought of addressing comment and uploading it 
> new patch as i wanted to explain SE. whatever i have added for SE 
> explanation is in qualcomm hardware programming guide document.
>> Really 0 seconds to respond to your comment, while you give yourself
>> days to respond to my comments.
>>
>> This is not how it works.
>>
> Sure, let me first conclude here what exactly should be done.
>> NAK
>>
>> Implement previous feedback. Don't send any new versions before you
>> understand what you have to do and get some agreement with reviewers.
>>
> Sure, this is definitely a good way. what did i do for previous comment ?
> I have opened SE and expanded, explained.
> 
> which statement or explanation should i rephrase ? Is it description 
> statement from this yaml file ? Could you please suggested better word 
> instead of shared-se if this flag name is not suitable ?
> 
> I could not get this ask -
> "There are few of such flags already and there are some patches adding 
> it in different flavors."

Come with one flag or enum, if needed, covering all your cases like this.

Best regards,
Krzysztof

