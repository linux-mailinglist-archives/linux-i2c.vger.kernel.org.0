Return-Path: <linux-i2c+bounces-6969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EF9853AB
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 09:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 685131C2349D
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 07:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBE8155C95;
	Wed, 25 Sep 2024 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHOLKMMW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A2155C98;
	Wed, 25 Sep 2024 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248748; cv=none; b=olSA/pclUvzuBpeV9zilq79R5Ov3LnrqWdWt6aZzKyhco5ddySBpZowc8H7U5YW2J+2QomKrWG9IMm5SBhBGleHsXBL+eThulPo2qIAqDhErs0WXNTs7EqteCjtxTMRCNTR7DOZ54/CTUZJoZYY+EtqcyePA/2kCcdK52S479xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248748; c=relaxed/simple;
	bh=kSpaw8ddrExpAZltHSiB0vnDbD0+xlRGiinkGk+R+40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7cY72vYmfRdtNk8dNRM2T1Rn06w/LA9y0Qs3CKwfyL0h23RETPsKgDTixMkfi3cIa3UZGJCDePyfBWmxuoPBBSNboIvsZTzgoahNwZm2PsOz36avvJf7eJIERTEi2QgWvRmatYVwUNVsbfCXgzLBazaIXAjX1JynHQfaW7ossM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHOLKMMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD27FC4CEC3;
	Wed, 25 Sep 2024 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727248748;
	bh=kSpaw8ddrExpAZltHSiB0vnDbD0+xlRGiinkGk+R+40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RHOLKMMWanAJxLyPGk9irXzcW9UcGqgpuG3ur5ST7z/XMgbcgjbkS3i3qgqfpJsrb
	 /oFffhlyMuhrwtN141yyrjxXyVLP4SgGFsZUrRcnE0nNP91Go4LVz+PAaLvflwxwQa
	 G7uaRkPIRR7qfmu90nAq1ILDldJpTPtfnBc+sS3MdXn9/1jojYu3jy9GEJIsxUL3s3
	 nQKN6JkqUHqM4+6XhDXRKN45jF49XfCE8bTlThDU3/32oobhesr9LGw3dalnmtKfen
	 TqH8syxkAh2tXS7uUOT6uqfY67yehuldN3w2sT/ms+LjRMrkyaKd+0UrCKGQSRfJwI
	 hjNmDPd8fXlZQ==
Message-ID: <775c8de3-a66d-43ee-8941-cc55741f54f7@kernel.org>
Date: Wed, 25 Sep 2024 09:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
 <20240923230230.3001657-2-chris.packham@alliedtelesis.co.nz>
 <uxv5kzjo5btypvca5vh27i7xkajyqvbqtkys7xcmfz5ltmwezv@fgrlz4yzznri>
 <4a0dbf45-3f27-43d4-87c6-35b1983ceaef@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4a0dbf45-3f27-43d4-87c6-35b1983ceaef@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2024 23:11, Chris Packham wrote:
> 
> On 24/09/24 20:55, Krzysztof Kozlowski wrote:
>> On Tue, Sep 24, 2024 at 11:02:28AM +1200, Chris Packham wrote:
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
>>>      Changes in v3:
>>>      - Remove parent node in example
>>>      - put unevaluatedProperties after required
>>>      - Add #address-cells and #size-cells
>>>      
>>>      Changes in v2:
>>>      - Use reg property for controller registers
>>>      - Remove global-control-offset (will be hard coded in driver)
>>>      - Integrated the multiplexing function. Child nodes now represent the
>>>        available SDA lines
>>>
>>>   .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 80 +++++++++++++++++++
>>>   MAINTAINERS                                   |  6 ++
>>>   2 files changed, 86 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..979ec22e81f1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>>> @@ -0,0 +1,80 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://scanmail.trustwave.com/?c=20988&d=gf7y5rgy9ER44HZptkkovLbVGtkYd7ByAz3K6PNPAw&u=http%3a%2f%2fdevicetree%2eorg%2fschemas%2fi2c%2frealtek%2crtl9300-i2c%2eyaml%23
>>> +$schema: http://scanmail.trustwave.com/?c=20988&d=gf7y5rgy9ER44HZptkkovLbVGtkYd7ByA2-a7KJKBg&u=http%3a%2f%2fdevicetree%2eorg%2fmeta-schemas%2fcore%2eyaml%23
>>> +
>>> +title: Realtek RTL I2C Controller
>>> +
>>> +maintainers:
>>> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> +
>>> +description:
>>> +  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
>> This is confusing. It took me some minutes to understand that two I2Cs
>> in the example do not match what you wrote here. I got there only because
>> of your DTS. Your patchsets - sent separately and describing problem
>> incompletely - do not help.
>>
>> This is the binding for I2C, not for RTL9300 SoC.
>>
>>> +  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
>>> +  assigned to either I2C controller.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: realtek,rtl9300-i2c
>>> +
>>> +  reg:
>>> +    description: Register offset and size this I2C controller.
>> Nope, your reboot mode does not have reg. Either fix reboot mode driver
>> or this. Preferably reboot mode.
> 
> I'm not sure what you mean by this. The syscon-reboot binding doesn't 
> require a reg property and I can only find one in-tree dts 
> (turris1x.dts) that actually gives it a reg property.

But it could. It uses offset instead of reg for historical reasons, when
it was outside of syscon node. I propose to add there reg and oneOf
requiring either reg or offset. This way you will have only MMIO children.

Best regards,
Krzysztof


