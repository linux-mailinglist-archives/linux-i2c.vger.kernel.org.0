Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEA63936BB
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbhE0T6f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:58:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234847AbhE0T6c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:58:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F0116101E;
        Thu, 27 May 2021 19:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622145419;
        bh=qIE1LXRLwXEmg9ILFWfe9VjRIfnJQbP1zmbVHHFqpKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uIShwkpoNZP+fWrZdA/6GE7SWrBVlw3EHwydbKgUmlpz1ZRZqPfJsssSiFBJerrNV
         QggAyWGrjsFdoBPL3RSQ8X7yvE78w8pTbL0ZoJZaDGi0cUNijsY0FyI5LixFqM7E4F
         e/jYosoYax+/FxyvwwiERnODhqNipIihpSbmkg+7LHOs72Ihh8+raJMPbhkXmGb/lU
         594WuSj5WJzoacD/6SHchW0touAgKGcXvWmvlrzN7WreiaF3TuvE/X0ATXmerr2PsH
         Wdh45t4AVtoh4455QY6LqGB66JWenMDyQvj6hSWSMeOaV8Pbzxi358f5YFuDNSwg3/
         VOUxISIAHPbsA==
Date:   Thu, 27 May 2021 21:56:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: i801: Don't generate an interrupt on bus reset
Message-ID: <YK/5iPNV5USqxE4G@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20210525170336.213a19b4@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="47Hu26P1NuXCfTyF"
Content-Disposition: inline
In-Reply-To: <20210525170336.213a19b4@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--47Hu26P1NuXCfTyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 05:03:36PM +0200, Jean Delvare wrote:
> Now that the i2c-i801 driver supports interrupts, setting the KILL bit
> in a attempt to recover from a timed out transaction triggers an
> interrupt. Unfortunately, the interrupt handler (i801_isr) is not
> prepared for this situation and will try to process the interrupt as
> if it was signaling the end of a successful transaction. In the case
> of a block transaction, this can result in an out-of-range memory
> access.
>=20
> This condition was reproduced several times by syzbot:
> https://syzkaller.appspot.com/bug?extid=3Ded71512d469895b5b34e
> https://syzkaller.appspot.com/bug?extid=3D8c8dedc0ba9e03f6c79e
> https://syzkaller.appspot.com/bug?extid=3Dc8ff0b6d6c73d81b610e
> https://syzkaller.appspot.com/bug?extid=3D33f6c360821c399d69eb
> https://syzkaller.appspot.com/bug?extid=3Dbe15dc0b1933f04b043a
> https://syzkaller.appspot.com/bug?extid=3Db4d3fd1dfd53e90afd79
>=20
> So disable interrupts while trying to reset the bus. Interrupts will
> be enabled again for the following transaction.
>=20
> Fixes: 636752bcb517 ("i2c-i801: Enable IRQ for SMBus transactions")
> Reported-by: syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-current, thanks!


--47Hu26P1NuXCfTyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv+YcACgkQFA3kzBSg
KbYHLQ/9GBuY4E8obBS8mdrhuNvAfzOVQ2cKnJQEpmZnN69hsd+2ihhHuj2FRBnM
QJgpHzoQ/AxCI2G9PxTSV6gkggpNHvBiOq5F836Elscwdq2oMh181rxykXy1Bqad
7BuxrnovA5sQ43MZg206pXalp+h9fzfPkzKhR+IQcpAgVfF3yRMF6kUFqPxwO0wH
Gqn6i61DTZ+3gnmzREOsxYRSPbspK08N3+TdviGP2trrMooFpyxZd+/nZlv4Kqd5
CjS2AL6kUYEiehzetqsBnWWXB/+8S/MyRSMHqlz99B7wIw7OVmnAK6dvCmzUsftQ
f5YpDkFemaR+7BQ4Fmf+wGx1TNFo3wzawUpOrfyWQ5D8mkkC48oaGQnkYS4FREC+
udSkMVBKH7U+M1TYxPnvAWHHIaq0VSmqR4P9gr2DIIU70JhDH3fMDpAYpQ8YcTQ7
UBh3h8ykvxfkAkp+B0Wt9AGV7IYtW20TQm6rU/73i3GEWIK8nxReEtGtUp3csZSC
RTk45ghqLW+/5FYt1MKY1/1bdCR5Pubd41rKlFy8CDGvWN1hvFAF9KpB8Mg3TrDp
AgvNjwZ1KmIr/nY3A4QhmIZZSEONb3iEIgZYJVdE5PwOUzTNoB1irTJWu/W5GmMH
aNMFcIlzCGO+5i9Yfz8Th06vT9Xq0APQkFu+50JNcbrxXWaH/Uk=
=ufya
-----END PGP SIGNATURE-----

--47Hu26P1NuXCfTyF--
