Return-Path: <linux-i2c+bounces-6860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2E397C0F4
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 22:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7E71F227D9
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 20:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6F71CB30A;
	Wed, 18 Sep 2024 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="y/VEMZ7N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9D1CA6B3
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692192; cv=none; b=s3nrhvsBZU7y8XHJ558TRmXCVfwhu4fw6iqVsTz0n+cVhqDC78dde/q3WQ9mUbu4ZVEZ350ZHsa1h7CShSupqJGkhLnolYn4CS17SjSddgFq8rkCpChbFX2KXOBKgEww3vVhvam+gf4ezCzHvEZfIRPHviYvNImoePdM+Jg+KCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692192; c=relaxed/simple;
	bh=zSgVsNUK+bta9ZlSgv7i9IzM3GTyvCrN540E66rr2RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acNeNr4uQ3q6xOZRjeQRAm3k3cBNeJvHSfvEd64ehr4M1r196OFab7BSwP2zlCbWm9LKoRAzconkXkSbnlYG8u+m4zlJsOkz8KwHhA5NuOXPTUDQxNbr/VD9uxE4jG3KywuBFS9QhY2taNBhdN2xc6JgdzvZn9fYRHUXr0Xb+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=y/VEMZ7N; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 335E82C031F;
	Thu, 19 Sep 2024 08:43:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726692188;
	bh=WQcAVV9R5XwCwy1Gly1QNTDVEReUdXeXYtkwacCQRoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=y/VEMZ7Ncq97BgHrXrXSBvy9tm8kFFrePFp46HTeWlCNkmB5F2SSmjubfboZVqGR3
	 ZEBt0cpU10S+qJXH1R0/p8cWn/5JYuwCAPnOOUwYoKnyj5ofVtyS6LR5bSIavfnLfF
	 4af6leYfR3b5BKw59nWxszaUx5juw+iNrATM1OFw/hM/UhiUHSaXLy5H0wCajaB7xL
	 d+DD1b5hC1w2k7AwCKwQj3q6WAeLoyYfGW3jqZdYQZ7aCLdnRnnox9exV93q3A+m+E
	 PlpSKIfaSZxJWNRooxtS4J4U41fv36o3V56vPqdHZD7IDVl+NAfod0sh6NBLm/BHaE
	 16XBzN9mquJQw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66eb3b5c0000>; Thu, 19 Sep 2024 08:43:08 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 080F813ECCD;
	Thu, 19 Sep 2024 08:43:08 +1200 (NZST)
Message-ID: <4e3156a9-1b18-48a6-9aba-19c5d026c256@alliedtelesis.co.nz>
Date: Thu, 19 Sep 2024 08:43:07 +1200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add RTL9300 I2C controller
To: Rob Herring <robh@kernel.org>
Cc: andi.shyti@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-2-chris.packham@alliedtelesis.co.nz>
 <20240918141409.GA1494676-robh@kernel.org>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20240918141409.GA1494676-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66eb3b5c a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=1RYeprS4dyvIMdkUys4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=jN3ps_WhWjoppdTyGyg0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Rob,

On 19/09/24 02:14, Rob Herring wrote:
> On Wed, Sep 18, 2024 at 11:29:28AM +1200, Chris Packham wrote:
>> Add dtschema for the I2C controller on the RTL9300 SoC. The I2C
>> controllers on this SoC are part of the "switch" block which is
>> represented here as a syscon node. The SCL pins are dependent on the I2C
>> controller (GPIO8 for the first controller, GPIO 17 for the second). The
>> SDA pins can be assigned to either one of the I2C controllers (but not
>> both).
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>
>> Notes:
>>      This does hit generate the following dt_binding_check warning
>>      
>>      realtek,rtl9300-i2c.example.dts:22.19-30.13: Warning (unit_address_vs_reg): /example-0/switch@1b000000/i2c@36c: node has a unit name, but no reg or ranges property
>>      
>>      Which is totally correct. I haven't given this thing a reg property
>>      because I'm using an offset from the parent syscon node. I'm also not
>>      calling the first offset "offset" but I don't think that'd help.
>>      
>>      I looked at a couple of other examples of devices that are children of
>>      syscon nodes (e.g. armada-ap806-thermal, ap806-cpu-clock) these do have
>>      a reg property in the dts but as far as I can see from the code it's not
>>      actually used, instead the register offsets are in the code looked up
>>      from the driver data (in at least one-case the reg offset is for a
>>      legacy usage).
>>      
>>      So I'm a little unsure what to do here. I can add a reg property and
>>      update the driver to use that to get the offset for the first set of
>>      registers (or just not use it). Or I could drop the @36c from the node
>>      names but then I coudn't distinguish the two controllers without failing
>>      the $nodename: requirement from i2c-controller.yaml.
> Use 'reg'. Looks like you need 2 entries for it.
>
> Whether a driver of some OS decides to use it or not is irrelevant to
> the binding.

OK thanks for that clarification.

>>   .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 73 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 ++
>>   2 files changed, 79 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>> new file mode 100644
>> index 000000000000..5b74a1986720
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Realtek RTL I2C Controller
>> +
>> +maintainers:
>> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
>> +
>> +description: |
> Don't need '|' if no formatting.

Ack

>> +  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
>> +  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
>> +  assigned to either I2C controller.
>> +
>> +properties:
>> +  compatible:
>> +    const: realtek,rtl9300-i2c
>> +
>> +  realtek,control-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Offset of the registers for this I2C controller
>> +
>> +  realtek,global-control-offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Offset of the I2C global control register (common between
>> +      controllers).
>> +
>> +  clock-frequency:
>> +    enum: [ 100000, 400000 ]
>> +
>> +  realtek,sda-pin:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
> 0 is already the minimum.
Ack
>> +    maximum: 7
>> +    description:
>> +      SDA pin associated with this I2C controller.
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - realtek,control-offset
>> +  - realtek,global-control-offset
>> +
>> +examples:
>> +  - |
>> +    switch@1b000000 {
>> +      compatible = "realtek,rtl9302c-switch", "syscon", "simple-mfd";
>> +      reg = <0x1b000000 0x10000>;
>> +
>> +      i2c@36c {
>> +        compatible = "realtek,rtl9300-i2c";
>> +        realtek,control-offset = <0x36c>;
>> +        realtek,global-control-offset = <0x384>;
>> +        clock-frequency = <100000>;
>> +        realtek,sda-pin = <2>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +      };
>> +
>> +      i2c@388 {
>> +        compatible = "realtek,rtl9300-i2c";
>> +        realtek,control-offset = <0x388>;
>> +        realtek,global-control-offset = <0x384>;
> Humm, normally we don't want the same address in multiple 'reg' entries.
> Is this offset known to vary? It could just be hardcoded in the driver
> or implicit from the compatible (different compatible is the usual way
> to deal with differing register layouts).

It's one of those annoying registers that is sandwiched between the two 
I2C controllers that affects both of them so you kind of need to use it 
whether your using I2C1 or I2C2. For the RTL9300 it'll always be 0x384. 
There is a RTL9310 that appears to have it at a different offset but I'm 
not planning on adding support for that chip any time soon.

If I switch to "reg" for the I2C controller registers as suggested above 
I can just go with a hard coded register value in the driver for the 
global control.


