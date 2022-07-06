Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0CF5685A5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 12:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbiGFKc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 06:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbiGFKc4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 06:32:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D574D27163;
        Wed,  6 Jul 2022 03:32:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 706AF61E3A;
        Wed,  6 Jul 2022 10:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FD6C3411C;
        Wed,  6 Jul 2022 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657103574;
        bh=RC0sAMRYDT1U59SwYYLhHEAvAo1xmi55rfLw6xp/hmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UgfrUtZk32S41NHaKv+WfBqTPZlu2oza7bjcv+s3TEpmawoudj5uBSZZKfSBG8efZ
         urt/MVxszctw0h5NiIiu1BmNNw+3UKQpA3PVHDfUwDRQym2H3hEPz/mpKUtFzEgLHY
         T6hM/X1CSsJ0iKeI1FPHIuYpnW8vRWiIGBndHjqX1XZzyOzpjsScCKtUJABqNvD6U6
         wLmZQgnxxSXhfvNIazf4WU26qZQHVsHhsC+8k8nIn1rf+eS1zgnxbyL8GCBFoMrGbQ
         fPF3PJq2ceV6v1Pv7dBADOWvrqv6uy2WAd+gF9jd220BsReHN+RCGq840wxP0M8F7k
         e6/A70Iyzuapg==
Date:   Wed, 6 Jul 2022 12:32:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor.Dooley@microchip.com
Cc:     linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Daire.McNamara@microchip.com
Subject: Re: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsVk0Gg1x7juHcZU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
        linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Daire.McNamara@microchip.com
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <YsU3eLA3PrceFS65@shikoro>
 <ac070176-93b9-3bc4-5589-ec57d4d38af4@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pqWsQi0x7XBD8P6y"
Content-Disposition: inline
In-Reply-To: <ac070176-93b9-3bc4-5589-ec57d4d38af4@microchip.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pqWsQi0x7XBD8P6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I'd prefer the latter. Being called "core" is unfortunate and I
> did think about that. i2c-microchip-corei2c would have been my
> first choice but I thought the double usage of i2c would've been
> disapproved of haha

:) Well, double "i2c" is not exactly pretty but since it is the name of
that IP core...

> >> +		if (idev->msg_len <=3D 0)
> >> +			finished =3D true;
> >=20
> > How can it happen that len is < 0? Wouldn't that be an error case?

Is it to be on the safe side?

> > Have you testes SMBUS_QUICK as well?
>=20
> Not specifically SMBUS_QUICK, but I did test with hardware
> that uses "zero-length" messages.

Good!

> Thanks for the review :)

You are welcome.


--pqWsQi0x7XBD8P6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFZMwACgkQFA3kzBSg
KbaFgw/8D7lDj4vUyKcwMGPx6bwOENbvQni8vymREU+9j3FAApPuYtvbkg3ulzqO
Vr31LTbwZB6zYrnafuKPofGuJa9L3D7BkoovGGq8F/029h55FNksZm7jssnQkdgF
ianlDedgOsyaLBvsGyxhpOpbJ9sG4DiGHvrlnOzy+L9wJ/dKfPnGKaZHh5BR0ZN6
5WvSxdxTFFkLiNrOadLO9Wb8r0tTkw2gsrr5SeR8wbKEQJZlIlSy30vnqbD7VZ4i
TOIisHPJpjtHIlOQ+ijbGpDvIZ7ZhNm2rwH24Sze0N9wUr4V2p3eQxeG4FfPf9IR
HfFHJ2F/ZBcPPTHfkPqHvbLQIwMBvGcJ916SX6hc+ag0hrA488dDv84Qi8YaEZlR
ddJqEF0XYN+uKG3tt8qpO5pAMw8PTJOKCT7RM6hM4SRE3GNF2FZkTZvzQfkzG75e
d4N5wMW+yp76cVwTHx29aH9BL46rrQXgJLRBSPcfSPqoNWHBS7sC7X582UWs7R+t
S3TDm2eYA6Y+t5a500BhqHcgCtuA/PZK0QeMkcDT4ljRpQVo17B5QdNlwAPY/SCW
opdR3rlRHEG077SSLP6Ns3tkm2yl6uZrg2lJJ/hNOvBpsfEEXa9FecrjZtq8E63E
8fNxY0M7OdQ3Yvd2+FNLcLuHioEtsz/h2sJKz82nZjcRhhshFfA=
=uow+
-----END PGP SIGNATURE-----

--pqWsQi0x7XBD8P6y--
