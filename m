Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2F3607081
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 08:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiJUGwg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 02:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiJUGwe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 02:52:34 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729BD22E8DE;
        Thu, 20 Oct 2022 23:52:32 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 6C5815C007F;
        Fri, 21 Oct 2022 02:52:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 21 Oct 2022 02:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1666335151; x=1666421551; bh=asFMH01gIy
        FuLLt84XhpsavdGbikk/Zr70yYHFNA5r4=; b=tmmE+zyWqZsaV1HNHXmexsKCRZ
        cTGaKpie3Ix8/C9msO3j7jjW6V++ZSgrCc/D8wECWflD2w77EVwUT4ZDJI4/qcDa
        AE+VHQAznpHOe3oxin/wy0H7Jo04+zv8pXMIZDRqNYKa7QklC3Cl0vigmK7m0AEx
        jx4A+td7c0SMHEJZVt6BhAUTnDzWRhZ9MfDQtZxrfpDQrShjDhD3SXdwd+IKTxAI
        ZlRdzDXxtI9oe5QhZuvE6Vh3SgZNQgA+Thl0nO742KhzJJmNXR4asTqNJtVzEXKw
        nLbhugd9XR3xVQIgR9sNyfKv+DM6ICYPVRj+7tuFLcBrlxWvHEZtTmiUJv3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666335151; x=1666421551; bh=asFMH01gIyFuLLt84XhpsavdGbik
        k/Zr70yYHFNA5r4=; b=kCOatloKYNVOBJC3olA9k9hCbIwlxdKz89aA/Z58vRei
        9lF6wbuChyuHTmzK1sc/5zb1M9ITUeNuFi1Qnmt8Ylcp3S8LtMToKa47i81KnVUn
        pKaYJSDOMcqY5XM1uIM8a19oVoZvqIfhzU1X2pRzpCooHtDS9LFbVzR7GEcdGtHL
        AklcoevJjyfziK/7t/uavCUXSXqEEVMLG/OrSxEbgY3S5JVdkTlRp0Z4RJitL/+e
        0ERI0xWyGGrXd2+d5YSKUTWnNw4Arew5r/fl7dC/5kvsW4oQj/ac1iCAQLFRY1/q
        XMZ34TsU+xO6zNgCM1pN8wwV1egVuBvELVnsf+ph8Q==
X-ME-Sender: <xms:rkFSY7b52o4SSS29ii51024C6Tx9E3noQFHWuRk6VKm_aOR-UZKzQA>
    <xme:rkFSY6byU9_2HIcQmGIOp1DUsd0lSnFXIvrb605VOlHM0RkwJGbTS-mIbt6ZO5aIY
    0gt_IjGFwCVawZFB94>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeljedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:rkFSY9_MJx9tKvhvQ5lwCt0Zb3IV3YOYY3pCycDfPWnv71sUpdgg3w>
    <xmx:rkFSYxoBeoqaIgsY93umf4TjZTfSZAS5scg5cHiLigOO9T8BZHkFJw>
    <xmx:rkFSY2qYK18DaISpgzqWb_yvcq_kGLQgKvWFftU45cRPvZmabuJJrQ>
    <xmx:r0FSYzQVLjlAZPdjc9KdCUd8H-_UiL5nj-YrhWIpq4YNRLBe_QmjzA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A2DA1B60086; Fri, 21 Oct 2022 02:52:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <de36ec6b-2e7c-48eb-9682-f60d8e4011da@app.fastmail.com>
In-Reply-To: <20221020193511.GB3019@t60.musicnaut.iki.fi>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
 <20221019171541.GA41568@darkstar.musicnaut.iki.fi>
 <1b632df1-7e3c-456d-8629-dc36efd9fe15@app.fastmail.com>
 <20221020193511.GB3019@t60.musicnaut.iki.fi>
Date:   Fri, 21 Oct 2022 08:52:10 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Aaro Koskinen" <aaro.koskinen@iki.fi>
Cc:     "Arnd Bergmann" <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 20, 2022, at 21:35, Aaro Koskinen wrote:
> On Thu, Oct 20, 2022 at 09:11:11AM +0200, Arnd Bergmann wrote:
>> On Wed, Oct 19, 2022, at 19:15, Aaro Koskinen wrote:
>> > On Wed, Oct 19, 2022 at 05:03:35PM +0200, Arnd Bergmann wrote:
>> >> All board support that was marked as 'unused' earlier can
>> >> now be removed, leaving the five machines that that still
>> >> had someone using them in 2022, or that are supported in
>> >> qemu.
>> > [...]
>> >>  config OMAP_OSK_MISTRAL
>> >>  	bool "Mistral QVGA board Support"
>> >>  	depends on MACH_OMAP_OSK
>> >> -	depends on UNUSED_BOARD_FILES
>> >>  	help
>> >>  	  The OSK supports an optional add-on board with a Quarter-VGA
>> >>  	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
>> >>  	  and camera connector.  Say Y here if you have this board.
>> >
>> > Shouldn't this go away as well?
>> 
>> No, this one was incorrectly annotated, it's not actually
>> a board but it's an option for the OSK board that is not
>> getting removed. I considered making a separate patch
>> for removing the dependency, but that didn't seem worth it.
>
> OK. For the record, I don't think anyone has this add-on board anymore,
> and it has probably never been tested with the mainline kernel, so
> it's likely in the "dead code" category... Maybe it could be changed to
> "BROKEN", then the related OSK LCD panel stuff could be deleted later
> on too.

Ok, good to know. I left it in place for now because Tony originally
listed it as a likely used machine along with NOKIA770 and
AMS_DELTA [1], but I don't have anyone listed specifically as a
user for it.

It's not too late to revisit this list if you think it helps to
get rid of it. I can see that drivers/mtd/tps65010.c and
drivers/pcmcia/omap_cf.c become orphaned without it and can
probably get removed as well then.

      Arnd

[1] https://lore.kernel.org/linux-arm-kernel/20220721150320.GA9385@macbook.musicnaut.iki.fi/
