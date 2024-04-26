Return-Path: <linux-i2c+bounces-3217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1E28B398C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2BA91F21456
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 14:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F11148821;
	Fri, 26 Apr 2024 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a0yWg0xY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3168147C79;
	Fri, 26 Apr 2024 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714140728; cv=none; b=o1vKSy/OW8gmKyyYE3bD2lHj2qMzrIMLqJepyiPIgrB/GLDepZeWX0cDk6coN7FaubWq5iGaDA7/ow6YrfFL6wW2i4H6I0n/Apqhj38Oj08w9I0jCYG09NroO0P70i9X/v+GyuzeXscIZl1lIupYUMlmGcX4r8BZshFtMBGpR5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714140728; c=relaxed/simple;
	bh=3rw5uMBpx6jKewvUC7jKYAqLMpc6PkGw5Jje2sPYdeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdzer4rrAarGsS5ZEIP6zAFfFdYVoEhkZVNnCwOLzIzMlF+aSb+5SldJUNssxF9K7OfmsabP+8m+sZf4rE6iPi2LSFJICKQs29y6Y1xN2fYugOPwm31A9bxqKdkEEY1jpUzSUVlTRu99Sr27OdWceLzKRgeDW+br1XxG5O8ehTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a0yWg0xY; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E27BEE0003;
	Fri, 26 Apr 2024 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714140723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBlZZhqUOxK1WoIWgNjoVopQORRPwTRwg+7z5lKrffc=;
	b=a0yWg0xYVg+XK1+iP6vP7DJO22dF3t4BkE6I6QKK6Rq9EuigqqJaFPj1HsaaR865AuKmXQ
	LHmeUfc95oT+8LXjdjqgH0AmroqFqID86RaE+N7CmcCZ+oh3dW1nbid41OGlx4oYgmNMb/
	lZGZor6r/fj5FCfIKd8FyxbGGP02MOLA9KmQo0te+2SRNIInAOikCTVjkdWIOU9QlPDNBe
	vvGEgCqKBFDkQJoTOyQxawYzZRgxCpWCLOD6VEifIZK/Wb5AIjKzwzsTHA1+9j26IWCuVr
	XChAt9ui+M12CY2V5HeIdOu4lE9gkHms8h6z9GhNWXKVUbYf8kK3DSLmdjGHTg==
Message-ID: <3eb27570-4a53-47f6-8e36-e25fc1063124@bootlin.com>
Date: Fri, 26 Apr 2024 16:12:00 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: andi.shyti@kernel.org, jszhang@kernel.org, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 thomas.petazzoni@bootlin.com, guoren@kernel.org, wefu@redhat.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <171405653346.2527762.16827325392956038580.robh@kernel.org>
 <20240425-script-fondness-0e80bfa31615@spud>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240425-script-fondness-0e80bfa31615@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.bonnefille@bootlin.com



On 4/25/24 6:35 PM, Conor Dooley wrote:
> On Thu, Apr 25, 2024 at 09:51:26AM -0500, Rob Herring wrote:
>>
>> On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
>>> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
>>> and a default configuration for the BeagleV-Ahead. It appears that the
>>> TH1520 I2C is already supported in the upstream kernel through the
>>> Synopsis Designware I2C adapter driver.
>>> As there is no clock driver for this board as of today, this patch
>>> series uses a fixed-clock named i2c_ic_clk.
>>> There is also no pinctrl driver yet so pinmux must be handled manually
>>> for now.
>>> It also fixes the order of the nodes in the device tree to comply with
>>> device-tree coding-style.
>>>
>>> Thomas Bonnefille (4):
>>>    dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>>>    riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
>>>    riscv: dts: thead: Add TH1520 I2C nodes
>>>    riscv: dts: thead: Enable I2C on the BeagleV-Ahead
>>>
>>>   .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
>>>   .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
>>>   arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
>>>   3 files changed, 127 insertions(+), 27 deletions(-)
>>>
>>> --
>>> 2.44.0
>>>
>>>
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>    pip3 install dtschema --upgrade
>>
>>
>> New warnings running 'make CHECK_DTBS=y thead/th1520-beaglev-ahead.dtb' for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:
>>
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
> 
> The bot is not freaking out here, 50 MHz is indeed more than 5 MHz :)

5MHz is the maximum clock-frequency, ie. the I2C bus frequency.
This is actually set to 100kHz for I2C0 in the DT:

&i2c0 {
     status = "okay";
     clock-frequency = <100000>; <----
...
};

50MHz is the "fixed-clock" frequency, that is the clock feeding the I2C
IP block:

i2c_ic_clk: i2c-clock {
     compatible = "fixed-clock";
     clock-frequency = <50000000>; <-----
     #clock-cells = <0>;
};

My guess is that the bot confused the clock-frequency parameter for the 
bus clock (SCL) with the i2c-ic-clock value for the controller itself 
during the checks.

Do you agree with this or am I misunderstanding the error ?

If I lower the fixed-clock frequency to eg. 100kHz, the error is gone. 
But I guess the 5MHz limit should probably not apply to the input clock?

Best regards,
Thomas

