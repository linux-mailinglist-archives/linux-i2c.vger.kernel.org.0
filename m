Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1F17DADF0
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 20:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjJ2T3n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 15:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJ2T3m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 15:29:42 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673E59B
        for <linux-i2c@vger.kernel.org>; Sun, 29 Oct 2023 12:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=p9zr
        TD00DIpe6oylzEgJGwQE8pK2cLRj8DxtFfGEiMQ=; b=bFgaGK7F7IzVg56PCsa7
        1fGZ28vsCEefZu+LcreA4Q/bGACjqnsoeyeIpGHm3g50ubd2a1u6BReW0szod+3B
        44pqvZX2GmuRIxKRgrVHxAwcylptSa7jZHf2W2MQWerNTXY8LiEMrZcvLE1MkENr
        6+Doe2aGc99keRwcXShWQH4vD/AHkz5M1EvInfH3rCBRfi/4D1rf+S2xQGzH35gI
        zi0Vscki/TqhJfnmm2oZM4KBXxkvJxSCbsyVSesklo4kZ7FSWjvInNXqqsg0H0Mb
        xtwkVEjU91F1zmL8fgN3EA+9ZRapF08mnSHD1KJR89+ov+cJm3eArwsy84woRIBg
        gw==
Received: (qmail 3888756 invoked from network); 29 Oct 2023 20:29:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Oct 2023 20:29:35 +0100
X-UD-Smtp-Session: l3s3148p1@THIM8d8I5JRehhre
Date:   Sun, 29 Oct 2023 20:29:34 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     ye.xingchen@zte.com.cn
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mux: Convert to use sysfs_emit_at() API
Message-ID: <ZT6ynvEUT1gWr4FZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        ye.xingchen@zte.com.cn, peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <202212071048339386860@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8h6Xx8JROQRZl63F"
Content-Disposition: inline
In-Reply-To: <202212071048339386860@zte.com.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8h6Xx8JROQRZl63F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 10:48:33AM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--8h6Xx8JROQRZl63F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU+spoACgkQFA3kzBSg
KbZQ9A/9E6bzVQmP1mu1+IVaakSwjZ/vEKPpsODnIxahg+yxFBg+R+z9AdAdLinC
6SCU4rbgnnVoyx0N4X7QvHY3x2Lcjxm2lvnyJFgFAn4s31DNlkXON6+XmA+6v6NM
C25x3HeqQJJ+h0hiCyd34/MHK71pqiH4Khk7KMMB9LhGS1ERuuLRKWIloAjp24N6
wPh7KmkuhiktX88fYbssLXew3kLHN/UW2Ey3fhCiNn4S8DAJ0U7wCtW4v45HERlz
STlg2bh4OpWr+uPtXIjPl0XPBH0pDKVGJRQ+e5qSWhe+fiad8ExwksZkCfSb3CIE
4SX7OuGzLjZA/rX+Zdk8lVXBwrQa57Tp6bc3ROPOWvVTlH/rx5BXXQOMLhPQLvK3
jqAJoT+BE3r7PbutyAxEu+UhasIUwKlxblSM4+CwZcyV2UJgvNRZU32ZmCguygHC
a2JAJvI6bxr6ro3JuF48+3U0RJNoeApaQAM/A8j9RKdJgFCZS/wsN/+UL6VOtzp9
cDRqp2l7RWbTcrcqJ1vrIGYe9qFJL1u3vh5n9ltZ84We1xN/ciN8XuSt8SF9qROu
NAu2jOuSjv0EpnGeLjM0qh/KteEJBL7c6IZ+/5MCvWJCSOzUNCcU7vXZDX0hEmx9
Js7GAfDC0jOoLBuHJDNCd72Ru/Fel2dWpnP3lhkJ1fFOShEdY7M=
=hJmj
-----END PGP SIGNATURE-----

--8h6Xx8JROQRZl63F--
