Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43036316153
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 09:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhBJIp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 03:45:29 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:52996 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230127AbhBJIkc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Feb 2021 03:40:32 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11A8Uspd032146;
        Wed, 10 Feb 2021 09:39:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IdIphRq0oo03Upaifx4Sr2lddUG/YQLMaBXzjBtS7BU=;
 b=0YLLFZjDT3TCALs25fy5Dia6PQlM89y1hFyTr9xH1csDL1FClrZcu7NHicXWytBBXhnq
 DBTtzv5gLl+JnY5n8TRI4fR7mTibaaJUNDMJtjIi8VNIRX1q4aNXzL9sCXMW+56zuV0l
 8GMv9ym9beQXLVombOk8VtrYlGdAQ6p8ScSjOPx3bWgb7H4hsOtw1Dv14xooRARK+4nq
 MOqBc/mWcN1k3zJZk6CQxF0L5TS38O6iYrUCEtSr4lPxM6wEKYggHOTmFZsajyIMgw+w
 lVunJuS/RA1ODu/slEkxlbkKHPaHion/Vs/M3ap1w5WFEGFPl8hYttVdc+rwA9f1h7IP Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36hr2ceg1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Feb 2021 09:39:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0781410002A;
        Wed, 10 Feb 2021 09:39:33 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E14A921CA9C;
        Wed, 10 Feb 2021 09:39:32 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.122) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 09:39:31 +0100
Subject: Re: [PATCH 4/5] ARM: dts: stm32: enable the analog filter for all I2C
 nodes in stm32mp151
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <59aec92b-9e5d-b9e9-0fee-d14d50281d4b@foss.st.com>
Date:   Wed, 10 Feb 2021 09:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-10_02:2021-02-09,2021-02-10 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello

Looks good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Thx
Regards


On 2/5/21 9:51 AM, Alain Volmat wrote:
> Enable the analog filter for all I2C nodes of the stm32mp151.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 3c75abacb374..558fc8fb38b6 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -493,6 +493,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x1>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -508,6 +509,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x2>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -523,6 +525,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x4>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -538,6 +541,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x10>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -1533,6 +1537,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x8>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -1570,6 +1575,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x20>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> 

-- 
--
~ Py MORDRET
--
