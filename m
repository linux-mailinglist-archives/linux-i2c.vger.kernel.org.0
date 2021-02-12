Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FBF319C71
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Feb 2021 11:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhBLKNZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 05:13:25 -0500
Received: from www.zeus03.de ([194.117.254.33]:59692 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230387AbhBLKNV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Feb 2021 05:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=JZ+qqu9VW3ftLItt+cmsBqFqqeG8
        wxS5wyoVHBkaZB8=; b=toK5fVNZBQ4uq8WQau87Xj9mcYzLwnw39662xpILC7cM
        T9U/Ad6NXiHBHLh8Jr1bthYgLgZOnU1XkMd6PIsZs3INDu6BIdl2BPc3ylzAclbV
        wRJhWmjF8fbEZe5Vyn2VnAOoPBXz8rsaUlfKfROGpxS4OHFeQFvG9Ac0DfOC7+g=
Received: (qmail 1204217 invoked from network); 12 Feb 2021 11:12:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Feb 2021 11:12:39 +0100
X-UD-Smtp-Session: l3s3148p1@V2k+4CC79pMgAwDPXwX6AJRmyqdzpdZ4
Date:   Fri, 12 Feb 2021 11:12:38 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: testunit: add support for block process calls
Message-ID: <20210212101238.GA8038@ninjato>
References: <20210209111927.19169-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20210209111927.19169-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 12:19:27PM +0100, Wolfram Sang wrote:
> Devices offering SMBus block process calls are rare, so add it to the
> testunit. This is also a good test case for testing proper
> I2C_M_RECV_LEN flag handling of I2C bus masters emulating SMBus.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAmVJIACgkQFA3kzBSg
KbZuwg//XN8KQ+B3wgjDvyulwPNxMS0DKHUuVnTzt6lL8wIrCfmj615RlIu3keSK
U7Uy3ii0FPb2CfvjEttR5WcDWFLghHjjkS3AKjpfp9eHmC2/q3K/w/s9JvlAqO9U
8zMwduXLxQCwEZ+OkngTd1o/Go1N5THLCzga2SIzReySeyl1Y2/tVvty1IyyS19s
aJAuejHGLTo57kkFGeII3jdoLuCPZK/DFJOigGQEswS5MtBoJnMmX+x3+DxVC1eB
mQ+VnXB+OTnkTjrQVta0Vojc1o1LVS4yBRlPatLStO9ywPI+cgcqYvIQw3NLJoeW
zGMc+6drLey7T5Zdc8SHRFqRYqNNp9gYXyJje5m8BKlnqXSQdsWH+QRuxQs5Tvrf
mX1TQdsLVY/omx5YU9PDcA4q8jGxDQ5Js+XFWLg2QqWvj2eWa82r0cwVn3YaIqz4
yC8N3UWIJdP6F/hnD9GVQIwGSmwhmQ8C5wrFvaaOXz3wQcHuzt2j1gvkpyXuUw6W
78HosLI+t+78EsqMzd9MfRvt7z/j6fcOopBJ869PI3ZWfZHO0lPykFXC65YkTMwj
1F/HfcHHC8Vndw9vV61vlqo/9deOpoF3Z4Lb3B09BXEXRkKSlOBGPK0bc3Tr8t2c
ngJU+kJTZt2Fl/Vo/r2YjvlzWnmIOUxdbK97VROxXn8FaCQD6Ow=
=BhjL
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
