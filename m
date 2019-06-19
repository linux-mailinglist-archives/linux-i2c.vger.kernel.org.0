Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5834B370
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 09:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbfFSH4w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 03:56:52 -0400
Received: from smtp111.iad3a.emailsrvr.com ([173.203.187.111]:60535 "EHLO
        smtp111.iad3a.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbfFSH4w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jun 2019 03:56:52 -0400
Received: from smtp14.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
        by smtp14.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 13EA02509F;
        Wed, 19 Jun 2019 03:56:51 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1560931011;
        bh=nlytxzqSkiORuqwDCgMfTH9qNAct2oY4cbvvUdkDmD8=;
        h=Subject:From:Date:To:From;
        b=wbMriODlEZVzbkMl+dZQ8pc7VzwKjFcgTCbrZo8pzgMGQGr1i+U1/4jzUShGXKiOa
         HwpqntUTNAqJNVXffSSPd54NnunG+nA2gNm5mK40kSKL3HIgjabmab/pjr4nU0XMYA
         TDHGaZi4p1i+RXhOXL60GJhvKVTofxgrxbwepR0k=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp14.relay.iad3a.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id EA61F20FDE;
        Wed, 19 Jun 2019 03:56:49 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Wed, 19 Jun 2019 03:56:50 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v4] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <cd25e228-c3e1-2a01-14e3-fe9a5198c78d@i2se.com>
Date:   Wed, 19 Jun 2019 00:56:48 -0700
Cc:     eric@anholt.net, f.fainelli@gmail.com, wsa@the-dreams.de,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <EBC4BB44-5ED9-4C88-B371-A85774DB16B4@nh6z.net>
References: <20190529042912.12956-1-nh6z@nh6z.net>
 <20190608171443.14484-1-nh6z@nh6z.net>
 <cd25e228-c3e1-2a01-14e3-fe9a5198c78d@i2se.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Stefan --

> On Jun 19, 2019, at 12:16 AM, Stefan Wahren <stefan.wahren@i2se.com> =
wrote:
>=20
> Hi Annaliese,
>=20
> On 08.06.19 19:14, Annaliese McDermond wrote:
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
> i've seen reports [1], [2] that this commit causes trouble.
>=20
> Could you please look into them?


I=E2=80=99ll see if I can look into these and see what=E2=80=99s up.


> Thanks
>=20
> [1] - https://www.raspberrypi.org/forums/viewtopic.php?f=3D44&t=3D242856=

> [2] - https://archlinuxarm.org/forum/viewtopic.php?f=3D23&t=3D13719

--
Annaliese McDermond
nh6z@nh6z.net=
