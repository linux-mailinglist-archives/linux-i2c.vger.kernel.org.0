Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6597D879F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 19:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjJZRhv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 13:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjJZRhu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 13:37:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665EE1A6
        for <linux-i2c@vger.kernel.org>; Thu, 26 Oct 2023 10:37:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B20C433C7;
        Thu, 26 Oct 2023 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698341868;
        bh=FHKLhTfiGbtt7lUYh4l/mhrzXwDvQvqOgR3+Lhvtngs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KACfl63GSk4SX8PsDPcuAFkoeIc3ZfpqrIy2gxYHe8Z7fUjdevduG0xLSAA2zNW5J
         RktoA4HOJCpPv3F3xp1oZZYe3W53JmNH5NYAs/k264DIaklpoDN6vaD24tBRIddJhJ
         wQWYXBDvimnAQ38EnklF6v/dmpWCjSZm05pvXZEovIJf7JJoP/5rlC5KzGHwvLL0Qc
         E+eJx2IAKdTU8OIIxrtw14t6aqHJlnUaG9WMLOdmgeIbEu7IyGW0fCYvtK4eLU1HrZ
         xPIESUD3zzZD80b5Kp2soddwo8czAH0Ba3KMkyVOvCaTQtBzxAZX+mSUQMeS26iV3o
         shTSMLWTUR6eg==
Date:   Thu, 26 Oct 2023 19:37:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: Mark I2C_CLASS_DDC as deprecated and emit warning
 if adapters declare support for it
Message-ID: <ZTqj6BKcNYzEkZpp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5c521229-18be-47dc-baa9-cabd78420cad@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nnHOYA/20KqsmnRe"
Content-Disposition: inline
In-Reply-To: <5c521229-18be-47dc-baa9-cabd78420cad@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nnHOYA/20KqsmnRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heiner!

> With removal of the legacy eeprom driver the only i2c client device
> driver with I2C_CLASS_DDC is gone, so it's time to mark I2C_CLASS_DDC
> as deprecated.

OK, but I will need to wait until the eeprom-removal hits mainline.

> Use pr_warn_once, because graphics adapters can have several i2c
> busses and we may see the warning multiple times otherwise.
>=20
> Note:
> Driver staging/olpc_dcon declares support for classes HWMON and DDC,
> but only HWMON is used with the scx200_acb adapter driver on olpc
> devices.

And why don't we remove its DDC declaration here in this patch?

Thanks for cleaning this up!

Regards,

   Wolfram


--nnHOYA/20KqsmnRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU6o+QACgkQFA3kzBSg
KbZrBBAAs6P+Fe0ieX+ybPK38c6eHYqp+rRXYjB8Siy/tgmZLPce2HM46rX5zRKW
G/SgKOuk9Cn1IW2s/itzOLyiJrr5JtbbgQ5NW2nheCGeTk5fVBWMjZKcwyg6W3K8
jMjtUpDIwtenbBsj43F1ieDiiV4/vM0pdpt//eeqRQnS8uiEb/HJLd+wJm2S9gcR
wlIhMM5Goo2wGjuT1zhgGdobq5Uct3y1x31NqNJasK4OtIked9f5h4d1FEZKI1WZ
2WB3LUXMOYFwL8gbHdCn/zs4WbY7LRiyJLCUZ7N8zVvihjvcdT8U77YqOA+FnoV0
vWjU0hWryfAJ9cNa+CtUMEW16fT4QxJq6NCc2Mtp+doUambtm8OcoLsyDyE9AGRf
Gius5E25HzL7G5ZFvpiFAAVRwpPdjW2xQdcs4z3AzaNSP1NicKx5baxEDUov5xkf
nIQxba49wmx3MoCsYerY5BV6FjIEBZOuMq2K1Zv2qHXm//cFJLrIOnOX/kuE7XhF
EjJ/SpwomjGan2lhcq3eBPD6YThChFY8+MfWgCFiXiokROuieh4W8jptfh78NmXL
H1MAr7D8qmkg38TV94CuM5lUAC2KK+j5X1dfsEcHS2aTFQcdvE+oZmKdwVyqd9wX
INywo3CtpXYABblFQf5Rm5VuHMh/1a2jCy8lgbYogKAiFyS7pOA=
=Q7US
-----END PGP SIGNATURE-----

--nnHOYA/20KqsmnRe--
