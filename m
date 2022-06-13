Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247CA549BA3
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 20:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245048AbiFMSgA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 14:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245690AbiFMSfh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 14:35:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6EB24BDC
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 07:54:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3CB16B8101C
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 14:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3F3C34114;
        Mon, 13 Jun 2022 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655132090;
        bh=bFwVavaMFKjXTeGA1LhEIfvdIx7yQgzlHpdb9tsTkCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qcu6zQduS/g/CCRkPhpRqyfKd331GgeAC6MLrZ4rZ8hOGMX/zpy1+UUccNMI3sh9F
         73ZghFb5u+k+dp+znzzDdXzXgGU9yph7Hm9+E4IlWYQ1Q+JY1zAjkaznPzIvIjDf5u
         tvpTQHa+ULofHEJcoJGuKazE/GjhEc33hNywK/5f7v5Ji1HhbL2wWDWqzmYlfajtt4
         j/dRjSFHx7a9CzFKID1EuFt+78FnYlgDkXKiSLvrnY6RtbQeLSaSiO7g08TiD5ZuJY
         TEQRBkiFGYbG36gSRSnake0FYxEehACaDPIWkQWJil0MOwacVCdMmbdOFbj41Cu0/v
         Nv3TwlH1TvT3g==
Date:   Mon, 13 Jun 2022 16:54:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
Subject: Re: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Message-ID: <YqdPtexPiukMlUcG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
References: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wlVU0l2cpjd7u0hm"
Content-Disposition: inline
In-Reply-To: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wlVU0l2cpjd7u0hm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2022 at 10:00:02AM +0530, Shubhrajyoti Datta wrote:
> Fix the coverity warning
> mixed_enum_type: enumerated type mixed with another type
>=20
> We are passing an enum in the xiic_wakeup lets change
> the function parameters to reflect that.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

What is the difference to the V2 you sent 4 days earlier?

>  enum xilinx_i2c_state {
> -	STATE_DONE,
> -	STATE_ERROR,
> -	STATE_START
> +	STATE_DONE =3D 0,
> +	STATE_ERROR =3D 1,
> +	STATE_START =3D 2

No need for initializers.


--wlVU0l2cpjd7u0hm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKnT7UACgkQFA3kzBSg
KbbO/w//SaBNhjFkSuqJpOd9XvGLzznReZXyLOhFsPBvMtrT5k8Z7DYDbD2hCB0c
SGtQo242seB1AlsMkZJp1BJfnV1bQSSw6adrLW8meXDxD56H4c3VCjoZk1eguC2m
yiI8hu1DvHvnD62lP4KbA0usmzE7Wa4x3heYiAaxZqf8WiRvi8xNM4jmgZ9jKkWo
CAQBsLlj8IgtHemXNSS2oaWl7M8pG3tTZj3e68vfEBe8GmyYJMnhbMU8LqHl+2Op
wJtAmNkKXnpw/97UitMEjEnxh96pTOZCbq5zGZDr4gN/6/e+EAdUw5864rrABgZ5
FK23wpF4FoSeQmX3JZ9fYGZwp+vveUP1wEw/t5vQU0jsAt2tNgYDS7ej+Lxz8oW+
Q3lVq/TlDOPMdsdMk1MJkQbCFrHG0yfUdQ6/BaoDatKh/hSSHsd8F/r9fQtWKRU/
0xcaFmHH6b1MmAw9nzSLKpGFqedmkC/PinRF5TtTRWF4qTFGlCL33mivaFOKD1hG
2UlqX0BW9B5XIFFAxCkAEsuwXLJgInisxfufJWEfMAqs4CqEhngu2odNsyqrQrFz
Nu7p/lx8f+djXDtpWpWVOk67MUcAFZ1oiLOfZZP3vNzAGbIZX9X1q/eLdp5ZS+Js
6PItUviC/PhBtsE8zUVB4//GHaRHtrcqlGws0x/k4QS1e2ovZGU=
=J3I/
-----END PGP SIGNATURE-----

--wlVU0l2cpjd7u0hm--
