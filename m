Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD2818473D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 13:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgCMMuK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 08:50:10 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:59780 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726534AbgCMMuK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 08:50:10 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02DClBB5009053;
        Fri, 13 Mar 2020 13:50:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=j35mJ3ri135kHou00lXuY3AxjlbeJipjZQDtYU8870M=;
 b=0Co1yOfCyVApMI/AS97ntTQqFT1z0Pf8cuWFQiHfpY7DeLhfUMIVCK7EiLgT3ZA7mB9m
 AAW1APKTuMfozG32i5vhXB6vD5oNbAX9AvFvLQ9bWtbyrWU71LAPd92cAwPt8Rgxqh/S
 8FjDuSBvraZ8Cde7WlDOI3SYYdoR69ZFadrBpcIfxsJ9bErOKo+sZG+v+bHrMGNzlko1
 gROem7gFD6CpD6FwP47d/JMMAqHICn+dZwaOaoC2dGSAKX4Hs0hr3SKi3J0/TnPZre9W
 EKykdUNnZC4o+0PurlE4GVkQGN6ual/pH0YGgvzMuP307tqz4IP71rt31Frhhk6q/ppC ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yqt82gm30-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Mar 2020 13:50:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B557100034;
        Fri, 13 Mar 2020 13:49:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47B572A7F68;
        Fri, 13 Mar 2020 13:49:56 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 13 Mar
 2020 13:49:55 +0100
Subject: Re: [PATCH] ARM: dts: stm32: set i2c4 bus freq to 400KHz on
 stm32mp157c-ed1
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1581355041-13845-1-git-send-email-alain.volmat@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <9c127dfe-d171-8967-3227-3dafc358277f@st.com>
Date:   Fri, 13 Mar 2020 13:49:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581355041-13845-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-13_04:2020-03-12,2020-03-13 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

On 2/10/20 6:17 PM, Alain Volmat wrote:
> On this board, the I2C4 bus has only a single slave (pmic) which
> supports I2C Fast Mode hence setting bus frequency to 400 KHz.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c-ed1.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> index 209dae010be4..ac4f7ee4ad55 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> @@ -135,6 +135,7 @@
>   	pinctrl-0 = <&i2c4_pins_sleep_a>;
>   	i2c-scl-rising-time-ns = <185>;
>   	i2c-scl-falling-time-ns = <20>;
> +	clock-frequency = <400000>;
>   	status = "okay";
>   	/* spare dmas for other usage */
>   	/delete-property/dmas;
> 

Applied on stm32-next.

Thanks.
Alex
