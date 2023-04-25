Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891086EE66B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 19:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbjDYRPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 13:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbjDYRO7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 13:14:59 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E383B10EF
        for <linux-i2c@vger.kernel.org>; Tue, 25 Apr 2023 10:14:58 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 40A6E5C00E9;
        Tue, 25 Apr 2023 13:14:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute5.internal (MEProxy); Tue, 25 Apr 2023 13:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        colorremedies.com; h=cc:content-type:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1682442896; x=
        1682529296; bh=Ax/7qRn0Qx8jtdyuwMV1REnMpqVuh4tazlH2Hqpev8k=; b=T
        wopj7m+KIlC5LqZVi6iZittMeya+DwL1q/e9AOeUNY+/f3xYQ9H9SSWUzQiM3AMc
        wqiQxiX0Ufs5PpcwWjxE9n0Nw6FyatdfzAHvWc7irS19b7gp/Q1d1xjFVIQp6c7Q
        OM6PcQLfBmpVV9hxPraQhmmZSlBHfWrS0GZt5n4KDtuDYddkhmClxtt59t+o9NlV
        v1lEmzjnxDw6AETF3kCSm29NhcBebuV2t1Ntjbs7OtiUbSMrvb9f6XrslmTwagXm
        4jRAUbVpnX2d5DSc9NK5SrN+vFKLqAQIX5jRDspFi3rJwlYLXrEiuohaqcM8WZ1Z
        XDOq9V34G7nR/hc1cdIXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682442896; x=1682529296; bh=Ax/7qRn0Qx8jt
        dyuwMV1REnMpqVuh4tazlH2Hqpev8k=; b=P/SPJ2K20nbofhr/YRQxx2nKWk4jW
        pwhvj/NNKkVA91Na+1i9VkBXyTNHQypeD95wdyj55TqhQAePoqwAViTi6QllPujZ
        t3VUS8TPL6zYHVjfzCag8krRJXV+MFBIAlEF15n5sjizwze1VpglYRfHUkXy/mkY
        5IuyxUqp0ON4Sv18RoAl8BfBs49h0Q0mmmXr/i2NyYbFORmV1OykPV9f0BoaLldT
        oRTgQvxSqm8qVJ3xziPcl7OcJAwwqIxD64VQqi7GCbMcfdM8mK1+Mhhzsn6l5tdn
        K2/JUe3X2rIUpgFf46JEDewsQ2q1QrcRjBuJPDNARykfcHEEss59bvsUw==
X-ME-Sender: <xms:jwpIZM274pjWXxIcaLUjXlwSurzkIxraYH52cX4KFgM1sIVtzL6CNw>
    <xme:jwpIZHFANvz3q8kTm_T7ru688F3AGMnuLw5wj56Ika8tZLLf7glB_hEYipwJjFAaZ
    fYl0KqbgrtnL9bA5-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfvehh
    rhhishcuofhurhhphhihfdcuoehlihhsthhssegtohhlohhrrhgvmhgvughivghsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeefjeduleekhedvheelvedukeefhfevffelvdeiueeg
    iefhtdejuedtgedvteekleenucffohhmrghinheprhgvughhrghtrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhishhtshestgho
    lhhorhhrvghmvgguihgvshdrtghomh
X-ME-Proxy: <xmx:kApIZE5Oi35Vo07NKv0X07K3s_bgZkH8pXgKO2Gs6olYrKgvZdopWg>
    <xmx:kApIZF3XdSLjDyIQ87dhhm-KhQ1IOmzTWWETJHrjI9Gmg0WHO8L7Qw>
    <xmx:kApIZPEEqvdMtGlxKkWKIHigTSE7nGg2K-2KLnB2irQfsRUvNOAMtg>
    <xmx:kApIZERfnKgiFk45D3EvrDdfcDRphs8DTQtSngsEespn8nAwAwoh2g>
Feedback-ID: i06494636:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DD5B21700089; Tue, 25 Apr 2023 13:14:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <a08d27b1-6eed-4fba-a3e9-b3b6746c88c3@app.fastmail.com>
In-Reply-To: <20230425070109.GU66750@black.fi.intel.com>
References: <47ff45c8-20da-4eac-acad-6d51353f95c6@app.fastmail.com>
 <ZEdsLw+dJhdHVdEO@sai> <20230425070109.GU66750@black.fi.intel.com>
Date:   Tue, 25 Apr 2023 13:14:35 -0400
From:   "Chris Murphy" <lists@colorremedies.com>
To:     "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        "Wolfram Sang" <wsa@kernel.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: intel-lpss 0000:00:15.1: idma64_irq: status=0x0, millions of lines
 spamming journal
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Tue, Apr 25, 2023, at 3:01 AM, Mika Westerberg wrote:
> Hi Chris,
>
> Would you be able to bisect this to a mainline commit?

Difficult in the near term.


> At least looking at the changes between v6.3-rc1 and v6.3-rc7 there is
> virtually nothing to any of these drivers involved. The log itself looks
> like:
>
>        dev_vdbg(idma64->dma.dev, "%s: status=%#x\n", __func__, status);
>
> so this should not be enabled at all unless CONFIG_DMADEVICES_VDEBUG is
> set to y which seems odd in distro kernel.

$ grep DMADEVICES /boot/config-6.3.0-0.rc2.20230315git6015b1aca1a2.25.fc39.x86_64+debug 
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
# CONFIG_DMADEVICES_VDEBUG is not set
$ grep DMADEVICES /boot/config-6.3.0-0.rc2.20230317git38e04b3e4240.27.fc39.x86_64+debug 
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

It follows the bug, though I'm not sure if this is the true source of the problem?


> Also what does /proc/interrupts show for this?

Attached to bug report.
https://bugzilla-attachments.redhat.com/attachment.cgi?id=1959838



-- 
Chris Murphy
