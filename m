Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8200151AF3C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 22:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353874AbiEDUgt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 16:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378117AbiEDUgs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 16:36:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE5150448;
        Wed,  4 May 2022 13:33:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 993B4B828CC;
        Wed,  4 May 2022 20:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BAAC385A5;
        Wed,  4 May 2022 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651696386;
        bh=vXTYk+3aszdO2rzyIDTdT5z/Wbvp6+A1bvIq0k3UvbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OPgq40SNq7gJaguRYkkjMVj9iayuns37TLq7WTtexVmYo96BawSe0bOR4K/D2W4FJ
         42rN29mW3xrdhxkvu7lWr7VsGAIamcDlPWsSKqOnvCAAEGsOZSwPm2QUfFxc3OVICk
         MHADMwhuww1L+AX5R+xcXsNXSlOhZ/Ql6Svj83FYkgylGkBHsQZyLx8SsL1hTOcXKL
         rn9h2WZzmZctmPgJT1E6bwcdPStMKaWknN8GS1U+Um4XIT6wjYjAEOhLWfA6Ovwrl+
         C1co2ZH00Lzg1gXRPOskNjAgyRINLwlHU+ml/UYW8ArR9WWCcnlx0o32XwDk2GZI5k
         Jw4G+FQbFQRHw==
Date:   Wed, 4 May 2022 22:32:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: powermac: Prepare cleanup of powerpc's asm/prom.h
Message-ID: <YnLi+E+UsgzPUxLJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
References: <f1785f7b2b9f79bb41525e3b5c3e06894852414f.1648833430.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6Fhrsg5OnubBpYb0"
Content-Disposition: inline
In-Reply-To: <f1785f7b2b9f79bb41525e3b5c3e06894852414f.1648833430.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6Fhrsg5OnubBpYb0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 02, 2022 at 12:06:59PM +0200, Christophe Leroy wrote:
> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.
>=20
> In order to clean it up, first add missing headers in
> users of asm/prom.h
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Applied to for-next, thanks!


--6Fhrsg5OnubBpYb0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy4vgACgkQFA3kzBSg
KbaXpA//d/536N+cHqZzpvwBcWQbwtNpU/Cq/yyV3bsMD4Dtlo6DBSiMr8992OBz
O9lO9ovmg8cVSl5h3zgvwErKd1wLi0YEYkUUmGsaqw+YZ0ReGhEoyZCMVLz2dnTk
oNQ30UiLFdXxi2SbGEPXlMB7mJNpMFioCc/8xPSE2y4deuk3+gWUEoHmHmq9hP1Y
Y+UXfFOIxu2bkJLmOmDvMWoWS/RhzdfHt8Cq8LMOFnsDzhGMvO1UqcLEu8B+rf+l
sWddki6CLeMIHufhGcqDWBIu2oQNfeTPU8+fAaxh/Lu3QBzxoSnQEh3Px0pc3V6C
GAFFu5Les9nYapcXLdTMe3dRajKlHIPBz8HbQ1nlcS9VPoOa/obAmP8J+6eAPseV
py0rxQXjNjAiFrxStkp5fODk7b7FSI3/JvVBpZGTxbSdsDpFM22Tf23PmStdKxST
gmwOXstxkJnv99xmbKmX5ih8hhM/0kjlFTE4MDCo33O2bI2425siWo+VfSpc3NgJ
3i/q0RzwlWJqknZuyNjwYnLZZC57Kh738LDaM56WWl4KHSebsFU3Zihxgj5uJhmC
zYNwJYe3fgpWsXDSiIgkeTkJ1oKEeVWG9n3sXNXVhNVO04exzBHZcOxnfIUbWOso
W2Js0uf2MzcnqHk4hcbj5TCr37i2FsRsFToG3bA03mHNgJGCfBo=
=mCzu
-----END PGP SIGNATURE-----

--6Fhrsg5OnubBpYb0--
