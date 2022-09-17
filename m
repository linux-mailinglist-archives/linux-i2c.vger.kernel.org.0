Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C12C5BBA5D
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 22:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiIQU3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 16:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiIQU3p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 16:29:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6495613D2C;
        Sat, 17 Sep 2022 13:29:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 013EA611C5;
        Sat, 17 Sep 2022 20:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BED1C433C1;
        Sat, 17 Sep 2022 20:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663446583;
        bh=MYjXu3NdTKaXN6iZw84zRdCJuMG8dADoF6DsAwXPhGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W27dItBNeFQxmVQWuCqVXHSxsGH4tOgy3Ayfoa8w5MtUBRoKR/1ecfSjnjKNOQSic
         ExPslc3F9laz1OmZgV3+k0l0frJPQ9ZcKOiH7bRAuLhRwoKzHCfy3bBXP4l3GQrdy1
         KOsF8OHaOF+d2njSuhZv49hsPsUBL3UZHXB2b7rSYwsGW0HouPcmNBZXdjlILvb+vl
         jKi7NPsPLfcGrQ9fnQt4a9jsDyNgbyX/epIfq/cq9AD4TZPF95dclrF01VtDNuYWEl
         hGPZ+wJdeR1Yts5kIr1v4k/XgiKdqQWNciwb++72klZ1x/jrslZC9qMO2XH/QaVQfG
         tpcH47c8pAfFw==
Date:   Sat, 17 Sep 2022 22:29:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tao Lan <taolan@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: hix5hd2: Add some debug enhancement for register
 access
Message-ID: <YyYuK1UD7CpZQoFr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tao Lan <taolan@huawei.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220913124820.48715-1-taolan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="87LZbo8elNr19Yap"
Content-Disposition: inline
In-Reply-To: <20220913124820.48715-1-taolan@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--87LZbo8elNr19Yap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 12:48:20PM +0000, Tao Lan wrote:
> From: taolan <taolan@huawei.com>
>=20
> Sometimes, to locate a fault, we need to know how the register is
> configured and whether the configuration is incorrect. Currently, no
> better method is available for analysis.
>=20
> This patch tries to solve the problem by naming the registers and
> printing the accessed values.
>=20
> Signed-off-by: taolan <taolan@huawei.com>

Such debug helpers are not suitable for upstream because they need quite
some resources for rare cases...

> +		pr_notice("write 0x%04x to %s\n", val, g_i2c_reg_name[idx >> 0x2].name=
);

=2E.. and using this loglevel you will flood logs of users.



--87LZbo8elNr19Yap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmLicACgkQFA3kzBSg
KbZGKg/+PsF/rh5RLE13VjDTAs9pTXGYCyHdijNibiDeKSiBn/jvoVp956JCR8/x
Q0XIm7XOn4Rgm3U5XaYtnDPnlTLduwL63fYM/wL9d0EU8WcPvcgvcjKLQi1fem8A
+0VihJUcvmfbonK5Xqr8WvCpX2EL/aNcCq5YTXpQOaVZA0Uv6xMo1LvlAOpBtrAt
kPeVQN91AU/6NmhLsTp6BBoL7jTzBxJNH3blh0bK7hvJjNQ2UOZI+QThxhIyeJV6
pUSiFKTcpncisCfvrf2cRrfpKZaL1ZZ1gsx+/SNgQbq2rFPmb1LFl6QScEK7mGuc
skJLwuBhIINh9sUlSqSiqg3XbpU8JtFHdcQWqEkkYWcH6dCWffAHTZygu9e4Zwl7
U6jvqlls6QRPnswWEwGcYaHvp//FC1fTaMUCh94RQa0dNchBevLdems/MqKPf9HL
Z/ccn8CbJmb6Ock/2jII4ugtNtHHKWrWRPbDIhhuyLwPfAInSQHW3Trp/QP/FlTl
fUU+69cwIjjJPV3bJc1fRItb65l4GjQz47v2doiY0yLZ0sRLStSy6fh8QVoPTjdw
4ZtNlL866v/sZZLmRImFXVEK9oz5+ta4L5+rN54iesesIl7bX3m2QXfaKxRLX+ut
YGJ9Qc+Djt4lD3sDnYlv1DaYE3dFJm9phrNyDIg/+WAJL45K1sM=
=ed/D
-----END PGP SIGNATURE-----

--87LZbo8elNr19Yap--
