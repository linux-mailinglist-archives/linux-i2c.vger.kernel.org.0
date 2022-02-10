Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A284B168D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 20:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234709AbiBJTuv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 14:50:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiBJTuv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 14:50:51 -0500
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814E75F58
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 11:50:50 -0800 (PST)
Received: from [192.168.1.18] ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id IFSlnMAn4FTgbIFSmnLNW6; Thu, 10 Feb 2022 20:50:48 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 10 Feb 2022 20:50:48 +0100
X-ME-IP: 90.126.236.122
Message-ID: <7260c0a6-6771-6dd6-2c1d-43c1b70d2699@wanadoo.fr>
Date:   Thu, 10 Feb 2022 20:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] i2c: bcm2835: Fix the error handling in
 'bcm2835_i2c_probe()'
Content-Language: fr
To:     Wolfram Sang <wsa@kernel.org>, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com, nsaenz@kernel.org,
        krzk@kernel.org, stefan.wahren@i2se.com, nh6z@nh6z.net,
        eric@anholt.net, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <338008c444af4785a07fb5a402b60225a4964ae9.1629484876.git.christophe.jaillet@wanadoo.fr>
 <YgExAGEN91QEnObO@shikoro>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YgExAGEN91QEnObO@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 07/02/2022 à 15:47, Wolfram Sang a écrit :
> On Fri, Aug 20, 2021 at 08:43:33PM +0200, Christophe JAILLET wrote:
>> Some resource should be released if an error occurs in
>> 'bcm2835_i2c_probe()'.
>> Add an error handling path and the needed 'clk_disable_unprepare()' and
>> 'clk_rate_exclusive_put()' calls.
>>
>> While at it, rework the bottom of the function to use this newly added
>> error handling path and have an explicit and more standard "return 0;" at
>> the end of the normal path.
>>
>> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Sadly, noone tested it but I think it is good to avoid the resource
> leaks. So, rebased and applied to for-next, thanks! Please kindly check
> if I rebased correctly the irq error case (once I pushed out).
> 

LGTM.

CJ
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

