Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 619A516463
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 15:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfEGNR0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 09:17:26 -0400
Received: from smtp119.ord1d.emailsrvr.com ([184.106.54.119]:37754 "EHLO
        smtp119.ord1d.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbfEGNR0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 May 2019 09:17:26 -0400
X-Greylist: delayed 386 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 May 2019 09:17:25 EDT
Received: from smtp7.relay.ord1d.emailsrvr.com (localhost [127.0.0.1])
        by smtp7.relay.ord1d.emailsrvr.com (SMTP Server) with ESMTP id A36C820188;
        Tue,  7 May 2019 09:10:58 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp7.relay.ord1d.emailsrvr.com (localhost [127.0.0.1])
        by smtp7.relay.ord1d.emailsrvr.com (SMTP Server) with ESMTP id 94DA120189;
        Tue,  7 May 2019 09:10:58 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1557234658;
        bh=OOkoQgnHxu//5/xnAwqLV6gzZ7D2HJz3eqql9tebNv8=;
        h=Subject:From:Date:To:From;
        b=RCxY2p/RCqeYXbmgDxdIj575CapFfmLQYnS41gfCliQILm2RyJ5cnLle1dBN3oyH+
         +KrPxpeVk4MbflLy8jOMINGR8sCJgr9NQNK39yhjsvWzayD8rwMsBAtdEFeA3BFhc5
         LPwPRgJrfQRfjBPjIXmfnBN5SjTKKZkLvHoyb7d0=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp7.relay.ord1d.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 9CC5D20188;
        Tue,  7 May 2019 09:10:57 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Tue, 07 May 2019 09:10:58 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <878svivq8y.fsf@anholt.net>
Date:   Tue, 7 May 2019 06:10:56 -0700
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, wsa@the-dreams.de,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        NWDR Team <team@nwdigitalradio.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F9C09952-3F75-44E7-94A6-1055ADA5A0A8@nh6z.net>
References: <20190505034339.30778-1-nh6z@nh6z.net> <87o94fo3h0.fsf@anholt.net>
 <C611AB4D-7674-438D-BB95-9F83852043EA@nh6z.net> <878svivq8y.fsf@anholt.net>
To:     Eric Anholt <eric@anholt.net>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On May 6, 2019, at 9:32 PM, Eric Anholt <eric@anholt.net> wrote:
>=20
> Annaliese McDermond <nh6z@nh6z.net> writes:
>=20
>>> On May 6, 2019, at 11:14 AM, Eric Anholt <eric@anholt.net> wrote:
>>>=20
>>> Any chance we could reuse clk_register_divider() instead of having =
our
>>> own set/round/recalc rate implementations?
>>=20
>> Eric --
>>=20
>> I=E2=80=99d love to, but the set_rate implementation includes setting =
the
>> BCM2835_I2C_FEDL_SHIFT and BCM2835_I2C_REDL_SHIFT registers for the=20=

>> rising and falling edge delay on the I2C bus based on what the =
divider
>> value is.
>=20
> Hmm.  I ran into that in clk-bcm2835.c as well, and the solution was
> that bcm2835_register_pll_divider() sets up the divider structure and
> then reuses clk_divider_ops.round_rate() and .recalc_rate()

I=E2=80=99m not sure this makes a lot of sense in this particular case.  =
I=E2=80=99d still
have to keep the bcm2835_i2c_register_div() function, and really I=E2=80=99=
d only
be saving having to implement round_rate() and recalc_rate().  The =
tradeoff
is that the common round_rate and recalc rate are much more complex and
require a more complex private structure (clk_divider) which also=20
precludes my use of the common bcm2835_i2c_writel() used in the rest of
the driver because I no longer have a pointer to the bcm2835_i2c_dev
structure that I need to call it in set_rate().

I get the desire to reuse code and to use common structures whenever
possible.  It just seems to me that going down this path leads to more
overall code that=E2=80=99s less straight forward.   Maybe I=E2=80=99m =
wrong.

--
Annaliese McDermond
nh6z@nh6z.net=
