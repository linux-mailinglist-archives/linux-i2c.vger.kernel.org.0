Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645774CB11D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 22:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbiCBVSL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 16:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245322AbiCBVSI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 16:18:08 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2275D1162
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 13:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=R1HfuEPNnV2HPbjXGZzn4hbxUBS3
        nO9gTHPMAuFzR70=; b=2jHzGkukwQicy9w/hkGqZeAPZ32G9Yk5EgrYO5MmIKcu
        zYInjr1bU9aY1kA5yg81GRvW0KYcJJ25c6jadwDi4WuoDHPJuGUqxHC7YI3/s/XE
        SRSP2b9n7JbLzfpJ2IuUIdBtNaOAa35C5leNaTmTQ4s0uDuvhQWX8bz81Aff3Bw=
Received: (qmail 257907 invoked from network); 2 Mar 2022 22:17:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Mar 2022 22:17:21 +0100
X-UD-Smtp-Session: l3s3148p1@Su2bzkLZ/sMgAQnoAGk1AHiBA1wHs4oK
Date:   Wed, 2 Mar 2022 22:17:20 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: do not deactivate a master that
 is not active
Message-ID: <Yh/e4OzQ/hYSb+dg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fI53YHIyjI418Sfe"
Content-Disposition: inline
In-Reply-To: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fI53YHIyjI418Sfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Attempting to rollback the activation of the current master when
> the current master has not been activated is bad. priv->cur_chan

But the master is activated?

259         /* switch to first parent as active master */
260         i2c_demux_activate_master(priv, 0);

Or am I missing something? :)


--fI53YHIyjI418Sfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf3uAACgkQFA3kzBSg
Kbaw7xAApyMoXoMmWz5Rcb06GYQ681jFXgF4RUYPrh0AecZKvjqeBrT4ZgAcdEnr
2jMcuB2d/ZgXfhi+hOVBmx6y6sSXR2ONlki9SosC1gYnGV+DCkbHQlbV3SjZcqTn
KrrbQAvoSzQZHlu9EpkH6RiAUiG1O/EQroZ54bJXfrZelPiWbZX5MVYKg2RSD38r
Le+h30U0YNim1vl2l28lxwg4gr6SSgadp2kJagBO+ySXm6iBLG7z/npHIedDOM8s
BzXmnDq+0guQ4ex7Gi05MLPTwZ7oFcj8wlTWmG2EKJjbpTdoSZE7AFys22tCeMz6
VPaR7i1YVS8pa/aXfJh7VqX4Xi/JUdP/iqjqy8cpSKEkatl9qk0I+C/8VdAuGi4i
XwbUBLtNVe07looAJzWA0aWffbXwTN2cle4kIOVnDBgaASfC29+7tLrx0vcScVKt
b6YeCfBqGqSBsqsSUGKxz6j1fxLKx+xUaKl/UurIwiccg39K/6ELGjaISXKaQFdG
zcob1LWTQeBDxIx62lP3yFz24u3epXlSwMUZJREFZTTBK30SzealBcDQotJ/BRcn
XYXPl7cJ9glh7aqloYddbMfLz67JBKz0Zcx37jKWpqH1fW5FGCd4bvbCXcvED93U
fZiyh0WYMCV2J9viIynaN5QzsUWGOy/KThIVmiET9QqJuS4bjGs=
=m2zY
-----END PGP SIGNATURE-----

--fI53YHIyjI418Sfe--
