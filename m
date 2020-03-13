Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8402E184741
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 13:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgCMMuV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 08:50:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:59864 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726534AbgCMMuV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 08:50:21 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02DClBBG009053;
        Fri, 13 Mar 2020 13:50:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=r4gx10/wtvNnRN5cGMpKMfyjngW05Zoe7Hit39sNOOI=;
 b=vsgXryl3gsHhysTHeFNVOvbdWiNlUdW0cEZqWoEBwuAtx9dMlhCnEfi1/5P/RApZgbKE
 cFQh5E/t/8unfbgFBVUzql5SDo5MBvM6I92G1WOpcqjzWwUcJsjgB2LhIUPkGK4XAsAv
 Phah9YYFe5kZnCjZgQkj8JUuhs3kjHxLI1jtmZ4X4Z/Iz2wLi6CJrJB2Z7fV6t3001op
 e7fXivhc9aGBE8JH6UpU/GXsCjU9aIsEtIr3Kfu4xCVIFDQVDiNHsKmwRPBY9eHrOq+j
 6ez0T8BGwCkFOybaUdKVuy2LE/0Qp96LR8FnLJIjTdqUvD/xY93n7gDmmsPenQDO7olc og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yqt82gm58-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Mar 2020 13:50:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E27DF100038;
        Fri, 13 Mar 2020 13:50:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CED582A7F68;
        Fri, 13 Mar 2020 13:50:11 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 13 Mar
 2020 13:50:10 +0100
Subject: Re: [PATCH] ARM: dts: stm32: set i2c4 bus freq to 400KHz on stm32mp15
 DK boards
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1581355056-13884-1-git-send-email-alain.volmat@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <7f8a5f6d-4d62-3649-efda-3d02f89a4d07@st.com>
Date:   Fri, 13 Mar 2020 13:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581355056-13884-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-13_04:2020-03-12,2020-03-13 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

On 2/10/20 6:17 PM, Alain Volmat wrote:
> On DK boards, all I2C4 bus slaves supports I2C Fast Mode hence setting
> the bus frequency to 400 KHz.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 7f5fcb2c5b03..2521f428ae67 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -221,6 +221,7 @@
>   	pinctrl-1 = <&i2c4_pins_sleep_a>;
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
