Return-Path: <linux-i2c+bounces-2888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A68A0C97
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 11:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D15AB286908
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 09:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F9D145350;
	Thu, 11 Apr 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RH23LTku"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3930B13B2A8;
	Thu, 11 Apr 2024 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712828386; cv=none; b=PusHeacMlNx8UuWmN4NbKIVMZcoaG4BKdYp/SRlPNHPaGq7Rwb+PW/8TeXzmByAFPL92qZzyKbEJcOZ4NenJa5ad2MTA0JAHKNKLmsVfQq50PurIT2O6Ec5W45O9pDBU34ahT4O7JZEVWwZkM5L1RPSqmMbfk9KKMxTPd13di5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712828386; c=relaxed/simple;
	bh=wanp9p18Kaf0ShHZ0lGWcX4M0b7lk+ryk6Qlal5cEOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V6pVbqzfPJc7ZepFHHLG6R+/HQ+5hm4Dc0FsZoEHB3Hc68T4bRN5eJ70O2/BbP32elGL92pHfIMI7/c/cL3fCAZO/Gp+YmlWgbpxnSo7s7CkOgg+2cwxg9N81U08ZmXL4G3l725gJxlw0bjioDZYAED3jKQCnnonw4a5+zdEqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RH23LTku; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B7Pfi7029833;
	Thu, 11 Apr 2024 11:38:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=6rfS5zPiSmzZMMxQ4v6y7X7sH1FVnmMas6q+NGiPbP0=; b=RH
	23LTkuSOQZgrLqSQPcyDWEaHansF0FyzusSDHHejYeeQubA/RF03+Fcw0JO1uxMG
	vxF1TpPcpGgm0D5a22KTGFQ7B10VA0NGWF7kWPIuCEes6xP+vVpTvGT3WcMqMrto
	D4vR5lrxgA/glhjYfqpRe5c0L23nsZVK7DVfPfG0lEV5OCEp0AXAts6p2Sz8Eqn+
	pfNDTysrxZZj3w6etWkPop5DdColzGvEkh0mS5oMq1L4D7HeqW1uQ1DiKhu8ho9x
	WWExS/Zmj9aq87LkaFiH+L0wv8VNYlPBEg0uHS/sXlEIu+kMGooWvN+/JWrTbuwL
	XfW02l4cyVpCxpiEPg5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbfy12h6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 11:38:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D322A4002D;
	Thu, 11 Apr 2024 11:38:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 906DE2132CA;
	Thu, 11 Apr 2024 11:37:27 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Apr
 2024 11:37:25 +0200
Message-ID: <ee47d2e8-763f-4451-b9f3-b46ded4c1b97@foss.st.com>
Date: Thu, 11 Apr 2024 11:37:24 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Introduce STM32 Firewall framework
To: Rob Herring <robh+dt@kernel.org>
CC: Gatien Chevallier <gatien.chevallier@foss.st.com>,
        <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
 <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_03,2024-04-09_01,2023-05-22_02

Hi Rob

On 4/9/24 19:13, Rob Herring wrote:
> On Mon, Apr 8, 2024 at 3:44 AM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi Gatien,
>>
>> On 1/5/24 14:03, Gatien Chevallier wrote:
>>> Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
>>> platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
>>> register to the framework to offer firewall services such as access
>>> granting.
>>>
>>> This series of patches is a new approach on the previous STM32 system
>>> bus, history is available here:
>>> https://lore.kernel.org/lkml/20230127164040.1047583/
>>>
>>> The need for such framework arises from the fact that there are now
>>> multiple hardware firewalls implemented across multiple products.
>>> Drivers are shared between different products, using the same code.
>>> When it comes to firewalls, the purpose mostly stays the same: Protect
>>> hardware resources. But the implementation differs, and there are
>>> multiple types of firewalls: peripheral, memory, ...
>>>
>>> Some hardware firewall controllers such as the RIFSC implemented on
>>> STM32MP2x platforms may require to take ownership of a resource before
>>> being able to use it, hence the requirement for firewall services to
>>> take/release the ownership of such resources.
>>>
>>> On the other hand, hardware firewall configurations are becoming
>>> more and more complex. These mecanisms prevent platform crashes
>>> or other firewall-related incoveniences by denying access to some
>>> resources.
>>>
>>> The stm32 firewall framework offers an API that is defined in
>>> firewall controllers drivers to best fit the specificity of each
>>> firewall.
>>>
>>> For every peripherals protected by either the ETZPC or the RIFSC, the
>>> firewall framework checks the firewall controlelr registers to see if
>>> the peripheral's access is granted to the Linux kernel. If not, the
>>> peripheral is configured as secure, the node is marked populated,
>>> so that the driver is not probed for that device.
>>>
>>> The firewall framework relies on the access-controller device tree
>>> binding. It is used by peripherals to reference a domain access
>>> controller. In this case a firewall controller. The bus uses the ID
>>> referenced by the access-controller property to know where to look
>>> in the firewall to get the security configuration for the peripheral.
>>> This allows a device tree description rather than a hardcoded peripheral
>>> table in the bus driver.
>>>
>>> The STM32 ETZPC device is responsible for filtering accesses based on
>>> security level, or co-processor isolation for any resource connected
>>> to it.
>>>
>>> The RIFSC is responsible for filtering accesses based on Compartment
>>> ID / security level / privilege level for any resource connected to
>>> it.
>>>
>>> STM32MP13/15/25 SoC device tree files are updated in this series to
>>> implement this mecanism.
>>>
>>
>> ...
>>
>> After minor cosmetic fixes, series applied on stm32-next.
>> Seen with Arnd: it will be part on my next PR and will come through
>> arm-soc tree.
> 
> And there's some new warnings in next with it:
> 
>        1  venc@480e0000: 'access-controllers' does not match any of the
> regexes: 'pinctrl-[0-9]+'
>        1  vdec@480d0000: 'access-controllers' does not match any of the
> regexes: 'pinctrl-[0-9]+'

Yes I noticed it to my colleague. YAML update has been sent for VEND/VDENC.

https://lore.kernel.org/lkml/171276671618.403884.13818480350194550959.robh@kernel.org/T/

As soon as it is acked I could merge it in my tree.

Alex

> 
> Rob




