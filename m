Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2D714164
	for <lists+linux-i2c@lfdr.de>; Sun,  5 May 2019 19:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfEERVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 May 2019 13:21:53 -0400
Received: from smtp111.ord1c.emailsrvr.com ([108.166.43.111]:58272 "EHLO
        smtp111.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726965AbfEERVw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 May 2019 13:21:52 -0400
Received: from smtp6.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
        by smtp6.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id 6A359A0109;
        Sun,  5 May 2019 13:21:51 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp6.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
        by smtp6.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id 5F85BA01B2;
        Sun,  5 May 2019 13:21:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1557076911;
        bh=bGboeso/6pM/R+qsWKfFODRbluQRZ4gytzEB/GD3jxg=;
        h=Subject:From:Date:To:From;
        b=QKe/IRupEB6631vcy1NB2cTrQW/FZ0H7HR0o5X9L7Tw0CSt2Gb/s+Uy05fFHzeqcU
         wXl7nBKtqf83OBzPmMaHGNeZk5xallmBs5QvOXWpSSMpUvZxolSTOl83WZ4tCJqs7g
         zW4rtYZQpbjCKJ9j2p/s4mImGBNfpoLPNvFHPe4Y=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp6.relay.ord1c.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 79C34A0109;
        Sun,  5 May 2019 13:21:50 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Sun, 05 May 2019 13:21:51 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <c43eb848-23cd-4b0c-638d-3bb0df58ed31@gmail.com>
Date:   Sun, 5 May 2019 10:21:49 -0700
Cc:     Stefan Wahren <stefan.wahren@i2se.com>, eric@anholt.net,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <362948E6-B012-4F3D-89B7-396141C7E596@nh6z.net>
References: <20190505034339.30778-1-nh6z@nh6z.net>
 <610c7594-85c9-72db-63a6-6e632e9586aa@i2se.com>
 <c43eb848-23cd-4b0c-638d-3bb0df58ed31@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On May 5, 2019, at 10:13 AM, Florian Fainelli <f.fainelli@gmail.com> =
wrote:
>=20
>=20
>=20
> On 5/5/2019 3:36 AM, Stefan Wahren wrote:
>> Hi Annaliese,
>>=20
>> Am 05.05.19 um 05:43 schrieb Annaliese McDermond:
>>> Model the I2C bus clock divider as a part of the Core Clock =
Framework.
>>> Primarily this removes the clk_get_rate() call from each transfer.
>>> This call causes problems for slave drivers that themselves have
>>> internal clock components that are controlled by an I2C interface.
>>> When the slave's internal clock component is prepared, the prepare
>>> lock is obtained, and it makes calls to the I2C subsystem to
>>> command the hardware to activate the clock.  In order to perform
>>> the I2C transfer, this driver sets the divider, which requires
>>> it to get the parent clock rate, which it does with clk_get_rate().
>>> Unfortunately, this function will try to take the clock prepare
>>> lock, which is already held by the slave's internal clock calls
>>> creating a deadlock.
>>=20
>> i think i understand the problem, but could you please explain the
>> specific use case where this happend?
>>=20
>> I suspect bcm2835 is not the only platform which is affected, so it
>> would be better to fix this in general.
>=20
> Agreed, if you could identify i2c bus drivers that support changing =
the
> bus clock and move the registration of the bus 'struct clk' into the =
i2c
> core that would scale a lot better.

This isn=E2=80=99t necessarily because of changing the bus clock.  This =
is
because one of the parents of the bus clock could change.  This =
necessitates
resetting the divider feeding the bus clock of the i2c device so that
it still produces the desired frequency.

I would imagine that not every device has an internal divider that helps
create the bus frequency.  I could very well be wrong.

> --=20
> Florian

--
Annaliese McDermond
nh6z@nh6z.net=
