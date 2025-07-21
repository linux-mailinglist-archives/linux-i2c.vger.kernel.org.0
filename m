Return-Path: <linux-i2c+bounces-11981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F4B0BD2A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 09:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 541E217B0B9
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 07:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7BB27FD46;
	Mon, 21 Jul 2025 07:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZm4zOci"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D3818EB0;
	Mon, 21 Jul 2025 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753081358; cv=none; b=NeWhMZd4zTYVoVnDfzDbjTg3LAFVA0ME/eA/ohBFGfWxwOw0jS1lV1l8j4ZwdTi1divKoxX+KNWwy3r76YAZ+LNRn9MMi4wqsgLU1ZyIa+Aq4ChCgkc7pSfkwW3QCYhz1NgLFHT/2pT0no9WTJkjU4FpcbMFcCRN5DYH0JYvMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753081358; c=relaxed/simple;
	bh=6M8wcO5ghSDQstD+yUFu+09zG0kOCXRbJgoraNTHOFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AR1zTq+qhcJSuv2HY+j1DI/mXak0AkPw167rGZI8cKjDIAQtPYylyNwgtG7m5cInvYK4mLw8DsCNEDUfZiUDTJy0Fv5eHJEgUPVKXjMsYGDtTxSJcJQ9ix5JU2kLOsZ/5Yl0Hdu3IrDcsVkFK+Yse2RQcHyROQmRSGft500emYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZm4zOci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF147C4CEED;
	Mon, 21 Jul 2025 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753081357;
	bh=6M8wcO5ghSDQstD+yUFu+09zG0kOCXRbJgoraNTHOFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iZm4zOcidzx9QsgSF7Cxp3bvLayGEkEym9virFlMCDDoJS5yvaA5T2+Er0Jzmf1tM
	 w/o8gjvBMF/zNIGnWm0+GV3/mT2RPS7kit4lBM5bNMxmx3bLmU3pYEM7sNLvkvpSFj
	 Te00G+Y5PJ6PoAFIwgk+la4FittJYRfSFGnolDd3FyF2xtXZrSFuuDfsNo+uwhrLnT
	 4Zrn6lXZkBGqdzQcqXKZjGyv+m4aphSNLF9aBlYXNDbjWAQ24E/wVtw38FvTUgMoDc
	 Apb7QjmM2g2v/NQzhu4wX6YNGVMOhj7ai7n9UIa3BzXBpqtWGqlVkccaOspNVvi8sK
	 JClNSkWTs97+g==
Message-ID: <df947cbe-e207-4619-957f-0c961c6d7139@kernel.org>
Date: Mon, 21 Jul 2025 09:02:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: linux-i2c@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
 <20250712194255.7022-3-jelonek.jonas@gmail.com>
 <20250714-magnificent-powerful-nuthatch-afcc01@krzk-bin>
 <0a2a0fa6-ee82-40be-b62d-847a4ef04626@gmail.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <0a2a0fa6-ee82-40be-b62d-847a4ef04626@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2025 21:51, Jonas Jelonek wrote:
> Hi Krzysztof,
> 
> 
> On 14.07.2025 08:00, Krzysztof Kozlowski wrote:
>> On Sat, Jul 12, 2025 at 07:42:54PM +0000, Jonas Jelonek wrote:
>>>  properties:
>>>    compatible:
>>> @@ -23,7 +25,14 @@ properties:
>>>                - realtek,rtl9302c-i2c
>>>                - realtek,rtl9303-i2c
>>>            - const: realtek,rtl9301-i2c
>>> +      - items:
>>> +          - enum:
>>> +              - realtek,rtl9311-i2c
>>> +              - realtek,rtl9312-i2c
>>> +              - realtek,rtl9313-i2c
>>> +          - const: realtek,rtl9310-i2c
>>>        - const: realtek,rtl9301-i2c
>>> +      - const: realtek,rtl9310-i2c
>> So these two are just enum.
> 
> Could you be more precise on that please? Sadly, I don't get what you're trying
> to tell me.


These two last lines should be part of one enum.

>>> +    minimum: 1
>>> +    maximum: 2
>>> +
>>>  patternProperties:
>>> -  '^i2c@[0-7]$':
>>> +  '^i2c@([0-9]|1[0-1])$':
>>>      $ref: /schemas/i2c/i2c-controller.yaml
>>>      unevaluatedProperties: false
>>>  
>> As mentioned last time, missing constraints.
>>
>> How did you solve this:
>>
>> "you should clearly narrow this per variant"?
>>
>> See example schema. It has EXACTLY this case.
>>
>> https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L212
>>
>> You also need to narrow the number of children.
> 
> I missed that from your previous review by mistake, sorry for that.
> 
> I managed to narrow it per variant whether 'realtek,mst-id' is required or not.
> But I'm not really able to do the same for the different regex patterns or the
> number of children. Although I'm trying to follow various examples,
> dt_binding_check just fails not taking the regex patterns into account.
> 
> Since you have a lot of expertise on that and I obviously fail to find
> documentation that helps me to do that properly, could you give me some hints
> on how that has to look? I'd really appreciate this.


So in your if:then: block where you narrow mst-id, you add on same level
as properties:

patternProperties:
  YOUR_REGEX: false


Best regards,
Krzysztof

