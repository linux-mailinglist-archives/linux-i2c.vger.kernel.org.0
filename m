Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC344AC261
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243241AbiBGPDP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442170AbiBGOrf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:47:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7742CC03FEC5;
        Mon,  7 Feb 2022 06:47:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32F13B8112E;
        Mon,  7 Feb 2022 14:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5927FC004E1;
        Mon,  7 Feb 2022 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644245252;
        bh=823u3Op3WC/cpHw0jFq2FcbGrRnHMEfr+lxNki6buM4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VtR4Lc2o/2f2O1v+eJk5kB/88OB8coFXuZfqbBDd6ZbxbPM8t/pDkFnqT71Qbz6Cd
         6A0Z3AYCW/QWWqGrcrJLRx7O25UDAuWh10K8SvOA9bQiitl58S07ikxj2XB7VuCTdp
         nBVJp6BHDKzRVPILgzMn8JA9vTmpSE3n/EheNADnXpuXZj4Z5Qb21oSIHfSEhwG+9E
         3btfgGN6huk3PLYw07XHo7R1/n8VaKM4Ip9F2jMPZ8BzAh75BvLSDwwTQx2gKyxSwZ
         QYKpQR9SLtrGeT4MPhlIRqogpf5FueORddYBT7gTm+K6eVUgdHH3f31EPfMVfnlD1d
         UxrNXBWczu0Kw==
Date:   Mon, 7 Feb 2022 15:47:28 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org, krzk@kernel.org, stefan.wahren@i2se.com,
        nh6z@nh6z.net, eric@anholt.net, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Fix the error handling in
 'bcm2835_i2c_probe()'
Message-ID: <YgExAGEN91QEnObO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org, krzk@kernel.org, stefan.wahren@i2se.com,
        nh6z@nh6z.net, eric@anholt.net, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <338008c444af4785a07fb5a402b60225a4964ae9.1629484876.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hummrw8NxFlbNLQO"
Content-Disposition: inline
In-Reply-To: <338008c444af4785a07fb5a402b60225a4964ae9.1629484876.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hummrw8NxFlbNLQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 08:43:33PM +0200, Christophe JAILLET wrote:
> Some resource should be released if an error occurs in
> 'bcm2835_i2c_probe()'.
> Add an error handling path and the needed 'clk_disable_unprepare()' and
> 'clk_rate_exclusive_put()' calls.
>=20
> While at it, rework the bottom of the function to use this newly added
> error handling path and have an explicit and more standard "return 0;" at
> the end of the normal path.
>=20
> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Sadly, noone tested it but I think it is good to avoid the resource
leaks. So, rebased and applied to for-next, thanks! Please kindly check
if I rebased correctly the irq error case (once I pushed out).


--hummrw8NxFlbNLQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBMPwACgkQFA3kzBSg
KbZFKhAAi5cesS0ucf8ZPQrs1eGglGGzCUhyOm3t8uff8TDyHkmFfRSu9xG2Dwh9
ie1QiIKrf+qHPLVIsd9DXn+vYbOs/oF4B4uLEJ37RCbADAIX90YwY8x9w+txWBtv
5Jj3RRtqrFafNBS8ml2efRbiftcNT8ii9K3yxw3p3a4RNaFBPUkw0ccAcna6kHhk
v0rHg4JxjilGg92qO1QWdJZ1y419qGxHtOL3kCUx9M+CTgGkTEivkqnCoHkjz7z9
piN3FvfZ2ZrfuzVC65iU5YseCpaPiKwWcKVeaKPAvVvEpa4LCzfgn/Jo/T9kCnzc
mRO+dwpJO0xPVYcQhHVz4HM5m0MVNywFpxnvLMygSxq4LXQYzUAv/v1I6qkfUrAi
S7eJ5bkE0ngrEZgrdTGZW+O8FaJmek3KqDVmYcOZRPfzUH6Qcw6qYtEe1JepOTd0
FYgsjz5C2oi5IzRHg2RSFreyoIRf2DqD4YxUkvMXFFkMfA/P1RRKOKJ9eHv1Q8L+
ItFxhffLAA5BaKXE/ZxOdOKVFhfWY8xhb/phE9XmHzTlX1vPMI+e33eJRp9dz26b
qWuYmUkEnhm1U+BvUt9gQLSQa9eRH0Nce6E8/4rmQJGQDFSX61NHIUtGAbWe6pm+
zL+nxrjRIh7EPUTqs/7QlXCHfZZfGUbn0NTrtZXZes5cdOYsn2g=
=UMF4
-----END PGP SIGNATURE-----

--hummrw8NxFlbNLQO--
