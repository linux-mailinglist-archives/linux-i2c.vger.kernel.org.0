Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C90184736
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 13:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgCMMtb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 08:49:31 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:2678 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726655AbgCMMta (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 08:49:30 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02DCmfLG023752;
        Fri, 13 Mar 2020 13:49:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=CcNbvyWT8YbgbTbfcBrr6mQAfjtlUg8BoiN/XYnnNpg=;
 b=ffRTEwV3eLtpJsKwvTTf0ZepigM0uAvelLzcsr9ANg7n+xODervmIJPeZ8CX3IU2TSqa
 XHjSpBlIsaw2c8J1aP7nfezfGjN9BTn+lwMTR6AgrC5hmN/p9R9o1Fj0ci0ouqW+vmCy
 yMIk0bYTSAyujNLDMAKRcupvyYsSDLIEvgZ1+gmhECp5kaOUGbXvILQglJiw2liZoVjA
 aGeMxNBxJ3x2h7rMe80Ee+jACEezdKlC7fvF4K8hVw90wlX/PbPNp3fmLvzO6ha2M2QH
 1MxHgKi9C+nvqRuXTssIwMRrQ/4TLxjM04hwlIpmCf4yaR/KsLl0NNi9C7Wpj3vZvbFL aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yqt7t0m86-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Mar 2020 13:49:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A882410002A;
        Fri, 13 Mar 2020 13:49:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DE312A7F68;
        Fri, 13 Mar 2020 13:49:08 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 13 Mar
 2020 13:49:07 +0100
Subject: Re: [PATCH 0/6] i2c-stm32f7: support suspend/resume & wakeup
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <0c852ecf-fab4-6df7-1f27-f80b3f2e2f48@st.com>
Date:   Fri, 13 Mar 2020 13:49:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-13_04:2020-03-12,2020-03-13 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

On 1/6/20 2:28 PM, Alain Volmat wrote:
> This serie replaces the previously sent serie "stm32: i2c: Add suspend/resume & add sleep pinctrls".
> 
> This serie adds support for pm sleep suspend / resume and allow I2C slave to be
> a wakeup-source for the system.
> 
> Alain Volmat (6):
>    ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp15xx-dkx
>    ARM: dts: stm32: add i2c2/i2c5 sleep pinctrl on stm32mp157c-ev1
>    ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157c-ed1
>    i2c: i2c-stm32f7: add PM_SLEEP suspend/resume support
>    i2c: i2c-stm32f7: allow controller to be wakeup-source
>    ARM: dts: stm32: add wakeup-source in all I2C nodes of stm32mp157c
> 
>   arch/arm/boot/dts/stm32mp151.dtsi      |   6 ++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts  |   3 +-
>   arch/arm/boot/dts/stm32mp157c-ev1.dts  |   6 +-
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi |   3 +-
>   drivers/i2c/busses/i2c-stm32f7.c       | 187 ++++++++++++++++++++++++++++++++-
>   5 files changed, 196 insertions(+), 9 deletions(-)
> 

DT patches applied on stm32-next.

Regards
Alex
