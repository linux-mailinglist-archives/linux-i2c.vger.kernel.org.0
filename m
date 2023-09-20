Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F102E7A76D7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 11:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjITJIM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 05:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbjITJIL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 05:08:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63EA93;
        Wed, 20 Sep 2023 02:08:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8E6C433C7;
        Wed, 20 Sep 2023 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695200885;
        bh=N1lD23FkrwrqkdmSA/OHQhTfc6OPAn97xACvmG+HoZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VS9i6xtJXAC3RNG85DP8J8Yf23d2W4hItE+BfvJUq3wIEq8IItgkJHpdNQPYZupTp
         JGGg/0o/1vq2QG0YtBN+5qUKaML4qQ7P5hIXnGF/y+qJDNwgz94T98SVEqJ+f2tfUf
         dpdQhQ0K7nMVlmWt3LzFLrugqCzFH265FTXOSC/NgFGz9J7zz0f02QxUsVhsFc3s49
         S2lMRXw39DzxP6Yk7zQF1VQ4LTb+MiUSzByCu49CCIWCOj0tz68pYjXZWDVoEqYa7n
         Y410yoQ3JvN+hMK47sOIkmxWG5l/V7ha5mEIbDdCC6p7YT0oNwSExdAzjC41Bdp5jT
         vfwgSOD8JVYgw==
Date:   Wed, 20 Sep 2023 11:08:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jan Bottorff <janb@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
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
Message-ID: <ZQq2cT+/QCenR5gx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Yann Sionneau <yann@sionneau.net>, Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zbsmrbM1UnXjFOBG"
Content-Disposition: inline
In-Reply-To: <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zbsmrbM1UnXjFOBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> same thread." [1] Thus I'd suggest the next fix for the problem:
>=20
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -72,7 +72,10 @@ static int dw_reg_write(void *context, unsigned int re=
g, unsigned int val)
>  {
>  	struct dw_i2c_dev *dev =3D context;
> =20
> -	writel_relaxed(val, dev->base + reg);
> +	if (reg =3D=3D DW_IC_INTR_MASK)
> +		writel(val, dev->base + reg);
> +	else
> +		writel_relaxed(val, dev->base + reg);
> =20
>  	return 0;
>  }
>=20
> (and similar changes for dw_reg_write_swab() and dw_reg_write_word().)
>=20
> What do you think?

To me, this looks reasonable and much more what I would have expected as
a result (from a high level point of view). Let's hope it works. I am
optimistic, though...


--zbsmrbM1UnXjFOBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUKtnEACgkQFA3kzBSg
KbYfuBAAjbkiEJ7rAKZvK0lG+E7VkpVCxQYb0nBQMNxMBfhnTSIUhqpk7AQtOaL+
dJ5fwsjD0N1ospSPgveqMWJuYhfXwjel5Nw1sACYXkfKTS6iMzPDa7OSvyGxa31P
WG+25P+XVwgieYGpaNCucgDEw5wEURJ2h7mlCCSrnRx/42z2C7pAKKzo9BoEC2Or
EAcduW+L6ZcieP8ApXlQU6emtWumRuCGmjOB6mna8zHGqQjNLZBTCWkgkqI6qeNq
8SDF3jp2YulvyP6LXEOxkDly/Bw4+dTEXIAEVfwix6/1tB2EpNPqWKljEcA1PlT/
dtgNnrv0SdT8jo2xjP+tcnXCREx7XVSTGYuXJhpXdAeQmL28ALrmbZOThcbQmgDO
EPDFJK+IytAklYSxUxXsiFtKr+tHLVCjmmZY4eTonXll8gzirsIW0hDaRvAT5dp1
wdwd6b0mnJDTGcGtYLqBDvlk7lAcAdo/M8TnJyrP2arQOzZ19Whb6iuutoCfr5iJ
Zz026mN8SM78yi8OzHeZog6rZ9GbFTejSwhK7y6zMUwjBsFPLJLLLCW/n7YX8a2V
jcgohkOKCja192+3zY4zRjIY9J8nUypPF8QZdxSQtMEU6wkCsY+wEhIkPDxGv0mw
HnGBPd5C1lOJa1U9mlOOfOe6dUYrnxMyDTbFPU+8nAegUtEb5bo=
=Crw0
-----END PGP SIGNATURE-----

--zbsmrbM1UnXjFOBG--
