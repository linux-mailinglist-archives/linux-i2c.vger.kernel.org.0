Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF302571A82
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 14:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbiGLMw2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jul 2022 08:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbiGLMwY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 08:52:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5213AB3D5C;
        Tue, 12 Jul 2022 05:52:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EFFFC61707;
        Tue, 12 Jul 2022 12:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529D0C341CA;
        Tue, 12 Jul 2022 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657630343;
        bh=CZjOFtcsRU4tBiWJ7CtJh3EtYkC4QzT0yP++sYR6tgo=;
        h=Date:Subject:From:To:References:In-Reply-To:From;
        b=B+u2WqNBosq/zXqBeLc8uz7K0IPDAxthTXWNWQVyYcaihM3D2c5qpKBv94OnUNiIH
         wIQ9z2zWl52Yo8TXjwmzdfbI0xqCl/b89BOea7x4rO4OKdZDFZkCk29zSgj+LwpKZZ
         pU+sAWKbraC+jSNwTgtBkhoU9/3U41wTyh63Yeh5WFLLlr2YsqEhj64iYOLzrOzblJ
         MWhSCrRbcybF4UKInRZyfTIOGeJTXJ9VQSDdXOgeGMRXgWnP5O6JtKC0tJWvpPd1ui
         kcGFI9KZiFYp37t7tYlQbSSD2PbUmsDn/NKEDCDH10P8w1JNV30SLR9NIoxUJqfYTi
         pVDhZMeM3r36A==
Message-ID: <124806c0-4189-0280-ce9a-80cafb238c7d@kernel.org>
Date:   Tue, 12 Jul 2022 07:52:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        christopher.hatch@intel.com
References: <20220620230109.986298-1-dinguyen@kernel.org>
 <YrI6EeVkkWVMNPFY@shikoro> <928b2996-b2e7-d847-0e20-7e19df3cbf03@kernel.org>
 <YrN2lxvlP4cWfelY@kunai> <c765455f-c1b9-2da0-675e-591f7c268d99@kernel.org>
In-Reply-To: <c765455f-c1b9-2da0-675e-591f7c268d99@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/12/22 07:41, Dinh Nguyen wrote:
> Hi Wolfram,
> 
> On 6/22/22 15:07, Wolfram Sang wrote:
>>
>>>  From the original code, the first mechanism to a recovery is to 
>>> acquire a
>>> GPIO for the SCL line and send the 9 SCL pulses, after that, it does 
>>> a reset
>>> of the I2C module. For the SOCFPGA part, there is no GPIO line for 
>>> the SCL,
>>> thus the I2C module cannot even get a reset. This code allows the 
>>> function
>>> to reset the I2C module for SOCFPGA, which is the 2nd part of the 
>>> recovery
>>> process.
>>
>> The second part is totally useless if the client device is holding SDA
>> low. Which is exactly the situation that recovery tries to fix. As I
>> said, if you can't control SCL, you don't have recovery.
>>
> 
> This is recovery of the master and not the slave.  We have a customer 
> that is the using I2C with the signals routed through the FPGA, and thus 
> are not GPIO. During a timeout, with this code, the driver is able to 
> recover the master.
> 

Adding a bit more, because of patch:

ca382f5b38f3 ("i2c: designware: add i2c gpio recovery option")

the driver is now not able to reset the controller at all because it has 
placed a strict dependency on getting a GPIO. Before this patch, during 
a timeout, there was a simple call to i2c_dw_init_master(), which 
ultimately resets the master.

Dinh
