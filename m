Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F25727574
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 05:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjFHDI0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 23:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbjFHDIW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 23:08:22 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7D1268E
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 20:08:18 -0700 (PDT)
X-ASG-Debug-ID: 1686193690-086e2331350f620001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id KAV45lAFIBfU0ItV (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 08 Jun 2023 11:08:10 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 8 Jun
 2023 11:08:10 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 8 Jun
 2023 11:08:09 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <689522d4-b7b3-59ee-685d-fa88315dbde6@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Thu, 8 Jun 2023 11:08:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
To:     Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
 <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
 <87c0be06-0ac4-5d34-671c-5668739bdb8b@zhaoxin.com>
 <4c2d8675-5cc0-ec6e-f352-b032600b9469@kernel.org>
Content-Language: en-US
From:   Hans Hu <HansHu-oc@zhaoxin.com>
Reply-To: <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
In-Reply-To: <4c2d8675-5cc0-ec6e-f352-b032600b9469@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1686193690
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 892
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109749
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

Hi Krzysztof,


On 2023/6/7 21:55, Krzysztof Kozlowski wrote:
>>>> +static int zxi2c_probe(struct platform_device *pdev)
>>>> +{
>>>> +	int error;
>>>> +	struct zxi2c *i2c;
>>>> +	struct pci_dev *pci;
>>>> +	struct device *dev;
>>>> +
>>>> +	/* make sure this is zhaoxin platform */
>>> Why? How can you match to different platform?
>>>
>> In case a platform device named "IIC1D17" is also reported on
>> non-zhaoxin platform, this driver may also be registered successfully,
>> even if it shouldn't. In theory.
> Why shouldn't it be registered on other platform? It's the same device,
> isn't it?


Sorry I didn't make myself clear. I mean, if there is another
non-zhaoxin I2C device with a same reported HID name of 'IIC1D17',
this driver shouldn't it be registered. Because it's not the same device.


Thank you,

Hans

>
>
> Best regards,
> Krzysztof
>
