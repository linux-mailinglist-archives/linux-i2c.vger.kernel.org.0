Return-Path: <linux-i2c+bounces-474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8E7FA150
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 14:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0141228167F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 13:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FDE3033B;
	Mon, 27 Nov 2023 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4kH3otVN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02993C3;
	Mon, 27 Nov 2023 05:47:47 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AR8w3bo017254;
	Mon, 27 Nov 2023 14:47:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:from:subject:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=8hGazSvMP2gNXnWuE2YGDfecV4aQ8ZkhDAZNfo9ZL7U=; b=4k
	H3otVN1HaFRDT9yF7U0HmECWFJJDC71b2rS3CjU7ESa7kB8m0UP/19kw2rumrbaX
	KunMUZLjfFu8KWPPQLIVxqBPwHA7ocaRMO6UQdnJVc2G/AOvSum6YtuSnV2A7RKU
	79l85N0tMtbHPnmVlcIg0Cv5UmQmcitJbLQRew22OKyzIhKTmcQWpes1I1R5Grgd
	GeaV73IZ16M0lmaN/L9bQwlRUTsymZwUFzAePC0dhjDC5tHD+I8axUF6put6LuaU
	crQvdeKflQVLAlApNxg/cZLSWWeOU4ioF8XuI4bAOMpybdRTe104wPpuOgWQ5fOB
	kdSuIB9Dfsvc5ARo4AmA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk8pjqnw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 14:47:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF21A10004B;
	Mon, 27 Nov 2023 14:47:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 357D9228A4A;
	Mon, 27 Nov 2023 14:47:00 +0100 (CET)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 27 Nov
 2023 14:46:58 +0100
Message-ID: <2387a549-4ccf-450d-a461-26d3c9ff58f1@foss.st.com>
Date: Mon, 27 Nov 2023 14:46:51 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a system bus for
 STM32MP15x boards
To: Rob Herring <robh@kernel.org>
CC: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-p.hy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
 <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
 <20231012153012.GA698406-robh@kernel.org>
 <b16ed06f-66fd-457b-9610-a67ad07deb60@foss.st.com>
 <20231024163956.GA4049342-robh@kernel.org>
 <8fa014c3-c0e9-4183-b4fb-90962f71295a@foss.st.com>
Content-Language: en-US
In-Reply-To: <8fa014c3-c0e9-4183-b4fb-90962f71295a@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_11,2023-11-27_01,2023-05-22_02

Hi,

A gentle reminder on the questions below.

I'm also thinking about moving the STM32 firewall framework to a
specific access-controllers folder if that's ok.

Best regards,
Gatien

On 10/27/23 17:37, Gatien CHEVALLIER wrote:
> 
> 
> On 10/24/23 18:39, Rob Herring wrote:
>> On Mon, Oct 16, 2023 at 02:02:39PM +0200, Gatien CHEVALLIER wrote:
>>> Hi Rob,
>>>
>>> On 10/12/23 17:30, Rob Herring wrote:
>>>> On Wed, Oct 11, 2023 at 10:49:58AM +0200, Gatien CHEVALLIER wrote:
>>>>> Hi Rob,
>>>>>
>>>>> On 10/10/23 20:42, Rob Herring wrote:
>>>>>> On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
>>>>>>> ETZPC is a firewall controller. Put all peripherals filtered by the
>>>>>>> ETZPC as ETZPC subnodes and reference ETZPC as an
>>>>>>> access-control-provider.
>>>>>>>
>>>>>>> For more information on which peripheral is securable or supports 
>>>>>>> MCU
>>>>>>> isolation, please read the STM32MP15 reference manual.
>>>>>>>
>>>>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes in V6:
>>>>>>>            - Renamed access-controller to access-controllers
>>>>>>>            - Removal of access-control-provider property
>>>>>>>
>>>>>>> Changes in V5:
>>>>>>>            - Renamed feature-domain* to access-control*
>>>>>>>
>>>>>>>     arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 
>>>>>>> +++++++++++++------------
>>>>>>>     arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
>>>>>>>     arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
>>>>>>>     3 files changed, 1450 insertions(+), 1377 deletions(-)
>>>>>>
>>>>>> This is not reviewable. Change the indentation and any non-functional
>>>>>> change in one patch and then actual changes in another.
>>>>>
>>>>> Ok, I'll make it easier to read.
>>>>>
>>>>>>
>>>>>> This is also an ABI break. Though I'm not sure it's avoidable. All 
>>>>>> the
>>>>>> devices below the ETZPC node won't probe on existing kernel. A
>>>>>> simple-bus fallback for ETZPC node should solve that.
>>>>>>
>>>>>
>>>>> I had one issue when trying with a simple-bus fallback that was the
>>>>> drivers were probing even though the access rights aren't correct.
>>>>> Hence the removal of the simple-bus compatible in the STM32MP25 patch.
>>>>
>>>> But it worked before, right? So the difference is you have either added
>>>> new devices which need setup or your firmware changed how devices are
>>>> setup (or not setup). Certainly can't fix the latter case. You just 
>>>> need
>>>> to be explicit about what you are doing to users.
>>>>
>>>
>>> I should've specified it was during a test where I deliberately set
>>> incorrect rights on a peripheral and enabled its node to see if the
>>> firewall would allow the creation of the device.
>>>
>>>>
>>>>> Even though a node is tagged with the OF_POPULATED flag when checking
>>>>> the access rights with the firewall controller, it seems that when
>>>>> simple-bus is probing, there's no check of this flag.
>>>>
>>>> It shouldn't. Those flags are for creating the devices (or not) and
>>>> removing only devices of_platform_populate() created.
>>>>
>>>
>>> About the "simple-bus" being a fallback, I think I understood why I saw
>>> that the devices were created.
>>>
>>> All devices under a node whose compatible is "simple-bus" are created
>>> in of_platform_device_create_pdata(), called by
>>> of_platform_default_populate_init() at arch_initcall level. This
>>> before the firewall-controller has a chance to populate it's bus.
>>>
>>> Therefore, when I flag nodes when populating the firewall-bus, the
>>> devices are already created. The "simple-bus" mechanism is not a
>>> fallback here as it precedes the driver probe.
>>>
>>> Is there a safe way to safely remove/disable a device created this way?
>>
>> There's 2 ways to handle this. Either controlling creating the device or
>> controlling probing the device. The latter should just work with
>> fw_devlink dependency. The former probably needs some adjustment to
>> simple-pm-bus driver if you have 'simple-bus' compatible. You want it to
>> probe on old kernels and not probe on new kernels with your firewall
>> driver. Look at the commit history for simple-pm-bus. There was some
>> discussion on it as well.
>>
> 
> Hi Rob,
> 
> First, thank you for your suggestions.
> 
> Regarding controlling probing the device: the philosophy of the firewall
> controller was to check a device secure configuration to determine if
> its associated driver should be probed (+handle some firewall
> resources). I'd rather avoid it so that the device isn't created at all.
> 
> I took a look on the simple-bus driver side. I don't see an obvious way
> on how to do it as the firewall controller driver is a module while the
> devices being populated is done at arch initcall level.
> 
> I ended up with two propositions:
> 
> 1)I took a shot at implementing a new flag "OF_ACCESS_GRANTED" that
> should be set in the first call of the of_platform_bus_create()
> function for every child node of a "default bus" (simple-bus,
> simple-pm-bus, ...) having the access-controllers property.
> This flag should be unset by the access controller if the access is
> not granted. This covers the particular case where the access controller
> has a simple-bus fallback whilst not creating the devices on the first
> try for the bus' childs.
> 
> This way, the first round of of_platform_populate() done at arch init
> call level won't create the devices of an access controller child
> nodes. Then, the firewall controller has a chance to clear the flag
> before the second call to this function by the simple-pm-bus driver.
> 
> If the controller module isn't present, then it's a simple-bus
> behavior to extent of the child devices not being all created in the
> first place. This shouldn't be an issue as in only concerns childs
> of such bus that aren't probed before the bus driver.
> 
> I have a patch that I can send as RFC on top of my series if my
> explanation isn't clear enough.
> 
> 2)Make the STM32_FIREWALL configuration switch select the OF_DYNAMIC
> one. This way I can use of_detach_node() function to remove the node
> from the device tree. The cons of this is the device tree is now
> used at runtime.
> 
> Are you considering one of these two proposition as a viable solution?
> 
> Best regards,
> Gatien
> 
>>> Devices that are under the firewall controller (simple-bus) node
>>> should not be probed before it as they're child of it.
>>
>> fw_devlink should take care of parent/child dependencies without any
>> explicit handling of the access ctrl binding.
>>
>> Rob

