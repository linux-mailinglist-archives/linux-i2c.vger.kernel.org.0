Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAD8459646
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 21:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbhKVUwN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 15:52:13 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50623 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237015AbhKVUwJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Nov 2021 15:52:09 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2957C5808FC;
        Mon, 22 Nov 2021 15:49:01 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Mon, 22 Nov 2021 15:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm3; bh=se5bfYkPT7kIXF8J2Gea1/9IMltq
        BeaRSW+HQ4r0XQo=; b=esM+8DaZPFF8rh3zwBamhCTEYqwG5W+xc699fM9sUDQI
        tmUtHh9A7DJf20QjCFZx0p+RdGr+HHzEEWRJoVibsPZpY7KjN6KbnVCNqs2Fd2Jh
        3FWipDlFlXgAHWqzZBJ3cNTkXOSMuMpKRsxs5zoqx+1p1qrYpPDwuv5YdCrh5pDl
        jRNgaczzhvHX/rZSgmvpzY7Az4JPUqNXx8SxLmI83hl2g4yRcipo3yP0rmkoqsDA
        02c3Y3XjyIIRL3QlA4ivGu/bnBhxCGInOc/X/2xhprvuBFgVWB9/qoWsuSQd/sod
        oHUU4TTM598FgY4NSfmBGp3ZXD3RCjZGSe0lcjAaPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=se5bfY
        kPT7kIXF8J2Gea1/9IMltqBeaRSW+HQ4r0XQo=; b=XgTLdh5o01Qbfri2YmZX/r
        86xlrugzmzcHhtPYUto/UuikkkB7OvwUW+/pD4jTDUsMk0C6IElyUf4qzscz0rHS
        wMoPeWcmW6Bh0U5MZYMaLTB3M+Xj2WT6XlZHldPIRGm0KYNkzyAyhwsixZPfSedH
        hF+8ARnlOYZEItRAYh/Usp1U54vXtPHYwaCKFHZlLfEb0nhNb8EJR7tf01H6Vvov
        A+gyTrph1z7esarM2pPT51Ajb2pu/ia6sS5+sJOmukgqDMmnEs3iQgDtdOXTtv1p
        OCFKVLQuQIzNpLzBaGFwzogBnhBHph9Oj4VIkMD0ePHyPTRDxh5buYObyyZTvrew
        ==
X-ME-Sender: <xms:PAKcYcUvmr1tBLOaYBW2L4LUm9USL7lm65XglU73yD8w84P5Etlngg>
    <xme:PAKcYQlxI2lt7QO72cwNFcg5T_fONWXSRrZUnCP33UdyJWKwdUoAqvV7DGAYeH4eD
    Q1Qi39ZDT19riznkO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpeekleelfefhtdduieekffetkeevhfdthffghfeggedvvdehkeeikefgvdev
    tdejgfenucffohhmrghinhepohiilhgrsghsrdhorhhgpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:PAKcYQaPUZXYDfQeSpZPthJzrPCjURFqfZbpPZ7DAY5_5AWucJHr-Q>
    <xmx:PAKcYbW1pCwb_6QTAgAVqHAqa5RARGV_3RK2tf33Ya-SRcYVgkV5KA>
    <xmx:PAKcYWnAgbJSV2IyqrnqaRvd4_V6OHDboL3B3FnuKyXZRhTQddCltw>
    <xmx:PQKcYfc-bXaELf3H4wrHpnjtXQg-4LQgw2ep13E5075mRdooesBpFg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7EAFA27405DA; Mon, 22 Nov 2021 15:49:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <e22c452d-9b64-4b29-9f82-74b33d688ee1@www.fastmail.com>
In-Reply-To: <20211122175903.GA28130@jannau.net>
References: <20211121171545.27402-1-j@jannau.net>
 <20211121171545.27402-3-j@jannau.net>
 <2baebbe6-0080-4cff-86de-a00f23aea95e@www.fastmail.com>
 <20211122175903.GA28130@jannau.net>
Date:   Mon, 22 Nov 2021 21:48:39 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Janne Grunau" <j@jannau.net>
Cc:     "Hector Martin" <marcan@marcan.st>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Wolfram Sang" <wsa@kernel.org>, "Olof Johansson" <olof@lixom.net>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "Mark Kettenis" <kettenis@openbsd.org>,
        "Rob Herring" <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: i2c: apple,i2c: allow multiple compatibles
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Mon, Nov 22, 2021, at 18:59, Janne Grunau wrote:
> On 2021-11-21 21:22:47 +0100, Sven Peter wrote:
>> Hi,
>> 
>> On Sun, Nov 21, 2021, at 18:15, Janne Grunau wrote:
>> > The intention was to have a SoC-specific and base compatible string
>> > to allow forward compatibility and SoC specific quirks,
>> >
>> > Fixes: df7c4a8c1b47 ("dt-bindings: i2c: Add Apple I2C controller bindings")
>> > Signed-off-by: Janne Grunau <j@jannau.net>
>> > Cc: Mark Kettenis <kettenis@openbsd.org>
>> > ---
>> 
>> Yeah, this should've been "apple,t8103-i2c", "apple,i2c" all along :/
>> Given that we have no i2c nodes in the dts yet and that this binding was
>> only added for -rc1 I think it's fine to just drop "apple,t8103-i2c"
>> here instead of marking it as deprecated and keeping it around forever
>> if Mark Kettenis also agrees.
>> 
>> >  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 9 +++++----
>> >  1 file changed, 5 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml 
>> > b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>> > index 22fc8483256f..f1cb96c08212 100644
>> > --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>> > +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>> > @@ -20,9 +20,10 @@ allOf:
>> > 
>> >  properties:
>> >    compatible:
>> > -    enum:
>> > -      - apple,t8103-i2c
>> > -      - apple,i2c
>> > +    items:
>> > +      - enum:
>> > +        - apple,t8103-i2c
>> > +      - const: apple,i2c
>> 
>> Nit: the enum makes sense once we add t6000-i2c but right now
>> 
>> properties:
>>   compatible:
>>     items:
>>       - const: apple,t8103-i2c
>>       - const: apple,i2c
>> 
>> also works and look a bit less weird.
>
> I split it from change which in addition added "apple,t6000-i2c" as 
> second enum value. I have no strong preference but the weirdness will 
> hopefully vanish soon.

I'm slightly in favor of not introducing the enum. You'd have to fix the indentation
if you wanted to introduce it anyway [1] (checkpatch there also seems to complain about
the commit hash for the Fixes tag but that looks like a spurious warning to me since
df7c4a8c1b47 is in Linus' tree [2]):

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/apple,i2c.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)


Best,

Sven

[1] http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211121171545.27402-3-j@jannau.net/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df7c4a8c1b47
