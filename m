Return-Path: <linux-i2c+bounces-2822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC72089BABC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 10:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B63D1C2170F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 08:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065AF51C5F;
	Mon,  8 Apr 2024 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="H0Hz8koo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E83BB3D;
	Mon,  8 Apr 2024 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712565915; cv=none; b=iab7RC4ZR62zkaq94fSNdm8gUQt/AI9D2EyWEeNmhVwH5ligwAqW7jHW8V2cpVb6/Te74+zkmO4sMuqobJA7WpGEVXDhyLo8ugncddc5gZ4dl0yMnogIEPvAP16Oe9YtcWzXsYdZTFIEmNqLgkUEFZiPjRLQFr0ZgeQRIninmo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712565915; c=relaxed/simple;
	bh=vJ9C9ICtmHohArhbC1wa6KFi5aR/p0VT/SWDNweoaAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ijTG/Zev4+IewAS92WQMcGoe4B9xBz9m+AhR7/9mdIZ2k3mJOnRMCT/k6RGPcorXc7r2+0v9D0OpCeKmo+/6i7CW96zACIF487FjVd8CLNHqPnGuwtGLdusth+1KaJagAL9ABXv8f15Q/gLANwrllJwXEFjFAMBOfOOIV0xpxUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=H0Hz8koo; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4387SNEk009700;
	Mon, 8 Apr 2024 10:44:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=p9CMLavhVsATyBEL2PMrrzwDGq1Q/Uy83NePUSe/nV8=; b=H0
	Hz8kooN+RWyeLVNT5G6PnWy8ULfDSW6CpoagsFb+J3M0DtuXTtnHqwuFRioi3gAA
	z5t7reJ8TsDXoNyseC06fx94TQCm6ALfyu6bsdF56llYVodLg9zaUIGjwFgk8DmE
	zXqWHU2YrzgiaVhWnsN82v10SkaVMrvQJ80OkoBuvJLqZ+Kpqac574MQ8DF/PNQk
	FZ7K4mrgNckGiIqwFgGzwaEUM/92Kh75C09Nbbz1efURqgiAW/I7HKGkw+Rcqd5J
	lc1lWbYAnp3PuE8qyX64hAyomATyqJvNHG1wh159HfLOx5KBBLJVFOjc6Rg6NG0V
	F9DOJvtck291a9gQZoMA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xaw9cnmn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 10:44:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F2D0D40059;
	Mon,  8 Apr 2024 10:44:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2018E211978;
	Mon,  8 Apr 2024 10:43:02 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:42:59 +0200
Message-ID: <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
Date: Mon, 8 Apr 2024 10:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Introduce STM32 Firewall framework
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
        <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02

Hi Gatien,

On 1/5/24 14:03, Gatien Chevallier wrote:
> Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
> platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
> register to the framework to offer firewall services such as access
> granting.
> 
> This series of patches is a new approach on the previous STM32 system
> bus, history is available here:
> https://lore.kernel.org/lkml/20230127164040.1047583/
> 
> The need for such framework arises from the fact that there are now
> multiple hardware firewalls implemented across multiple products.
> Drivers are shared between different products, using the same code.
> When it comes to firewalls, the purpose mostly stays the same: Protect
> hardware resources. But the implementation differs, and there are
> multiple types of firewalls: peripheral, memory, ...
> 
> Some hardware firewall controllers such as the RIFSC implemented on
> STM32MP2x platforms may require to take ownership of a resource before
> being able to use it, hence the requirement for firewall services to
> take/release the ownership of such resources.
> 
> On the other hand, hardware firewall configurations are becoming
> more and more complex. These mecanisms prevent platform crashes
> or other firewall-related incoveniences by denying access to some
> resources.
> 
> The stm32 firewall framework offers an API that is defined in
> firewall controllers drivers to best fit the specificity of each
> firewall.
> 
> For every peripherals protected by either the ETZPC or the RIFSC, the
> firewall framework checks the firewall controlelr registers to see if
> the peripheral's access is granted to the Linux kernel. If not, the
> peripheral is configured as secure, the node is marked populated,
> so that the driver is not probed for that device.
> 
> The firewall framework relies on the access-controller device tree
> binding. It is used by peripherals to reference a domain access
> controller. In this case a firewall controller. The bus uses the ID
> referenced by the access-controller property to know where to look
> in the firewall to get the security configuration for the peripheral.
> This allows a device tree description rather than a hardcoded peripheral
> table in the bus driver.
> 
> The STM32 ETZPC device is responsible for filtering accesses based on
> security level, or co-processor isolation for any resource connected
> to it.
> 
> The RIFSC is responsible for filtering accesses based on Compartment
> ID / security level / privilege level for any resource connected to
> it.
> 
> STM32MP13/15/25 SoC device tree files are updated in this series to
> implement this mecanism.
> 

...

After minor cosmetic fixes, series applied on stm32-next.
Seen with Arnd: it will be part on my next PR and will come through 
arm-soc tree.

Thanks
Alex




