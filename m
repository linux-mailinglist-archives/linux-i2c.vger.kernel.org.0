Return-Path: <linux-i2c+bounces-8096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E20879D4221
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 19:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2850283D10
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 18:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856871AF0A1;
	Wed, 20 Nov 2024 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/OiW2bx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6F1155C9E;
	Wed, 20 Nov 2024 18:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732127950; cv=none; b=Mtst6W+apPD5BjfSxAvE6sjsHpN87/25fpZ68IDKHqW/Jrv5XUXXJn6QHp/oyL0toeJogu+gDnFWDD+SgSo4ui7y/lsMPtZcUeU1vSuThqLK4mJOMdx25P2I4dcH5cWCoBQZV+jfxVfshASr++WYccxUfpyYmQ8vB/czBnaEPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732127950; c=relaxed/simple;
	bh=UXMlFytvYrHCfFZWYtSAFPtM120qL1+pkap/yp8A7SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Afc2B9E+OHXCaB9cqShQCxIgZvH2f+GJnGKy+JdVoshn7AfczspeI3giX9xAQeQpmsxbW8ufYVyLxcZSQQNeFxgxDkm9M97PTaTKCyiwkNX/HEqL6DhakSJAyRBVEgB7d8hHzngvseFjj6LhbF1Mp3ZsfiMaSZGMxPSmNzO4RxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/OiW2bx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20175C4CECD;
	Wed, 20 Nov 2024 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732127949;
	bh=UXMlFytvYrHCfFZWYtSAFPtM120qL1+pkap/yp8A7SU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J/OiW2bx5pFDOBALUB3vynVFgfEqW9j4QHsbFn+nnA0t3NYmlCPICs8ZLXuBORAnB
	 1Oc0VkhtgEMAT38COHCc+/8iwwosVZ45t5Y4H2Rybik8+DTd4HXzPQ/uTwWImMptYJ
	 NvZncNsKv1x5Rc0QWyOFenyn0VhLkjbGSxohYI+RYVExqisnGx53UfwnM0XNvNGuP+
	 EE4l/w62nTM0soe3zESN7DJjwWYypnUhdC/FIdMMo6+R/jg5SQ1AGijf1QS9mtFWgJ
	 LLbJF5VhWpnpXJSuAhvvO2STau7NqkeOrQWealFuDtUmBtVnpCL+cTfuesbh5FsoQJ
	 Vevy+gJ6BWr+Q==
Message-ID: <4d907ddf-16ca-4136-b912-f571a691dc90@kernel.org>
Date: Wed, 20 Nov 2024 19:39:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings for
 adp1051, adp1055 and ltp8800
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Radu Sabau <radu.sabau@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
 <dfe8e47e-6c31-4b11-b733-38e5bd0e49d3@kernel.org>
 <7e55a403-eb1c-4369-8180-1639b50cc9b1@roeck-us.net>
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
In-Reply-To: <7e55a403-eb1c-4369-8180-1639b50cc9b1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2024 19:07, Guenter Roeck wrote:
> On 11/20/24 09:35, Krzysztof Kozlowski wrote:
>> On 20/11/2024 18:11, Conor Dooley wrote:
>>> On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
>>>> add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
>>>>      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>>>>      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>>>>      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
>>>>
>>>> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>>> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>>>
>>> Why did you drop my ack?
>>> https://lore.kernel.org/all/20241106-linoleum-kebab-decf14f54f76@spud/
>> So that's a v2? Or v3? Then should be marked correctly. Please start
>> using b4. I already asked analog.com for this in few cases. Feel free
>> not to use b4 if you send correct patches, but this is not the case here.
>>
> 
> In general I agree, but this is a combination of two patch series, as mentioned
> in the summary. I am not sure how to use versioning in such situations. Is it
> v2 of one series or v3 of the other ?
I would say the highest and keep the b4 changeset. This allows to use b4
diff easily. Choice done here - v1, no usage of b4  - breaks everything,
look:

b4 diff '<20241120035826.3920-1-cedricjustine.encarnacion@analog.com>'
Grabbing thread from
lore.kernel.org/all/20241120035826.3920-1-cedricjustine.encarnacion@analog.com/t.mbox.gz
---
Analyzing 13 messages in the thread
Could not find lower series to compare against.


Best regards,
Krzysztof

