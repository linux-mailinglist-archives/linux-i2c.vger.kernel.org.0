Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915A967FA41
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 19:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjA1Sri (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 13:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjA1Srh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 13:47:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB23233E2
        for <linux-i2c@vger.kernel.org>; Sat, 28 Jan 2023 10:47:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E464860ADB
        for <linux-i2c@vger.kernel.org>; Sat, 28 Jan 2023 18:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21B5C433D2;
        Sat, 28 Jan 2023 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674931655;
        bh=N8c8ADGKSbnpUL1P3khyEG0+7kVpbOgqEZejlETI78U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Osk9RqEshGJcYHAzpCAySooBk4hTi40JaxuGltla7E+GhCSBVdN09tpvokuMqM5O3
         S9zQ7DfJi3HP+aAI3Mt+Pf70zyfxns/7sxL9KjXQg1oytCFQXzpmQ6P0oPBbX007Bq
         u0hAYxgjO7lJ3uo9rFABUe8MUT0TuurybH7+3NrqVSPMxlLzq7zRcYHD6fX78M45XB
         beD+6ri3vy6ou+V8UTkEJzvGSZ27l8oYc3KG0YGbpDFcKsQMlxjWCwAsfLwfUdW6K3
         RZDArwiQR6oyrkOzMEt0WY7nu49LfWCEsFukBEMX8fKSzi8F9FznNxUGx5BkpZgk9Q
         wQETHdc04FO6A==
Date:   Sat, 28 Jan 2023 19:47:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: designware: Change from u32 to unsigned int for
 regmap_read() calls
Message-ID: <Y9VtxPvPSZy+oi/2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="052ZSKN7U5J+VAgN"
Content-Disposition: inline
In-Reply-To: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--052ZSKN7U5J+VAgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 05:17:32PM +0530, Shyam Sundar S K wrote:
> regmap_read() API signature expects the caller to send "unsigned int"
> type to return back the read value, but there are some occurrences of 'u3=
2'
> across i2c-designware-* files.
>=20
> Change them to match the regmap_read() signature.
>=20
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Applied to for-next, thanks!


--052ZSKN7U5J+VAgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPVbcQACgkQFA3kzBSg
KbZHmRAAjhSxNzYdtgqpimghkwMfJwi5FSzBVxI7VZ3g46eczlb0EKQu14Kk/dBi
iQHGDouK7JiLGSPmER2lGBkWsjFW8JqvVYDglRWja4K1zVIG7ynmHxC4bHYz2+ib
m9mBHAgyTjacrLEPI6FAC6Ku6+GfIqbrf8jypp0hGPDzAuQg42uSyniL3dPxNN9k
YziWgVbaihOHAvTenZFC9PG+oYAFeF6kYMw6b73cy8qwSuy5eonId4aXrxByC9IU
/BDNNKdsVUioz6HtNVDgSRQudN5mVl5Yu2ZpuFMMFlpZIE8xDVE4NtTrpLbO2u8w
gJKZi67sWv5VWQs6OK+VFr54+hLOM3RdAoJVwbKvCt4vWPsmsgtosW5FfKu/VHJB
0Fek/KgvH5bEnEMPP4OrsuunesbqAQAy8F3aLMmqFzHq/6HfWHXFvkPNgsQC1qKs
FQyZmciJOZiFX4bMe+Afpbl5vFSCNT8IOL8mDN6/ulOb1QBSi9SzIDtp8KosGpAw
enH8WpMOGs5OgZ9UYIxW0cAUCSsK2u8VjNtAG//fGhnjCqZPgaPEgoJhq6aVoM29
el3uDkjlnifaqcVfbg2px/ADXZZV7gTZ9TpWixp72ug9LMsHNwPN2CI6+xV9HWsb
JEcSNSX9N/L2ll4jzwWz1eJv/v2t60TMRb1rix74UiA1hHXKEJ0=
=YXPa
-----END PGP SIGNATURE-----

--052ZSKN7U5J+VAgN--
