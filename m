Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055975EBBF2
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 09:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiI0Hu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 03:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbiI0HuI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 03:50:08 -0400
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115485E304;
        Tue, 27 Sep 2022 00:49:46 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B93AB580763;
        Tue, 27 Sep 2022 03:49:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 27 Sep 2022 03:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1664264983; x=1664268583; bh=YDujUhOswI
        QM3ClSAwD1lSC2w9cFM+FJGSgX/v7CLGU=; b=RHmsHl/6GsrkVx+XhjAEA3zhaK
        Xwo3uJJjfRMn5BX8uDfvmcxpWSdRC//n0rGrQeMO4Jknyfp+0KQVzj15nKCHmEyy
        OSfk8RqOxRUa2a8DfaclsRvuueulJkesU7Zd5tM+xoAgaUuzUqpWXZE3V83XfZFM
        mhCh2hO/xZSRC6BXrtcXY8nRM4gAiv8ATgnIiDjQrkic2p50p+2zt0idZ7TFzFuG
        SLjwC/O4vo4/sziSkZbU5jLHRLBSrESK7/zeHMEBkfxR3kgtOD6bwdIDWUodTP45
        Iw+NxXYjHwUw0+AySBIlxtdrlVYZW11uuovh63PTxW+ylKFjfNqaFpKmCi5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1664264983; x=1664268583; bh=YDujUhOswIQM3ClSAwD1lSC2w9cF
        M+FJGSgX/v7CLGU=; b=qQjF0ERorHQ2+BYyjfbqv0euVO7j1ILs1Bi8KfSdicej
        KKqVMwAgwhVO7vHTYfz9KSaPx9APFYLxgM/IJyilI4NfGfEyaC9/2mWxjc3kYXEk
        h9ytGNMUuN0YsMUM58GrY/rC8Q4hi55QGZAZ3EU43hp4ZEwN2MoBSoiviwfVY4wo
        U2xOR+t0x21teY1md2RvNcsScKB00FoqO+vkM68ad9AHICQRfYN/MxsrDbK12ILO
        8LaLEat71wrGc60SseprDRHyDLtoif5a38y5L8OS4sNlOX3mFSYooLF505shxRZZ
        toV1xwysZED9sgW/hTj7VSKg3H47XoMMcjMCOmseTg==
X-ME-Sender: <xms:FasyY8oGUf3mlhRoxlN_JnPS5nXag8alcflKpE02bY5oVH0mdw2z5g>
    <xme:FasyYyp8x117zWAh4YsfgVbSGesRlgbpvjzPTdBrZ3942QGsTfHJALTObzJwexm3Q
    kbE8gIi3iM4jjvrXp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:FqsyYxPylQFcM2JOxQx3Z9ir8yfj25aLdTjKOD520D4tXa1-peDdJQ>
    <xmx:FqsyYz6QvEzR9Av52ZnScvRxHr3N-TONbRZj1o4rHgDEg5VklV1O_g>
    <xmx:FqsyY77iTA_fChm5OtnQ3eL7iE1QtlbySgLMJ6pZjc1UB3EDD3n0Eg>
    <xmx:F6syY4E8Lq4on0PE_zX4XB010b5PAxRYBTTiDQEk9S7C-yuxyoqzZA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DA10DB60086; Tue, 27 Sep 2022 03:49:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <ef6e1e54-5b8d-4a1a-85cb-7f9d3411a371@www.fastmail.com>
In-Reply-To: <YzG+Pr+jNIWhWQnp@black.fi.intel.com>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
 <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
 <YzG+Pr+jNIWhWQnp@black.fi.intel.com>
Date:   Tue, 27 Sep 2022 09:49:21 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc:     "Wolfram Sang" <wsa@kernel.org>,
        "Andy Shevchenko" <andriy.shevchenko@intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, "WANG Xuerui" <kernel@xen0n.name>,
        "Jianmin Lv" <lvjianmin@loongson.cn>,
        "Huacai Chen" <chenhuacai@loongson.cn>
Subject: Re: [PATCH V2 1/4] i2c: gpio: Add support on ACPI-based system
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 26, 2022, at 4:59 PM, Mika Westerberg wrote:

>> +static void acpi_i2c_gpio_get_props(struct device *dev,
>> +				  struct i2c_gpio_platform_data *pdata)
>> +{
>> +	u32 reg;
>> +
>> +	device_property_read_u32(dev, "delay-us", &pdata->udelay);
>> +
>> +	if (!device_property_read_u32(dev, "timeout-ms", &reg))
>> +		pdata->timeout = msecs_to_jiffies(reg);
>> +
>> +	pdata->sda_is_open_drain =
>> +		device_property_read_bool(dev, "sda-open-drain");
>> +	pdata->scl_is_open_drain =
>> +		device_property_read_bool(dev, "scl-open-drain");
>> +	pdata->scl_is_output_only =
>> +		device_property_read_bool(dev, "scl-output-only");
>> +}
>
> Otherwise this patch looks good but I'm concerned because we have two
> kinds of bindings now. The DT one above uses "i2c-gpio,..." and this
> ACPI one uses just "..." so the question is where did these come from?
> Is there already some existing system out there with these bindings or
> they are documented somewhere?

I'm fairly sure it's just a mistake and it should use the regular
binding. As far as I understand, there are still other incompatible
changes being made to the firmware on these machines, so it's just
a matter of updating this part as well.

     Arnd
