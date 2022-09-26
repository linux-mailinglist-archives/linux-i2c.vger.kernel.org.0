Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A245E979F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 03:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiIZBM7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Sep 2022 21:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiIZBM6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Sep 2022 21:12:58 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEE227FC8
        for <linux-i2c@vger.kernel.org>; Sun, 25 Sep 2022 18:12:57 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id CE19F3200392
        for <linux-i2c@vger.kernel.org>; Sun, 25 Sep 2022 21:12:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 25 Sep 2022 21:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:feedback-id:feedback-id:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1664154776; x=1664241176; bh=aVmF38sMSPbIraClyFhDK2Xvbw2a
        OJ2w9YqqZx/HgNU=; b=uBgUr9/U9erNRiYoLpnjWwIzkYvkiPiHfFHpgazAhLQK
        19ipWM37EZJjWz0jcaK06Y560VeXs53J1oCMrn8uxFGOuCwQlMfwVrSqZ7COAnVe
        sYjP+DfOGZAB9Qvk6aYjAYrI9TrmztA1kmm0wn9ONh5qyBX0hXn5WB4PAnQYUEIp
        c9DmRF2QVKTNhWKFaTRX5/NXCpAGYru2r1N6+xDZPSa6oceeF+eRszDYr33PZFsT
        bCL7+/Qtmjkhe75PHqgUdzIO2sM/gs8Jh0CPx5YmrJawytDgG14fx/hijkCP8qBp
        tMf6oU5g5lnCuvRRL+bV1ap5QTZsQ/JABbhgZVT3rg==
X-ME-Sender: <xms:mPwwY0gfOLsOy8gv2a9-zNwDAzgmrH-16mcGp_SCDkzaa17GRYX-0w>
    <xme:mPwwY9AdVrEcy58Jc7xmKlmBGXL6ctG-wN6clPXcOsu1x2MRSVBas6u8inQuHXPQR
    9LEQ4muX_cNlLRNons>
X-ME-Received: <xmr:mPwwY8Hpk7N7feDgN0KQjJ8KxvqgeqPPUVezSLMfDBnZf1kPaXQ0H-Q3OnaNR9qXqYjE3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeguddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefvhffuohfkffgfgggtgfesthejrg
    dttdefjeenucfhrhhomhepufgrnhhfohhrugcutfhotghkohifihhtiicuoehrohgtkhho
    fihithiisehmihhnshhofhhtrdgtohhmqeenucggtffrrghtthgvrhhnpefhuefgveffke
    dvleeileeigffgjeeigfekgffggfelvedugedvudehjeeuheektdenucffohhmrghinhep
    nhhvihgurgdrtghomhdpghhithhhuhgsrdgtohhmpdguuggtuhhtihhlrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhotghkohif
    ihhtiiesmhhinhhsohhfthdrtghomh
X-ME-Proxy: <xmx:mPwwY1RZzXqfDX95zi-HH7SaNIU7t9xN-0VI-IIlD7FNm_kzBO-QRQ>
    <xmx:mPwwYxxFZDWe-7rSRw8lpY4dU11nSDs4kd3ZVSjWIYeAGO8DoRxwOA>
    <xmx:mPwwYz4xf1CjEcpo3uKA9rENRjBVhG94winK75JFafMW-uP5Hucw1g>
    <xmx:mPwwYw8rYscGAfEmyTtdJpYBP3ESsP2-iGi5ejjkwfxR8X3NU5V-cg>
Feedback-ID: i954946e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-i2c@vger.kernel.org>; Sun, 25 Sep 2022 21:12:55 -0400 (EDT)
To:     linux-i2c@vger.kernel.org
From:   Sanford Rockowitz <rockowitz@minsoft.com>
Subject: i2c-dev mismatch with proprietary nvidia driver
Organization: Minaret Software
Message-ID: <6330FC96.5030908@minsoft.com>
Date:   Sun, 25 Sep 2022 21:12:54 -0400
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.23)
 Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.666
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I'm not sure where to post this bug report on the Linux side, I have 
already posted it at developer.nvida.com.  If there's a more appropriate 
location, please let me know.

At approximately line 41 of nvidia driver file nv-i2c.c, in function 
nv_i2c_algo_master_transfer(), there's an if-test for symbol 
I2C_M_DMA_SAFE.  If the symbol is not defined, a call to the function 
with the bit set fails with error -EINVAL. The file includes 
"linux/i2c.h", so apparently there are versions of I2c.h in which the 
flag is undefined.

At approximately line 262 of i2c-dev driver file i2c-dev.c, in function  
i2cdev_ioctl_wdrw(), this bit is set unconditionally, with the comment 
"memdup_user allocates with GFP_KERNEL, so DMA is ok ". This behavior is 
not the result of the userspace caller setting the flag, the driver sets 
it unconditionally. The result is that calls into i2c-dev using its 
ioctl() interface, as opposed to the read()/write() interface, always 
fail with error EINVAL.

Every version of i2c.h that I have defines I2C_M_DMA_SAFE, so the 
version of the nvidia driver that DKMS builds for me works. However, as 
the developer of ddcutil (https://github.com/rockowitz/ddcutil, 
https://www.ddcutil.com) I receive bug reports of failures with the 
nvidia proprietary driver due to this mismatch, so it is a problem.



I
