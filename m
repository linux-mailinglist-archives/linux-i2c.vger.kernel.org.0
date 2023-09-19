Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91AB7A6BD6
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 21:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjISTxl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 15:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbjISTxk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 15:53:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C607F3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 12:53:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40B0C433C8;
        Tue, 19 Sep 2023 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695153214;
        bh=gGMfuet93LQ7soZIER3Pdhw/3YbOOIvpZXSiGrqUZ/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IFjRpGO8KWUE52IIYfNhH3KnOyGNSkVRd00M+gLT3NfZb8OqRi1eW5owzXZx8W/Vp
         et93HMyip1BcoYpJA1jZj/Igjx+RWCf3Yre4IpiHGUsy071/eL/VU8L8sfjkpvUJuO
         0puD17T6XLpkjzP9JWxLx3ZX6Xk2wnvl7QY9JxdQ0vBZAxyhojo/x2NinRcQ+VS4tw
         349pSoz8TQWtFLkBWsPVD/58djIG8b8lO23/fXJ40NDBOXT8XMw1Rw/z7DpXPIh5RS
         iwuFwCO99ZukTffKwep8QAmf3HA3OFGzRzV5fwPc1uhXOU7QvIBRwRpc0wF3n9F0Z1
         4FFFMh+sR0sFQ==
Date:   Tue, 19 Sep 2023 21:53:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: add helper i801_restore_regs
Message-ID: <ZQn8Nz9p7FLiEpIk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <94271a34-dbf5-440a-9f53-dc27b8384812@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="B1rUf3FHrVFkoTss"
Content-Disposition: inline
In-Reply-To: <94271a34-dbf5-440a-9f53-dc27b8384812@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--B1rUf3FHrVFkoTss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 01:57:01PM +0200, Heiner Kallweit wrote:
> In few places relevant registers are reset to their initial value on
> driver load. Factor this out to new helper i801_restore_regs to avoid
> code duplication.
> Even though no actual problems are known, this patch may contribute
> to avoiding potential issues by:
> - restoring register values also in the error path of i2c_add_adapter
> - making restoring registers the last step (especially in i801_remove)
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--B1rUf3FHrVFkoTss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJ/DMACgkQFA3kzBSg
KbZH/BAAkY/W5HT8CHE+Or9voo45MjhccLAFp6n24ed2Lje5lT0ii1jXj5V2H54n
xA5nnnAByOaH/YAYAcNRCjw7rjt5cWIUZN0IeOJyW7z7hw7GcLw2qqC4CUOxIq2/
xIAc5fwMX18RaxkPv+gLhhHL3DOWqaIjvvgNEojPx0502fNipALkMd26pfo946d5
K9Yk3aRILa3Kuu0aEY3l3b+ThULAQoNmL36p21kGcjb9nbWztL11M1EQQSeXZbeY
9W4yYdRbd6zjw2pPOVbTvI7IUm9Ou8mmxbFixp1wAEvVP8jogjaR9wwWNW54xgAM
9CjdE4q8oh0zHFz1zPPbipS/N8BQKeVt5MTufpwFLUoQlQ0fkWuS/HA5S6KO+eWS
hfcsJcxlNulNpCgxm8WpNoVcTj5Tq30lgLUgzkev2c4Ci5RiRDIwJ1VZyw/toPNN
g8PQd+HLoOp3Ft1+zQCMUmS0SV9MWK/EE5s1DM3/oaPt7pCavo4CA3c0o8Jv3rQs
7a00/Yhgh99UtImdJgbLZlpWvj4FrCmjAMhJMW3xRctoWd+Fi0iZA03X3OK2/X75
girKO+XDOmvUDXDJfA11Zlk+DEPVI1W+WczXE7Ex2fH0RLtzlYScqxGuzdACfMF+
Apslr14xYRt7NQTGUbOo14lsi/BiptXG2QRoQ2pDGpokTvll2yc=
=Ro5H
-----END PGP SIGNATURE-----

--B1rUf3FHrVFkoTss--
