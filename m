Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEFE418EB3
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Sep 2021 07:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhI0Flk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 01:41:40 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:50645 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232910AbhI0Flk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Sep 2021 01:41:40 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2C4B2580BC7;
        Mon, 27 Sep 2021 01:40:02 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Mon, 27 Sep 2021 01:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=ak1/NyNHcL+y89gvyMRS1SkX9a8U
        UV2UncuVzD4o65U=; b=diT6Gng5AR5WB6gQReTE6zaaYmRzH7nxmiLpKVWe1q1z
        E37yJJnMLNKLxhIU/1n3lW2p0uba4K5VSAe4J1UBG7dFoVRpwGbSMQGBtVMXzsRG
        BNKUsr3ZjRRaBuSZfm5ZFq4FmN96YS+EmXAerY2Mo5Ih6yqx2BjhLklaaHxtK7sK
        OuOvakC3Z5JSAN4K5OSKCNXBKNhnk99uRBC+ZWnJuEt3D621j0fKzN0YxeHg/OJP
        VV8ncWeMKovAJF17uVAT3miGyPp135vr2BIAYg50BpHNnD4j5c6u2XXK6dCpcejG
        vG9VyrupeYOfPZIdlomy1KHi0IZ9La6kZ8NOcvRT+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ak1/Ny
        NHcL+y89gvyMRS1SkX9a8UUV2UncuVzD4o65U=; b=NleN4unVajTeBeEiak931q
        iqRGvaXFdxAUMpgNeqQR+buTPw1HKWzfcgKTbnWWcTFWP5O+z4QcAzXB2csa1MKx
        lAmFAyH7pffzQsdXUVlBGwd99yVio6vQA2fQZqU4jEZmLeIOMRayctKaocyIp34t
        5MV8SVzWMmOdv4eXBbwpEAPud2qp8SGy2PNpVFFL1/EMEkWJ3VmdCRiSogfxQmdp
        CpwuORA5pNkyGT6uQQDt5gtAQ0IrhZ+cva5xe1GVk9HuK9FKT98/FfkPvw8WF6Jr
        S96sug6xMiK9dDajX1nyshkhpv6IWALpxZqMH6i4AxB6V0M0cY0/5rt5nr58mZ4w
        ==
X-ME-Sender: <xms:L1lRYReMadmShvwxJ7Yp1n5SQr2S6rmJMLuxf5TOgZdNDLSaZXn0Lw>
    <xme:L1lRYfNr98SE5ZZz1cmmrjyeiVA090I-l56QJdaApXB-OWSPhIZUBtRMgA_kvhwtM
    sLd8yNsct83jSCph2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:L1lRYaiguV0BscYi_hIzrHWwI4YouVy_3RpEZfHsNKjOVpKFwd2rZQ>
    <xmx:L1lRYa_DI75kAK1JgESQWyfeHcG6zDoHDCcTscUm3VFRjoUPoU3chQ>
    <xmx:L1lRYdtPoXp-hnu0gyOmumQr-OWqFpazq-eqyNoIkWxQDEjzwT9wxg>
    <xmx:MllRYW-jA2G63ae78zi9DHtJ_FjL6HEXcvBOXjGSSeG1WVGpOWel0g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7811E51C0060; Mon, 27 Sep 2021 01:39:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
In-Reply-To: <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
Date:   Mon, 27 Sep 2021 07:39:39 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Christian Zigotzky" <chzigotzky@xenosoft.de>
Cc:     "Michael Ellerman" <mpe@ellerman.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Paul Mackerras" <paulus@samba.org>,
        "Olof Johansson" <olof@lixom.net>, "Arnd Bergmann" <arnd@arndb.de>,
        "Hector Martin" <marcan@marcan.st>, mohamed.mediouni@caramail.com,
        "Stan Skowronek" <stan@corellium.com>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        linux-arm-kernel@lists.infradead.org,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        "Darren Stevens" <darren@stevens-zone.net>,
        "Matthew Leaman" <matthew@a-eon.biz>,
        "R.T.Dickinson" <rtd@a-eon.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Christian,

Thanks already for volunteering to test this!

On Sun, Sep 26, 2021, at 22:27, Christian Zigotzky wrote:
> Hi Sven,
>
> I can't apply your patch 5 (i2c: pasemi: Split pci driver to its own 
> file). [1]

That's strange because it should apply cleanly. I'll double check
after to work today to see if I messed up while sending this.

>
> Error message:
>
> patching file b/drivers/i2c/busses/i2c-pasemi-core.c (renamed from 
> a/drivers/i2c/busses/i2c-pasemi.c)
> Hunk #3 FAILED at 344.
> 1 out of 3 hunks FAILED -- saving rejects to file 
> b/drivers/i2c/busses/i2c-pasemi-core.c.rej
> patching file b/drivers/i2c/busses/i2c-pasemi-core.h
> patching file b/drivers/i2c/busses/i2c-pasemi-pci.c
>
> Please post one patch with all your modifications.
>

Sure, will do that later as well!


Best,


Sven
