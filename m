Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0658227A45
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 10:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgGUIOU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 04:14:20 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:56918 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725984AbgGUIOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 04:14:20 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06L8CxxX017868;
        Tue, 21 Jul 2020 10:14:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vLvdjebn18vp1iXjDc73XEAirigA9VZVa85se3b0xmw=;
 b=hiukbOV++/qLbPbEsXN2qdfvVHhOJdKMoN+jfWRNz9iPx9+75sqaWfZRKP0E765c7tbw
 PxQwYUxPoW1iK9lqHE9AkUp615w+L/G9OxqAqYQZSIwU6vg1b1hBimcCGMxssRnSYGHN
 EFkBInhKNW0spWaMu14Du1o3fORUGrVor6AsM3yLTSBduQTV8cPlI1yrvFoLvlb50Aux
 KC3IauLU6X9TmgnwgiZA9crvF9/CoAXy3Asu2WR1WkPC5IAA2XNU15Ci+rTp0/+Bh1vb
 lCBkWbPgwowQgSVx5Tx/LP3fzcR3i2XzRYAgJZFY2c+HEbsTx90HHcfyXR8loHk4FHKk xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32bsagvsuv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jul 2020 10:14:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C9E010002A;
        Tue, 21 Jul 2020 10:14:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC3562A4D9E;
        Tue, 21 Jul 2020 10:14:09 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 10:14:09 +0200
Subject: Re: [PATCH] ARM: dts: stm32: configure i2c5 support on
 stm32mp15xx-dkx
To:     Alain Volmat <alain.volmat@st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1592904672-12781-1-git-send-email-alain.volmat@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <073d551e-1624-62fe-5bf3-45ee26894600@st.com>
Date:   Tue, 21 Jul 2020 10:14:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1592904672-12781-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-21_02:2020-07-21,2020-07-21 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

On 6/23/20 11:31 AM, Alain Volmat wrote:
> From: Fabrice Gasnier <fabrice.gasnier@st.com>
> 
> Configure I2C5 on stm32mp15 DK boards. It's available and can be used on:
> - Arduino connector
> - GPIO expansion connector
> Keep it disabled by default, so the pins are kept in their initial state to
> lower power consumption. This way they can also be used as GPIO.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index fcf50131e5fe..e69aba9830b3 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -361,6 +361,19 @@
>   	};
>   };
>   
> +&i2c5 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c5_pins_a>;
> +	pinctrl-1 = <&i2c5_sleep_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	clock-frequency = <400000>;
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +	status = "disabled";
> +};
> +
>   &i2s2 {
>   	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
>   	clock-names = "pclk", "i2sclk", "x8k", "x11k";
> 

Applied on stm32-next.

Thanks.
Alex
