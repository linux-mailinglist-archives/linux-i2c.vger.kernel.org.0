Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7E360B424
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 19:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiJXR3l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 13:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbiJXR3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 13:29:04 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C8D76570;
        Mon, 24 Oct 2022 09:05:04 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id F1F3D320076F;
        Mon, 24 Oct 2022 12:02:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 24 Oct 2022 12:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1666627354; x=1666713754; bh=icgj1uEJtY
        GqD+reQlzk/FX1027W4qJc11yfxx1nfMc=; b=nRqqed7n0WSU2HtMrYyagXLHLM
        gLuRmUsCVCXHU/RLF4lT4ap4gp3ey/2LEHxivyi5fv2nZDTdshlQufjb1RZA3MXa
        1q1ZPNRLIHhr6DShmhfTc+mVqVkkNpGShcQR4X3aBM5sJunyHZDlv/tqX3P5l4Kv
        HjwBSCGZ9Zbj6GDvsWhZv/tOHYACYXUc/pIdVzV2jveqTpgPiua9laO4x81yf0s6
        SHGJggjidU/tdKwliTWYSzbubdcBwVDK9sPIgWE2w3StxY8qRrll+r5VW/z+vuCf
        VfU4TNwL9t8EFM7v1wYPWtHTPtWE287kCy22qRfVNXomPevpgrjfnO56cAzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666627354; x=1666713754; bh=icgj1uEJtYGqD+reQlzk/FX1027W
        4qJc11yfxx1nfMc=; b=PERaMDbQvT7LbZ1a44RxhBL1rnm0QUbi4YhIxyinUgVQ
        VXa7OY7rg3UTa9/TBEnbY2F7TGP46qkeD+QTpl8kt71ZWZVh1flQDrBLwGx8RFVK
        UZ4M6o2dFUe/Ei7xqf/bBXsvVgVV5chRJrBIv++ipQy9aNizf5FPRqxSLDV09U2u
        YN+gn+WGr476zEeKpP9UsVECaN3c3QEMhL0tk0dDPlpBHn6JfEBeiSNdhkJxkeyf
        OGv16/YbD9atIm/yyRQyAg2O0YorodyU5PUOjLsDxOsvw801u2yA8NgfyI9EJuAQ
        5T9y6Y78j5SWRhm3SEC46xJQyJNjx0pmX+K0LAWTYA==
X-ME-Sender: <xms:GbdWYwZpHEjlXgYqJ_RgZXrgHK2kX7V8gCxtAhZZYyQbEEEzL5bbiQ>
    <xme:GbdWY7Y38odImXBlQ8YBzr0UKl5tIPWyxybTq4kvIJv6RT0btfgzSp9_zhLUReWLi
    N5RIvLINv4gRlM1mNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:GbdWY6-UV6cQpRp_iU48UVeoa2XEV97G3-x1rFcVP2uAFBqoqr2X7g>
    <xmx:GbdWY6r0Fgi5TFudIfOQEkT3ZmkOaVzfQ8_NS71kZRc5hO_UCykcag>
    <xmx:GbdWY7qskkY867NII9Da03ZLdV2vK5OXmJQ1hf6nPQLC_JoGY51WYA>
    <xmx:GrdWY0Q_PzX2yUhax7ARpo-QVtdDbdYzf6mICseHbVsx2DBy5z6wyQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9D0F2B60086; Mon, 24 Oct 2022 12:02:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <aa4195a9-f6be-4600-82df-8b5d1035ebd5@app.fastmail.com>
In-Reply-To: <Y1YnT+/ZdoglcdS4@atomide.com>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
 <20221019171541.GA41568@darkstar.musicnaut.iki.fi>
 <1b632df1-7e3c-456d-8629-dc36efd9fe15@app.fastmail.com>
 <20221020193511.GB3019@t60.musicnaut.iki.fi>
 <de36ec6b-2e7c-48eb-9682-f60d8e4011da@app.fastmail.com>
 <20221021111101.GC3019@t60.musicnaut.iki.fi> <Y1YnT+/ZdoglcdS4@atomide.com>
Date:   Mon, 24 Oct 2022 18:02:13 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Tony Lindgren" <tony@atomide.com>,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>
Cc:     "Arnd Bergmann" <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
        linux-kernel@vger.kernel.org,
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
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 24, 2022, at 07:49, Tony Lindgren wrote:
> * Aaro Koskinen <aaro.koskinen@iki.fi> [221021 11:02]:
>> I was only referring to this Mistral add-on board and related display
>> drivers.
>> 
>> The main OSK board support is still needed and used.

Ok, got it.

> I'm pretty sure I have that display, but I was booting my OSK in a
> rack anyways so I rarely saw the LCD in use. No objections from me
> for removing the LCD support for OSK if nobody is using it.

I was going to leave Mistral in, thinking it's just a device definition,
but upon closer look I found that this is a somewhat annoyingly
written part that hardcodes GPIO numbers in unusual ways, so I'm
adding a patch to remove it now.

     Arnd
