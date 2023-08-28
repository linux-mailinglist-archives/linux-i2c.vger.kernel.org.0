Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DC978A4AD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 04:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjH1Cmw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Aug 2023 22:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjH1Cmq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Aug 2023 22:42:46 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BD2107
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 19:42:42 -0700 (PDT)
X-ASG-Debug-ID: 1693190560-1eb14e751404710001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id 3931MwTV5SYwF9CT (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 28 Aug 2023 10:42:40 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 10:42:40 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 10:42:38 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <744e7a46-066f-738f-69cc-9f2374be2fba@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Mon, 28 Aug 2023 10:42:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] i2c: wmt: split out i2c-viai2c-common.{c,h}
To:     Wolfram Sang <wsa@kernel.org>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>,
        <TonyWWang@zhaoxin.com>
X-ASG-Orig-Subj: Re: [PATCH v2 1/2] i2c: wmt: split out i2c-viai2c-common.{c,h}
References: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
 <fdd2968e0ae028ce3d4cf389e4e2d55a4641c0d7.1691999569.git.hanshu-oc@zhaoxin.com>
 <ZOkI62MZee+3HR6n@shikoro>
Content-Language: en-US
From:   Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZOkI62MZee+3HR6n@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1693190560
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1729
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.113330
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2023/8/26 04:02, Wolfram Sang wrote:
> Hi!
>
> first of all, thank you for reworking your driver to share common code
> with the WMT driver. This effort is much appreciated and we are close to
> go, I think. But some remarks.
>
>> +config I2C_VIAI2C_COMMON
>> +	tristate
>> +
>>   config I2C_WMT
>>   	tristate "Wondermedia WM8xxx SoC I2C bus support"
>>   	depends on ARCH_VT8500 || COMPILE_TEST
>> +	select I2C_VIAI2C_COMMON
>>   	help
>>   	  Say yes if you want to support the I2C bus on Wondermedia 8xxx-series
>>   	  SoCs.
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index af56fe2c75c0..b7e20c3531b5 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -120,6 +120,7 @@ obj-$(CONFIG_I2C_TEGRA_BPMP)	+= i2c-tegra-bpmp.o
>>   obj-$(CONFIG_I2C_UNIPHIER)	+= i2c-uniphier.o
>>   obj-$(CONFIG_I2C_UNIPHIER_F)	+= i2c-uniphier-f.o
>>   obj-$(CONFIG_I2C_VERSATILE)	+= i2c-versatile.o
>> +obj-$(CONFIG_I2C_VIAI2C_COMMON)	+= i2c-viai2c-common.o
>>   obj-$(CONFIG_I2C_WMT)		+= i2c-wmt.o
>>   i2c-octeon-objs := i2c-octeon-core.o i2c-octeon-platdrv.o
>>   obj-$(CONFIG_I2C_OCTEON)	+= i2c-octeon.o
> I'd prefer to link the core object to the driver object like pasemi or
> octeon do. Or is there an argument for having a seperate module?
There are two main reasons:
1. I checked the MAINTAINERS section related to ARM/VT8500,
Found that the entire ARM/VT8500 ARCHITECTURE is currently
unmaintained, maybe one day it will be removed from the kernel.
So I think it might be better as a separate module.
2. In addition, if not separated from wmt, the driver would
become a bit confusing and difficult to maintain.
> Regards!
>
