Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489F853133A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 18:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238186AbiEWPvm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 11:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238159AbiEWPvl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 11:51:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B1F12A81;
        Mon, 23 May 2022 08:51:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6DA8DB8119C;
        Mon, 23 May 2022 15:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C68FC385A9;
        Mon, 23 May 2022 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653321094;
        bh=hutBX+Oz9JNnuPHhbIBkgVpusAKrZODp3P2mXXnK9+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LwsN15qe8Oe33mCnkk6kvNGz9YH9mbxY59IcSNRBKc+R054e1BggotGQLRu/1MPo9
         0tBX6Cc+z5aszy+2VFnx78Why2rfsUZ1QqP9j7XAWc4BlQkh1InmiC1rre+pa3Px38
         esq7ESa1ug/Ben+Meyb/oT+ejkCKj3cAXkV4vawhABU5WmWwjD+dhibTQf2DiIr47Y
         91rimUj1+MxstWyk8D9ikeeuxrnSfu6A/K5heuzPz0zxpchxcfBQZwZ5CI3ZyS7cGs
         NVjgzHrGFgN6jZVWJ82airEJc6ZvsORf4IgKBNXb2LNQg/ITrNa0+btaE2RYGrnDGX
         FNhraLnnTfmVA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ntALC-0007gX-GZ; Mon, 23 May 2022 17:51:30 +0200
Date:   Mon, 23 May 2022 17:51:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 3/3] i2c: ch341: add I2C MFD cell driver for the CH341
Message-ID: <Youtgr7a3dw58KT0@hovoldconsulting.com>
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-4-frank@zago.net>
 <YojVHBofkBOFVYap@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4KGljskCb2z2Sz1V"
Content-Disposition: inline
In-Reply-To: <YojVHBofkBOFVYap@shikoro>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4KGljskCb2z2Sz1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 21, 2022 at 02:03:40PM +0200, Wolfram Sang wrote:
=20
> > +MODULE_DESCRIPTION("CH341 USB to I2C");
> > +MODULE_LICENSE("GPL");
>=20
> SPDX header says "GPL v2".

There's no (longer) any difference. See bf7fbeeae6db ("module: Cure the
MODULE_LICENSE "GPL" vs. "GPL v2" bogosity").

Johan

--4KGljskCb2z2Sz1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYoutfQAKCRALxc3C7H1l
CODFAQChFUKdlMW0BDuBh/9x02gHkR1H/UglZZUtax3HMB/orwEA4WWFjQIIRlrz
o9+Zl7wYmUknVEveVz5vDifvZwkFbgM=
=l1Xi
-----END PGP SIGNATURE-----

--4KGljskCb2z2Sz1V--
