Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725E26E15B3
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 22:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjDMUT6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 16:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjDMUT5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 16:19:57 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341E47683;
        Thu, 13 Apr 2023 13:19:56 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 7B58132009AA;
        Thu, 13 Apr 2023 16:19:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 13 Apr 2023 16:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1681417187; x=1681503587; bh=F/
        l2Q91+I+7QRSyzEwveBN2Jb8cIeTST0fly+XtN9JM=; b=k9CvmUcFqGteu6NUVH
        8vX/N9Cv+LZRUAnu0NZuM+9ywGp8RiOP8HbtbkYKwooP9Iv9ZMKI7Yx1PJjY8Nli
        TMkd2VuPx2KOyBl71U3g+JPb+wPimLExtLMxoM5wKdWkTJPhxlelXFa5WOSvKEmd
        pcvii9c9UyiLdKqyt0/ER6XSQI1GjyatF4XNDAdBxuE8EqRF0k+0gMh1wMqdySld
        3MaB78qqMZizn0zt67li2M0CYLBYQZre3FZW5SYzAwfeonfZOUdSiUy++WBPfWdd
        H1izSYdd8PL0w/SbI9AFDljpMaSqgRcPVkzRa641Run2oT2BayPIJCNkIsZJ9qug
        UEIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681417187; x=1681503587; bh=F/l2Q91+I+7QR
        SyzEwveBN2Jb8cIeTST0fly+XtN9JM=; b=aEu54th8lPVwPejuTgCfv4BiTL62U
        S7QduGrbemnZpckXb64u9C0/nREHPVhAHwISKKTMGjGf8yk/SW7mJHQLeuM+P8Qu
        fw8sXqciOCeGB4CmS8bv7YZjNmSXeaWffjoO7EtJyJNJoDxhsKdSj3bcndIUO6ef
        T3EmzssC0NRJrJy6M+9k50cRf1qzP06osOv/DJ8Oh9BtrgRTB9s8GRKuexQQdONm
        QnjyFTBNiUvgBn7kOQL9lLdYt5J0HTPE60UZNQfpZRNIzoXcPhPfy9l5YTSC1VoF
        viT9R2F5eH0zZfWI9Gujw6DsFerK3Ml8GzTWPQcecy3b4bMHBqBmF7iIQ==
X-ME-Sender: <xms:4mM4ZDK-DSaLE9EDuay6xq--Ou5wClj2oj8BLzg0IcU89JaINJdRQA>
    <xme:4mM4ZHIDyYb0yH2PICy0h3gVzaEbT47y8A4N_SFFDCiQGXChW-pHnNPQS3nR2wfKj
    oKFLF2U5Upj9aijJmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekkedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4mM4ZLs7J_2htnn3QwHU8FJ0CeMAZvinNvYvqmpfww-U-5AJPK9j8Q>
    <xmx:4mM4ZMbcpYhch3zHMa3SPf_QmsBq0XppHv8DLngBie24MLO9C35Zbg>
    <xmx:4mM4ZKaoxKlwoCqFw2FSQrVsswZ1Wxyj60R-Q2h-0LMj1J7su5qA-w>
    <xmx:42M4ZPMTD1-2z4q-qnVpWw-LufOrdwxYGGkMgU_g2C1NgneO1cNeKA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4F96FB60086; Thu, 13 Apr 2023 16:19:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <c84eee23-1a25-4367-9588-6cfd27a4345f@app.fastmail.com>
In-Reply-To: <ZDhXtDLiTtm2iXGW@sai>
References: <20230403074939.3785593-1-arnd@kernel.org> <ZDhXtDLiTtm2iXGW@sai>
Date:   Thu, 13 Apr 2023 22:19:26 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Wolfram Sang" <wsa@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "Hawkins, Nick" <nick.hawkins@hpe.com>,
        "Joel Stanley" <joel@jms.id.au>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: gxp: fix build failure without CONFIG_I2C_SLAVE
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 13, 2023, at 21:27, Wolfram Sang wrote:
>> The gxp_i2c_slave_irq_handler() is hidden in an #ifdef, but the
>> caller uses an IS_ENABLED() check:
>> 
>> drivers/i2c/busses/i2c-gxp.c: In function 'gxp_i2c_irq_handler':
>> drivers/i2c/busses/i2c-gxp.c:467:29: error: implicit declaration of function 'gxp_i2c_slave_irq_handler'; did you mean 'gxp_i2c_irq_handler'? [-Werror=implicit-function-declaration]
>> 
>> It has to consistently use one method or the other to avoid warnings,
>> so move to IS_ENABLED() here for readability and build coverage, and
>> move the #ifdef in linux/i2c.h to allow building it as dead code.
>
> Can't we have a solution which modifies this driver only (maybe by
> defining an empty irq handler for the non-IS_ENABLED part?)? Doesn't
> feel good to touch i2c.h only because of this...

The idea was to avoid the problem for the next driver as well. At the
moment, there are #ifdef checks like this one in three more drivers,
and I suspect we could clean them all up the same way.

>> -#if IS_ENABLED(CONFIG_I2C_SLAVE)
>>  enum i2c_slave_event {
>>  	I2C_SLAVE_READ_REQUESTED,
>>  	I2C_SLAVE_WRITE_REQUESTED,
>> @@ -396,9 +395,10 @@ enum i2c_slave_event {
>>  
>>  int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
>>  int i2c_slave_unregister(struct i2c_client *client);
>
> ... especially with moving these two prototypes out of the protected
> block. The functions themselves are also protected by the same symbol
> via the Makefile. I'd rather get a build error right away than a linker
> error later if a driver misses to select I2C_SLAVE. Or do I miss
> something?

I usually prefer having greater build coverage by allowing symbols
to be referenced by dead code that gets eliminated during the compile
stage. It helps find issues in the unused code paths at compile
time, and tends to be easier to read. than a group of #ifdef checks.

The only time I would put a declaration in an #ifdef is when
there is an #else path with an empty inline function.

     Arnd
