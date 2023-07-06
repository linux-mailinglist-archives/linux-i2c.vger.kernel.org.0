Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9408F7496A1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 09:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbjGFHkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 03:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjGFHkP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 03:40:15 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7813B1FDF
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jul 2023 00:39:48 -0700 (PDT)
X-ASG-Debug-ID: 1688628327-1eb14e179e12830001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id o2CoKKfPA8HsDFY6 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 06 Jul 2023 15:25:27 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 6 Jul
 2023 15:25:26 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 6 Jul
 2023 15:25:25 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <3a884910-80c4-4a85-5582-454f28740c41@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Thu, 6 Jul 2023 15:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6] i2c: add support for Zhaoxin I2C controller
To:     Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v6] i2c: add support for Zhaoxin I2C controller
References: <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
 <20230614094858.317652-1-hanshu-oc@zhaoxin.com> <ZJVcNIDWEbB6Jq7a@shikoro>
 <a12f9bb4-835f-ea18-307f-4aa5ce36f61c@zhaoxin.com>
 <20230630080159.wvt5loiq66tuo24z@intel.intel>
 <6f3479fb79944d5a8b4a562d67c82a4b@zhaoxin.com>
 <1abb34e5cbe74514911598a5a522045b@zhaoxin.com>
Content-Language: en-US
CC:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, <TonyWWang@zhaoxin.com>,
        <cobechen@zhaoxin.com>, <linux-i2c@vger.kernel.org>
From:   Hans Hu <HansHu-oc@zhaoxin.com>
Reply-To: <20230630080159.wvt5loiq66tuo24z@intel.intel>
In-Reply-To: <1abb34e5cbe74514911598a5a522045b@zhaoxin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1688628327
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1748
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.110988
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,


>>>> + * registers
>>>> + */
>>>> +/* I2C MMIO Address Constants */
>>>> +#define ZXI2C_CR_L                     0x00
>>>> +#define   ZXI2C_CPU_RDY          BIT(3)
>>>> +#define   ZXI2C_TX_END           BIT(2)
>>>> +#define   ZXI2C_RX_ACK           BIT(1)
>>> The register layout looks similar to the i2c-wmt driver. Could this
>>> driver maybe be reused for your hardware? I'll stop reviewing here
>>> because we need to have that clear first.
>>>
>>> Thank you and happy hacking,
>>>
>>>      Wolfram
>>>
>> I just learned that they are indeed derived from the same VIA I2C IP.
>> The relationship between WonderMedia/VIA/Zhaoxin looks like this:
>> * The i2c-wmt.c driver is used on the WonderMedia/VT8500 platform,
>>    an ARM-based SOC from VIA. This SOC hasn't been updated in years.
>>    Its MAINTAINERS are also Orphan.
>> * Lots of VIA IP is now owned by Zhaoxin, including I2C, SMBus, etc.
>>    Zhaoxin adds some new features on the basis of the original I2C IP,
>>    such as FIFO mode. And there are plans to continue adding new
>>    features.
>>
>> Based on this information, we thought it might be more maintainable to
>> create a new driver file.
> I think I commented about this some times ago but then forgot.
> The two drivers are, indeed, very similar.
>
> We could eventually create a *-common.{c,h} file.
>
> Andi

I was wondering why I didn't receive your reply, it turned out that
I was not on the mailing list, probably caused by mail system issue.

I also recently learned that this is an old IP and that there is
a driver in the kernel already. I will do some experiments here,
create a *-common.{c,h} file, and verify the results are ok.

Thank you,
Hans
