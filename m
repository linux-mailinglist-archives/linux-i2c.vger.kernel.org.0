Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C653E7AAF35
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 12:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjIVKMP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 06:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbjIVKMO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 06:12:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B3594;
        Fri, 22 Sep 2023 03:12:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DD1C433C7;
        Fri, 22 Sep 2023 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695377528;
        bh=KTp3+5YEfk8OXMEq9FRYbmvHCPYkW/LfzyG6e8jyrmE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u9Ta/PHxFGYtdvyR7EyjbHhgY2PgupOINSohq8W3l1y2ntQltHwu0DFxjAxonBPT3
         j+A0gQaDzt+PaotHTBPHV10x7An3Gqxx4qdSFjsJWuFjln8X4f/3/34GTehDaGU0jh
         kYqssWzWSbSJfuTLNCxPyTaGGKnJHcegK5wcHIaXlWU6aE9j8VDt1kvluhd/2Le6a2
         VGgnpL6DQAMQMhSsAZ5Kf7HGutE7W/yUIDTEj8mqPJGe8Lc5nNbStG5/CWh1MNnYV6
         oroHipTH3ZVFkWBTIwNe6oXwzVDu4iolSrelgg6/AK41pCq+7WeOMRE9sUbh0lEG/n
         TUROSSffqfMPA==
Date:   Fri, 22 Sep 2023 12:12:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: replace deprecated strncpy
Message-ID: <ZQ1odR+4bLWrxn0h@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Justin Stitt <justinstitt@google.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9cBeMkCN/aqfYfhG"
Content-Disposition: inline
In-Reply-To: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9cBeMkCN/aqfYfhG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 11:07:35AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>=20
> We should prefer more robust and less ambiguous string interfaces.
>=20
> `info.type` is expected to be NUL-terminated judging by its use in
> `i2c_new_client_device()` wherein it is used to populate `client->name`:
> |	strscpy(client->name, info->type, sizeof(client->name));
>=20
> NUL-padding is not required and even if it was, `client` is already
> zero-initialized.
>=20
> Considering the two points from above, a suitable replacement is
> `strscpy` [2] due to the fact that it guarantees NUL-termination on the
> destination buffer without unnecessarily NUL-padding.
>=20
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strn=
cpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.h=
tml [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Added "powermac: " to $subject and applied to for-next, thanks!


--9cBeMkCN/aqfYfhG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNaHUACgkQFA3kzBSg
KbZm7RAAk1/spyitaQbYe3PLY8H0wGpdmUP+Yo6vjUIH/2oT5BZDL5XJev83mjnd
GTIDBPXPr1YAK+qpPahs0BNLIVkE8qBXeQMyCfj7LJJcmnvvXuCjoUeyIGtciqLt
y6tOXNy0PwN1KDKW2tE48CsY28VJeFJcXF/ZgGOcx+/FeWz6Fh4A+10fVnaPLPl5
J2iYBxmmrUT/heLsa0WDpuImW/k4iw37gLaEYIYjNlguYES0HgOe3zwQVGmzO38z
xN3CZNr1vFQYqI8hCcZtFayOD50W5YHN88pMbEQC7WJc8Uij0fjdoWLwGLPxSfzn
9noJZkQXGnA7nr+jBM1A4X6uXywLFPacbcHYjcMHeePljzthLhrOuJOJCd96p0IF
F4ckvd8AnRt0q3tXiracT+PnkXWlKGrREIkkxfdJ7L4OWTAzVQbRmcceXjO4+zac
fWW/rnNblvanTac8r7gU0AtVSavJqCnRawLvOeiVxJcNUxSr8IX1w5GMnOkWXT+V
YN9OP4iVcFFM8GEC3mbY49YOeO2z+4H79BjwXpef2lfYu6zYrDfYpgkMvrGjRXaZ
Wp/V5GE1bXbWi3uQhe6F9ruU07xz1ZOEfnW6gVtTt6whyi6g1AksJHCHTcpF0Sna
BIErf242wmZ6BSNpB/a60OXqcovC9Z1xQeXMUUzvdHIuUXZEZ7s=
=8uVT
-----END PGP SIGNATURE-----

--9cBeMkCN/aqfYfhG--
