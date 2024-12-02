Return-Path: <linux-i2c+bounces-8292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F57A9E0016
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 12:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AA6CB22FB7
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 11:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3DD1FDE00;
	Mon,  2 Dec 2024 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m34HbNQo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86261FA167;
	Mon,  2 Dec 2024 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138019; cv=none; b=p9HU53wk+UlKsv7Uc/iXmQzALEkadtNyTQHUAdmOBJooLeLa5WTLXAM9uv3Swzs5VTEUwgiKRSpmZW1eRBNQhcJOdWzXd7IxQp2ShwIiuU4NS4tDIib9Mw19+AP0lnFUnIkHRtatBC6M3wf6qJ6+jpyq89ruXkZdV+1LvESu4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138019; c=relaxed/simple;
	bh=RNC+kkS0e2Xbu+AuY957Pz/SQYrDMXQ+AGut6URecdw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KAan+Ad4JSd65je9stZS6MOu2FLmhx8FuXxvhEiQyO1CMRjc/a1fyTrvmhEXtzPAkSLoNomhQ3iqjU2Lq+ZxkTErhvGkHcEOQdHha9956gf0PbZDO8uHhog49GZYYf4zl8UQfVkOy8BQbn/54h7ESatrqUQC8gb9ilIqBTQ5qz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m34HbNQo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC63C4CED1;
	Mon,  2 Dec 2024 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733138018;
	bh=RNC+kkS0e2Xbu+AuY957Pz/SQYrDMXQ+AGut6URecdw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=m34HbNQoLpYYY+m6HnBuwB74SsFteM2zAyvSHojwuscWxDzyWd6npdcdkWyK/VBPo
	 +e8K5A/NBI8xDheoFF+2dO5fD2m/IHuQI2D8Jemvt6YV1VhZqAehAHyoQG/3Ix+5nU
	 IfcGK9YKV6sZUL9yBRINaR4yu9oVv05c7XCbLYgO8HtRk/QLUt1P7DS/tLl9wfJ1Ey
	 kjGlve/mq4nFY73IFj5P/Sz7DTXkT7dfv/mMriT2fZvoxBU5748qPkqCj0Eut70rku
	 Eg8vmPNuwKyRNrf9smKH+XAZEdrq22zOAJA/Rhk3tMvi3QbIUAKsM/IFZpFOlYkK9A
	 Q5KhDY9Hh13AQ==
Message-ID: <fa3ee895-5353-44f5-b816-9d17b6a7d199@kernel.org>
Date: Mon, 2 Dec 2024 12:13:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
From: Krzysztof Kozlowski <krzk@kernel.org>
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
 <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
 <75f2cc08-e3ab-41fb-aa94-22963c4ffd82@quicinc.com>
 <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
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
In-Reply-To: <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2024 12:04, Krzysztof Kozlowski wrote:
> On 02/12/2024 11:38, Mukesh Kumar Savaliya wrote:
>>>
>>> Come with one flag or enum, if needed, covering all your cases like this.
>>>
>> Let me explain, this feature is one of the additional software case 
>> adding on base protocol support. if we dont have more than one usecase 
>> or repurposing this feature, why do we need to add enums ? I see one 
>> flag gpi_mode but it's internal to driver not exposed to user or expose 
>> any usecase/feature.
>>
>> Below was our earlier context, just wanted to add for clarity.
>> --
>>  > Is sharing of IP blocks going to be also for other devices? If yes, then
>>  > this should be one property for all Qualcomm devices. If not, then be
>>  > sure that this is the case because I will bring it up if you come with
>>  > one more solution for something else.
> 
> 
> You keep repeating the same. You won't receive any other answer.
> 
>>  >
>> IP blocks like SE can be shared. Here we are talking about I2C sharing.
>> In future it can be SPI sharing. But design wise it fits better to add
>> flag per SE node. Same we shall be adding for SPI too in future.
> 
> 
> How flag per SE node is relevant? I did not ask to move the property.
> 
>>
>> Please let me know your further suggestions.
> We do not talk about I2C or SPI here only. We talk about entire SoC.
> Since beginning. Find other patch proposals and align with rest of
> Qualcomm developers so that you come with only one definition for this
> feature/characteristic. Or do you want to say that I am free to NAK all
> further properties duplicating this one?
> 
> Please confirm that you Qualcomm engineers understand the last statement
> and that every block will use se-shared, even if we speak about UFS for
> example.
> 

I think I was pretty clear also 2 months ago what do I expect from this:

https://lore.kernel.org/all/52f83419-cc5e-49f3-90a7-26a5b4ddd5a0@kernel.org/


I do not see this addressing qcom-wide way at all. Four new versions of
patch and you still did not address first fedback you got.


Best regards,
Krzysztof

