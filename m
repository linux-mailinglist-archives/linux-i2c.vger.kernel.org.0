Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16779311521
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhBEWYC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:24:02 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:53432 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230088AbhBEO1N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 09:27:13 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 115EosxG001254;
        Fri, 5 Feb 2021 15:57:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aWDWtjgjvIr2y3zTvyZfIzBb+OyjkthoLMM6dyPBcVE=;
 b=oxIa9uWsFM5obMv0fBgVcd9iyGG0c1i0xPxb4Z2ZRFlbzEF0xK6gqmOeQPvB+U54HasS
 KAmL9hx2l0mTSb7/lfJq8QldK7bT7E4ls2fdAE7CZjk+AZWOgLJ3KoAdHiAeCOZ7T2V5
 Ws8c/e9PIt+HhbVB9cb/XzCrz+vNLM9ck2bPnqXbeiXK2YZmb0p4LzklbDIjXgY3P4sf
 Dz+6MBeul8NArDWkhNO1QbdM9iAe3c2vek80OZbKTD9IuzufBf4HHPrthH4RBAHOvnF7
 bMg+SlFCc3ceT6HFRF4r0AY/6TtLgtlAxTQ1CxB0XUVIZ7Sx6X6yyucSoy3UjJuZhTJw OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36ey7hh1j7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Feb 2021 15:57:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BE6B100034;
        Fri,  5 Feb 2021 15:57:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 219BA2402BB;
        Fri,  5 Feb 2021 15:57:48 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 15:57:47 +0100
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Subject: Re: [PATCH 0/5] i2c: stm32: filter binding support & debug info
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
Message-ID: <4addb8e0-8fcb-d713-065d-858698f3d493@foss.st.com>
Date:   Fri, 5 Feb 2021 15:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-05_09:2021-02-05,2021-02-05 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all

Looks good to me

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards
On 2/5/21 9:51 AM, Alain Volmat wrote:
> This serie add support for the analog and digital filter binding
> for the stm32f7 i2c driver.
> An additional patch add also debug informations, displayed in case
> of errors.
> 
> Alain Volmat (5):
>   i2c: stm32f7: fix configuration of the digital filter
>   i2c: stm32f7: support DT binding i2c-analog-filter
>   i2c: stm32f7: add support for DNF i2c-digital-filter binding
>   ARM: dts: stm32: enable the analog filter for all I2C nodes in
>     stm32mp151
>   i2c: stm32f7: indicate the address being accessed on errors
> 
>  arch/arm/boot/dts/stm32mp151.dtsi |  6 +++
>  drivers/i2c/busses/i2c-stm32f7.c  | 63 ++++++++++++++++++++-----------
>  2 files changed, 46 insertions(+), 23 deletions(-)
> 

-- 
--
~ Py MORDRET
--
