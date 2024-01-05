Return-Path: <linux-i2c+bounces-1130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D51824FA9
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9A91C22BAB
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 08:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199EC21346;
	Fri,  5 Jan 2024 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="tT6cNXeG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABA20DC8;
	Fri,  5 Jan 2024 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 4052tkx3028984;
	Fri, 5 Jan 2024 09:19:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=gxrbGKGX0buop+PvuAmG2IkLu4G/QjEo0CpiUPjSvQ4=; b=tT
	6cNXeGAKaJftgTWYQ4btXPz25NJkoN6rwQ97Z+A70hxVGPC2EACwY9KlFCdwin7x
	T0eGIn7cyZvSTfTKL9FDgLEXwhSfQvbd3x/0RqhDxui/1vUCSEUHuwwZr9vaSZe9
	VdlGf5MOsb+NyVQ6ko42YO9d1nlPanGwO/RF/J4coZ/A/Hk91SlDoU+TcPWpChjc
	VMqXebLXrELMYSyaqHnkwRK2oyoxdP/Ov8ew4yZ4CDuu4GeqUPTeGL0AxMTR94Qn
	lXgr3Z1OrXzqkGP1ijFxHO1uxSOuRA4iapRhe6ZvvoZRpbUBJFP4zW8Cc7oNPSVD
	QPxxMGTmlyF9GBQaTcIw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ve9dss0v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 09:19:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 086FC10002A;
	Fri,  5 Jan 2024 09:19:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8B17210587;
	Fri,  5 Jan 2024 09:19:52 +0100 (CET)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 09:19:50 +0100
Message-ID: <9b66bc71-08de-43bd-b7e1-4e7c9defd400@foss.st.com>
Date: Fri, 5 Jan 2024 09:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/13] dt-bindings: bus: document RIFSC
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
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-medi.a@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-4-gatien.chevallier@foss.st.com>
 <20231221215316.GA155023-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20231221215316.GA155023-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_04,2024-01-05_01,2023-05-22_02

Hi Rob,

On 12/21/23 22:53, Rob Herring wrote:
> On Tue, Dec 12, 2023 at 04:23:46PM +0100, Gatien Chevallier wrote:
>> Document RIFSC (RIF security controller). RIFSC is a firewall controller
>> composed of different kinds of hardware resources.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Changes in V6:
>> 	- Renamed access-controller to access-controllers
>> 	- Removal of access-control-provider property
>> 	- Removal of access-controller and access-controller-names
>> 	  declaration in the patternProperties field. Add
>> 	  additionalProperties: true in this field.
>>
>> Changes in V5:
>> 	- Renamed feature-domain* to access-control*
>>
>> Changes in V2:
>> 	- Corrected errors highlighted by Rob's robot
>> 	- No longer define the maxItems for the "feature-domains"
>> 	  property
>> 	- Fix example (node name, status)
>> 	- Declare "feature-domain-names" as an optional
>> 	  property for child nodes
>> 	- Fix description of "feature-domains" property
>>
>>   .../bindings/bus/st,stm32mp25-rifsc.yaml      | 96 +++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>> new file mode 100644
>> index 000000000000..95aa7f04c739
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/st,stm32mp25-rifsc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Resource isolation framework security controller
>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description: |
>> +  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
>> +  designed to enforce and manage isolation of STM32 hardware resources like
>> +  memory and peripherals.
>> +
>> +  The RIFSC (RIF security controller) is composed of three sets of registers,
>> +  each managing a specific set of hardware resources:
>> +    - RISC registers associated with RISUP logic (resource isolation device unit
>> +      for peripherals), assign all non-RIF aware peripherals to zero, one or
>> +      any security domains (secure, privilege, compartment).
>> +    - RIMC registers: associated with RIMU logic (resource isolation master
>> +      unit), assign all non RIF-aware bus master to one security domain by
>> +      setting secure, privileged and compartment information on the system bus.
>> +      Alternatively, the RISUP logic controlling the device port access to a
>> +      peripheral can assign target bus attributes to this peripheral master port
>> +      (supported attribute: CID).
>> +    - RISC registers associated with RISAL logic (resource isolation device unit
>> +      for address space - Lite version), assign address space subregions to one
>> +      security domains (secure, privilege, compartment).
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: st,stm32mp25-rifsc
> 
> This needs to be exact and include 'simple-bus'. You'll need a custom
> 'select' with the above to avoid matching all other 'simple-bus' cases.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you for the review,
I'll update this for the next version whilst applying your tag

Gatien

