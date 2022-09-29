Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7534B5EFA53
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 18:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236298AbiI2QYF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 12:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbiI2QXq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 12:23:46 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E0E1EC9B2
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 09:21:16 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 685A73200921;
        Thu, 29 Sep 2022 12:21:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664468472; x=
        1664554872; bh=H64kTd7rbvlHD57K3DEsHCbHHfT0VecnAlpQmS00HlQ=; b=F
        mpLobVHy3onO61nbS9WulxzO4+dALSUK+TG0u+yYQI0T1Ev8U12LJiPkxL0q4L0y
        QQsuuRmncjGfnKe3mWMbwXbDsb4dP6jUmH94mvGvOOVVOSzZKjjZ4UFCa/Aqt1uA
        FPGVBqTWYxerBF8K46HUyEStZYhWWcEA0CQb4GkAK4BmTwLIrM3o6vj+lQgUI2VZ
        9eloX16j8OK2ZTnaiRmcO4b2Gg6uMMvt8ASPZKS0G6lt1u8b6o3i4pMjiX1ruxQj
        KfOhrtdnWFSLxfpjLuvM6r/KpR+GQd2qtCKjstOcF5ZIiMhD2P21Amo3uqjN5rzh
        uoW6LNwSAfabqU+EXcczA==
X-ME-Sender: <xms:-MU1Y5sIqqKJfiEC6DQkXWgIF2ufmOMiKk3hoKBDssDPqXvU2Mdnkw>
    <xme:-MU1YycI-6aSYVMMDZZlZJqlW5YPL9Yj5JhaOQSnrqRn4OTifPXhCC5hIzGO_i7li
    9_x-V9RAhyspAmsOiM>
X-ME-Received: <xmr:-MU1Y8zaie9NrUpk6LHVocR-QbFCWGk5pyIedi6fZhzNJrX2tQzeF1n_fNQGaKvPFcH06w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfhfhfevkffffgggjggtgfesthejrgdttdefjeenucfhrhhomhepufgr
    nhhfohhrugcutfhotghkohifihhtiicuoehrohgtkhhofihithiisehmihhnshhofhhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehleejffeitdekkeeuheduueelffeuudejleek
    jeeljefhffehheeijeeugfelleenucffohhmrghinhepnhhvihguihgrrdgtohhmpdguug
    gtuhhtihhlrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprhhotghkohifihhtiiesmhhinhhsohhfthdrtghomh
X-ME-Proxy: <xmx:-MU1YwPdOLn90IgWJ4l7nUMpF2XDFtknfQrYKFQg3YZrtYzZBRVJhw>
    <xmx:-MU1Y5-Qzoj_O_3rrIPXPNWKtnTnOI6iDoRlP3dlzOvG1OKg6OrkjA>
    <xmx:-MU1YwUKXYslr0BtBAdGcH-UmJ8GBPRIrWeSytozgjDeIn31pQMYLw>
    <xmx:-MU1Y-J400ZqVadQPE3RVdh9_OB-FcT07UlEHHdtFRE5ioONFv2d3w>
Feedback-ID: i954946e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:21:12 -0400 (EDT)
Subject: Re: i2c-dev mismatch with proprietary nvidia driver
To:     Wolfram Sang <wsa@kernel.org>
References: <6330FC96.5030908@minsoft.com> <YzSdhCrwjPwMr4DI@shikoro>
From:   Sanford Rockowitz <rockowitz@minsoft.com>
Cc:     linux-i2c@vger.kernel.org
Message-ID: <6335C5F7.40605@minsoft.com>
Date:   Thu, 29 Sep 2022 12:21:11 -0400
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.23)
 Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.666
MIME-Version: 1.0
In-Reply-To: <YzSdhCrwjPwMr4DI@shikoro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/28/2022 03:16 PM, Wolfram Sang wrote:
> Hi,
>
>> At approximately line 41 of nvidia driver file nv-i2c.c, in function
>> nv_i2c_algo_master_transfer(), there's an if-test for symbol I2C_M_DMA_SAFE.
>> If the symbol is not defined, a call to the function with the bit set fails
>> with error -EINVAL. The file includes "linux/i2c.h", so apparently there are
>> versions of I2c.h in which the flag is undefined.
> I2C_M_DMA_SAFE is a hint for controller drivers that the buffer is DMA
> capable. It is not something the controller driver needs to support
> actively. Bailing out on this flag is wrong. Do I need to mention that
> such misconceptions are the super-downside of out-of-tree drivers? (I
> know that you are only a user of this driver, so not your fault)
>
> Happy hacking,
>
>     Wolfram
>

Hello Wolfram,

Thanks for the clarification.  I've included the core of it in my post 
on [developer.nvidia.com]
(https://forums.developer.nvidia.com/t/nvidia-driver-i2c-dev-driver-i2c-failure/228966/2)
I'm not holding my breath for a fix any time soon.

I long ago gave up on using Nvidia video cards.  Building my own copy of 
the nvidia
driver was prone to failure due to mismatches between the kernel and the 
driver.
Unfortunately, I can't control the driver that users of ddcutil use. 
There's even
a [page on ddcutil's website](https://www.ddcutil.com/nvidia) devoted to
undocumented driver settings that are often needed for I2C.

I had simplified ddcutil's most recent release (1.3.0, which inter alia 
will be in
Ubuntu 22.10) to use onlythe i2c-dev's ioctl() interface. The amount of 
code
that had to go back in was both extensive and painful.

Regards,
Sanford


