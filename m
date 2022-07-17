Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4D75775BD
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jul 2022 12:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiGQK1t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jul 2022 06:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiGQK1s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jul 2022 06:27:48 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29E013F6C;
        Sun, 17 Jul 2022 03:27:46 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7278C1C0003; Sun, 17 Jul 2022 12:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1658053665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3MVHf1qHPbwU04QPrugrK9rKDYYcr5uqSuRuIBZh6RU=;
        b=E1wd2mR5U0P3hGWzxsehSHmMQgRyWJTSAWmvHc26G/G5mkxAEtvEy4BVpQYub/YXK0hYbL
        gmW9mhrDbGEHoVivVOofSu0a+HUqTkuMdgM76XcH8SZq2pXnNX8d9RZSiwmbZcTmslAn0D
        KJbRBbX8TLTBo1MJdd6AFEC9ra/P6L0=
Date:   Sun, 17 Jul 2022 12:27:44 +0200
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
Message-ID: <20220717102744.GD14285@duo.ucw.cz>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <YqBS8I62YBPFC9iS@google.com>
 <20220714112656.GB16407@duo.ucw.cz>
 <YtAHyZ5WHDRbgOZe@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
In-Reply-To: <YtAHyZ5WHDRbgOZe@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Can we just wait for Pavel's review, then merge them all at once?
> >=20
> > 10,12: Acked-by: Pavel Machek <pavel@ucw.cz>
>=20
> Thanks Pavel.  I'll get that added.

Thank you, sorry for the delays.

Best regards,
							Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtPkIAAKCRAw5/Bqldv6
8shAAJ9XaR038+0wsZQKvKNF4Tgr3zzktwCcCU+9rZjRQhe2EMoVQr1ueJ71gO0=
=4aTK
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
