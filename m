Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241BB4BC843
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Feb 2022 12:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbiBSLq7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 06:46:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242065AbiBSLq4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 06:46:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F8A527FA;
        Sat, 19 Feb 2022 03:46:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 31D0B600BE;
        Sat, 19 Feb 2022 11:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B27C004E1;
        Sat, 19 Feb 2022 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645271194;
        bh=4e/EgJDWhV8NcQ9F1WRKKUhaV4k3ES3qD2lohhNixgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mFGue8N3CUxwJsvCcKrsau/6OTQ4P5Us7Bud3nm5ECQt60R5Qvmy8rvEOZfdW0RkD
         qK/oWHsytBv3l8CxZ6e0wqeftvE9zjln8PrNdQwWUXVYKq5vRDSbgnI0GaYnCwjm9L
         nnxGi0cxH4IUJut96BNYkC/M5echjoS6SdlWWKavq9+HzEcAg55esXXFDOhHoNjiQs
         K0UdnaLm7NGgF3bwesu0t8+mIvGFSEmmX+BytW3O+SA2FQ5S8C+TDS+LAkiquds3mn
         uuLidCBMl/BrvVYbDU2vtSgQT5K2IxrHcc3yR3+kETn1IlGQd9KNN8RHgu3ch3HeA3
         84Gvb4m1yzrxA==
Date:   Sat, 19 Feb 2022 12:46:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Subject: Re: [PATCH v1 1/1] i2c: smbus: Check for parent device before
 dereference
Message-ID: <YhDYl8h/lDWne4L4@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
References: <20220204155920.13364-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a3Sxlhtvp78kjkDe"
Content-Disposition: inline
In-Reply-To: <20220204155920.13364-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a3Sxlhtvp78kjkDe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 05:59:20PM +0200, Andy Shevchenko wrote:
> An I=C2=B2C adapter might be instantiated without parent. In such case
> there is no property can be retrieved. Skip SMBus alert setup when
> this happens.
>=20
> Fixes: a263a84088f6 ("i2c: smbus: Use device_*() functions instead of of_=
*()")
> Reported-by: syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--a3Sxlhtvp78kjkDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIQ2JcACgkQFA3kzBSg
KbaOPRAAmMwzzC/YZTcoUZ9HdlOLGkjw5yVQTyO6EP8R7NvNf6IDT0decClMNSuJ
XkWt1jIdRxNF+5gbh8/NvaHtdL5C7p20kgp6+JSw/kBBJ5VNCY5lqbXzK8+LAu6a
IczSC16Ec+xuGIeK+98HYyg56csYf+NM6AyyhK2f14wF8ODKbyyL8PxKTXapA9i9
s3Djm3gVuFseGTw+yGI77qSHkIF83+ZLJh2xDVcd04mwSdfBTEaIHLABpk0W7zMe
hVQr3VMdUioogBh2Pb5kuh8zat0q1+xbh31Fis1Q1gLM/0EGBPnWo0YY7Of83meY
3pNp01bDZQhZ2JaOyCom9CeHI0rDNHSdRrAFH4jbPGMasU9QAZZiSpHjnRDQwzMu
mzDVP8uGcqB4bDlmJYKlMrQAZk/TvXIyxeyIfuNZwqhPd7dgLzsjqptuhnRKHaSl
YDjE9sF2/E2+HDYE0csfhxpbXQ4vbykEs40/aOsZ+xdIXjxwBPSV10lFg7bOHuyk
XPRWCZzjDwksxPS+Gxw0gmniWzI9lXQz0cgEaJU/fVCq2Ed5r9NdyPZtaGEck/6F
lqNq3fBMKeVaxoPCj9WTBpybFmPbRGOKuwubN18wzE9rzMH41Wbvagd1OB/hjcPK
cRbCih2ccruH/WKuDIYhJ5pn/geCpt9NxJK5Wm68RiJset685ao=
=YrJQ
-----END PGP SIGNATURE-----

--a3Sxlhtvp78kjkDe--
