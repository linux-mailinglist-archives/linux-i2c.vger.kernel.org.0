Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181EB42796C
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Oct 2021 13:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhJILcJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Oct 2021 07:32:09 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40321 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231526AbhJILcI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Oct 2021 07:32:08 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6FDF5580977;
        Sat,  9 Oct 2021 07:30:10 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute1.internal (MEProxy); Sat, 09 Oct 2021 07:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=uTxGnyhkHJhSQNzCzJ23BnB9E0YY
        OsJqvk8zIcUsFNE=; b=HWKeMA2zk/SmswwAuUwtSfayXtT2QRaC6A/bksgBpP4R
        AQIDzJBMbI8H40kxQoH9FMxddeq5/aVWu6X16xkUYSuL75Ag2xiyo3XZCIL8HfCw
        KR6RfOmj+bDvSJTAsdQ9JitmydeTLAvEPgHmX2QeJDz3xEpgOTh0QgpDBKACzKj/
        Z7PxTL8UpTLz/ExT1IkSa3g68GxkjunLLNKK5W7iCRE4CRbaPJI21+Axpdq7KWcO
        4cvA43vN17PfqSYJS5XlKNSMqGooKCpuZw6ahTr1PmmHpdAcHs6Jh6fod6Efxnxl
        UBo7eJwEvuEuMWm/Qrjz+K9q/b4is/0HXH1eHHa3MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uTxGny
        hkHJhSQNzCzJ23BnB9E0YYOsJqvk8zIcUsFNE=; b=AtsLYlu3D5YC01UzMJvxjY
        X7/h7ztco+uS7Hi+74AFtUw309ecoVdJCplIaMCeJIR2FgW1RxBgSW+lcLUO0jUU
        X6Fvvxc5YBtvvL1720jwh13Nb5eNm+TXsbrBSiJq7WWJ3N67J9IqapGoMCDf5h7r
        FsH4RxQkILz5gsWd37LwO0CBOmxCvqJlp6QIq7f1Z4UUhdR0INVSBpE1Hzywir3T
        08RqhwgjkGbFOCOe/B/+Lxs4UNTmEKIp3eSGRa97Oddm9Cj1Noc0qdyt9RKKWLjp
        C2nxqNFtPrzpeTtMO8LW8rU/JbO3eDfU54Kct72WuxrE8zNQf8a6h824kcf/Z/lg
        ==
X-ME-Sender: <xms:QX1hYa7lqWLI1vXjwr6C3e9afYZY0cc3wLdMoG97PxqEbDD75_rv5Q>
    <xme:QX1hYT47D4-oQPjPpRaj09h-7lJYrhmkQO9dWxBpedMw8bBUmLzn7GmFqz1hkUSef
    tOJI5hySZsEPrdFJbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:QX1hYZdFPvGujphPZs4XiP3CvjfPRcpaIUCBlOFFEmhf1QJ5qe2BIg>
    <xmx:QX1hYXK3IAjGfM5iWV0OpMIUl6wrOtD--dv_2DALBvW6sWkCah3hAg>
    <xmx:QX1hYeJLGhCe6V-0kFUSxPAWblhISXHUGh82rDm2t9NHLXE41rwUwg>
    <xmx:Qn1hYZYEwfWBy6tacnWQ_8Z2EqoKxT3-97Eym_zIOwO1cY778nhwrg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 11C5A2740061; Sat,  9 Oct 2021 07:30:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1331-g5ae342296a-fm-20211005.001-g5ae34229
Mime-Version: 1.0
Message-Id: <7b8290ce-7ca0-4c91-a0a0-3421fc8b4983@www.fastmail.com>
In-Reply-To: <YWFqUuc7I5Dh8+w6@ninjato>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <20211008163532.75569-11-sven@svenpeter.dev> <YWFqUuc7I5Dh8+w6@ninjato>
Date:   Sat, 09 Oct 2021 13:29:48 +0200
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
Subject: Re: [PATCH v2 10/11] i2c: pasemi: Add Apple platform driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Sat, Oct 9, 2021, at 12:09, Wolfram Sang wrote:
>>  F:	arch/arm64/boot/dts/apple/
>> +F:	drivers/i2c/busses/i2c-pasemi-platform.c
>
> We have no dedicated maintainer for PASEMI. Are maybe you or your
> project interested in maintaining the pasemi-core, too? I guess not many
> patches will show up and they will likely be for M1 anyhow.
>
> If so, then no need to resend, I could add the extra line while
> applying.

Sure, feel free to add the core to the entry as well.


Best,

Sven
