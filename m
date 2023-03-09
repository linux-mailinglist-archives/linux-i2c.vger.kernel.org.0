Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39C16B2F57
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 22:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbjCIVLd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 16:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjCIVLc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 16:11:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEFFF98C5;
        Thu,  9 Mar 2023 13:11:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 882EB61CDA;
        Thu,  9 Mar 2023 21:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C976C433EF;
        Thu,  9 Mar 2023 21:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678396290;
        bh=u4VqRJso8zH9qZKSmQOFBu/jiHn2fWd7l/mQCOcDGRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NuVhvpAgu7tqzGGtbpm3/DtGd6GsIW8NrjN1FsryzF6gm98vc2jyiQ7wBqRQ1SjbD
         jXrI5dREBb8MCrykCafukdkb3m6RobUTjxZOC0AMEf6Ym3v7Hr8r0VZFE749JC3r4S
         VDswzwiyrP3eIbkTktFJbYGxN0okLBuHb7Wxp6f78c/UKNg1saDqvvTCgI1UUzzyEh
         s7D44VLmZsulM3eXGlbTWkBvYpi8m7I5iJ4CFf+fcoCc9HJ+X225tjkV6NfEoLVPG6
         RRRr8N1Gsdc+ijBUGoKnk5Ws6nDxFOcx+f+IIC8jNBfY/IgvJWkV1euLohS4IkFL7x
         souPbaFP81V/Q==
Date:   Thu, 9 Mar 2023 22:11:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: dev: Fix bus callback return values
Message-ID: <ZApLfPnPdJkCIQYt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <03a8cd13af352c4d990bc70b72df4915b9fa2874.1678347776.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dpj+1m9Hb2Yj+lH9"
Content-Disposition: inline
In-Reply-To: <03a8cd13af352c4d990bc70b72df4915b9fa2874.1678347776.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dpj+1m9Hb2Yj+lH9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 08:45:46AM +0100, Geert Uytterhoeven wrote:
> The i2cdev_{at,de}tach_adapter() callbacks are used for two purposes:
>   1. As notifier callbacks, when (un)registering I2C adapters created or
>      destroyed after i2c_dev_init(),
>   2. As bus iterator callbacks, for registering already existing
>      adapters from i2c_dev_init(), and for cleanup.
>=20
> Unfortunately both use cases expect different return values: the former
> expects NOTIFY_* return codes, while the latter expects zero or error
> codes, and aborts in case of error.
>=20
> Hence in case 2, as soon as i2cdev_{at,de}tach_adapter() returns
> (non-zero) NOTIFY_OK, the bus iterator aborts.  This causes (a) only the
> first already existing adapter to be registered, leading to missing
> /dev/i2c-* entries, and (b) a failure to unregister all but the first
> I2C adapter during cleanup.
>=20
> Fix this by introducing separate callbacks for the bus iterator,
> wrapping the notifier functions, and always returning succes.
> Any errors inside these callback functions are unlikely to happen, and
> are fatal anyway.
>=20
> Fixes: cddf70d0bce71c2a ("i2c: dev: fix notifier return values")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-current, thanks!


--Dpj+1m9Hb2Yj+lH9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQKS3gACgkQFA3kzBSg
KbaEIw/8Di3Rnwk9g5nCq/XtZ1EpQ5ZmJKofFSVI5+Ye7N65+W881Eq5XisTv+x5
cG7LPYn5XN+/vzDsmc80h9gERx/yQH3Rjkry+2doE1SRdYGdMsN2qBtaZXzZDr7V
oY2A4PC7FYKTjhUh1PRK0LahWDxeofsNBA4jfp0sinAAeirSGbrSuN0PvAFSvrMs
duRJTN/nlPvCPiYZQqMqhST2fXueCjqpsEgQ4keRhwntVhNIvhRz4JomZntSbLyP
Co5QR0YNZcWpdC3qT1fLnN+5o2dEda2w5JXYvP8NrxA1dCb9ZiyChQrr8RfejYQQ
Rf3CHnJSUHl9H5yuzzMZ3NUpQFxmv3i48lHV08myDW9UNdcvdWRIu7zMZhBzi0uX
WouSPsqEBJwQW3YmqWh3Hxo5pxVbmHk4rAanq6tdQU8y0jhQ/OsOKgM6g5I6UUAe
FrQD3cnTN4qkL6jpTC3SXMzHxhOvNHjIDIMYCx8ZXlTHGjMR8DgV+eVyv1R0Dit3
hfFZ6it52H/st7Z5HBxuEc5jTbunrvLbz9gwF1eAgNOAywxddgLa12IjsaMowWl9
NjkdAZrlTiSks9i1PpkRrxUsaHWYfR3WikaFdqIwSLno38B0vSPCbwBhbth032jP
csdsfO2ZdXnmL7MiGZhEecffCJPdpdM7+0dDvpuMQE89iZ1dfT0=
=6t5G
-----END PGP SIGNATURE-----

--Dpj+1m9Hb2Yj+lH9--
