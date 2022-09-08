Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C365B282A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 23:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiIHVLh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 17:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiIHVLe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 17:11:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C26F8258;
        Thu,  8 Sep 2022 14:11:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9B24CB8219F;
        Thu,  8 Sep 2022 21:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5237C433D6;
        Thu,  8 Sep 2022 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662671491;
        bh=fbU6YEgnVA5iNITYsU8siSSX2Mt3xBJY2WDQPCs951c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fTB95cRnGvdSIsayJfhvyT393fN5UoqYLYrQUG1L3Ki6kb14IyAVDnUVFfiSwT//7
         oBITwqeAteexjJbdyaqpxxQR7BsYKwMXsPdRDFRQiEKkLK23C71RQrjeTYWQLZiGm1
         WK3l3/RSKDjBmUhnGN2azx6EUKjlB3OKgLvmnk2Yoi1jeQQrjJm8sOY7fT4JD7l5WS
         HFYXCtnMZ3o+8HgGMgNq1j9G9j0WxLjv3CeqZsvaLyRlyF6fRtlMna2SV0ANRnrIsi
         ejsai0Q9Ub/Z0s9ykbfq5M4hd6F9M+s4Dh+8hzbFG6LZYIEvmLvUmkH5yLP3xu1B9p
         53s8b40rupY+g==
Date:   Thu, 8 Sep 2022 23:11:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Zheyu Ma <zheyuma97@gmail.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jean Delvare <khali@linux-fr.org>,
        Bill Brown <bill.e.brown@intel.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Fix an out-of-bounds bug in ismt_access()
Message-ID: <YxpafCXQ0pwbuQ/K@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Zheyu Ma <zheyuma97@gmail.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jean Delvare <khali@linux-fr.org>,
        Bill Brown <bill.e.brown@intel.com>,
        Wolfram Sang <wolfram@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220729110216.557010-1-zheyuma97@gmail.com>
 <20220908172254.GA2865640@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3xBGgiMuZ91XTRsz"
Content-Disposition: inline
In-Reply-To: <20220908172254.GA2865640@roeck-us.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3xBGgiMuZ91XTRsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 10:22:54AM -0700, Guenter Roeck wrote:
> On Fri, Jul 29, 2022 at 07:02:16PM +0800, Zheyu Ma wrote:
> > When the driver does not check the data from the user, the variable
> > 'data->block[0]' may be very large to cause an out-of-bounds bug.
> >=20
> > The following log can reveal it:
> >=20
> > [   33.995542] i2c i2c-1: ioctl, cmd=3D0x720, arg=3D0x7ffcb3dc3a20
> > [   33.995978] ismt_smbus 0000:00:05.0: I2C_SMBUS_BLOCK_DATA:  WRITE
> > [   33.996475] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   33.996995] BUG: KASAN: out-of-bounds in ismt_access.cold+0x374/0x21=
4b
> > [   33.997473] Read of size 18446744073709551615 at addr ffff88810efcfd=
b1 by task ismt_poc/485
> > [   33.999450] Call Trace:
> > [   34.001849]  memcpy+0x20/0x60
> > [   34.002077]  ismt_access.cold+0x374/0x214b
> > [   34.003382]  __i2c_smbus_xfer+0x44f/0xfb0
> > [   34.004007]  i2c_smbus_xfer+0x10a/0x390
> > [   34.004291]  i2cdev_ioctl_smbus+0x2c8/0x710
> > [   34.005196]  i2cdev_ioctl+0x5ec/0x74c
> >=20
> > Fix this bug by checking the size of 'data->block[0]' first.
> >=20
> > Fixes: 13f35ac14cd0 ("i2c: Adding support for Intel iSMT SMBus 2.0 host=
 controller")
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
>=20
> This patch has not been applied, and I don't see a response to it either.
> Is there a problem with it, or did it get lost ?

Seth is currently looking for a co-maintainer to assist him with this
driver.


--3xBGgiMuZ91XTRsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMaWnMACgkQFA3kzBSg
Kbahuw/+Lv67vye8HcZXX2PovZQj+xxJgFU4ru5vG6sqjcfKmditbVOA+lh24FVK
fTQ0ueQe2Eknm7FbAdMH9+Cz7lkb6JB0lZgKZDO4dD+SDjn9jVChBOyvWkWSe+DR
sLQFuqeP7fmsg0AjD+f6rP0/oPtHwZOCEQT4s048k1ggWoHe2M8muLDqkfZN9I0U
rOMRyw60eiiOM9iamEPnKsAr/mPFY3233Jj53hesa5I2wHN4nX/eh8F6XtI7iuZg
V/JFGAojgSPjAE4MG8w06R77Go8ZwmKoYL1sTOUOjpo3SFyfnmOjS++ttoY2bOYV
XXPgpuwAflfzgaVvoWHhRSTdBY2lt7FgXtzYO6rHWkeE/l3i558BuOGloUvZVgtB
SmOajCqxKVmxankQVqeQMYD3KweIR5sfw1KE/qKmtSSCPPeczCQzc4wHIEJj60lC
VgoBDtzayEX7siMKiAGQDt0hPretcOb1cD3ECEgIPpOocad8ik1/YhyDG097Wg3w
iE/hcO6VGElfGsEP9Dm2QYxFu497JPwwbH+PTThcIXEgTJc5F2EvdClAExP4c/bQ
craLLlUa470kaRojnTZfoYOd1x4W0z86+9YMQL7wCaGrqTDdlEg+LhwrpD/b+GcI
OUIEVm2D46j+kN6OmZNXnsalleN0rFL5BLLDs3M1mV/uUky0YZs=
=6E9Q
-----END PGP SIGNATURE-----

--3xBGgiMuZ91XTRsz--
