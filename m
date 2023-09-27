Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE917AFAF9
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 08:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjI0GWH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 02:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjI0GVO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 02:21:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B5197
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 23:20:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BC7C433C7;
        Wed, 27 Sep 2023 06:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695795658;
        bh=7fgwg1sef6wIrS4qx4uSIVf2iP2jKdYWcieEbIs953M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wvw/Jz8LrwegJpWHBbqHaVDqSe8TlOFN9K+TH9Al8RgKaeRtPyWYZnwIsfuwpRB07
         EDNZ9ZhRbYk+dOavap6b8DRzCEMwKez7YfS04EqN70AncwZohbzm2aifQT8xOjYtW1
         TpphFBr5xi0D/V7Tq/DHWJ6tioRNKtR+8KiHGwQMmjtnrtFimyn4prhaJ6C2DoF275
         6zETmZr7u9EVjV2l1Ep13pTkVRfI/gpI7ZBoJb5qUHeFgt2uB2SjblLZ8atDTIVfwW
         kJt2DKT90lIGS4PQcS9UaMHTdV640WVJXzqISLSd4tKijkTR2rGUzQW5EAVK8m2fmC
         uGWUt/tWZ4o8g==
Date:   Wed, 27 Sep 2023 08:20:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <ZRPJx5OFGaAkXJzg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20230926133725.5c3fb96e@endymion.delvare>
 <20230926212720.adcn42akrnj72oxl@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KE5i3S+bg3WeXNwL"
Content-Disposition: inline
In-Reply-To: <20230926212720.adcn42akrnj72oxl@zenone.zhora.eu>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KE5i3S+bg3WeXNwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm somewhat conflicted, on one hand I like the cleanup. But on
> the other I think that they don't do any harm if they stay where
> they are. There are lots of drivers that look outdated and need
> maintenance, we can't just remove them... right?

I'd agree if they are proper drivers. If they are hacks which would be
solved entirely differently today, I am all for removing the bad
examples from the tree. I happily take Jean's offer to rewrite the
drivers with proper mux-interfaces, if any complain should arise. I
wouldn't wait for it, though ;)


--KE5i3S+bg3WeXNwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUTyccACgkQFA3kzBSg
KbZQag//fA77cnUhYdFcHifDg+eUt8oRgGLxOLzHgR3RUlWDiLEdgWYVkVKsHkxz
CPtPCGlTyWSNjUiT1PMwVxWt63X5Ir0alcCyXbl0GVbioZ2P28g3g6tKPOJilZ/1
9VqJJB2FiHyl0Fj8KkHKqZUD8invOxLrVgqSuoDl08YUgvUWs4Cr18V2qCvW0w5i
tgdYhZIPPHjr0rVYd3YWrsRSArg6f2kvhWXaMeDo/TW6SD9tCJBbFXxn7d3y8Wyo
gQzp6pQ9UZorsB1+1i/FjSZmw2UzeuUA1qyukwzRG0Smjg+doRc8G1hZkWsldExc
hZq1uvVFXgHuLrPdoAH3iQEBryuiZjoUjO2vqltEaFzmZBBBA98Lx7nNuAPV3KUQ
TzW0vLt6HRnMovhj+g5/oGCvj5c2MjWyLKlDx2N6pIgRHoJi5Lfgwce4MAm8rKTN
a9Vz3EcbCeR4/1H48l/IAfeXbnhqeGGRSKnze/9ZTphsL99ceEgtU8ow5KYARKcQ
XsH3mQZ28vfQObQwwuYWouHF++O/pc8p6IpOhg9mBQJdvaYjHQ9f6sIjrH4g5Nrb
HxWQqTEfGyi9LcJDVjXsZGD4Qnlk7Hnx+cxZCxmeoQeWOB3Mxm9e/Uv50sbZD9RK
af7kkyxvFI+2dB+s7w6123dNVtxEHGK6dwuqJvbBK4arHgyaWuw=
=0EAX
-----END PGP SIGNATURE-----

--KE5i3S+bg3WeXNwL--
