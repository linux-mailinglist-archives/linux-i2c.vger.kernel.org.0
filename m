Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE71041B349
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Sep 2021 17:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241656AbhI1Pum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Sep 2021 11:50:42 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:33141 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241649AbhI1Pul (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Sep 2021 11:50:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id CD5E7580C06;
        Tue, 28 Sep 2021 11:48:55 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Tue, 28 Sep 2021 11:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=TJNJoVJQ2CEvO+11aqczB9+XTOD9
        M2VrFWYC6esaHkk=; b=pFuuc22Hay31tr39igmxFxm5qlwbHt2vgL494/h8/iFF
        /ZitFPJhBCYOna6WHbBqB5Q8MiEAxrgoVWPJrO9gepN43dwjcrEQFzBmvDb1Y5du
        0RINlITZPhla+GNetUYbLl+F0tSng5kyoakfMiXu6g9smWs0hYCjYeLGXydbI0e9
        piDzSOjvMkfuCw17cPw9wvv2NQjD7+4Cu1HTSekRvuaU7YNVR6AVaHiIzDeKlkrM
        EyfytEYuGvHfFgdDQGBGYm6yery3ne5ff1vXBaqe7iItFVXC81O6JI7MuQKwHV/8
        bRQ79udTYV9+RkcZbuxlsktcCmReCvByLibKOTfeZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TJNJoV
        JQ2CEvO+11aqczB9+XTOD9M2VrFWYC6esaHkk=; b=Zs8VXUUgAD11M5h5+6VmLW
        wCnnGqo3a3sSoug5wzhjeSC26SBqh5BrFZLjjWYEwOWybLT4fWqnRuNlsVUkaBoH
        ajoI12YYjuzgdJvaE2IlHr9kYsoabTxuvxLxcoRJgwDoF98LbGeWEq81EejjAjcM
        FBLiJM90zeLFbDqKWmeTwzK1oaQq2htXcfpshHWmUHk8YEXfOB6MSIRn7Ct4RSCv
        pr4ra0Vq2jE9PM69m9b30eywkwrvulMYjEr/YXIlYTFndJYmSrQAsSo6npn5ge5k
        DmR5PASJK0WQVeDR+a/VxpkT5gjdaZdal47A7LA05JGzB3O5Reg2Ejs5n2JJa8Qg
        ==
X-ME-Sender: <xms:ZTlTYXNylaEvjabnNwq_LLT89P3x7QXNqZjdPQYdVe6mSz7fFHM4WQ>
    <xme:ZTlTYR8pb5V68Ge9FgWq79gknq7dVAfuVFP44ZI7vWc8j3kVMmz4Ppr0vQH0-Uhvn
    QcudmnudrBEwm2T0Qs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:ZTlTYWS0OkFJyuuvqjeonaqqt20guSHhFQHm4C3A3uFumquVd_rvKg>
    <xmx:ZTlTYbsSJM3wQTLNpuhaXvx7Ez80rbczBIhwjiDXetmmEBUsxnmEzQ>
    <xmx:ZTlTYfe_12tv2GPQKKuIITQbAi47Eyu-pFuHZzvnoMsiEjkAzYsdNQ>
    <xmx:ZzlTYX3ufoWus3Kvb_bx_SSqaLLPp7BvjKMXwvDfHcnmkkW5xFxffw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C651151C0061; Tue, 28 Sep 2021 11:48:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <1c0fd67d-f06c-4e69-876d-31754283b665@www.fastmail.com>
In-Reply-To: <CAK8P3a2_6rcQa8TCgw=6uH26UfjShrVVu-zfLf2=pi6Z8cGOPg@mail.gmail.com>
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <20210926095847.38261-3-sven@svenpeter.dev>
 <CAK8P3a2_6rcQa8TCgw=6uH26UfjShrVVu-zfLf2=pi6Z8cGOPg@mail.gmail.com>
Date:   Tue, 28 Sep 2021 17:48:33 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Arnd Bergmann" <arnd@arndb.de>
Cc:     "Michael Ellerman" <mpe@ellerman.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Paul Mackerras" <paulus@samba.org>,
        "Olof Johansson" <olof@lixom.net>,
        "Hector Martin" <marcan@marcan.st>,
        "Mohamed Mediouni" <mohamed.mediouni@caramail.com>,
        "Stan Skowronek" <stan@corellium.com>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "Linux I2C" <linux-i2c@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/10] i2c: pasemi: Use io{read,write}32
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 27, 2021, at 09:39, Arnd Bergmann wrote:
> On Sun, Sep 26, 2021 at 12:00 PM Sven Peter <sven@svenpeter.dev> wrote:
>>
>> In preparation for splitting this driver up into a platform_driver
>> and a pci_driver, replace outl/inl usage with ioport_map and
>> ioread32/iowrite32.
>>
>> Signed-off-by: Sven Peter <sven@svenpeter.dev>
>>
>> +       smbus->ioaddr = ioport_map(smbus->base, smbus->size);
>> +       if (!smbus->ioaddr) {
>> +               error = -EBUSY;
>> +               goto out_release_region;
>> +       }
>
> While this works, I would suggest using the more regular pci_iomap()
> or pcim_iomap() helper to turn the port number into an __iomem token.

Thanks a lot for the review!

I'll replace it with pci_iomap here and then later in this series with
pcim_iomap when also switching the rest to devres.


Thanks,

Sven

