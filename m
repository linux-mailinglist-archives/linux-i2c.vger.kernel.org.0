Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81099642681
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 11:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiLEKNE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 05:13:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiLEKNC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 05:13:02 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DB0BF5C
        for <linux-i2c@vger.kernel.org>; Mon,  5 Dec 2022 02:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=JJLu287q12e0dCwWOgONBjgapDpF
        OYeRtdx2iWjRP6g=; b=EV/V/FbmhRrO0/+1w3ZeuPSClXvtTAEWvsvTdBcj0Zeb
        YZzMLkHUPnOW8bYRWLvdUI9bRAyOTRE2f2bRd5et6bxiR40f8QnNJHaziyqwM1Rv
        lY4ZOPfAWw2W0IG5ZQl/IVntAwBfDVSMXIl1HrQg9dJ6wY88ffN/9wyLILtO+pU=
Received: (qmail 2273268 invoked from network); 5 Dec 2022 11:12:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Dec 2022 11:12:58 +0100
X-UD-Smtp-Session: l3s3148p1@dpZ57hHvhLFehhrO
Date:   Mon, 5 Dec 2022 11:12:57 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools] i2cdetect: display more functionality bits
 with '-F'
Message-ID: <Y43EKQ+spYkU2buq@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
References: <20221119215646.6818-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vAEOmkLkbs1ilrRh"
Content-Disposition: inline
In-Reply-To: <20221119215646.6818-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vAEOmkLkbs1ilrRh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2022 at 10:56:46PM +0100, Wolfram Sang wrote:
> Original motivation was to add I2C_FUNC_SLAVE, so users can easily
> find out if their hardware supports being a target. While here, add
> HostNotify and 10-bit addressing as well.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Pushed to master with the improvement requested by Jean.


--vAEOmkLkbs1ilrRh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONxCkACgkQFA3kzBSg
KbY61A/9HG19adkJ3Z/7equCUQpfxURjrCu4foi6oihgxZ3UCeXYUs9n/2x+M+AC
E7a6yZmbzVrTlqpsoR9KM+jc1+SzBfotAoGvvoF8Wx1nRuF1peTjGMjjRnAtQ4zZ
/4/rkYKLj5ly7Ga/d1lzlUH8Ah9ZWtHfXcBGmD2j9qeeceQIQBKaYYYoyR7/SMj1
N7ld9qrnEfL5On9wL+eJ5ctktTwnivqCiGBzad4alUEg5vhJxTDL99PEXTR8GOcT
eWyHf34B/A4vXdh4XnEtTlEgOQOp9QyV9vWCq9a7YYjEXnrcyBHGnAdDW308r5pg
n/LfsLHZdqcXuihbcfjLUiOZf68hs8s64g8LORnejnymNQphn00keiqODSrQ6Cv1
NcV4KQWoLOCQy0+gcPUD0f9c81leYAWJoyxhh5x1JVSe6DqW6U13Rw+hCIO75IeA
2y07HC3i8qOnAV0n+FrRGUN22hd/kpWwL8STHuGWpf8HlitjtmIq7T62Ky0JX6H2
FID1aRsWYRw8mocap5IdZOWJb3j2rFNQbVL7Oc6j2T9vJosfomSd0zfUkStpd1+c
iLOjAJXfxAGV6qNkv1mwHr9aN8iPazYEvV5u0Z/aQY/QsgK82ayg1vnky+iZNX0d
/T+plbhPuv7ydDvJN8RhzdDWOSNrlKWZie4NA3TmsGe3malij1Q=
=aYLk
-----END PGP SIGNATURE-----

--vAEOmkLkbs1ilrRh--
