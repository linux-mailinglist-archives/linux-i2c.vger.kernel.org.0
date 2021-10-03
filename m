Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2A7420210
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Oct 2021 16:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhJCOjY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Oct 2021 10:39:24 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38547 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230050AbhJCOjX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Oct 2021 10:39:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 369FF580ADF;
        Sun,  3 Oct 2021 10:37:36 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Sun, 03 Oct 2021 10:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=5Oua/xYcZ8sUdKkZ+WL2Y13bonyO
        X558R4+E8eOjPK0=; b=rlvzb2vCrzSz6CHr3TI2OaG5/Z8mFul9dCvhpRkOg0fT
        QUoSLH6jjBzOO7fPBSlAD3cbQrOnYwDpSqL7ianjL87WJ07+gs9Qv458OpIEKXrF
        e39spiACDRsEvVS6qnYKOHxVHOcnZXkha1ry12C2xXGE4vJp5WNDplmzxkYbStGV
        zu8SZxD7NhhyJ8rtIXntB50MQvuqeS7Nl+D1BTpg9HMHCn7LeCwBKJY+sJYJn3Ka
        vuKYTRJfOtidGF+c1F8EgiceVz2pG6YsHYL+ABNavQhFWF7/Rk05r4tn92OiufXj
        djZv9cwCd1Lw/xKL9NrrjfB0+mhqI2rKPYc7CNpEjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5Oua/x
        YcZ8sUdKkZ+WL2Y13bonyOX558R4+E8eOjPK0=; b=nkgefiqJ5l2kC+bTcXTrJi
        l+xhq45qU0uVOALdU/XK9Dxn0r7rkx+xzr89VLHQjq8lGTDYhFrgqKxomrLKUfPS
        1vkk3JvxCbAlOz7a8/Yfg9aWxcWhShynBkXiIOowT0DeX90bqcIAGCR83JfMKrvv
        FEf7rybxB6L32eyR6nsj0K3Rhyn29KPcBYB6P5SKXbr81sKgQZV/bDUhbIHnb8AD
        mqg6BwrPIxc8xJAzeuxjw/giofT+g68fu9oUN0I0eOhmvtOZDt7U3YPphUGOD4fG
        cjXr2yvd03I1cF6KQnaMJBzwYnSIEMSNdEEZQAswZsz4ceEmBekMeLzzTEss2/4g
        ==
X-ME-Sender: <xms:MMBZYZRr_AzCfIj0Ps92D784AB3B0gNag8E5RNFhiKQvjAOHPHcYcw>
    <xme:MMBZYSzihhz9G1J6eUkFEQL0LlmNxrS0sgCQeQb0vqUkrMxTkh_f-55fzZTcNVxfQ
    U4SzuRP_oAgB_VdzSY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:MMBZYe0skvR09teY6kd_z8tbmZ_sCqLG0mzC8gkgUkkd4oFqdPsSUA>
    <xmx:MMBZYRB7-asYWIzXyh3Czni4-O5z0-BC_M2_KOQzPHDVERC2r-9ouQ>
    <xmx:MMBZYSiKzewZZfx7YeDH9Mk3Y7xm0wJnoh3ZdC_0aXY7nDvI__LItA>
    <xmx:MMBZYTZt5ozJJDb30AzEiRAH-L4KaZqLoeGZm_E3I5Pa_T9kSOtYPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 074A551C0060; Sun,  3 Oct 2021 10:37:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1322-g921842b88a-fm-20210929.001-g921842b8
Mime-Version: 1.0
Message-Id: <acbacba2-b239-4268-8acf-6596ab0dfded@www.fastmail.com>
In-Reply-To: <YVTNpt/vOeZI5P+L@kunai>
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <20210926095847.38261-10-sven@svenpeter.dev> <YVTNpt/vOeZI5P+L@kunai>
Date:   Sun, 03 Oct 2021 16:37:15 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Wolfram Sang" <wsa@kernel.org>
Cc:     "Michael Ellerman" <mpe@ellerman.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Paul Mackerras" <paulus@samba.org>,
        "Olof Johansson" <olof@lixom.net>, "Arnd Bergmann" <arnd@arndb.de>,
        "Hector Martin" <marcan@marcan.st>,
        "Mohamed Mediouni" <mohamed.mediouni@caramail.com>,
        "Stan Skowronek" <stan@corellium.com>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] i2c: pasemi: Add Apple platform driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 29, 2021, at 22:33, Wolfram Sang wrote:
>>  drivers/i2c/busses/i2c-pasemi-apple.c | 122 ++++++++++++++++++++++++++
>
> Can't we name it 'i2c-pasemi-platform.c' instead? Makes more sense to me
> because the other instance is named -pci.

Sure, that's more consistent. I'll change the filename for v2.


Thanks,


Sven
