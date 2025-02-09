Return-Path: <linux-i2c+bounces-9357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047EFA2DD3B
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 13:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5089E7A252C
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 12:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2769B1AF0D0;
	Sun,  9 Feb 2025 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI0fLVPn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B97243392;
	Sun,  9 Feb 2025 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102484; cv=none; b=Vd+I/DaB77gUdeXOCQIRwsW/WCdFTpipOt3Ro5pjIj9yI/V6NQ9x7sD/Nk3cggtwHO73DUdnsndmo/7Ext4+dTVh2uiDY4uRCNuYrWpmLJ0HIG5j36yyvTwsfGO/z7F5FEnoZtmEF8SkHYg6Ki05GNruiw4FQGnskIQ3INM3Y1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102484; c=relaxed/simple;
	bh=YOlF0kfEhFPlEFqyngV+aVrsjWHQHhzJ3hb7R1wmWaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6ma026IbOIHRpNzMhoejd71U2UQ4a7ihrBSnY+c381EMt99KpOU39diGM8hMd0wgbYfXRB9YMAFoZ/FcWXj8ZRmEfIMEArQL0pV3rH/bwfgsi8gZYAXn24J2ooIHu7S7Mhztn4k/SkBoWiksW4uUz+eg4f70CUziM8r5wpXoRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI0fLVPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE53C4CEE2;
	Sun,  9 Feb 2025 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739102484;
	bh=YOlF0kfEhFPlEFqyngV+aVrsjWHQHhzJ3hb7R1wmWaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DI0fLVPnHzCLzO/qyU7oeSgqlxDU/UEQdIgw+LaJ3hX/9EKWQPWn9d2gmA+dsV74h
	 JAglg5KC/qvKWcAskeAB6dGq8y6qZjxVPVPIBjdqL1rZzvxw2w304+5MSSoVoHeLhK
	 SYjO/5Z7zyvQMCVfYKW6ae51S0M1oB9yfydfXHn1ebhF2GjV5SwRRvzoNHplPNFNBu
	 zxxUSpNpmiFut6/uheoxm8HzhSX47Bgvn7qPSzmItuc5xPwbrbAkoY6Xv7DD5JBofE
	 WzOi5zk2dP68aOEAQXTy6u05EUYmFnv3D31uAc1AfulbXHrHmb4FD5PTC2/BEzjegA
	 V0tCGga0bNHQg==
Message-ID: <5d2b71a9-a62b-418c-91ae-fa2a195aa27c@kernel.org>
Date: Sun, 9 Feb 2025 13:01:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
To: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
 <20250124-upstream-lt3074-v1-1-7603f346433e@analog.com>
 <20250127-outgoing-ibis-of-respect-028c50@krzk-bin>
 <PH0PR03MB6938B71327DAADC17492A5538EF62@PH0PR03MB6938.namprd03.prod.outlook.com>
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
In-Reply-To: <PH0PR03MB6938B71327DAADC17492A5538EF62@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2025 10:05, Encarnacion, Cedric justine wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, January 27, 2025 3:52 PM
>> To: Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>
>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
>> Conor Dooley <conor+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>;
>> Guenter Roeck <linux@roeck-us.net>; Jonathan Corbet <corbet@lwn.net>;
>> Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> hwmon@vger.kernel.org; linux-doc@vger.kernel.org; linux-i2c@vger.kernel.org
>> Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
>>
>> [External]
>>
>> On Fri, Jan 24, 2025 at 11:39:06PM +0800, Cedric Encarnacion wrote:
>>> Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
>>> Regulator.
>>
>> Regulator? Then why is it trivial? No enable-gpios? No I2C interface?
>>
>> Best regards,
>> Krzysztof
> 
> I based this driver primarily on the LT7182S dual-channel silent switcher
> regulator. 


I do not understand why the base of driver matters here? If it was based
on LTFOOBARGROUNDHOG1 would it change something? I know neither LT7182S
nor the LTFOOBARGROUNDHOG1. And driver matters here even less - bindings
are about hardware, not given implementation in OS.

> The LT3074 is a single-channel device with basic enable and
> power-good GPIOs, fewer registers, and fewer functionalities than the

So it has GPIOs? And by GPIOs you mean what the SoC/CPU, thus the
operating system, sees as GPIOs or something else?

> LT7182S. Like other PMBus drivers, its GPIOs are not exposed.
> 
> Here are other PMBus regulators/power modules found in trivial-devices
> I also used as reference:
> 
> - infineon,irps5401
> - delta,q54sj108a2


I don't know these devices so still no clue. Please rather explain in
the terms of the hardware, e.g. what this device has or has not. See
also regulator bindings.

Best regards,
Krzysztof

