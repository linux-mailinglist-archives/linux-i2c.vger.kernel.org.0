Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8974376522
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 14:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236639AbhEGMbF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 08:31:05 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44948 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233468AbhEGMbF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 08:31:05 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 147CRH1T009277;
        Fri, 7 May 2021 14:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jII+K+gNDTx+89b4wj12HRtrpKjsgBKJ3myLEsIFnbg=;
 b=JkLZmEhrSmvkUYlXI4kkl9wE/bqTpzVGvQzo1u2GdrODbjcilgcS6uHa+fFUYvaLy85l
 NYGYvte9tsZ/C/UcClxjyig+NOtwuJMmLqFBA1KHHEKCxPLecqwO5ZHUmPhGEmq6U8g4
 5WYPZjLqhVWt5ZLOgdmEfuzeQ30cLINu5gJaoozKNVDkMz/nCNlxcAdhRcP+ZYh5dfXu
 myNzx3ny1pbL0dLkoapCaZ4hUD04okH7N8I0kn6BsDQ7YJMLHnNMdAYjqr/dSqukcg28
 zrzMGxqcHpBJyhpvKYF0Ghg9LgF74JAUnJ6I9VquT03EiYv4hlYNCysQV1DsaYAQKLmH qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38csqbux09-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 May 2021 14:29:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D711810002A;
        Fri,  7 May 2021 14:29:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C02C7221050;
        Fri,  7 May 2021 14:29:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May
 2021 14:29:38 +0200
Subject: Re: [Linux-stm32] [PATCH v4 4/4] i2c: stm32f4: Fix stmpe811 get xyz
 data timeout issue
To:     dillon min <dillon.minfei@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        <pierre-yves.mordret@foss.st.com>, <alain.volmat@foss.st.com>
CC:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <Alexandre.torgue@foss.st.com>,
        <pierre-yves.mordret@st.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <p.zabel@pengutronix.de>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
 <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LJPnxA0JSmV3mogvPA5xRRYCO_4=P7pqpAO7R=YaJX5g@mail.gmail.com>
 <20210315130050.GD1182@ninjato>
 <CAL9mu0LnHAUSMXmQpZK78QAccqrc58cyFC2GD4cBkTNW41rvKA@mail.gmail.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ff2bc09d-1a17-50d4-d3ee-16fd3a86d7f1@foss.st.com>
Date:   Fri, 7 May 2021 14:29:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0LnHAUSMXmQpZK78QAccqrc58cyFC2GD4cBkTNW41rvKA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-07_04:2021-05-06,2021-05-07 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dillon

In order to test this patch, it's tricky to make a recent kernel running 
on stm32f429-disco as this board embeds only 8MB of SDRAM and 2MB of flash.

Can you indicates us which kernel version you are using and also the kernel config please ?

Thanks

Patrice

On 5/7/21 4:54 AM, dillon min wrote:
> Hi Pierre-Yves, Alain
> 
> Could you help to take a look?
> i really appreciate it.
> 
> Thanks,
> 
> Best Regards
> Dillon
> 
> On Mon, Mar 15, 2021 at 9:00 PM Wolfram Sang <wsa@kernel.org> wrote:
>>
>> On Mon, Mar 15, 2021 at 08:43:54PM +0800, dillon min wrote:
>>> Hi All,
>>>
>>> Just a gentle ping.
>>
>> Pierre-Yves?
>>
>>>
>>> Regards.
>>>
>>> On Tue, Jun 9, 2020 at 9:27 PM <dillon.minfei@gmail.com> wrote:
>>>>
>>>> From: dillon min <dillon.minfei@gmail.com>
>>>>
>>>> as stm32f429's internal flash is 2Mbytes and compiled kernel
>>>> image bigger than 2Mbytes, so we have to load kernel image
>>>> to sdram on stm32f429-disco board which has 8Mbytes sdram space.
>>>>
>>>> based on above context, as you knows kernel running on external
>>>> sdram is more slower than internal flash. besides, we need read 4
>>>> bytes to get touch screen xyz(x, y, pressure) coordinate data in
>>>> stmpe811 interrupt.
>>>>
>>>> so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
>>>> in xip mode, have to adjust 'STOP/START bit set position' from last
>>>> two bytes to last one bytes. else, will get i2c timeout in reading
>>>> touch screen coordinate.
>>>>
>>>> to not take side effect, introduce IIC_LAST_BYTE_POS to support xip
>>>> kernel or has mmu platform.
>>>>
>>>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
>>>> ---
>>>>
>>>> V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
>>>>
>>>>  drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
>>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
>>>> index d6a69dfcac3f..97cf42ae7fa0 100644
>>>> --- a/drivers/i2c/busses/i2c-stm32f4.c
>>>> +++ b/drivers/i2c/busses/i2c-stm32f4.c
>>>> @@ -93,6 +93,12 @@
>>>>  #define STM32F4_I2C_MAX_FREQ           46U
>>>>  #define HZ_TO_MHZ                      1000000
>>>>
>>>> +#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
>>>> +#define IIC_LAST_BYTE_POS 1
>>>> +#else
>>>> +#define IIC_LAST_BYTE_POS 2
>>>> +#endif
>>>> +
>>>>  /**
>>>>   * struct stm32f4_i2c_msg - client specific data
>>>>   * @addr: 8-bit slave addr, including r/w bit
>>>> @@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>>>>         int i;
>>>>
>>>>         switch (msg->count) {
>>>> -       case 2:
>>>> +       case IIC_LAST_BYTE_POS:
>>>>                 /*
>>>>                  * In order to correctly send the Stop or Repeated Start
>>>>                  * condition on the I2C bus, the STOP/START bit has to be set
>>>> @@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>>>>                 else
>>>>                         stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
>>>>
>>>> -               for (i = 2; i > 0; i--)
>>>> +               for (i = IIC_LAST_BYTE_POS; i > 0; i--)
>>>>                         stm32f4_i2c_read_msg(i2c_dev);
>>>>
>>>>                 reg = i2c_dev->base + STM32F4_I2C_CR2;
>>>> @@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>>>>
>>>>                 complete(&i2c_dev->complete);
>>>>                 break;
>>>> -       case 3:
>>>> +       case (IIC_LAST_BYTE_POS+1):
>>>>                 /*
>>>>                  * In order to correctly generate the NACK pulse after the last
>>>>                  * received data byte, we have to enable NACK before reading N-2
>>>> --
>>>> 2.7.4
>>>>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> 
