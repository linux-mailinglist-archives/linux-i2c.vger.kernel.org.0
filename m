Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D566057F5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Oct 2022 09:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiJTHLg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 03:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbiJTHLf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 03:11:35 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA65153814;
        Thu, 20 Oct 2022 00:11:33 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 39D925C0118;
        Thu, 20 Oct 2022 03:11:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 20 Oct 2022 03:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1666249892; x=1666336292; bh=VKnxMFhTQ2
        bD9dGwCnO8mk5gYoCFAkEbzjlFbm9rovY=; b=mx0RguBAra0abQu7M4Y1+MUi33
        KMNn/vZOiCggNhPBxxFZUy2NzCTRt5cfJi6DqRtGr0aU8kyjB0FuCWdRE1ESSVfO
        sIFWbYRFVHB+W0CzZqepqCpzSWp1QUBRE8IEt1rnmVnhXu1i1lVReTstddxV6b8O
        mnXzD7xtSvK91uJ3//4bI5OJDkxANxoYGFvZEBO+ozuHvP/Jfc9yHUqhQfuaKKyL
        MTdJkm9dzDJGKelIfVHqklogaMsblFo0pnIQi+ajn//A85+RCtzTt+vTTBEY4rzx
        XPT6s1r2QRz8Qyh+sjpqXq+mV4rIoew/aoTklNlH8vDPJEqKjY8naO6n9RZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666249892; x=1666336292; bh=VKnxMFhTQ2bD9dGwCnO8mk5gYoCF
        AkEbzjlFbm9rovY=; b=CIlSjHmAXwsx/YWjLQ/Wzj/EjQQQxjDG1krSeXGRKQ0l
        BSSuMXZWkLWWl7uwBhn/gjcYkKWK6/rvHTI7T5FHSHCD971EEB6UplprIf90tSFm
        WNnkRj3o+wv3B1uGjGFuBsulNxGuYML4VylSUo8WeMzmheUc5pnoEcIDBtPvdkmA
        H73zV8CAS27N2P8LoV1SaKHIweN+ah5O7VHk9yXVWs04Fb9GpTqiiGBkklghLxDP
        wremdM+FfvBpDZLpyTSo/OrDw4lajm+h4MQzyeEXgpyb+MLq0V6V5xN+rivG6bY0
        MJDWUFiUsxltMj2RO6z2zxsEU51kdKDnfHl4LsMM8A==
X-ME-Sender: <xms:o_RQY-ZLJTRzMXsItyMbHQlmCV04T7mk8EY3alVsMM_cMrwQdVSm2A>
    <xme:o_RQYxYREGqXTgQVjaqvE0I02peT7IFLWfJRdxD6hF03QwzitqrVZlUg6yJ16IM2U
    jfrYF4erALQtkFXX2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelhedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:o_RQY49i2WOHU2ZiybVKJPOyczK_wN43XuENDHBGLcGzpojd6SVoTQ>
    <xmx:o_RQYwrd0vSjaZX8pHoF2YxiJMRG2qB6V3yzlszB_e4pPqDNXA74Bg>
    <xmx:o_RQY5rd2l0cCOIvWxxOLlYhaVvDMXoXGOvG6_UDlyPiJcNBXWEQnw>
    <xmx:pPRQY6Tmh5Y_tereJiQL4ZAD0PAJQTUsYaXFKet4i3vvMsv2uSsTJA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 588A1B60086; Thu, 20 Oct 2022 03:11:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <1b632df1-7e3c-456d-8629-dc36efd9fe15@app.fastmail.com>
In-Reply-To: <20221019171541.GA41568@darkstar.musicnaut.iki.fi>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
 <20221019171541.GA41568@darkstar.musicnaut.iki.fi>
Date:   Thu, 20 Oct 2022 09:11:11 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Aaro Koskinen" <aaro.koskinen@iki.fi>,
        "Arnd Bergmann" <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
        "Tony Lindgren" <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "Lee Jones" <lee@kernel.org>,
        "Ulf Hansson" <ulf.hansson@linaro.org>,
        "Felipe Balbi" <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/17] ARM: omap1: remove unused board files
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 19, 2022, at 19:15, Aaro Koskinen wrote:
> Hi,
>
> On Wed, Oct 19, 2022 at 05:03:35PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> All board support that was marked as 'unused' earlier can
>> now be removed, leaving the five machines that that still
>> had someone using them in 2022, or that are supported in
>> qemu.
> [...]
>>  config OMAP_OSK_MISTRAL
>>  	bool "Mistral QVGA board Support"
>>  	depends on MACH_OMAP_OSK
>> -	depends on UNUSED_BOARD_FILES
>>  	help
>>  	  The OSK supports an optional add-on board with a Quarter-VGA
>>  	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
>>  	  and camera connector.  Say Y here if you have this board.
>
> Shouldn't this go away as well?

No, this one was incorrectly annotated, it's not actually
a board but it's an option for the OSK board that is not
getting removed. I considered making a separate patch
for removing the dependency, but that didn't seem worth it.

    Arnd
