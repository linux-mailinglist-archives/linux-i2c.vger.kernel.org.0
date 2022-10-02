Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D168B5F23BC
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 17:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiJBPCi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 11:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJBPCf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 11:02:35 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E721F2B638;
        Sun,  2 Oct 2022 08:02:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 7889F5C0088;
        Sun,  2 Oct 2022 11:02:31 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sun, 02 Oct 2022 11:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1664722951; x=1664809351; bh=gt
        bV2ARN10oUA4d7+HFMmKZYuHzsFVOrur3KwfZi+tU=; b=Yl5/d7ln6FEayDKb3a
        N/sVwgwnhxcXakbRaHrSfWI6CLcsoxFCAgiUHCKlasth4F3x4ZTHBuzFf5wSELBe
        A1dDE5H6+ghtayghaoKho3WtHpTd5avmwl+XySxppoxzD9ujrxiRrlcTzmLhvTDo
        JcQRnJ0xziBf4agLrrOG5KmypFsw1x2VCEn1qVMppnz/vOqv11XgQZ8g4hOtVZIb
        VaSqvQ+JTCJX3zDmnfIoGV4PFc1mZsoJHZY1jTAbEMxriBHCVvEBYGz2EV1gzx0j
        soKctLR+DH0XrlnK6yhKwby6yaJm3JGkRHXjTx5tsaP5znB8XaQDdUAbQZJJOUNv
        SShQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1664722951; x=1664809351; bh=gtbV2ARN10oUA4d7+HFMmKZYuHzs
        FVOrur3KwfZi+tU=; b=zozp5BMwW/askMznzeNXAoZAJN9Zyook2fl4uza7fj1t
        10jWNQg8MxsoQeXuLxESlXuxseRyKJ9ct6ExzHj6R6kVv1BBgcL1ZkEea6Eun19b
        ATmJGhc2GbUQjXbLWjiekoMezy2Fs/0wLALQrbbhrjUbk10PcH4qV/fh6EM5f6nh
        ZuXg8dMEq5tTplRK3dbDRSKUJbWdR8Us1U5yvHS5xbN6BWI6USUR54pBPXJopgly
        uBQzT2trDUBkFjHoXjJx6OPlqVKAaQhF/1WxGnXttcupqkPZwjb6VjZRt9nCBO2X
        rH4DSsIx7G7nwVxflTFKLirVQlS044jSP2i9OvlYLQ==
X-ME-Sender: <xms:BKg5Y_PI4U_0TkJDMtk003A8R_U_wrZgWUSwWHFlHQulmal6cywoLw>
    <xme:BKg5Y5_9ph_cXyMbXDL5T0aWe646eiX7x8L2keigIJWYBDfo0Id2pYFtUZ6CYccyY
    wnBFkdewt-nSpq6ytc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehjedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:BKg5Y-Qu6yl6S90YJm6bOG7vg57HzdJQlO9o8Y9dIdYvTRU7medXqg>
    <xmx:BKg5Yzs7V1zkRnPOTTpDO8b2VHUhdU8frI_imVT7doY6nDaIyGpPqg>
    <xmx:BKg5Y3f-ArGZeKQLErfdDm6OEw0U_co4TJ73dsyJcM4ZDjamz4vGaQ>
    <xmx:B6g5Y_2qb2B6WXeJrRY9EiHKXKXYLthI6BmJnWk4-uRjIYKTiNhp4g>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0A2F8A6007C; Sun,  2 Oct 2022 11:02:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <5e89999e-5c9d-428c-a6c6-b454fb47aaa3@app.fastmail.com>
In-Reply-To: <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
References: <Yzl16W6+poH8/8h4@shikoro>
 <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
Date:   Sun, 02 Oct 2022 17:02:07 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Arminder Singh" <arminders208@outlook.com>,
        "Wolfram Sang" <wsa@kernel.org>
Cc:     "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Christian Zigotzky" <chzigotzky@xenosoft.de>,
        "Darren Stevens" <darren@stevens-zone.net>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "Hector Martin" <marcan@marcan.st>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Paul Mackerras" <paulus@samba.org>
Subject: Re: [PATCH v2] i2c-pasemi: PASemi I2C controller IRQ enablement
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

Hi,


On Sun, Oct 2, 2022, at 16:07, Arminder Singh wrote:
> Hi,
>
>>  #define REG_MTXFIFO	0x00
>>  #define REG_MRXFIFO	0x04
>>  #define REG_SMSTA	0x14
>> +#define REG_IMASK   0x18
>
>> This doesn't seem to be aligned correctly, this file seems to use a tab
>> to separate the register name and the offset and you used spaces here.
>
>> @@ -15,7 +16,11 @@ struct pasemi_smbus {
>>  	struct i2c_adapter	 adapter;
>>  	void __iomem		*ioaddr;
>>  	unsigned int		 clk_div;
>> -	int			 hw_rev;
>> +	int			         hw_rev;
>> +	int                  use_irq;
>> +	struct completion    irq_completion;
>
>> This doesn't seem to be aligned correctly and the hw_rev line
>> doesn't have to be changed.
>
> I'm sorry for the alignment issues in the patch, I genuinely didn't notice
> them as from the perspective of my primary editor (Visual Studio Code)
> the entries were aligned. I just saw them when opening the files in
> nano.

No worries, it's just a small nit and quickly fixed after all! :)

>
> Does fixing the alignment issues and the commit description justify a v3
> of the patch or should the minor fixes go out as a "resend"? Just not sure
> in this particular case as the fixes seem to be very minor ones.

I'd send a v3. I've only used resend when e.g. my previous mail provider
messed up and silently converted all my outgoing mails to HTML.


Best,

Sven
