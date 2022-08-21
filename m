Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97C859B2D1
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Aug 2022 10:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiHUInq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Aug 2022 04:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiHUInp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Aug 2022 04:43:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852B61A05D;
        Sun, 21 Aug 2022 01:43:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02F1860DD1;
        Sun, 21 Aug 2022 08:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A10C433D6;
        Sun, 21 Aug 2022 08:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661071423;
        bh=4ow+87klzjK1s/ZPzynCOL4sSJYQb/HTm8PrOxl9BkE=;
        h=Date:From:To:Cc:Subject:From;
        b=rXjcbp199xnGbQfM/i1rvABsQl2S08RjdSV+MY9PpOU8/kvjWRBnEioz30Y6+dVrZ
         2Y+/vii3uNu9cW7z3Ni+CR81+3K/5ZkLIRAnMFEYEdV/PRFJAwFA4fgdZRMIXwMUsu
         Xewlok0ZGWB3Ortj1PjCnPO+UZ2uhP4OSCPtBqmkO4Lg37C/lp3BUx4M5oDM8qeIXW
         srxPSm0QaYqMvZlUUk/X3XDkRdOpgVd2TUnDM8pPMHsQ+ZyJrOO6zeBERTRitMJgBG
         mZtgW8AKorJLFXdmrlZ8OspHmxkgG6TiSJBUDx1dShYcYqNI63g0aj6VPAm2ksZRmp
         AFvTNbvLTLFFg==
Date:   Sun, 21 Aug 2022 10:43:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.0-rc2
Message-ID: <YwHwOwkBOAeoRuci@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="peF6uqEsAHXhFynL"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--peF6uqEsAHXhFynL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

there have been some last minute changes to the commits which only
affect the commit messages (added tags). The code changes have been
tested by buildbots before.

Please pull.

   Wolfram


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.0-rc2

for you to fetch changes up to d98bdd3a5b50446d8e010be5b04ce81c4eabf728:

  i2c: imx: Make sure to unregister adapter on remove() (2022-08-21 10:27:3=
3 +0200)

----------------------------------------------------------------
This pull request includes a revert to fix a regression introduced this
merge window and a fix for proper error handling in the remove path of
the iMX driver.

----------------------------------------------------------------
Uwe Kleine-K=C3=B6nig (1):
      i2c: imx: Make sure to unregister adapter on remove()

Wolfram Sang (1):
      Revert "i2c: scmi: Replace open coded device_get_match_data()"

 drivers/i2c/busses/i2c-imx.c  | 20 +++++++++++---------
 drivers/i2c/busses/i2c-scmi.c |  9 +++++++--
 2 files changed, 18 insertions(+), 11 deletions(-)

--peF6uqEsAHXhFynL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMB8DsACgkQFA3kzBSg
Kba4MhAAm48sdzNwnxjHa0TEBMbQQkrvFqPk8YYVVN0BRuxNU7hDPzuBD7qWLB5x
brslm7BLRSOcKDw3QgMkq476lYKGVv0AcCAgE52Y48FM7xAJe8yWLFDZsLbnSq/9
nIjx1TNQMULuK1WTFq967VZXlR5HkS0apeRr94vkG6PD8rHVOjvFrStM4Ao8c0S+
Mvtf/rYu3+6iLGAHaCYTPBb6ad4grJGjXVaiqdPbXPYwMq6IP1CmGAsTNRkftqaT
bToBpLipGjDUZwNVnmZkM/WPRF9QMpSGOxTMB0DR5Ky5TnxBPvIO4v9lzIUHApCe
xQUA39HUAAKEvmDKLgDWOBrEqTIGObPh8kv06Wgyl9JQbszkfgRiiTbU1rjNmjJa
bP1BVQgoNjad+5b/V01TSTVA2o9TPvOTOPpt7AweX/2NZAYG4BZUaJK9KvVfMN+N
nW7YcVyttiPpWTbxahMRnoftNTcaFtPEiBr39HDzy6n2LmMjZTTqZpbZvBniBzCg
SSSKcQZbqrNQFUkF1u6McaqqPD+nggVRMfON3YSFf+05HhBu3tVIt8KwWIV8lb9v
+WTSdxjkjHevb+uENyKJhczI4jEbHYF9/dk37oUCtw+11o0TpSLO3FAsQgGhWMu0
GqX15OFRaP1kLVuuRbX/po20TxsZRRLJ17InlhFPcsfcb4/G8gw=
=rTY2
-----END PGP SIGNATURE-----

--peF6uqEsAHXhFynL--
