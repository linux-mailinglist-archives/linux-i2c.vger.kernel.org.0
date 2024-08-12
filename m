Return-Path: <linux-i2c+bounces-5308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D455694EE0D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 15:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0563C1C21B5A
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 13:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB2617C21E;
	Mon, 12 Aug 2024 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWaFHU+E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8F178378;
	Mon, 12 Aug 2024 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469085; cv=none; b=F5E5Fl+PJJVq4GV7LN068qM/tZhMgSVC4j1YpYGXLB1TDfCaJDhK8HG3KjqXO+QADm5++/OKIuh6hj2isnElwXkBZ3UHZJJsSKo51zkFJCVF/35CN5rQTbSBuocpMpt2zfSMCI8LoO8e20XbI1/sJ2/pvPtAhOT89QvhgNBrU04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469085; c=relaxed/simple;
	bh=r59nsTPbSHwIVS+3ZwKeyI1JmhygrBGoA+H4HVStEcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFhIYRcqcMFd7D6oEyW8iTYPDORJnPjAxep6mYSTSXWmhXXXCxFw0/oJbtnX5n0oYlACTJBdo6jE3rTdrrHIN2P0H2FAhM+YVhpv8E+qCsK6ZnzV/ogBJmkB71G0eqADwzuAKw+sUsueMTrwwkVv+LSYW9PrPXVAVNfDW9i5sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWaFHU+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677E2C32782;
	Mon, 12 Aug 2024 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723469084;
	bh=r59nsTPbSHwIVS+3ZwKeyI1JmhygrBGoA+H4HVStEcY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OWaFHU+EC8ziSkJC1LoA4/YIUgeDMDTykoaYCD9Mx3xMzdlnPSTweqdRb9XgwjdCx
	 OW6LLSk/BDiJs3wjN815P3iiK+UnVDQcJnC4m0SpQm2hN8RmVFzswjOATkniBkWQ+i
	 m53Q2AMk3+Zs15OVp18EJd1Xu94zC9xgTcXwzQVSL/HMpOr0JImaK52pPys+C5fo5S
	 VnpMCb3uH4T2I4FCj+HquQNK3PlGAo8Rz70CKlExuHKhaHrpwkCNiaJr8s1XNOOP6k
	 pwRrwerlO0zm6Fwz5WC7U9o/CryNCR3H7qw9fhkq8jxkhREWRPrU5cDhcX+1x7rQFd
	 W8g+gmCf+sd5g==
Message-ID: <1e23f37b-bfa6-4827-96a6-c859b0ddc9ca@kernel.org>
Date: Mon, 12 Aug 2024 15:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] hwmon: (amc6821) add support for tsd,mule
To: Guenter Roeck <linux@roeck-us.net>,
 Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-4-f9f6d7b60fb2@cherry.de>
 <5d5c44cd-6320-4fcd-9409-f3fc97bc5389@roeck-us.net>
 <40ff0c23-f037-454c-9d79-05dd72655052@kernel.org>
 <46493cf7-6885-4c30-965b-29c158599c58@roeck-us.net>
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
In-Reply-To: <46493cf7-6885-4c30-965b-29c158599c58@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:21, Guenter Roeck wrote:
> On 8/12/24 04:38, Krzysztof Kozlowski wrote:
>> On 31/07/2024 17:12, Guenter Roeck wrote:
>>> On Thu, Jul 25, 2024 at 03:27:50PM +0200, Farouk Bouabid wrote:
>>>> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
>>>> among which is an amc6821 and other devices that are reachable through
>>>> an I2C-mux.
>>>>
>>>> The devices on the mux can be selected by writing the appropriate device
>>>> number to an I2C config register (amc6821: reg 0xff)
>>>>
>>>> Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
>>>> when probing the amc6821.
>>>>
>>>> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Applied.
>>
>> Eh, there is undocumented dependency on I2C here. Next has warning
>> because of this.
>>
>> Farouk, please *always mention* the dependencies between patches.
>>
>> Best regards,
>> Krzysztof
>>
>>
> Sorry, I wasn't aware that all bindings have to be in the tree before I apply
> patches, and I somehow had the apparently wrong impression that the bindings

None of us were aware of it and bindings were in fact approved, so I
would do the same as you - picked up patches.

> were approved. I'll drop the two patches (this one and the DT patch for
> amc6821). Someone may need to remind me to re-apply them after all
> pre-dependencies are in the tree.

Thanks, that would solve the issue.

Best regards,
Krzysztof


