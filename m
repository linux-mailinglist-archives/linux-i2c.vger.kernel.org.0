Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA9142020E
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Oct 2021 16:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhJCOij (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Oct 2021 10:38:39 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:32783 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230050AbhJCOij (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Oct 2021 10:38:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1F836580ADF;
        Sun,  3 Oct 2021 10:36:51 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Sun, 03 Oct 2021 10:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=eJp/L4J4kGWt8gl3xOU1z9Ma3M3k
        D9N4KMdCSrftlnc=; b=MTdHaifqNQT/oVcoX7O+4n2Q40y5SZo6zuSXckebMpt1
        Yfi/bf2s0NWktuvFTY9S1e95hTNbO4C5dJNS6ZPNN8p4j0deM4Cyl80mDNebpvPI
        APsDp7teKO2rjwK9850it9o/2Ab7fLopYFueIWP4ZHFfDo6+G1bdgN7k6C38kke/
        H/zSn1XG/OBIWYEePKgRIdnMNPhgA+1hZKfV3RaRbpb33ddQU4ZJc0rwzT/6YR/U
        HVNBJSAQUAAM2Jr+Ztn61CaHm1oxWVyn5nlN4sEzh3CmOY8uLMt8Y6+5UC4c8VMi
        aUB4cOwkvQhYMPsN8YB+5v10C44jeYqV1YAa8Bvnmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eJp/L4
        J4kGWt8gl3xOU1z9Ma3M3kD9N4KMdCSrftlnc=; b=dVMGtFFMA2Q6y2ckd+hiH7
        OofqPxpIRtWTeM2bzzh9N1N8/f2vBqyG0ERUFU9HGDJ0QfQmxELbBMFjkxzUKi8n
        w2USydW5vxZF6Siu+qIngSD8Kr4RZbpSlJp4P0J/zGrWGjc3M7i+80660F5R0O24
        F81gNVnfVgzSFuacqvuD9YcHolDsKKEdjf9EKEB1A527EmHD6aY6cmw6MND+6MY7
        3lhYL/3QNlKDKoQriygMUqpSm+vLKYMpdMRmnmM1scwhKo6iKphhGeqGE3l9sKuM
        rm16ae/OsAlPf5HdXO3nXON2TlqNK/htxrkZTmy1gekn7/TqA5AQ4vRI8DRSzQ2w
        ==
X-ME-Sender: <xms:_79ZYbqqY3PiRWyNh0t6rW-Xw2XucFcjvj9uYRq2z7e3MvGl3f--hg>
    <xme:_79ZYVrpQKQR1tlGww1AaTq3RCGGK6-TMD7hOzqdSdQlIWhcCsgDYVSY2zzJSfe2a
    m8TL37EOHthuH60klw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpeevvdegveduvdevvdfgleefgeeivdegheeiuedtleevvdeiveevleejfeev
    tdelheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdgu
    vghv
X-ME-Proxy: <xmx:_79ZYYOPomOSeABHyzMBhZMjgodNb-hB2F13D_jg1zFb53HLmjoD0g>
    <xmx:_79ZYe44zqT5pwYcU3HJnH6YASUjokk5OXVkFhP_C-R4zAmktSIw8g>
    <xmx:_79ZYa7Vn46vwdrO7FcCaT95QgGFfOvf2pB_SRWzPnLU0caq7mMQow>
    <xmx:A8BZYWq3WfPRuszFh3wnhrookCYqYx1nf4VygGGOXFrBy_OORow7tw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A68D951C0060; Sun,  3 Oct 2021 10:36:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1322-g921842b88a-fm-20210929.001-g921842b8
Mime-Version: 1.0
Message-Id: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
In-Reply-To: <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Date:   Sun, 03 Oct 2021 16:36:26 +0200
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

Hi,


On Fri, Oct 1, 2021, at 06:47, Christian Zigotzky wrote:
> On 27 September 2021 at 07:39 am, Sven Peter wrote:
>  > Hi Christian,
>  >
>  > Thanks already for volunteering to test this!
>  >
> Hello Sven,
>
> Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with your 
> modified i2c driver on his Nemo board yesterday. [1]

Thanks a lot, that's great to hear!
If he wants to I can credit him with a Tested-by tag in the commit message,
see e.g. https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes.


Best,


Sven
