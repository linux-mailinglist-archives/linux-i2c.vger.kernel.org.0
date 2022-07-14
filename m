Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C44574C00
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 13:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238802AbiGNL1O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 07:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238850AbiGNL1A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 07:27:00 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BA757E3F;
        Thu, 14 Jul 2022 04:26:58 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 315591C0001; Thu, 14 Jul 2022 13:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1657798017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dUHCXrZZsaZHtr/Nu1V80b9dO4byk2qDHza8hn02rTg=;
        b=Gj7OhCwMRUAJIG2tO+Y/LkLYyMBJMejUdiwDPo7s12ZQvgECr525CrwqgD9Sq1bgQqU8Be
        G8Xik25hWTjZ50c5J/d9HLu+PkKvc3W0jGJZe+Cq9UaKCJEe87zklo6ADczXeek2ZQsuFq
        ktuAYsOWEgqPKdtP9e0VSDgR74IKrtk=
Date:   Thu, 14 Jul 2022 13:26:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Message-ID: <20220714112656.GB16407@duo.ucw.cz>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <YqBS8I62YBPFC9iS@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <YqBS8I62YBPFC9iS@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2022-06-08 08:42:40, Lee Jones wrote:
> On Mon, 06 Jun 2022, Andy Shevchenko wrote:
>=20
> > There are a few users that would like to utilize P2SB mechanism of hidi=
ng
> > and unhiding a device from the PCI configuration space.
> >=20
> > Here is the series to consolidate p2sb handling code for existing users
> > and to provide a generic way for new comer(s).
> >=20
> > It also includes a patch to enable GPIO controllers on Apollo Lake
> > when it's used with ABL bootloader w/o ACPI support.
> >=20
> > The patch that brings the helper ("platform/x86/intel: Add Primary to
> > Sideband (P2SB) bridge support") has a commit message that sheds a light
> > on what the P2SB is and why this is needed.
> >=20
> > I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> > since we have an ACPI device for GPIO I do not see any attempts to recr=
eate
> > one).
> >=20
> > The series is ready to be merged via MFD tree, but see below.
> >=20
> > The series also includes updates for Simatic IPC drivers that partially
> > tagged by respective maintainers (the main question is if Pavel is okay
> > with the last three patches, since I believe Hans is okay with removing
> > some code under PDx86). Hence the first 8 patches can be merged right
> > away and the rest when Pavel does his review.
>=20
> Can we just wait for Pavel's review, then merge them all at once?

10,12: Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYs/9gAAKCRAw5/Bqldv6
8ubTAJ4lJV3sSOMmCDzU9ppIj7pPee2UsACfXwn5zrZlCGTRzug+D74SB+3OTaA=
=zcrF
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
