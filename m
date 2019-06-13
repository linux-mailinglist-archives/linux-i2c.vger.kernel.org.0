Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C267445D3
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 18:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730304AbfFMQq7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 12:46:59 -0400
Received: from smtp111.iad3a.emailsrvr.com ([173.203.187.111]:38808 "EHLO
        smtp111.iad3a.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730280AbfFMFJZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 01:09:25 -0400
Received: from smtp38.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
        by smtp38.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 302C31855;
        Thu, 13 Jun 2019 01:09:24 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1560402564;
        bh=YphfuBxons+OWOZNJBAlemTbwJdLog12Pz9975FV9lE=;
        h=Subject:From:Date:To:From;
        b=TcnXbiR3mVBC7+Vi+KfgW8p+wSwKO0l7u8OvL72AXx/4HHzTnVJo/6ptDUYm8BaqU
         CgGAn3DnI0OtguY6c3serWW4+cOuHk3BfAwYRVr1vJf9hCm0TCDmIagPrIxt12p5yN
         JYx3XPruhINe/T2oZ3rOyEOO8JiwMpMwgBd3fsO0=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp38.relay.iad3a.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 0E2CD2CA6;
        Thu, 13 Jun 2019 01:09:22 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Thu, 13 Jun 2019 01:09:24 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v4] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <20190612104107.ndbo55ii2w3ahtzr@ninjato>
Date:   Wed, 12 Jun 2019 22:09:21 -0700
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, swarren@wwwdotorg.org,
        NWDR Team <team@nwdigitalradio.com>,
        Eric Anholt <eric@anholt.net>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E838B63-DD8D-40AC-AA31-7C0FEF8B4424@nh6z.net>
References: <20190529042912.12956-1-nh6z@nh6z.net>
 <20190608171443.14484-1-nh6z@nh6z.net>
 <20190612104107.ndbo55ii2w3ahtzr@ninjato>
To:     Wolfram Sang <wsa@the-dreams.de>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Jun 12, 2019, at 3:41 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>=20
> On Sat, Jun 08, 2019 at 10:14:43AM -0700, Annaliese McDermond wrote:
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
>>=20
>> Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
>> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
>> Reviewed-by: Eric Anholt <eric@anholt.net>
>=20
> Applied to for-next, thanks for keeping at this!

Thanks for your patience with this.  I know it=E2=80=99s hard to deal =
with
newer folks sometimes, but I really appreciate your forbearance.

> And thanks to all
> reviewers, too.

Thanks too to Eric and Stefan.  If you=E2=80=99re ever in the Eugene, OR =
area
look me up for a free beverage of your choice. :)

> (One minor thing: next time, please start a new thread when sending a
> new patch. This makes applying patches easier.)

I=E2=80=99ll definitely do so next time.  Thank you.

--
Annaliese McDermond
nh6z@nh6z.net=
