Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00D87AD0C9
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 08:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbjIYG4Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 02:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbjIYG4G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 02:56:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DFB1B4;
        Sun, 24 Sep 2023 23:55:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C53C433C8;
        Mon, 25 Sep 2023 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695624953;
        bh=5dW7YNpbxW+6ZEI9C3zdDpNw1rrUHJJxI/gVVtxsPTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VlqjQj//PuCFllDnEEU/O9tQlIOE+f604AZZPzGlO8FLRvv4KwwdWzEnHZPVU1nrY
         UvlYUe2WqMiXUO+vdeperchnQ13H4y084BGDg4IkDV0g9g5TuvH1uuV9FloyufSzGn
         5+c9IsMtdoPq6I+yGV3Ow0w8UI30nWMXRNovHRMP8/hUQTULxSBqsCveeZzSWVIiG4
         x7qFZWnJywagDiSjo9RuZC9y7NSE9YyxhLqz55wy41zeoiQPM+lVW4TgAXBTuCi8Et
         R8psXeXEvP/t0kMkBVgo78QGGROZNnL3lfZwYwqWb6sxBnrTMV3zD07ao0/QDtdynX
         nESLK7gr2wsiA==
Date:   Mon, 25 Sep 2023 08:55:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to
 common code
Message-ID: <ZREu9Pq/YqaL5/tV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
 <20230725214521.zxjqinryvva2zanx@intel.intel>
 <928d54c4-ec71-5f09-ed66-5f9c52aca6ba@linux.intel.com>
 <ZMgWJY3w/HhsZvVd@smile.fi.intel.com>
 <2e2f4d7e-2831-9161-9564-3d1e89511727@linux.intel.com>
 <ZRCiYI5SMEVxxJ98@shikoro>
 <ZREs1XQzPe9GqlbK@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qQ5FN+LhzD4GPmo4"
Content-Disposition: inline
In-Reply-To: <ZREs1XQzPe9GqlbK@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qQ5FN+LhzD4GPmo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Does this all mean that the series needs to be refactored?
>=20
> At least that is my impression. Just have no time to look at it (yet).

Okay, I'll set it to 'changes requested' then. Thanks for the heads up!


--qQ5FN+LhzD4GPmo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmURLvAACgkQFA3kzBSg
KbYchRAAgtjiV1cdGz3OpR4RFua+ts5E5bD+fAYPDewHts6BEf1S/PvkNFWivhLN
dAx2r9aDhShHvnYubkAgCDgkm37AxxOukVPo4pWTaiZZ3R3Ve47O3TCOEAHIB8mh
u96U6TIQfuPEiAjyPa9EvNBzrHHzSP5nB3v7rJvHTR5h0SM3XF2+ROxa8h60m4r1
eL/ZHZCn428QxCbvIV6+0QXV8j8qQg+I9q7p2BxLpBmjNqIPzOyMjGCzfG9xXS6N
fyFmqHweaXS9oivvFtWiBX2nwP1Ld5g/6eEZARwyZRhkud8o/H/Y+dPxPUJcfYdV
fgsV1FFwM+AuJXv8lq8ipid7HN/X71NlFxcbEmgtSn0TWZxe+0/85MHXwGlO6XdI
KspveebmTd8L5ILwzZ6l2hLAhAOc2N/UXwfK1YeNyIlJo7pxW7dgk7GnItU59a9q
gLCpegn0RWK90M3eVbxn4Goc4utSb3+FI5xrtKOS3xI8R7Lr2K+W385IaqEKPKdB
LmqOHebvoo4X6bJRskhGXB6FqNhHv6lIEoIW1s0b+NSYjg0Vxapt8s0vC6Q6YAzD
V2z6PF8i0dUbkMSp14HeEP/saTngH2ZYGhdL5w3txc78MRfZJOKz6SQe0VzBevne
ru1vW7iSTfqv3/PDfs2kGfp96+Ps+ZJnQpfU6HzyL8VWtcxwrs0=
=QKqF
-----END PGP SIGNATURE-----

--qQ5FN+LhzD4GPmo4--
