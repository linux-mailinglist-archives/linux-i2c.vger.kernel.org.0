Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D99196B27C1
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 15:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjCIOvr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 09:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjCIOvV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 09:51:21 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04732ED0E6;
        Thu,  9 Mar 2023 06:49:59 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 34C3332009A3;
        Thu,  9 Mar 2023 09:49:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 09 Mar 2023 09:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1678373349; x=1678459749; bh=HW
        lttmWBWkFFImvGFkmHbThBBRgnq5qfVnSMPiiuprE=; b=HFa6s2VhjmiI/OmIZT
        dul4vSKtbrmVMYGXrfcOSo6E/uyuqMWsqZ/VVF/S7WfeFrUGKULn/pmRMwvhbR7S
        3qU5ShCRoSJ+qlL0FHcQyeJt03jjinbMXKL98JxTGFSKYdzXjfqXe5cX8/z9Vblp
        ba7kVAtNTXIaDIpqL8L0W4HAcR/eElpSsGdu/f6OfBup4/mri5ebuJY8rIGUcinH
        3Lw5awbzLFtt2rAbhALs6JvXtnNDe7Yjng43XYH3YjdUNGSz0OAen66+/DM0l+bx
        ukJDZRPjpMkIE5/a6VwgEbtrjDpFvuDfweBdzwD95mE8ISh5nQE1uU0g2qW/C2FB
        DLlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1678373349; x=1678459749; bh=HWlttmWBWkFFI
        mvGFkmHbThBBRgnq5qfVnSMPiiuprE=; b=MrirbUSp6BM76BrjA/JqObhWc0wLd
        pxZSF0Mr53AeFaITIZ8KuMTctmlqmqaCrHVzHr0x6Y/utR39LiPNzPwXfpF+TBm6
        4NrmiWldOCHq73SWP032Cso3E2QF0eS9XRbzSzgySoBlTroo4oGQWNGUUgUlytP4
        h9kD5dPMDxTP7yje/pW70h99DhKFWLJdLo2Cti7h270QnD/q3/R2j0zKU7n62+KU
        CC7nN7KkUXwWExiMHvuzaf9OlsV5SVtDpfSF7JnxeMLoMQHNxSdN7ePQjDvilRKK
        ddlWHuWnk8F9XmkpQSk9dcTr/1MIpmA2n+BDCL7Yws1p2OERYSBs1I51Q==
X-ME-Sender: <xms:5PEJZImbpDwP6HjUpCUgc1MfTLnqYdPzwnjW45YBJnqOOr-1Uy2YCQ>
    <xme:5PEJZH1rFS5JhDK7T3Ncq9OzUFwY5sC3coPbtWwr2HIc5kHOBR8xepbqmhpX1AHkq
    QdgoG8tQ3SaOBPyVtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduiedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:5PEJZGpqTVJHj6yk9ML2avOR9nQ7tBw5qAdN6Erul2Gsc3K_NgkCUA>
    <xmx:5PEJZEn3LONMSgE8hjF2x1CS8QfC5gLP92rk4WKCQApbIveS2O5vBQ>
    <xmx:5PEJZG2k4KE3uLJn7BGIELbnTBMw28T3DF-Y8_DTrp1mBk3ftQBG5A>
    <xmx:5fEJZP5BOhksONANfnhcedrGW2aUYKAYmfcv1Gz19X-tTZM69mUvHw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 342DDB60086; Thu,  9 Mar 2023 09:49:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <d307b36e-4901-458d-a366-eaf478a77412@app.fastmail.com>
In-Reply-To: <CACRpkdYQfT=JXvmjKR_9O74H2dmwx1EF4QjCHM6fKAetpbrMOg@mail.gmail.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAnku01goVDCuNM+@smile.fi.intel.com>
 <CACRpkdYQfT=JXvmjKR_9O74H2dmwx1EF4QjCHM6fKAetpbrMOg@mail.gmail.com>
Date:   Thu, 09 Mar 2023 15:48:47 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc:     "Oliver Neukum" <oneukum@suse.com>,
        "Ye Xiang" <xiang.ye@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, "Wolfram Sang" <wsa@kernel.org>,
        "Tyrone Ting" <kfting@nuvoton.com>,
        "Mark Brown" <broonie@kernel.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        "Sakari Ailus" <sakari.ailus@linux.intel.com>,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
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

On Thu, Mar 9, 2023, at 15:18, Linus Walleij wrote:
> On Thu, Mar 9, 2023 at 2:53 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> Yups. And I think the solution looks something like this:
>
> u8 obuf[LJCA_GPIO_BUF_SIZE] __aligned(8);
> u8 ibuf[LJCA_GPIO_BUF_SIZE] __aligned(8);
>
> __aligned(4) if it's 32bit DMA I guess? 8 always works that's
> why we use it all over the IIO subsystem.

I think it must be __aligned(ARCH_DMA_MINALIGN), to account
for architectures with non-coherent DMA.

     Arnd
