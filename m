Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B4A15643
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 01:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfEFXGw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 19:06:52 -0400
Received: from smtp87.iad3b.emailsrvr.com ([146.20.161.87]:45044 "EHLO
        smtp87.iad3b.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725994AbfEFXGw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 19:06:52 -0400
X-Greylist: delayed 590 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 May 2019 19:06:51 EDT
Received: from smtp19.relay.iad3b.emailsrvr.com (localhost [127.0.0.1])
        by smtp19.relay.iad3b.emailsrvr.com (SMTP Server) with ESMTP id 0189F401B0;
        Mon,  6 May 2019 18:57:01 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp19.relay.iad3b.emailsrvr.com (localhost [127.0.0.1])
        by smtp19.relay.iad3b.emailsrvr.com (SMTP Server) with ESMTP id E6A2F401EB;
        Mon,  6 May 2019 18:57:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1557183420;
        bh=M66upwQcYfZke/JgzTNK76Q3ajUzl56JXsDHQtItSRA=;
        h=Subject:From:Date:To:From;
        b=ekv3mC598bdCnUkrtViS4mBVXvm5CR1TUCIxxX7iMV9MaIug0mejYT+kpft5r9E9u
         8v9yn9KQ8sDPVO8Cdk0Pfm/lte100BfGxWVlT271cH+rw0XvZ4mG+cjjmg3nz1vXkc
         4SLn8N1jNU0hltSh7S/AEfdJJ+lNtAuWlLHL1X2M=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp19.relay.iad3b.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id D5A3F401B0;
        Mon,  6 May 2019 18:56:59 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Mon, 06 May 2019 18:57:00 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <87o94fo3h0.fsf@anholt.net>
Date:   Mon, 6 May 2019 15:56:58 -0700
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, wsa@the-dreams.de,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C611AB4D-7674-438D-BB95-9F83852043EA@nh6z.net>
References: <20190505034339.30778-1-nh6z@nh6z.net> <87o94fo3h0.fsf@anholt.net>
To:     Eric Anholt <eric@anholt.net>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On May 6, 2019, at 11:14 AM, Eric Anholt <eric@anholt.net> wrote:
>=20
> Annaliese McDermond <nh6z@nh6z.net> writes:
>=20
>> Model the I2C bus clock divider as a part of the Core Clock =
Framework.
>> Primarily this removes the clk_get_rate() call from each transfer.
>> This call causes problems for slave drivers that themselves have
>> internal clock components that are controlled by an I2C interface.
>> When the slave's internal clock component is prepared, the prepare
>> lock is obtained, and it makes calls to the I2C subsystem to
>> command the hardware to activate the clock.  In order to perform
>> the I2C transfer, this driver sets the divider, which requires
>> it to get the parent clock rate, which it does with clk_get_rate().
>> Unfortunately, this function will try to take the clock prepare
>> lock, which is already held by the slave's internal clock calls
>> creating a deadlock.
>>=20
>> Modeling the divider in the CCF natively removes this dependency
>> and the divider value is only set upon changing the bus clock
>> frequency or changes in the parent clock that cascade down to this
>> divisor.  This obviates the need to set the divider with every
>> transfer and avoids the deadlock described above.  It also should
>> provide better clock debugging and save a few cycles on each
>> transfer due to not having to recalcuate the divider value.
>=20
> Any chance we could reuse clk_register_divider() instead of having our
> own set/round/recalc rate implementations?

Eric --

I=E2=80=99d love to, but the set_rate implementation includes setting =
the
BCM2835_I2C_FEDL_SHIFT and BCM2835_I2C_REDL_SHIFT registers for the=20
rising and falling edge delay on the I2C bus based on what the divider
value is.

--
Annaliese McDermond
nh6z@nh6z.net=
