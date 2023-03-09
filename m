Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB3496B230A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 12:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjCILbJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 06:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjCILbH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 06:31:07 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0AA1E5D9;
        Thu,  9 Mar 2023 03:31:01 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 855CB32003D3;
        Thu,  9 Mar 2023 06:30:57 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 09 Mar 2023 06:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1678361457; x=1678447857; bh=Fe
        qfYyDSqOUmEcEBUp15BGtG58cytd7b24Ewa8plTfQ=; b=V84Rh9jj8AZS2IAtNT
        A0UPcccrvFwJ7zKIXR/qavsrMnXtNHttEi6al7RjA46duXP0zEX1fUpQcojTOT4k
        ZJqMhSdsmgPgGmCB7pcbyFlHjXyEHevDs8HZw1B0bXBSPm77Z9WTuN4YkJAo+LDI
        i/8++X5e75bD0j1P81X69m1kE9x9x5B5dC2OZnzueK74qRFiJ30gJyWSMkSvcUWh
        VUsenzPp+GPPfrDX8NIlHeF3ZAxH/8xAsEEFFRqQIMxRqqPZLS54bvrjQEIVNulp
        oRQ0aCm7KBUkKCjKMiLTqfFsIIWQem50D44ZnUuo3ceOfzTRv+/vNWJ5BJXisM3e
        MWNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1678361457; x=1678447857; bh=FeqfYyDSqOUmE
        cEBUp15BGtG58cytd7b24Ewa8plTfQ=; b=UHAF1XwCHhQ34oiPzzd/iX/fyoIJr
        f2qlucdxwv7m47Dg4b3mXieqeGJlKb3OTcKkk6CwEUlYJ4W2sBZMDDp2+nbzGIYO
        cbprXOvQz9eQUTAVUETXZ70PbrPsGwbJk3JdMxgDNWDMSNOyJyYlUlBhNfflIwNE
        96ZC08YhUilgccXp94KjN6s8xIMwve1DbRhh9uANRp7vPnaWFvIenz4vIbbrcJFQ
        Tgd/pMHRwkcufneAtfWQ+3KN4QLHF6vnMWQci3QwNm0lTBHJ1XbOhhoIGPS5Mjl2
        4+zqc9B9CDXDMOZkG+7aduqiqioOjVdBTUN0mkkmAErYbEaqiUGfFmM2g==
X-ME-Sender: <xms:cMMJZDXF50ZDDr497pwkXIXhNvJCWzziE-GBP4FhPOeX4_5UXAIH3w>
    <xme:cMMJZLmxrnbgDZCwu1TwYvCM10TZsWUvTTBZst1kHXCZfWZlwntWpY6kA7le5hFKY
    GD9lxOeINPvOSY2y4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduiedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cMMJZPY5-rdhOtpzrfFEPSgbr7I7cMbtdayBOphxI__1HF-wNMYycg>
    <xmx:cMMJZOUdSS1n3oQ2cJYa_kph0ncl9RBb60vgtc3vMMSsHFoFK7pZoQ>
    <xmx:cMMJZNk8XVpEfqpmLLav43c2LN8pEjC7ZFsmwHJShU6soK61vA4kEA>
    <xmx:ccMJZMeOiHiwv7UMXh8pIQrnW2WYgvDXJ9v59zNhUNAp2L15ZvN5AQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3A5A8B60086; Thu,  9 Mar 2023 06:30:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <2fffffcb-4f76-405b-acba-1b2e744d75c4@app.fastmail.com>
In-Reply-To: <8e3c16a7-1155-419c-9bcb-cc3e3630fe5b@sirena.org.uk>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <dcb805e1-2b48-481d-8e72-1b515c9d43e6@app.fastmail.com>
 <8e3c16a7-1155-419c-9bcb-cc3e3630fe5b@sirena.org.uk>
Date:   Thu, 09 Mar 2023 12:30:33 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Mark Brown" <broonie@kernel.org>
Cc:     "Ye Xiang" <xiang.ye@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, "Wolfram Sang" <wsa@kernel.org>,
        "Tyrone Ting" <kfting@nuvoton.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Sakari Ailus" <sakari.ailus@linux.intel.com>,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 9, 2023, at 12:03, Mark Brown wrote:
> On Thu, Mar 09, 2023 at 08:56:05AM +0100, Arnd Bergmann wrote:
>> On Thu, Mar 9, 2023, at 08:10, Ye Xiang wrote:
>
>> >  drivers/usb/misc/Kconfig  |  13 +
>> >  drivers/usb/misc/Makefile |   1 +
>> >  drivers/usb/misc/ljca.c   | 969 ++++++++++++++++++++++++++++++++++++++
>> >  include/linux/mfd/ljca.h  |  95 ++++
>
>> Why is this in driver/usb/misc? It looks like a normal
>> mfd driver to me, and it evenhas the header in include/linux/mfd/
>
> It was a MFD in the original version, Lee asked for it to be moved to
> USB: https://lore.kernel.org/r/20230305103456.GF2574592@google.com

Ok, I see. That should probably be mentioned in the patch
description then. I'm still not sure I follow the reasoning
for the split between "usb functionality" and and mfd part:
This is just a usb driver as it is attached to a usb bus, and
drivers usually get put into a directory based on what they
provide, not how they are attached to a parent bus.

    Arnd
