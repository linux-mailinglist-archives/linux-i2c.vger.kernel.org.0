Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 672667C489D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 05:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344777AbjJKDy5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 23:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjJKDy5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 23:54:57 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA7793;
        Tue, 10 Oct 2023 20:54:54 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E5B4C5C04BF;
        Tue, 10 Oct 2023 23:54:53 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Tue, 10 Oct 2023 23:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1696996493; x=1697082893; bh=XU
        RNCAmC4EG85LJ2IwA8ijWYMJfISUOpWhPozcDFZr8=; b=I4UD5POOswSYS2Ai/K
        u4uZeq39hxS7F3fe24y2CPrcfQCN/BBUVXZvoTp/KcGTg/vxtcwcMgOo5mNzuNER
        s4pRLhoVfXqDlaBymn79w2/NBslB1rLHOW+2iRbtjHw7VRnUBNShoNVud3qzr9o1
        2HrgtYFU7gnIyaFs/KeujclwuCgOOnA1GjqLJ7+Z+pOK/ZQ0smtQwI2WyB83Kmbp
        x2mrIM2CAuFoYWKmUGDKKbv+/G3B62TDtFzOn1pT9776ZMKgaH79MUFqwOOMwrx9
        LCJHRj4fptWj50k0phtjf30NyVxYN+zTqHwaIfBQgC5kzijP1M6gceKRsl1NsSGe
        /IuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1696996493; x=1697082893; bh=XURNCAmC4EG85
        LJ2IwA8ijWYMJfISUOpWhPozcDFZr8=; b=QHUlcq9MO51x7HVjc2ccHXcQ1YyKC
        pl4AgEkhHjIW7j7QFL2hy5XzQMNIcqDGGuqldovtl227u3z64SSyRoM7NZh4P0eg
        NifzRow1zI0xk/N71/4+DtGRi+mpg32XczwaheA8usozHIVuyqUUJeHn/fQatnQS
        r+l5/9wKx8rjpYNd8dX2M4VM6LtYc8cu0OSruM5EFhthk5lKuTwb5Lg89qXbeDQh
        68aQl06iVeqD9e1pKJ56vuff2kh0EPntMCQbV6sQCNBt5fSMlLGCWevOQsiO+GXO
        XPRe2wzAgtECx4ww+z63iO2JxUpqXRgGbiugWri7gjapZQEsmRUO5tQ5w==
X-ME-Sender: <xms:jRwmZZOqOQxcZjnPVBzP4z_d52iIX7z4pUYecTzkTzzNYoEuLkF5AA>
    <xme:jRwmZb_ORwVuaujEz4FAZHmlQm-x6jXR9kKJr-4JSRyTPY36lkGSRhR6Hli2MQ86q
    S7ntvD9f2AJC6NTog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheejgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeegtdejteetkeeiueegffehveeiudekheeihfellefhkefguefhudejleef
    gffffeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    fiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:jRwmZYT5xvQBS5l381o9e_zSYwKnU-oROqWda20uid5IrXhxahPLoQ>
    <xmx:jRwmZVtBeL_JPJc5v3xxCoZ7UsMvABRQDWDzSG-UDacgXDDJg6J-7g>
    <xmx:jRwmZRdaE_fgUXZOhuZDAxvJZ6w6XXj5x7byYC7rWgU-s9KSGo2cTw>
    <xmx:jRwmZR12b82Gs-ptcISXiqraaPnr6XAtNl4UGUpKSk9k1W_BAERfdQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4ED5A1700093; Tue, 10 Oct 2023 23:54:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <0db41eaa-34dc-40c9-a28f-cfde39c6b48a@app.fastmail.com>
In-Reply-To: <125cac30-b83d-4530-885b-5008fc3045af@roeck-us.net>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
 <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
 <ZSWevlHzu6kVcGWA@shikoro>
 <125cac30-b83d-4530-885b-5008fc3045af@roeck-us.net>
Date:   Wed, 11 Oct 2023 14:24:10 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Guenter Roeck" <linux@roeck-us.net>,
        "Wolfram Sang" <wsa@kernel.org>,
        "Lakshmi Yadlapati" <lakshmiy@us.ibm.com>, sumit.semwal@linaro.org,
        christian.koenig@amd.com, "Jean Delvare" <jdelvare@suse.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "Eddie James" <eajames@linux.ibm.com>,
        "Ninad Palsule" <ninad@linux.ibm.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay between
 bus accesses
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 11 Oct 2023, at 09:29, Guenter Roeck wrote:
> On Tue, Oct 10, 2023 at 08:58:06PM +0200, Wolfram Sang wrote:
>> Hi Guenter,
>> 
>> > > > Reference to Andrew's previous proposal:
>> > > > https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/
>> > > 
>> > > I do totally agree with Guenter's comment[1], though. This just affects
>> > > a few drivers and this patch is way too intrusive for the I2C core. The
>> > > later suggested prepare_device() callback[2] sounds better to me. I
>> > > still haven't fully understood why this all cannot be handled in the
>> > > driver's probe. Could someone give me a small summary about that?
>> > > 
>> > 
>> > Lots of PMBus devices have the same problem, we have always handled
>> > it in PMBus drivers by implementing local wait code, and your references
>> > point that out.
>> 
>> I am confused now. Reading your reply:
>> 
>> "I am not sure if an implementation in the i2c core is desirable. It
>> looks quite invasive to me, and it won't solve the problem for all
>> devices since it isn't always a simple "wait <n> microseconds between
>> accesses". For example, some devices may require a wait after a write
>> but not after a read, or a wait only after certain commands (such as
>> commands writing to an EEPROM)."
>> 
>> I get the impression you don't prefer to have a generic mechanism in the
>> I2C core. This I share. Your response now sounds like you do support
>> that idea now?
>> 
>
> I didn't (want to) say that. I am perfectly happy with driver specific
> code, and I would personally still very much prefer it. I only wanted to
> suggest that _if_ a generic solution is implemented, it should cover all
> existing use cases and not just this one. But, really, I'd rather leave
> that alone and not risk introducing regressions to existing drivers.

We had an out-of-tree patch for the max31785[1] that I wrote a little 
after the initial discussion on this generic throttling and possibly 
somewhat before the other drivers had their delays added. Recently Joel 
pointed out the addition of the delays in the other drivers and I 
raised the idea that we could get rid of that out-of-tree patch by 
doing the same. Guenter's point about the work-arounds being very 
particular to the device is good justification for not trying to 
fix drivers that we can't immediately test - not that the series did 
that, but arguably if we're shooting for the generic solution then it 
should.

So I agree with Guenter that we probably want to do down the path of 
adding the delays directly into the max31785 driver and not trying to 
over-generalise.

Lakshmi: Apologies for misleading you in some way there - unfortunately 
I can't go back to understand exactly what I suggested as I've changed 
jobs in the mean time.

Andrew

[1]: https://github.com/openbmc/linux/commit/44e1397368a70ffe9cdad1f9212ffdef8c16b9be
