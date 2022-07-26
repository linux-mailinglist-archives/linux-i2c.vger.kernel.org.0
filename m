Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14618581B9A
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jul 2022 23:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbiGZVOx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jul 2022 17:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbiGZVOw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jul 2022 17:14:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3009E2A723
        for <linux-i2c@vger.kernel.org>; Tue, 26 Jul 2022 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6M3GcDQJnJjT8wRbNVIe0s9/boPZ
        /i8a4uUlWicMqr4=; b=u+yIzi0+MlikxGlA8T6kvS8BV0657UxpkgG3Yz/wv0+Q
        DRi4QzvH7ly3J5mrOd9bccs4BRTTaIAX+k5/EQjawTenLx3LYcn0u6tEiK+AKPOr
        QLfb541AM04JP8V8yTTW3I3AY6jSiNwA/PLoiLQDSbzeIe4X7Z8DTfIudTWB5OU=
Received: (qmail 2813781 invoked from network); 26 Jul 2022 23:14:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2022 23:14:49 +0200
X-UD-Smtp-Session: l3s3148p1@FkVbyrvkpAhZzIts
Date:   Tue, 26 Jul 2022 23:14:45 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: extend documentation about retvals of master_xfer
 functions
Message-ID: <YuBZRUSObpSeeTP/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20220724184628.2752-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aMKHlSRqF2b1E2EK"
Content-Disposition: inline
In-Reply-To: <20220724184628.2752-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aMKHlSRqF2b1E2EK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2022 at 08:46:28PM +0200, Wolfram Sang wrote:
> It was stated how the error codes should be. It was not stated what the
> regular case should return. Add this.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--aMKHlSRqF2b1E2EK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLgWUUACgkQFA3kzBSg
KbYz0A//WZIynw1YJ8YnIdfUsY4RttvwVeRWVcjL/NvHBwcJhHxjO5mYX875h9dK
g0VJINjcPtXF56NHOFhMTBhKH/B+KFmw5G4OlbPekqfZ4RM2suArFyietYeNN3X/
GjjqwN/2WY5bDiucZcXvYfwG1tfULq3FF8UOqZyWL1kexLwAeN3Skm5yHm/Ar4lE
8sbe2o+YSwnm302oQAIg1v5CUG38A17xd7kep8i6FOMi1zWITODGBgamjRxeO0BJ
m07/654BaxBfVlVPhEmVuYxs6aZj8CF4D0tndd8+8viLW87k3RM2dPOpTj+Vwlrz
ODitGR1T1GGH0SxF/uXlHWZJ+6EcWVf5Pl0SrVF5apmHRV3EgK/Hj7HkChNf2nM0
Tacw6dBQAXbS66srnVmnDaeNQUWLlqgYZgNz3l0NwPQcqnr05AVRziG8hzpgl3yY
Q8y0xh8cu7w59AN2OrUQCeHtZzgRmIvNipwNmqmuezbgXYMvdWmxfAmralu5QDFW
4FgiGvI76DW8brpajDF8vnGJc7v9DfW8/TfkiSSkKFEPdd83IRKgssOuApToiKfV
4jLGcwkzQmRf9kQzY/Lb+WF7ngD6D2Y5LTAVUEw1rUhqPxeBSqR+42kOzZ29FmiM
+4ZakJSWR4WmJkdZjaa4uwMhL+hs0tgGwvY6yqs0NWWf8I10O/w=
=YyGH
-----END PGP SIGNATURE-----

--aMKHlSRqF2b1E2EK--
