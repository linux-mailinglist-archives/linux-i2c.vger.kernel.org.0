Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC78D1BC530
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 18:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgD1QaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 12:30:16 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:1272 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728103AbgD1QaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 12:30:16 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03SGSJs9028011;
        Tue, 28 Apr 2020 18:30:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=NGkABTisrRFiR0U388ihye531O2dm6SDun433lkNoMA=;
 b=RkCcn1JCuaitkxrH921aZVHoXEJ9ZfE3vWn0dSduBNt56e6FiXSpymRcVgwq5wgWxdAP
 3yaF2ZciHRHwbsYkHaJbXc41GQbtN/h/yIDl2951ZXz9z1HNKA5LWcZe56OiQxap9NnB
 Grq1+mV1tC76LL3K89lYZEGq1qla4YVIxDgovh/BJ/+HsiUPbRHOEQC+8AsDlVJYXBO7
 MtMUin0osCda6vVrjZiSdHghI5dGIVVcs7LyCZ8WWISEdyjNpUSmVTWVVSrAlMBPl8WX
 CVbGyARjcpIcBzP6ZoXJR6l68nM0FUbp6qZqWjn+AB/aUYEjuTTuUgnWQCYlFLDikGmD QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30mhq61361-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Apr 2020 18:30:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1C5D10002A;
        Tue, 28 Apr 2020 18:30:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A74702B22EB;
        Tue, 28 Apr 2020 18:30:02 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Apr
 2020 18:29:57 +0200
Subject: Re: [PATCH 0/5] i2c: i2c-stm32f7: enhance FastModePlus support
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <baec4a71-3616-5c55-a528-6c79e49b8255@st.com>
Date:   Tue, 28 Apr 2020 18:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-28_11:2020-04-28,2020-04-28 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

On 1/23/20 5:12 PM, Alain Volmat wrote:
> This serie enhance Fast Mode Plus support in the i2c-stm32f7 driver
> (support suspend/resume) and add the support for the stm32mp15 SoC
> that has new syscfg bits.
> 
> Alain Volmat (5):
>    i2c: i2c-stm32f7: disable/restore Fast Mode Plus bits in low power
>      modes
>    dt-bindings: i2c: i2c-stm32f7: add st,stm32mp15-i2c compatible
>    i2c: i2c-stm32f7: add a new st,stm32mp15-i2c compatible
>    ARM: dts: stm32: use st,stm32mp15-i2c compatible for stm32mp151
>    ARM: dts: stm32: add Fast Mode Plus info in I2C nodes of stm32mp151
> 
>   .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  6 +-
>   arch/arm/boot/dts/stm32mp151.dtsi                  | 18 ++++--
>   drivers/i2c/busses/i2c-stm32f7.c                   | 75 +++++++++++++++++++---
>   3 files changed, 83 insertions(+), 16 deletions(-)
> 

patches [4][5] (DT) applied on stm32-next.


Thanks.
Alex
