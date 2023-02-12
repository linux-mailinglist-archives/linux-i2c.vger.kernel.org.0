Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6D6693A34
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjBLVMN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjBLVMM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:12:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3D81116F
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 13:12:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2921260CA0
        for <linux-i2c@vger.kernel.org>; Sun, 12 Feb 2023 21:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0F8C433D2;
        Sun, 12 Feb 2023 21:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676236328;
        bh=oup6HMMt0DD6gM7MOlkoKt55A0xC3QtYmMvg7CuzDb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rt6f48tZqwibPnvpCwcCClA2w5CqgpwA6imx4h/ehrERyVjuP9g4HQa9MDV+wM3Wx
         ttVs9OMNs4xSKVpdYYGzcj/+dmCq8u1ri3rZvNgwI0Gbka4nxDoI6OyJHhr7V1F4eA
         bf4+UgHZK8tPd1J1RnU9nEvkoswylhcYGu3dozcw3BO3ryqDUvKZ2f1/zTm0SXdcI8
         ml/qvlX61BUHpRiQZn5Wyk7uJ8WvHxNaCmvZ/DcHU5/vi7JWLm/6ePZGWBzRqpXxsW
         ojl9Y+oAYZGP3CxdqVXGmIulfpOfYbdk8W6+L4+9QokjP9VJK4MG0gM+TfXq4ehi6P
         OV6Ee0hSSW5jw==
Date:   Sun, 12 Feb 2023 22:12:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] i2c: i801: add helper i801_set_hstadd()
Message-ID: <Y+lWJQKw8SjIIE3A@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
 <042ba587-7428-5b44-56b3-061be22fd958@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xOvgNeU7pBNWBKyT"
Content-Disposition: inline
In-Reply-To: <042ba587-7428-5b44-56b3-061be22fd958@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xOvgNeU7pBNWBKyT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 07:16:08PM +0100, Heiner Kallweit wrote:
> Factor out setting SMBHSTADD to a helper. The current code makes the
> assumption that constant I2C_SMBUS_READ has bit 0 set, that's not ideal.
> Therefore let the new helper explicitly check for I2C_SMBUS_READ.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--xOvgNeU7pBNWBKyT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpViUACgkQFA3kzBSg
KbaIIQ/+PaATI7Yp5ERk9FsLk11v6lVAnfZQGxno1y1LVaiTYJLWl4pxOSOPJMtq
H/S0Lu18pjth6Fpyx/nYW1b4BKktVw0jd8ONzn7k/BZwnbNTePfhVlSdp36WeXMb
60ZXCsSWffOF5Z6+hB+hPM9qN0QMBymIUEHHCpfIp6FgqWaS/VNcvX1wmEwiTtSA
YdN5Yf7dxQT4fktXBFxVtKeaJT2mDo5y8yRfdTH0p2PUGV7F7/yCRJ+J7Skwrah7
4mSIWPM+jucQiJGgBREdA6K7chIMYhXf3biwzug2hRemSEpl11lfCtglx89zEzat
ZMWwzxQ/fgjgyhOUqexxDVqnI0hbECY4DFDT1HeL/VbQqFCYuoTEBPEzGzMgCEIf
ikGk9UCoTIxy3cuVIn4E9BLqQjAt1FanQPEUb7+MszlCZUPXs1pgLw8mpqH1AtaL
ZVJVlOMIsaCDPxjSB9IWAuepZs63g+NH4Tcy0mJ2rDNRashjcnuGFVWdvKnCWgd9
tz0uJQzD4kVGTF4wUms7hCdpzHjNpQ5lw3sETKsgSIdW1UX/IWsaHVdP+jAJJSY+
jEmodXCPBMu+D0tLSgkqdyXqqhs8LV/iyNszdQ0EppG4+dmfAi297N+934GG+cqB
yNn81Dmtf/L1vxVALQRdEmWpewr1vS7S/ubrDourPG3mo6jxDeg=
=GoJy
-----END PGP SIGNATURE-----

--xOvgNeU7pBNWBKyT--
