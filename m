Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFA21C5DD1
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 18:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbgEEQrr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 12:47:47 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:50541 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729119AbgEEQrr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 May 2020 12:47:47 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49GlyR4vq7z8r;
        Tue,  5 May 2020 18:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1588697264; bh=oCn7NSg9d6nqzdxyBMya4kTgYYy3wc8KZHz57zKjUA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=feHImZwBebwT2JOXshwt48eFj/hpxPen9F55a1uXUEhjDPJsuik91Ihynvqttb1rw
         5C6nfQXKqwr+OA1lB0W5iy5E/DqU3f0WLOWMon1ddrCQv4n/ErLooNEZfDm+SXKbV3
         eEm1YBd6Et5iPrkC97jaNREkjyp2DPhQ6Yj+GWLH3oUIwGXhsRaTO+efrFsZOkJoGT
         0B+bYSpUgwoOije7iWCpR7kEC3Vacy1/Y/8xJ70lhOj7gzGgddTwAJ2qJIvlm6SLEm
         ZIsrglxgKtXkdjGdNkwX+TusH7j8MHpkcRRF9Vm5zoiytN26hKti8Hy/P6MqU3t1nL
         4uPkrzXUA/BJQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Tue, 5 May 2020 18:47:39 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: at91: support atomic write xfer
Message-ID: <20200505164739.GA5476@qmqm.qmqm.pl>
References: <55613934b7d14ae4122b648c20351b63b03a1385.1584851536.git.mirq-linux@rere.qmqm.pl>
 <20200322143004.GB1091@ninjato>
 <20200322163013.GA25488@qmqm.qmqm.pl>
 <20200505155228.GG2468@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200505155228.GG2468@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 05, 2020 at 05:52:28PM +0200, Wolfram Sang wrote:
> Hi,
> 
> > I don't expect this to be used for much more than a simple write to PMIC
> > to kill the power. So this patch is tailor made for exactly this purpose.
> 
> Frankly, I don't like it much. The atomic callbacks are supposed to be
> drop-in replacements of the non-atomic contexts. There may be a need to
> read a PMIC register before writing something. I considered checking in
> the core if we can fall back to non-atomic calls if the the atomic ones
> return -EOPNOTSUPP, though,  but I still don't like the idea. I expect
> that people send me minimal versions then which are extended over time
> by very personal use cases. Having a proper implementation
> once-and-for-all (despite bugfixes) sounds much more maintainable to me.

Is it really possible to fall back to non-atomic calls? If that would be
possible, then I would actually want to use it in this case instead of
writing another implementation.

I must say, that I'm reluctant in investing a lot of time in doing
full-blown implementation for a feature that has only a very limited
use. I do understand your point about a proper implementation being
better than a special-cased-only one, but I really don't have a use
for the extension. The few PMICs I worked with just need a single
write to power off.

> > Though, if you would go for full support of atomic transfers, then
> > I would suggest to hack the non-atomic path to be usable in atomic mode
> > instead (some I2C drivers do just that, eg. i2c-tegra).
> 
> Yes, that is what I am aiming for.
> 
> > BTW, I found this comment in i2c-core.h:
> > 
> >  * We only allow atomic transfers for very late communication, e.g. to send
> >  * the powerdown command to a PMIC. Atomic transfers are a corner case and not
> >  * for generic use! 
> > 
> > I think this covers the idea.
> 
> Well, since I implemented the atomic_xfer mechanism, I think I am the
> primary authority of what "covers the idea", so I will fix the comment
> above :) Note, there is also this comment in the way more user-visible
> include/linux/i2c.h:
> 
>  509  * @master_xfer_atomic: same as @master_xfer. Yet, only using atomic context
>  510  *   so e.g. PMICs can be accessed very late before shutdown. Optional.

So, we don't have to wonder what the author had in mind. Lets expand
the idea then. :-) 

Shutdown is kind of special atomic context in that it is ok to do long
waits (as I2C requires) because nothing else is there to do. This is
very unlike normal atomic context. Do you plan to have it work in other
contexts? What are the idea and use cases for atomic-context transfers?

I guess we might want it for suspend/resume, but I think there is an
early stage (with all non-atomic stuff working) and NOIRQ stage (when
most everything is already shutdown). When a PMIC needs a read, I would
actually do it ("prepare" the PMIC) in the early stage if possible.

Best Regards,
Micha³ Miros³aw
