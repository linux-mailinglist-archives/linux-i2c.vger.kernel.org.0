Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA2B42796E
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Oct 2021 13:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbhJILc0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Oct 2021 07:32:26 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:56277 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231526AbhJILc0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Oct 2021 07:32:26 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5E8EA580958;
        Sat,  9 Oct 2021 07:30:29 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute1.internal (MEProxy); Sat, 09 Oct 2021 07:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=yjaV+Aq620PMH7q1EGIlum03SV/o
        UJx+i3qPZXiQFDo=; b=TtbRWbUcBV+Pt/wwY/RcU/PWNZf/aE5l2kf3EqdnxHyI
        s/yjd8KH80LtAUZw+tZqwEIE4Zpnz4v3nwG35xb2ggpdkYpzfQBFvQQfO4aPh1lr
        sFbmnXX5WxwoSvpY0X59wJggzlhXTgS9vlHm5QADlFABxj1ayBvSJxKBIXH6sg7E
        gLndLhRj6vPqQfZA1lDNnEEGWiD6ljmj2wjbglk4hT8niJ57x0Sjtyi1vELsXF5u
        yKPsqXK2Xp5YB3bKdaAbkD+sn9lOmyOSzmiOF/kp64QyZMJpY3lmlQHsWwE5qqaE
        E0g8V4wTs3iYwzsSfQjlRtnWziDpFN1a2p/jznFptA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yjaV+A
        q620PMH7q1EGIlum03SV/oUJx+i3qPZXiQFDo=; b=UXA09pFYq8poDEewrBZO/U
        fECE+f2C6Yr12nJ2G/gFdQCCUQ4KMqaXRO+qm9jFR2IfTinRAcfUjm07sovsQGNy
        CWP74ZGzFogkt2FtxneokoR/u6NEeD6LaSg0b6sLirYQaOhGWzgpRyepJVu/GBHL
        SAjP8dhjoMqBPXgm6PVcU2vzuGReKr/PXEBtVrVN4ne4eaLYeZ5oiLVOQGR9NGux
        +zjSmlDpr87cAj9Ad4ZVrCrQGzbyY4nyQ9pLvVCJh+4h3q+lUBMvtXV/JjN1lUhD
        m/SOwHsRjBtQEV4ep/hEn62GLicp6xSgGRyEc8xRizkzXDSKz2bGbid6pORLf4+Q
        ==
X-ME-Sender: <xms:VX1hYSHM9wpcHz3dl4pvcwuQ4d0QTZggyf4_5yEDj1DuLTlCXEGFQg>
    <xme:VX1hYTWsSWEri_U3HMEpXyRQN-syL6FGCKjR9PSwnmHGNtW1gIvHKDVhksKWyqeTP
    zYR9w8DLPXVgka6A2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:VX1hYcJIUkumBhOboIGcPzOSd3Q68zSU0NnI6cQS0J1SKKV1VH7bGQ>
    <xmx:VX1hYcGyIpP_rA6g78dAqg2XrjxW6uAFwXBUixeruzkYGyKV9_88iQ>
    <xmx:VX1hYYVGjzYwDIq2aDY5MHYgHst_-h-0jaa1kWLSBq62ec5ch2kw5A>
    <xmx:VX1hYZXTR3ZuA4FZ68Uk-RiVbnnvBJslbxivCXImn4Waiv7c4wHgVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3FA6D2740061; Sat,  9 Oct 2021 07:30:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1331-g5ae342296a-fm-20211005.001-g5ae34229
Mime-Version: 1.0
Message-Id: <2f0c7001-475e-4790-b90d-a6d9e1341563@www.fastmail.com>
In-Reply-To: <YWFqr4uQGlNgnT1z@ninjato>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato>
Date:   Sat, 09 Oct 2021 13:30:09 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Wolfram Sang" <wsa@kernel.org>
Cc:     "Michael Ellerman" <mpe@ellerman.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Paul Mackerras" <paulus@samba.org>,
        "Olof Johansson" <olof@lixom.net>,
        "Christian Zigotzky" <chzigotzky@xenosoft.de>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "Hector Martin" <marcan@marcan.st>,
        "Mohamed Mediouni" <mohamed.mediouni@caramail.com>,
        "Stan Skowronek" <stan@corellium.com>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 9, 2021, at 12:10, Wolfram Sang wrote:
>> I still don't have access to any old PASemi hardware but the changes from
>> v1 are pretty small and I expect them to still work. Would still be nice
>> if someone with access to such hardware could give this a quick test.
>
> Looks good to me. I will wait a few more days so that people can report
> their tests. But it will be in the next merge window.

Sounds great, thanks!


Sven
