Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352317A6759
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 16:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjISOzk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 10:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbjISOzj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 10:55:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6847FBE;
        Tue, 19 Sep 2023 07:55:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434B0C433C7;
        Tue, 19 Sep 2023 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695135333;
        bh=Z+KCWNb28zVEsZA3bgcGqvVW05rZBIKdnf6DwZ8F5+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fexae1IRIHDPJnBLkZpujCXwAyJheENZPR93E3wN5P7y/Iw4c2BG9uZqcFLk5UjrG
         5EWDJvua+WIZGI6QUaDAQgcHelmdYA0fKjllx0nax6AeByY0fJnUFuu3Z/om33yNzq
         Cb91zdCqDuHyakoV0IOmB4cA9wfXtgw7uSqR3n91kIK1/7+lT2m3z4trFvWVWjWhsx
         5g/1PmFrvTswUiH6dWWhmR9v6dv6QUFewGjkCP8f3311uuL+lqYxfdwI877Bga3HFv
         se+yBUofdNn4Xhss9XNFF2gWxoob8KT8TcQGTOBjWynlbDsT54hs12hybMbpQyaPNi
         GMfSeRnRN6YOw==
Date:   Tue, 19 Sep 2023 16:55:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZQm2Ydt/0jRW4crK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>, Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mv+JQVsHnSl3dLVx"
Content-Disposition: inline
In-Reply-To: <ZQm1UyZ0g7KxRW3a@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mv+JQVsHnSl3dLVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> OK, since it ends up with the *_relaxed() accessors, there are no
> barriers here. I wonder whether the regmap API should have both standard
> and relaxed variants. If a regmap driver does not populate the
> .reg_write_relaxed etc. members, a regmap_write_relaxed() would just
> fall back to regmap_write().
>=20
> We went through similar discussions many years ago around the I/O
> accessors and decided to add the barriers to readl/writel() even if they
> become more expensive, correctness should be first. The relaxed variants
> were added as optimisations if specific memory ordering was not
> required. I think the regmap API should follow the same semantics, go
> for correctness first as you can't tell what the side-effect of a
> regmap_write() is (e.g. kicking off DMA or causing an interrupt on
> another CPU).

Again, I am all with Catalin here. Safety first, optimizations a la
*_relaxed should be opt-in.


--mv+JQVsHnSl3dLVx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJtl0ACgkQFA3kzBSg
KbbFXRAAgy4qEqLgh7Xm0EoQCPqnMbizqcMFhaFIKjxcfbI2v5e6Gk92SdUqtAna
cL+5uqpCZ9ZsF7lLzTLJwqBOzMqCB5b16JRKy6WAwXB12Cy3CtF2SeC8s90JpIk+
vi8FqnYLS+0PxjaC46iuAU52OTi9uCwew8puCS5vxi7zycgsjdCCjRbmHTAvbC0E
yxQDpUWNGkOrpdl/3lPnEwdRrIpuD/pFZt6v55ytbzMbakZigH532jWkXKUPNHoG
2NgC59AvvYWx9XPAO2Pd1YwtOoVwCjbEaSyc+jFZqtwPocrueQCXnOiXHVXJ0z0F
12alQRQnb78kAz9YUnhG0hf9fCPj/2wSObaAWUap3FhLJ0eV53sfYidO2rCVEpns
Onl6sqrbpakVhjCNWA6e1XBe/rKNKWi4QkX5o3+c8mwydkL0OWSxb3Xe+BOt770/
41dcVM1nG2O0waMCJJr1UYym3gL9GYOhIbF4rrRa2jpmZZIHzG0jVkGB7Cj2LoY+
KA5iYIzS7jm+PNjC8zFgCUjc06D964jGAYJNfG4X8aYb0/nfaFniuGKGCOi2LHLi
G9bqyKr7Mg/5Do7AKgmXwhkrRoJqTfQ7tTjDgEG0M/shTU7QrA60XpNXN3j4K5zT
uzEbo+nxyc4L7PfzZU97e9Rmtp+mlPSfT/itDzT0sUn3EB56VUk=
=7WHl
-----END PGP SIGNATURE-----

--mv+JQVsHnSl3dLVx--
