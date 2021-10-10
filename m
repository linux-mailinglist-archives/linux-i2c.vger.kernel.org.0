Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60DA5428177
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 15:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhJJNTc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Oct 2021 09:19:32 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40525 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231907AbhJJNTc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Oct 2021 09:19:32 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9AA465813DF;
        Sun, 10 Oct 2021 09:17:33 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute1.internal (MEProxy); Sun, 10 Oct 2021 09:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm2; bh=PZzCauLMg+BrkHj2XOFWZVMQnGqma2A
        ScnwJBV9s9iw=; b=DhNcIVMIQtKhVLEHBMdEwWrO4/yG77/WbP9bdVOJ9z+Go+z
        zDbMiSh/Ju0mi1Hf1aRekwKad5MzSe6/Py58MHcJLb/yvS7lMecNVQ6Kp0WbwddK
        mpLHD4yoGw7jP33mq5FiekMIDA5ewuq+r0NxTXo5fdOOuUfeOiaX4+G+aBjgIIAc
        ZqgTrZwdd8+q1OggoBNKHj+CbCvXFIW4Yb9iqjaf61O1fGSmwvcyrIH9g5AqgG2d
        ibaQDwZnTH6q00PrpIasQ6wLrrC9IPVJuod8Pdp24Z//QYgXpY0tQSCFFIi6xstP
        0wykkcoit6h7VJG20oa5uaNgUjl7+vlbqP+UtWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PZzCau
        LMg+BrkHj2XOFWZVMQnGqma2AScnwJBV9s9iw=; b=RzM0HPVdCNHxIVk6uoKWMj
        NEcFX/28d2QVSY+N3nXylCE49oF2/eS03fy6Xx/+zLOsPRlra++XAVg2/AGe7kll
        kfmjl8qAB0/Eo+odjTfArJMD7+GxZyAbwaAi7ng/FTYuIhD9z9zYVrlg2LwIVVo0
        v+ZK4iSR2AvcO5TwlKbLRoP54ymm4i7Q7f+1q4hRkmH0xtAOqG+DkO5446KNHI+o
        sfosM8sI5LncZLXm9wIlfwRkA2M4sX+zruOrSU3uByYM0szOdqKKel4qRV78yqha
        KugGjBv4rYbidCr8E+bQbG7DILiVgY1wCfFum24dj6Duaauz5Ay/loJAW0mglisw
        ==
X-ME-Sender: <xms:6-diYcaY8IQGFzUCnIBpN8qBrg0dr7vPQxJUMh5EBeYGS5kGZ2y-Tg>
    <xme:6-diYXYMMZbtZFw364QR8ozyRJAKx2PdI6Yxx37PFNjFPAtce4M2_IDJwUmYPFDMt
    RmRzy0PAELxw-AwGEI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtgedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:6-diYW-qPMwEgRwAKNbuMc_OZumIUo9ck5tujTpacDsSp_-5E8x4Ug>
    <xmx:6-diYWq3KxyF9GdOZk0DRP57cprlnKjRKhAA8xj1wmehIsQ5MG5W1Q>
    <xmx:6-diYXoYYoP627gKSfndkdzNDH51CZUg7ev5-hBmGREPxDpbeuB3sA>
    <xmx:7ediYda2l88nnPG6TKaSSy02F32Jms1DUEUtQyxNmmDflm2q9C-Eeg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7C5092740061; Sun, 10 Oct 2021 09:17:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1331-g5ae342296a-fm-20211005.001-g5ae34229
Mime-Version: 1.0
Message-Id: <11d8f784-c90a-4e6c-9abd-564cb5241cb7@www.fastmail.com>
In-Reply-To: <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato> <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
Date:   Sun, 10 Oct 2021 15:17:11 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Christian Zigotzky" <chzigotzky@xenosoft.de>,
        "Wolfram Sang" <wsa@kernel.org>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
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
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "R.T.Dickinson" <rtd@a-eon.com>,
        "Matthew Leaman" <matthew@a-eon.biz>,
        "Darren Stevens" <darren@stevens-zone.net>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 9, 2021, at 15:57, Christian Zigotzky wrote:
> On 09 October 2021 at 12:10 pm, Wolfram Sang wrote:
>>> I still don't have access to any old PASemi hardware but the changes from
>>> v1 are pretty small and I expect them to still work. Would still be nice
>>> if someone with access to such hardware could give this a quick test.
>> Looks good to me. I will wait a few more days so that people can report
>> their tests. But it will be in the next merge window.
>>
> Series v2:
>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de> [1]

thanks a lot, glad to hear everything works on P.A Semi CPUs as well!

And regarding that git am issue you wrote about: I think I based this series on
torvald's tree instead of 5.15-rc4 and there have been some changes to at least
MAINTAINERS. It'll probably apply cleanly to 5.15-rc5 but if that happens again
in the future you can try

  git am -3 mbox

instead. It'll try to do a three way merge if the patch doesn't apply cleanly.


Sven

