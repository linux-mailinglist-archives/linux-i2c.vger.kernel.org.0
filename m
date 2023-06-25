Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8B673D03D
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Jun 2023 12:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjFYK53 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Jun 2023 06:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjFYK51 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Jun 2023 06:57:27 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0274A0
        for <linux-i2c@vger.kernel.org>; Sun, 25 Jun 2023 03:57:24 -0700 (PDT)
X-ASG-Debug-ID: 1687690641-1eb14e179f03b80001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id UEtmuPJB2cVyRDHU (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Sun, 25 Jun 2023 18:57:21 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sun, 25 Jun
 2023 18:57:21 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sun, 25 Jun
 2023 18:57:19 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <a12f9bb4-835f-ea18-307f-4aa5ce36f61c@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Sun, 25 Jun 2023 18:57:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6] i2c: add support for Zhaoxin I2C controller
To:     Wolfram Sang <wsa@kernel.org>, <andi.shyti@kernel.org>,
        <krzk@kernel.org>, <TonyWWang@zhaoxin.com>, <cobechen@zhaoxin.com>,
        <linux-i2c@vger.kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v6] i2c: add support for Zhaoxin I2C controller
References: <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
 <20230614094858.317652-1-hanshu-oc@zhaoxin.com> <ZJVcNIDWEbB6Jq7a@shikoro>
Content-Language: en-US
From:   Hans Hu <HansHu-oc@zhaoxin.com>
Reply-To: <ZJVcNIDWEbB6Jq7a@shikoro>
In-Reply-To: <ZJVcNIDWEbB6Jq7a@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1687690641
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 2259
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0065 1.0000 -1.9786
X-Barracuda-Spam-Score: -1.98
X-Barracuda-Spam-Status: No, SCORE=-1.98 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.110512
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,HK_RANDOM_REPLYTO,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,


On 2023/6/23 16:47, Wolfram Sang wrote:
> Hi,
>
> thank you for submitting this driver!
>
>> diff --git a/drivers/i2c/busses/i2c-zhaoxin.c b/drivers/i2c/busses/i2c-zhaoxin.c
>> new file mode 100644
>> index 000000000000..bd5432bec7be
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-zhaoxin.c
>> @@ -0,0 +1,599 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + *  i2c-zhaoxin-i2c.c - Zhaoxin I2C controller driver
> This doesn't match the real file name anymore. I suggest to leave out
> the filename completely.
>

will leave out the filename completely.


>> + *
>> + *  Copyright(c) 2023 Shanghai Zhaoxin Semiconductor Corporation.
>> + *                    All rights reserved.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/i2c.h>
>> +#include <linux/pci.h>
>> +#include <linux/platform_device.h>
> Some includes are missing here. For example, module.h as you are using
> some of its functionality directly. Probably some more includes are
> needed.


include files that are directly referenced will be added.


>> + * registers
>> + */
>> +/* I2C MMIO Address Constants */
>> +#define ZXI2C_CR_L                     0x00
>> +#define   ZXI2C_CPU_RDY          BIT(3)
>> +#define   ZXI2C_TX_END           BIT(2)
>> +#define   ZXI2C_RX_ACK           BIT(1)
> The register layout looks similar to the i2c-wmt driver. Could this
> driver maybe be reused for your hardware? I'll stop reviewing here
> because we need to have that clear first.
>
> Thank you and happy hacking,
>
>     Wolfram
>

I just learned that they are indeed derived from the same VIA I2C IP.
The relationship between WonderMedia/VIA/Zhaoxin looks like this:
* The i2c-wmt.c driver is used on the WonderMedia/VT8500 platform,
   an ARM-based SOC from VIA. This SOC hasn't been updated in years.
   Its MAINTAINERS are also Orphan.
* Lots of VIA IP is now owned by Zhaoxin, including I2C, SMBus, etc.
   Zhaoxin adds some new features on the basis of the original I2C IP,
   such as FIFO mode. And there are plans to continue adding new
   features.

Based on this information, we thought it might be more maintainable
to create a new driver file.

Thank you,
Hans


