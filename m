Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B201211DD
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 03:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfEQBzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 21:55:52 -0400
Received: from smtp87.ord1c.emailsrvr.com ([108.166.43.87]:33486 "EHLO
        smtp87.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725933AbfEQBzw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 May 2019 21:55:52 -0400
Received: from smtp19.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
        by smtp19.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id C64B5A00D7;
        Thu, 16 May 2019 21:55:50 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp19.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
        by smtp19.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id BB3FDA013F;
        Thu, 16 May 2019 21:55:50 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1558058150;
        bh=ruWjhSiIxIzZ+uVDbCZxZzbXIByPB1vnI1uU7Zw158M=;
        h=Subject:From:Date:To:From;
        b=tqxEf2jJjyVLeIePrdCa0SALLszfQmcrS3UecajepWWf2U+D6x2uCWIy6yyecGwCI
         ypKAGhtAeqoAThraMsjVwQIUmFkPJTeY4yyV56WyiePDW9FJsR6+IdRSF3oqZWGpsG
         pU0kvRTMZtlDIa0PcaFceK/ldME6nXbpo7KOeNFM=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp19.relay.ord1c.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id C44F3A00D7;
        Thu, 16 May 2019 21:55:49 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Thu, 16 May 2019 21:55:50 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <20190516075848.GA1033@kunai>
Date:   Thu, 16 May 2019 18:55:48 -0700
Cc:     Eric Anholt <eric@anholt.net>, stefan.wahren@i2se.com,
        f.fainelli@gmail.com, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E6EDCD1-E0B1-4859-BD75-EF411D3D4C6B@nh6z.net>
References: <20190508071227.18609-1-nh6z@nh6z.net>
 <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net> <20190516075848.GA1033@kunai>
To:     Wolfram Sang <wsa@the-dreams.de>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram --

Thank you very much for your response.

> On May 16, 2019, at 12:58 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>=20
> Hi Annaliese,
>=20
> On Wed, May 15, 2019 at 10:37:03PM -0700, Annaliese McDermond wrote:
>> I=E2=80=99m just following up on this since I haven=E2=80=99t heard =
anything since I submitted the
>> v2 patch a week ago.  Wolfram, does this look like a sane approach?  =
Stefan,
>> were my changes in v2 acceptable?
>=20
> There is a bit of overhead involved, but conceptually it looks like an
> elegant solution to me. However, I am not an expert of CCF. Grepping
> through kernel sources, I don't see many clocks defined outside
> drivers/clk. So, I'd appreciate if we could get some ack/feedback from
> one of the CCF experts/maintainers.

I was also similarly nervous about a clock provider being outside of=20
drivers/clk, especially since one of the instances of that I wrote.

When writing this, there was a certain logic to putting this inside of
clk-bcm2835.c instead.  Eric may like this approach better because there
will probably be more code reuse of some of the dividers he uses in that
driver. =20

My concern was surrounding the cross pollenation of the i2c and
clock drivers to a certain extent.  You have to be able to set the
FEDL_SHIFT and REDL_SHIFT registers when you change the clock rate.
You can=E2=80=99t do it in the transfer function like was done before =
because
it requires a call to clk_get_rate() which can deadlock in the
conditions I encountered.  You=E2=80=99d have to move those calls to the
clk-bcm2835 driver instead.

My nervousness surrounding moving the code into the clock driver
rather than the i2c driver is that I don=E2=80=99t know how dependent =
they
are on one another.  Do we anticipate that there may be a use for
the i2c-bcm2835 driver without the clk-bcm2835 driver?  Asking the
question very well may be premature optimization for a condition
that may never exist.  I=E2=80=99m thinking maybe Eric has some more
insight into this?

The other minor issue is that it=E2=80=99s going to require a change to =
the
bcm2835 DT to change the clock pointer to the divider.

If it fits better in the clk-bcm2835 driver, I=E2=80=99m happy to submit =
a
patch that puts it there.  Just let me know and I can work on it.

--
Annaliese McDermond
nh6z@nh6z.net=
