Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D0278A669
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 09:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjH1HZt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 03:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjH1HZU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 03:25:20 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C8AF1
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 00:25:16 -0700 (PDT)
X-ASG-Debug-ID: 1693207514-1eb14e751404de0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id EApGS2EddAhEKoyK (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 28 Aug 2023 15:25:14 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 15:25:14 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 15:25:13 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <fa22abcd-c100-c633-4625-5a2324e3337f@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Mon, 28 Aug 2023 15:25:11 +0800
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
 <ZOkI62MZee+3HR6n@shikoro> <744e7a46-066f-738f-69cc-9f2374be2fba@zhaoxin.com>
 <ZOw3+3njP/p8Ned5@ninjato>
Content-Language: en-US
From:   Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZOw3+3njP/p8Ned5@ninjato>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1693207514
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1368
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.113340
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2023/8/28 14:00, Wolfram Sang wrote:
>> 1. I checked the MAINTAINERS section related to ARM/VT8500,
>> Found that the entire ARM/VT8500 ARCHITECTURE is currently
>> unmaintained, maybe one day it will be removed from the kernel.
>> So I think it might be better as a separate module.
> But even if we remove the arch, we will not remove the viai2c core,
> right? We just remove the Makefile entry for WMT. And your driver will
> still link two object files into one kernel object.
>
>> 2. In addition, if not separated from wmt, the driver would
>> become a bit confusing and difficult to maintain.
> Ah, maybe this is the misunderstanding. The seperation from WMT is very
> good! It is just that the new viai2c core shouldn't be a module itself
> but only a seperate object file which gets linked into your driver.
> Please check the octeon or pasemi driver for an example.
>

Sorry about the misunderstanding, will change to like below:

i2c-zhaoxin-objs:= i2c-viai2c-common.o i2c-zhaoxin-plt.o
obj-$(CONFIG_I2C_ZHAOXIN)       += i2c-zhaoxin.o
i2c-wmt-objs:= i2c-viai2c-common.o i2c-wmt-plt.o
obj-$(CONFIG_I2C_WMT)           += i2c-wmt.o

But I'm not sure which way is more appropriate:
change file name i2c-wmt.c to i2c-wmt-plt.c.(I prefer this)
or
change config name CONFIG_I2C_WMT to CONFIG_I2C_WMT_PLT.

Hans

