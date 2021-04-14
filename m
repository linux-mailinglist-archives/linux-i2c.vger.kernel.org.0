Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E580335F62C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 16:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhDNO3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 10:29:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:34212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231451AbhDNO3e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 10:29:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BDA160E09;
        Wed, 14 Apr 2021 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618410553;
        bh=ULR2Y6Oyze+PfYYy5g7siky9rC4QhLeFnXM071T1jSA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RjlkfoGv7Jgt6mnjXeBfL4f4d5MXVM8Il6p9lr+0XfgbP27EUWNtlPLwt8f/uWNo7
         wTjD1z0OVgvgc4+zzJeIIJKJm+Pt4R7z9/pacgrKQ5w+JewZ4V2+03DtKKbtqYfh+l
         Sxib6yr+x9rq8adBgMsxdiGboF0uJR9JRZLqgtnV/prNhqriH5FyuPiJX0rRxxV15M
         4HOi3DEZ0Ecoqdr9Ktw4g9lV3YL8Mdx8YXIuRE+lDS5ouxGFD4Oe6fLhCqBUINaO3t
         nhrYeJ5BkQkV5S/ADY3vO5qsYkKdP0KVxowG27ZZbUoX9fKp1epp/4zMdpGAWrXqBY
         Lk+fe+UU4GjTA==
Date:   Wed, 14 Apr 2021 16:29:08 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] i2c: mv64xxx: Fix random system lock caused by runtime
 PM
Message-ID: <20210414162908.5034257a@thinkpad>
In-Reply-To: <87mtu1atcd.fsf@BL-laptop>
References: <20210408020000.21914-1-kabel@kernel.org>
        <20210413195854.GB2751@kunai>
        <87mtu1atcd.fsf@BL-laptop>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 14 Apr 2021 15:28:18 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> > On Thu, Apr 08, 2021 at 04:00:00AM +0200, Marek Beh=C3=BAn wrote: =20
> >> I noticed a weird bug with this driver on Marvell CN9130 Customer
> >> Reference Board.
> >>=20
> >> Sometime after boot, the system locks with the following message:
> >>  [104.071363] i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left:=
 0
> >>=20
> >> The system does not respond afterwards, only warns about RCU stalls.
> >>=20
> >> This first appeared with commit e5c02cf54154 ("i2c: mv64xxx: Add runti=
me
> >> PM support").
> >>=20
> >> With further experimentation I discovered that adding a delay into
> >> mv64xxx_i2c_hw_init() fixes this issue. This function is called before
> >> every xfer, due to how runtime PM works in this driver. It seems that =
in
> >> order to work correctly, a delay is needed after the bus is reset in
> >> this function. =20
>=20
> Marek,
>=20
> As you mentioned it was related to reset and the issue occurred with the
> support of runtime PM. Did you try to add the delay only in the function
> mv64xxx_i2c_runtime_resume(), just after the mv64xxx_i2c_hw_init() call ?
>=20

I did indeed discover this when I added this delay into the resume
function. In fact I discovered this when I added printf()s into suspend
and resume when debugging. The problem disappeared with these printf()s
(UART is slow so printf() counted as the necessary delay it seems).

I then moved the delay into the hw_init() function because that is what
made sense to me, that the delay is necessary after the reset, not only
when resuming, but always. We just did not notice because a xfer was
never done immediately after reset before the PM patch. (But maybe I am
wrong, maybe it is not needed in the reset. It just makes the most
sense to me...)

Marek
