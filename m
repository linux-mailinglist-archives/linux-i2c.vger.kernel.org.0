Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C9456E95
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 18:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfFZQUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 12:20:46 -0400
Received: from ns.iliad.fr ([212.27.33.1]:47826 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfFZQUq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 12:20:46 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 193562097A;
        Wed, 26 Jun 2019 18:20:44 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id B77C220307;
        Wed, 26 Jun 2019 18:20:43 +0200 (CEST)
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: Add i2c5 pins
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        I2C <linux-i2c@vger.kernel.org>
References: <ed5b1b55-285a-1c6d-c562-a965119000a5@free.fr>
 <20190427045151.GE3137@builder>
 <fcc97e67-3b8e-5b31-866e-6bee62a88fd9@free.fr>
 <20190502151244.GM2938@tuxbook-pro>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <db923066-2684-b768-c750-92b82c1bb656@free.fr>
Date:   Wed, 26 Jun 2019 18:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502151244.GM2938@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 26 18:20:44 2019 +0200 (CEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/05/2019 17:12, Bjorn Andersson wrote:

> On Mon 29 Apr 01:38 PDT 2019, Marc Gonzalez wrote:
> 
>> On 27/04/2019 06:51, Bjorn Andersson wrote:
>>
>>> On Thu 25 Apr 09:06 PDT 2019, Marc Gonzalez wrote:
>>>
>>>> Downstream source:
>>>> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi?h=LE.UM.1.3.r3.25#n165
>>>>
>>>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
>>>> index 6db70acd38ee..d0a95c70d1e7 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
>>>> @@ -2,6 +2,13 @@
>>>>  /* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
>>>>  
>>>>  &tlmm {
>>>> +	i2c5_default: i2c5_default {
>>>> +		pins = "gpio87", "gpio88";
>>>> +		function = "blsp_i2c5";
>>>> +		drive-strength = <2>;
>>>> +		bias-disable;
>>>> +	};
>>>
>>> You need to reference this node for it to make a difference.
>>
>> Right. I do have a local board file referencing i2c5_default, which I plan
>> to submit at some point. It contains:
>>
>> &blsp1_i2c5 {
>> 	status = "ok";
>> 	clock-frequency = <100000>;
>> 	pinctrl-names = "default";
>> 	pinctrl-0 = <&i2c5_default>;
>> };
>>
>>> Also the drive-strength and bias are board specific, so please move this
>>> to your board dts (and reference the node).
>>
>> Wait... Are you saying there should be no drive-strength nor bias definitions
>> inside msm8998-pins.dtsi?
>>
>> $ grep -c 'strength\|bias' arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
>> 18
>>
>> Why are the SDHC pins different than the I2C pins?
>>
>> i2c5 is "tied" to gpio87 and gpio88. Could my board designer "reassign"
>> these pins to a different HW block? Or is that immutable?
>>
> 
> Right, so it makes a lot of sense to have a node in msm8998.dtsi that
> says that if i2c5 is probed then the associated pinmux should be set up.
> 
> But the pinconf (drive-strenght, internal vs external bias) are board
> specific, so this part better go in the board.dts.
> 
> 
> On sdm845 we put a node with pinmux in the platform.dtsi and then in the
> board we extend this node with the electrical properties of the board.
> This works out pretty well, but we haven't gone back and updated the
> older platforms/boards yet.

Wow, I had completely lost track of this thread...

OK, I think what you had in mind is the following:
(Please confirm before I spin a v2)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index f09f3e03f708..9cd1f96dc3c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -27,6 +27,18 @@
 	status = "okay";
 };
 
+&blsp1_i2c5 {
+	status = "ok";
+	clock-frequency = <100000>; /*** NOT SURE... This depends on which devices are on the I2C bus? ***/
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_default>;
+};
+
+&i2c5_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qusb2phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
index 6db70acd38ee..dad175a52d03 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
@@ -2,6 +2,11 @@
 /* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
 
 &tlmm {
+	i2c5_default: i2c5-default {
+		pins = "gpio87", "gpio88";
+		function = "blsp_i2c5";
+	};
+
 	sdc2_clk_on: sdc2_clk_on {
 		config {
 			pins = "sdc2_clk";




Well, except that there don't seem to be any devices on the i2c5 bus
on the mediabox...

# i2cdetect -r 0
i2cdetect: WARNING! This program can confuse your I2C bus
Continue? [y/N] y
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

But there are on several on my batfish board:

# i2cdetect -r 0
i2cdetect: WARNING! This program can confuse your I2C bus
Continue? [y/N] y
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- 44 -- -- 47 -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- 68 -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --


Can I submit the arch/arm64/boot/dts/qcom/msm8998-pins.dtsi alone?

Regards.
