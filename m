Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706577B0CDE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 21:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjI0Tog (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 15:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjI0Tog (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 15:44:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3716CC
        for <linux-i2c@vger.kernel.org>; Wed, 27 Sep 2023 12:44:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD519C433C7;
        Wed, 27 Sep 2023 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695843874;
        bh=26jXvUrMI4rHYNdpgdvqJ9Wv5jC/1GdOMf3LxBMs/00=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M8gWHdvcOGwZm4wdOvl4RCtpVdVop7IGH/2dn9zbVdH7FKnj+RDPww2kA1fK2NciU
         Yfqu6dII32AyhL4nwbBsIJF+a8DG4eLAil/Th4dolgliMjgkodz6GUYetRb1vjbzvz
         obMV7XeNtk8Pynq/JzoHIhmizLbo8rPpuG0DHr+4tQQrPiu435TypTVAivgBDhmpjE
         6nBOU3XF9m1ikpOJtHaoCuZ6WI9rP49y3d2Yvrx/0SawRb/9dRzgoKQxGC5sEUrzuw
         o3Gj6mv30m4arLHXYYWIcrspThrUEMikiLJljQjuxZLHsnFh5ceqZmqo9tMoHXVJ1k
         MyFUfhm1qeoFQ==
Date:   Wed, 27 Sep 2023 21:44:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <ZRSGHm8t3ul/s07a@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20230926133725.5c3fb96e@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X71Q2PW1rurvCL4I"
Content-Disposition: inline
In-Reply-To: <20230926133725.5c3fb96e@endymion.delvare>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--X71Q2PW1rurvCL4I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 01:37:25PM +0200, Jean Delvare wrote:
> The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> written at a time when the i2c core did not support muxing. They are
> essentially board-specific hacks. If we had to add support for these
> boards today, we would implement it in a completely different way.
>=20
> These Tyan server boards are 18 years old by now, so I very much doubt
> any of these is still running today. So let's just drop this clumsy
> code. If anyone really still needs this support and complains, I'll
> rewrite it in a proper way on top of i2c-mux.
>=20
> This also fixes the following warnings:
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' wa=
s not declared. Should it be static?
> drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' =
was not declared. Should it be static?
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

What is this based on? Doesn't apply to 6.6-rc3 here?


--X71Q2PW1rurvCL4I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUUhh4ACgkQFA3kzBSg
Kbb8mg/+MVyfizsqKmaOuL6L7E5QQW+yFa5UdROOiv2klNsZDgK+ntMq7f4VBIN9
/BuB7hgnxblxnOoIuaWc2H5nLvALV29Own8g5H6niYMdD8fVUzkgmtuO2z/lbOsN
7HC3RVB2psQ7r/I7BRm8gt2DIzrpDMKKGCaeQ9Be4pKFfUDAqWHZVnU2KGtzHbsd
J++AJKZiyEckQ/Ockp+f6MEW3LyZUZ22NuAHGjv3HEMNobfftJK+6hHnGe8Dghk4
TGzcJdpcjM8Ww3PdHibUbfv+5FXHq9AcUPwsTjBrd+x5Eb90kIbhpOA0uwS4hyiZ
t1E03jzCCYnPukeUoqjw6fV7Vq3PWKKXaEgBBFLVFgsE7YlHbjVS28DURJsRWQ6/
C8KicEWNbOov7SH8jnBQRGVKIAj8waaOJ53jLG6e/kkkfn3eUDcI/2R1Q8o5EQh4
MVaswAg+BNNjAhPomJZC9DsmcZpQ9eDs/yVv6IsiKTPUVmsTKpACzpZjVtxYUSt2
YmgGWN8bkVBqMrUMlEi5oTtVu0P9O9prxXHwZNrph42ubSQngUSw2z+7LNpe8qWT
ptDe8T2lRuTTrTD2S8ABVih1ml2wXhGw/2eBJbDlYuMjg09/QhXrixdJZbzTX1a5
r52QL74OLkffINvASAfW+vbTRplv9zOmqxaYPWJWusEhaV5puoI=
=6OsB
-----END PGP SIGNATURE-----

--X71Q2PW1rurvCL4I--
