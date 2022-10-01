Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A5E5F2065
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiJAWnu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiJAWnt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:43:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D71A3AB04;
        Sat,  1 Oct 2022 15:43:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2DACCB80B04;
        Sat,  1 Oct 2022 22:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7096DC433D6;
        Sat,  1 Oct 2022 22:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664664223;
        bh=ZH+MM/G5aPTtEgmWD3DknvkKViOX8C2PARyh+5t9aEo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u3XZ5ZaK5z8bbJUSWKl2YMmjFIGRHb263MMuT5uOr4dmXd7KtUbU7km2NCa9dzjnB
         vDsu9garKYlOa/qbWsOZGD+jUOISakw8ua3mXKTmoWz3OmnH49ryxI5CEGZnvJUIo3
         ycVkeGZ4AyaTZEnLt1vxgKLZ5TWATBzSzP90PPgYSHLMixHsbZ/XgK9YjrDQzzadjG
         a6g4Dvghw6JRhvI60Md1N6RDLWgFw369HESj8HtPFov1mb/UzTjmBaT4cji1+Kyhj0
         MUZ5udqteAHNvvHjWlunfxeEIBfjqj/HgBezpvx/4KxNAWtrD6szgXDkoHmiYz5qEX
         Mw592vKhAkppQ==
Date:   Sun, 2 Oct 2022 00:43:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v2 1/2] i2c: designware-pci: Group AMD NAVI quirk parts
 together
Message-ID: <YzjCnJRJXXZHNHn0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20220929094215.76236-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yKlnirQlFZYTgFWp"
Content-Disposition: inline
In-Reply-To: <20220929094215.76236-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yKlnirQlFZYTgFWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 12:42:14PM +0300, Andy Shevchenko wrote:
> The code is ogranized in a way that all related parts
> to the certain platform quirk go together. This is not
> the case for AMD NAVI. Shuffle code to make it happen.
>=20
> While at it, drop the frequency definition and use
> hard coded value as it's done for other platforms and
> add a comment to the PCI ID list.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--yKlnirQlFZYTgFWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4wpwACgkQFA3kzBSg
KbbIrg//RUnc+A8nHg7SK+Y4aurBE1x0x2hrmbGlbUxKphb0zX6WQ2Fj/MoJsGjT
OPr8AvkMyfIcjXvtByvMcR3zuMoS5w6pAyJUqnYb9BQHihSMIk3YPYwxc18JWZKu
rNt9XMaHKxDBe/NIPzU0q4KUJJPTENRMWnjZL+6XhfJtxMs1rtnunbf88zryPDQn
gJuzo5cw0wklLYIaqQacHpIn1J63N7/3qB+epvSMKXNaI3WdKqdY3W3RwMdIS213
fmX06wynmKuPo1TUUYZT5XGLeLU5Mf10AF5zyd6mDdjU2rnAK5iWFDDcLmNLMeNs
qv5k5TQMaKyHiZWFQEs34f2NlNhHMRafT4VXkmCJ8RJ3eYKn1lHzPAzY3hNaMt+v
by8hGHz56ifDgYeEMZ7TvuIBrLb3VVp/xngghB6jH1QeTfEXcHMnAGsb+hQoFWpW
kw9Ol2Q6Fh6C0AmJZkawGzFbQ5B2kuXNvz1apHsRrCwMrudAHAbzkTwsCqutehCX
VNrm+Juh4AX49JGkgoAKnuo++bfAxCG9VA+KJsMloJjCijI9+IEtnM3H1kjSLoR7
Vl3iGioEuCRZ6mrxdCktgDAKNmETPQWSVk8LFzJtJ/TgW4uJnHL/aoQYPoPQKgFk
PAIsEsjElezlDBfZnb63vF1xzfkVa0p2MeQloBPqr0I1Xxg1JWM=
=3nYH
-----END PGP SIGNATURE-----

--yKlnirQlFZYTgFWp--
