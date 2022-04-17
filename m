Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C18504618
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Apr 2022 04:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiDQCXd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Apr 2022 22:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbiDQCXd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Apr 2022 22:23:33 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93913EF3F
        for <linux-i2c@vger.kernel.org>; Sat, 16 Apr 2022 19:20:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 01F9ECE09B7
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 02:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B468AC385A3;
        Sun, 17 Apr 2022 02:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650162055;
        bh=fgvai5CvpzVMO7BVUu2fC8BWY+ejHgQ/sklYiOA2FtA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rnzQ2UIe97xqOGl+Qy4+R5YzMv+AKdA+qrr7TVDjWiv4uKoDoHy6vyw7hALBoCxB4
         E+5JdGZYnwD+okqNvXZ+0hXDusI6zHXzQNQFN8Hu9xj72oF91ptsG4ziqL22Zx/eA1
         xsKaJmSlFofippzdap3UXVEfQVLwBGGBR0gndBV0/Khb6uvY0P8BQo1MBW4ix1btmu
         HBQ2v1IJzPEY5R3DkbpaOlCJUgue9kYR+07UpH43g0RcdWd5xQTehaeEnzFjsKigv5
         5gFP1/tySZ31Bobuq14VC6D90Oe+hnRyu/+pKAG3JqC4XDy0L9RAQDZEoEMeLJhwbm
         AO5QE1q+PywmA==
Date:   Sun, 17 Apr 2022 04:20:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Boris Lysov <arzamas-16@mail.ee>
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: remove mt6577 support
Message-ID: <Ylt5gOqaGaz7k1iY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
 <20220120185853.24266-2-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mTO0wy4BUSfB0BYW"
Content-Disposition: inline
In-Reply-To: <20220120185853.24266-2-arzamas-16@mail.ee>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mTO0wy4BUSfB0BYW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 09:58:52PM +0300, Boris Lysov wrote:
> Remove mentions of mt6577 from the dt-binding doc because the existing dr=
iver
> doesn't support this SoC. mt6577 was used in this driver as some sort of a
> "generic" configuration and it is now replaced with mt2701.
>=20
> Update the dt-binding example to replace mt6577 with mt6589, as the examp=
le
> uses [1] register addresses of the latter SoC.
>=20
> [1] https://marc.info/?l=3Ddevicetree&m=3D159949247901831&w=3D2
>=20
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Applied to for-next, thanks!


--mTO0wy4BUSfB0BYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJbeXwACgkQFA3kzBSg
KbYp9w/9EJRkwejroj7l2qVIdQGdlyXoR4I8tC5K9v3y9+AlVxwBrP906u3DTQHF
WwFIvhNu4meKfaYOMQVAAD5IUZPBDJURHITZS/C3iCKheoLohVNRS7uCybCcqE9a
eQk7d3HhQPbQWR5nYpAQCvAM56p4849rzY/S4IpCKh+jXT2Ff8OvG/ymbKuD7H3I
BcHB7/u+B02thcWVD/9OEVWT29D+9sZvz2A8f9C/oLW0ZNdEnDGPj5VKdJERAz45
ETfz4bPiyW+KbmG4DZpEqLb4lyTJi1TBOO0E3/djfsDBMIB3xBkp1wIdL/LndJCe
JILE0ZndYBdg32N79lyX1W9SaaI8atXUYl02dGLHJ8WIdWa5JsmTCw/T4kW6cqdU
sLbzcImPVUSDGBdYJh7mHgDZk/XbHBfv5ZRDak7B01AoFzRsFAFilSYmQkyynZc1
/rZE7hE2nWk0mYAAOn8zDgPnHYTBXDVK+ekYv4UTR+5jb23StNtObFJCCiuEUA1D
xCDnnuc7e4dMr6CrLwQherqvoXObK2NLxrZYuUJ84UfzAsRSHQ17i8D1zSCheHBw
6ESbHDDURq+Otog03F0qDMV1yj+JnQdSHcE2TnPxB8eFdB/2VeOlot7qM8qfWa9p
6sam7KeSS98FYAtLU5ESOPaSL90X7vpvKj3TnL+zkZtf96yl9hM=
=CIJ3
-----END PGP SIGNATURE-----

--mTO0wy4BUSfB0BYW--
