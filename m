Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B351A26BBDA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 07:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgIPFfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 01:35:53 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53881 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbgIPFft (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 01:35:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4413E793;
        Wed, 16 Sep 2020 01:35:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 16 Sep 2020 01:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=dAhartNk4zeRElK+/OxgbX2nG4Mmm0a
        i/4Y5aHhHOB8=; b=Sy2bgy4D3+z46ym6wc5/81/reL2KybtjK1GQF0fS26GYDhQ
        doNXtsSJxpl8ptiOFTl61Nj+fGmOVDL/lS6T3eaIkrvX4IMbPnWH+biAcP9qe7WN
        Nw4s5vDmQ43p+W5McPVKi38AcOmU2gYi93dOYB0s9fMmBwQHbagGZhi9pYih6aPx
        Uqa/YS3gLgF8TnoTkItssPRjJnJu+ZlVbHgnM3q4lxsx97TjqMBcXMqgxzfJCR4C
        hrVaSS7p78Y34/N+QdSZHBU+KCh7jqTRj1RXrCfmmpY1n38RoUEWgTsMkDnHA3bO
        t+SJQ3kreMfDce1OKEEdi0qsc+0vl60Lv31PBYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dAhart
        Nk4zeRElK+/OxgbX2nG4Mmm0ai/4Y5aHhHOB8=; b=T5lPpf4r/fBtEwXYwwUYo8
        x0qQp3FaISzTWxNBsM+v1JMm9nOi2Yb/GlquoImHHRFqah4qqtC/yR5UxZLscOor
        NBC5MSNqyqAWO6bGL3GDvzbys2lPKogI1ZYi0kDOjlM1zy+UvaRWy1OjkkRx+PxS
        XWaH49kUrRx6dYrzfPWxtMo/SPQg+wuGPS2WPN7ObHGSrBXcq3MucunXLq/tGQX/
        JQZtTWRLh2ns1a5ztZLiTXMzjvkWD24vje1/bMF0Plb0REXHpW4tP0Tuw/qQ2FBy
        oqflXISol0yGoER2qwgXft2d5M4GuTqHH9/zkk8SZjszLG+ds3ydykiD3r2MJBZA
        ==
X-ME-Sender: <xms:M6RhX-q68f0-eJs3ZaQj0wtGVBFdi8_fSo4T4VHRrTM3wopc4t0a_A>
    <xme:M6RhX8rtiNHhElk08mdJ4bHJH2Bpr8Xpf7-zisFJecJxgVJ1Fz8OklCa1PJhQ57g3
    SO4D1BYpcm05d9WmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddugdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:M6RhXzMTiZbPmvs_lRyOb6fZXO066GuVc4x4UjFLHG-tX_Ei5US9_A>
    <xmx:M6RhX95qhHGp4KawewxfHNOYYyZEj_y73bzVr7uXv_PGcl6X4cGOuw>
    <xmx:M6RhX964UJIsg8qKsak8gFD5-bfzRQG8RvtzmSdCUrTia10xi8Y0eQ>
    <xmx:M6RhXw2MAGMvD8gSiiLb1aKzH8Jy7C83IJWIJI7rtFikVUTcNhoZYw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6AE16E00C8; Wed, 16 Sep 2020 01:35:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <120342ec-f44a-4550-8c54-45b97db41024@www.fastmail.com>
In-Reply-To: <e7a64983-fe1d-1ba2-b0c3-ae4a791f7a75@roeck-us.net>
References: <20200914122811.3295678-1-andrew@aj.id.au>
 <e7a64983-fe1d-1ba2-b0c3-ae4a791f7a75@roeck-us.net>
Date:   Wed, 16 Sep 2020 15:05:25 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     "Jean Delvare" <jdelvare@suse.com>, wsa@kernel.org,
        "Joel Stanley" <joel@jms.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Throttle I2C transfers to UCD9000 devices
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Tue, 15 Sep 2020, at 02:13, Guenter Roeck wrote:
> On 9/14/20 5:28 AM, Andrew Jeffery wrote:
> > Hello,
> > 
> > While working with system designs making use of TI's UCD90320 Power
> > Sequencer we've found that communication with the device isn't terribly
> > reliable.
> > 
> > It appears that back-to-back transfers where commands addressed to the
> > device are put onto the bus with intervals between STOP and START in the
> > neighbourhood of 250us or less can cause bad behaviour. This primarily
> > happens during driver probe while scanning the device to determine its
> > capabilities.
> > 
> > We have observed the device causing excessive clock stretches and bus
> > lockups, and also corruption of the device's volatile state (requiring it
> > to be reset).  The latter is particularly disruptive in that the controlled
> > rails are brought down either by:
> > 
> > 1. The corruption causing a fault condition, or
> > 2. Asserting the device's reset line to recover
> > 
> > A further observation is that pacing transfers to the device appears to
> > mitigate the bad behaviour. We're in discussion with TI to better
> > understand the limitations and at least get the behaviour documented.
> > 
> > This short series implements the mitigation in terms of a throttle in the
> > i2c_client associated with the device's driver. Before the first
> > communication with the device in the probe() of ucd9000 we configure the
> > i2c_client to throttle transfers with a minimum of a 1ms delay (with the
> > delay exposed as a module parameter).
> > 
> > The series is RFC for several reasons:
> > 
> > The first is to sus out feelings on the general direction. The problem is
> > pretty unfortunate - are there better ways to implement the mitigation?
> > 
> > If there aren't, then:
> > 
> > I'd like thoughts on whether we want to account for i2c-dev clients.
> > Implementing throttling in i2c_client feels like a solution-by-proxy as the
> > throttling is really a property of the targeted device, but we don't have a
> > coherent representation between platform devices and devices associated
> > with i2c-dev clients. At the moment we'd have to resort to address-based
> > lookups for platform data stashed in the transfer functions.
> > 
> > Next is that I've only implemented throttling for SMBus devices. I don't
> > yet have a use-case for throttling non-SMBus devices so I'm not sure it's
> > worth poking at it, but would appreciate thoughts there.
> > 
> > Further, I've had a bit of a stab at dealing with atomic transfers that's
> > not been tested. Hopefully it makes sense.
> > 
> > Finally I'm also interested in feedback on exposing the control in a little
> > more general manner than having to implement a module parameter in all
> > drivers that want to take advantage of throttling. This isn't a big problem
> > at the moment, but if anyone has thoughts there then I'm happy to poke at
> > those too.
> > 
> 
> As mentioned in patch 2/2, I don't think a module parameter is a good idea.
> I think this should be implemented on driver level, similar to zl6100.c,
> it should be limited to affected devices and not be user controllable.
> 
> In respect to implementation in the i2c core vs in drivers: So far we
> encountered this problem for some Zilker labs devices and for some LTC
> devices. While the solution needed here looks similar to the solution
> implemented for Zilker labs devices, the solution for LTC devices is
> different. I am not sure if an implementation in the i2c core is
> desirable. It looks quite invasive to me, and it won't solve the problem
> for all devices since it isn't always a simple "wait <n> microseconds
> between accesses". For example, some devices may require a wait after
> a write but not after a read, or a wait only after certain commands (such
> as commands writing to an EEPROM). Other devices may require a mechanism
> different to "wait a certain period of time". It seems all but impossible
> to implement a generic mechanism on i2c level.

So I think it could be handled with an optional i2c client callback: e.g.

struct i2c_client {
...
bool (*prepare_device)(const struct i2c_client *client);
}

This way the logic to delay is kept inside the driver, catering to both the 
Zilker and the LTC devices. If the problem exists only after specific 
operations then we can stash some state in the client in the same way I've done 
in patch 1, test that state in the callback and only do the "preparation" if 
it's necessary.

I can knock that up and post another RFC, just so we can get a feel for how 
that solution looks.

Andrew
