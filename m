Return-Path: <linux-i2c+bounces-6950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB1983FC5
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 09:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43060284554
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 07:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513171494AB;
	Tue, 24 Sep 2024 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2etuIi9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025931B85E7;
	Tue, 24 Sep 2024 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727164715; cv=none; b=LYh771e/K7o60lgRTtNFfs1g4bi8dmIMKzhjocJevyYbW1yQxQShnx40ISbuw2wURRcJhrI+8QNTUAdZMCUECVaUntO1mlxq88FvTXygYoCCPrFWOHVktE/N9g38L8YrpLhjvcH3UdjBkrXGJS8ppGalZbhSi8SGwXNAmGcviSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727164715; c=relaxed/simple;
	bh=YZweGbLvQ86kElEW+MFo0mV9Gf/M/IeYsg6iu18HBVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByDBahtpseO92jy74rk5jZ5KY04YxjjfTZWd4ZnFC8vezyPqTZJugs/Gu4NBuI6L8ESpppCkKYw/1Cof6S48UoZUZJhc86KrevF1nNJuMDF1fKXkebFU9CCmzL/Ta866clGJ4a36K6DbRYM3u4lAc38uW/c718n3gg2YmIrZU+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2etuIi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3B4C4CEC5;
	Tue, 24 Sep 2024 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727164714;
	bh=YZweGbLvQ86kElEW+MFo0mV9Gf/M/IeYsg6iu18HBVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i2etuIi9XYJUvraJKfHPkd4pTh8ep3ha+udKLQVadxzGzOvIiW2Hm9MqXlGCcxcRI
	 Yf2YQ1i+WH+qZYHSG7NMQuKzyFp9ty32j58SsV02BpwruyPjZvWhR3KBrAvwPWOSNv
	 XiFiAk314UQuy2qA+yDq9EamGuWEd0n14PU/8Z9Ob83E1amJxwsj/3BlH5W7fZsraz
	 ATi1C2IaJgkJwH3Rur+iOQZInSDW8cZLrIStZfGfBermlmqiG3jSuKeeRdT2FVIPt9
	 dPfFxwTeoKZpubdBSnUu/VNE4SmLsG6fm5Ie2j9lLtavnb6+J1eze3EO/yWXsC/Hdl
	 2wE9A9/oahkFg==
Message-ID: <e5954cb6-7889-40c4-82b0-6df95d09d54a@kernel.org>
Date: Tue, 24 Sep 2024 09:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
 <20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz>
 <6hlfdtbdf7yhkaoiuglhk4gksgzpahewzjf4cseedon7x2tx3s@m6c23rqxwkyu>
 <ab5c995c-b7b6-4435-9f6e-8b0e37add2e9@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ab5c995c-b7b6-4435-9f6e-8b0e37add2e9@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2024 23:09, Chris Packham wrote:
> Hi Krzyzstof,
> 
> On 23/09/24 08:25, Krzysztof Kozlowski wrote:
>> On Fri, Sep 20, 2024 at 12:09:28PM +1200, Chris Packham wrote:
>>> Add dtschema for the I2C controller on the RTL9300 SoC. The I2C
>>> controllers on this SoC are part of the "switch" block which is
>>> represented here as a syscon node. The SCL pins are dependent on the I2C
>>> controller (GPIO8 for the first controller, GPIO 17 for the second). The
>>> SDA pins can be assigned to either one of the I2C controllers (but not
>>> both).
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> Notes:
>>>      Changes in v2:
>>>      - Use reg property for controller registers
>>>      - Remove global-control-offset (will be hard coded in driver)
>>>      - Integrated the multiplexing function. Child nodes now represent the
>>>        available SDA lines
>>>
>>>   .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 82 +++++++++++++++++++
>>>   MAINTAINERS                                   |  6 ++
>>>   2 files changed, 88 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..e8c37239b299
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>>> @@ -0,0 +1,82 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://scanmail.trustwave.com/?c=20988&d=2_3w5qdKawcvw7Bv6K3mA_v4JF1rlxddN3AhCekStg&u=http%3a%2f%2fdevicetree%2eorg%2fschemas%2fi2c%2frealtek%2crtl9300-i2c%2eyaml%23
>>> +$schema: http://scanmail.trustwave.com/?c=20988&d=2_3w5qdKawcvw7Bv6K3mA_v4JF1rlxddNyJxDbgXsw&u=http%3a%2f%2fdevicetree%2eorg%2fmeta-schemas%2fcore%2eyaml%23
>>> +
>>> +title: Realtek RTL I2C Controller
>>> +
>>> +maintainers:
>>> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> +
>>> +description:
>>> +  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
>>> +  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
>>> +  assigned to either I2C controller.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: realtek,rtl9300-i2c
>>> +
>>> +  reg:
>>> +    description: Register offset and size this I2C controller.
>>> +
>>> +patternProperties:
>>> +  '^i2c@[0-7]$':
>>> +    $ref: /schemas/i2c/i2c-controller.yaml
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        description: The SDA pin associated with the I2C bus.
>>> +        maxItems: 1
>>> +
>>> +    required:
>>> +      - reg
>>> +
>>> +unevaluatedProperties: false
>> This goes after "required:" block.
> Ack.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +examples:
>>> +  - |
>>> +    switch@1b000000 {
>>> +      compatible = "realtek,rtl9302c-switch", "syscon", "simple-mfd";
>> Drop... or put entire example in the parent device node.
> 
> OK I'll drop it.
> 
>>
>>> +      reg = <0x1b000000 0x10000>;
>>> +      #address-cells = <1>;
>>> +      #size-cells = <1>;
>>> +
>>> +      i2c@36c {
>>> +        compatible = "realtek,rtl9300-i2c";
>> Parent is 9302c, but this is 9300?
> 
> The RTL9302C is one of a series of switch chips with integrated CPUs. 
> There is also the RTL9301, RTL9302B and RTL9303 (there my be others but 
> those are the 4 I know about). The differences are all around the switch 
> port/SERDES. The documentation uses "RTL9300" when referring to things 
> common across the family. There's even an app note titled 
> "RTL9300_I2C_Application_Note_V1.1(83)". So I'd really like to use 
> "rtl9300" when talking about the SoC peripherals but use the specific 
> chip compatible when talking about the Ethernet switch or the overall 
> chip. I'm also tempted to add the other variants to my other in-flight 
> patch series.

Using family variant alone is in general not accepted. You need SoC
specific compatible in the front.

> 
> "realtek,rtl9300-i2c" also happens to be what openwrt is using, but I'm 
> not sure that that helps my argument as the binding is now quite different.

Does not matter. They could be using
"realtek,we-like-to-use-whatever-we-invented-soc", but that does not
mean we should accept it.

Best regards,
Krzysztof


