Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 589062BAFB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 22:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfE0UAE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 16:00:04 -0400
Received: from smtp95.iad3a.emailsrvr.com ([173.203.187.95]:52151 "EHLO
        smtp95.iad3a.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726817AbfE0UAE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 May 2019 16:00:04 -0400
Received: from smtp4.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
        by smtp4.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 01D8C3C3A;
        Mon, 27 May 2019 16:00:03 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp4.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
        by smtp4.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id E8623420B;
        Mon, 27 May 2019 16:00:02 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1558987202;
        bh=/XOoX/rWzqcLA8aPWxXXz/oJ+7rFLohE7GTNeNJ0x1s=;
        h=Subject:From:Date:To:From;
        b=n2BybzT6KSn8h69JdlPZSpgCrOdrkeo7dph1jDg70beokQSAWIX+mQ0R27DSH+Tna
         Gv/thHMFx5JcsYA60e26LMeMIGmz9vrNlzEIc+YKDYpf+Nx3+uJ+2Qrau8FsJsoCfH
         MSAoWqlAzynxpggIxEX6oK5zpKS5EOWvdRIyuP1w=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp4.relay.iad3a.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id C4F063C3A;
        Mon, 27 May 2019 16:00:01 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Mon, 27 May 2019 16:00:02 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <20190527191534.GD8808@kunai>
Date:   Mon, 27 May 2019 13:00:00 -0700
Cc:     Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        NWDR Team <team@nwdigitalradio.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E711B8C3-85B8-435C-97FD-E62BCB88B679@nh6z.net>
References: <20190508071227.18609-1-nh6z@nh6z.net>
 <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net> <20190516075848.GA1033@kunai>
 <2E6EDCD1-E0B1-4859-BD75-EF411D3D4C6B@nh6z.net> <20190527191534.GD8808@kunai>
To:     Wolfram Sang <wsa@the-dreams.de>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On May 27, 2019, at 12:15 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>=20
> Regardless which solution is favoured, I am going to apply this patch =
in
> a minute:
>=20
> http://patchwork.ozlabs.org/patch/1097688/
>=20
> It enables this driver for ARCH_BRCMSTB. So, the solution should work
> for this as well. (I don't know any of these platforms well)

I did some looking the other day, and I had forgotten that the RPi has 3
of the i2c-bcm2835 devices each with their own divider that sits in =
their
register space.  This makes me think the correct solution would be for
the divider to be controlled in the driver as was in my original patch.
Otherwise we=E2=80=99d have to make three different dividers in the =
bcm2835-clk
driver, and the i2c driver would no longer work for other platforms.

I haven=E2=80=99t heard any comments from any of the clock folks.  I was =
perusing
the code and I see there=E2=80=99s a SPI driver that registers its own =
clock and
some various ethernet and MMC drivers that do the same thing.

> Regards,
>=20
>   Wolfram

--
Annaliese McDermond
nh6z@nh6z.net=
