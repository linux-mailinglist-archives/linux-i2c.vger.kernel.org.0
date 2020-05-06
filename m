Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDD11C779F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 19:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbgEFRRS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 13:17:18 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:41740 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbgEFRRS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 13:17:18 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49HNZ2700Gz8L;
        Wed,  6 May 2020 19:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1588785435; bh=OEM7bOlF4icCh1XxlFqIfa1dT9YpIe2MTJF+1hvm8ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CKGCSWi/pj3ro+zfHoNh+j2tmFr1QwnLI6hoKavxCEOJJIVzUxu19hBUlu+DKOtSa
         fAbOPRN7KKL+Vl3PTsGlYxVEkisakrMAJD/aIf3FrnEW3ExAp7Gb7oDefJH2GsmsyU
         BsyprX5muaWMSD2kXLKK6XiL59w/XGCzf9WxNIKtKE3btJXw1LV7o09rhk9njn8NIl
         msfg8jYQo9fdQW0wwr72tKWopcNSAnzi0CN0jRM0ROCQgLbAtr8pU58kD+fRwRBHWU
         eEukRe1JM30ouJlAwYmSR5CeaVPzkFnhSXg/pFCVHT1g6WZcu4HQHroTaLOCmzG8hR
         s7zYkRbeO8Lxw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Wed, 6 May 2020 19:17:10 +0200
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
Message-ID: <20200506171710.GA6019@qmqm.qmqm.pl>
References: <55613934b7d14ae4122b648c20351b63b03a1385.1584851536.git.mirq-linux@rere.qmqm.pl>
 <20200322143004.GB1091@ninjato>
 <20200322163013.GA25488@qmqm.qmqm.pl>
 <20200505155228.GG2468@ninjato>
 <20200505164739.GA5476@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200505164739.GA5476@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 05, 2020 at 06:47:39PM +0200, Micha³ Miros³aw wrote:
> On Tue, May 05, 2020 at 05:52:28PM +0200, Wolfram Sang wrote:
[...]
> > > BTW, I found this comment in i2c-core.h:
> > > 
> > >  * We only allow atomic transfers for very late communication, e.g. to send
> > >  * the powerdown command to a PMIC. Atomic transfers are a corner case and not
> > >  * for generic use! 
> > > 
> > > I think this covers the idea.
> > 
> > Well, since I implemented the atomic_xfer mechanism, I think I am the
> > primary authority of what "covers the idea", so I will fix the comment
> > above :) Note, there is also this comment in the way more user-visible
> > include/linux/i2c.h:
> > 
> >  509  * @master_xfer_atomic: same as @master_xfer. Yet, only using atomic context
> >  510  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
> 
> So, we don't have to wonder what the author had in mind. Lets expand
> the idea then. :-) 
> 
> Shutdown is kind of special atomic context in that it is ok to do long
> waits (as I2C requires) because nothing else is there to do. This is
> very unlike normal atomic context. Do you plan to have it work in other
> contexts? What are the idea and use cases for atomic-context transfers?
> 
> I guess we might want it for suspend/resume, but I think there is an
> early stage (with all non-atomic stuff working) and NOIRQ stage (when
> most everything is already shutdown). When a PMIC needs a read, I would
> actually do it ("prepare" the PMIC) in the early stage if possible.

For a followup, I did a quick grep for pm_power_off in i2c drivers [1]
and looked around how are the shutdown handlers implemented. Mostly I
see regmap_update_bits() (almost all with a regcache) and plain writes.
No driver checks if the I2C controller provides atomic transfers - all
assume it is possible.

Coming back to the original patch, I think that WARN on error from the
atomic is transfer is missing here. The core tries to use normal
master_xfer in atomic context as a fallback, but I'm not sure this
actually works (I wrote the patch because it didn't).

If the driver API had split submit and wait callbacks, this could be
much easier, as there would only be need to implement atomic wait part
differently most of the time.

Best Regards,
Micha³ Miros³aw

[1] grep -rl 'i2c\|smbus' $(grep pm_power_off -rl drivers/)
