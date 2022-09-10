Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8C35B4A6C
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Sep 2022 00:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiIJWLn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 18:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiIJWLn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 18:11:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF9765E3;
        Sat, 10 Sep 2022 15:11:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ABB9FB80949;
        Sat, 10 Sep 2022 22:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FE4C433C1;
        Sat, 10 Sep 2022 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662847899;
        bh=pYaUZ8vP26B8WAXiF+Oi3w90Kq7OQpxHLlOI9dOkT0k=;
        h=Date:From:To:Cc:Subject:From;
        b=p4ip7Ep0GRovbIw52Q2LafZQufg/GChAhYR6j070joCgluHJ8JxBsTloBdYZSaQ/y
         AjxyMFskJ/A+uXGNN2KC8Yy/Bw/7Ml/Ey5qFzwx3k+LNzXxrhG4LgZ3w1h8lfC2yH/
         0eG+ZQcPtT60N99dUidZnz/6CWnhKGzq/Eppag5dOxK/vtYy74Gq9ebplJ5SRQbWOF
         f7lfbxT+BXewoIa4cxiY98r+m6ZG9SyYMOFH3ZThiF6webvmdzELcQmuNjzXvSjDS0
         A9V1P/f09WrePL+OdZqIzVZCGf1LMJbGzMjcpjgwqm6ed5ztyDmIboXz60TP0K+tAW
         pmhIiPsCXNYHQ==
Date:   Sun, 11 Sep 2022 00:11:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.0-rc5
Message-ID: <Yx0Ll5QJtBf348l0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OwbzpCVlfxIu9sA+"
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


--OwbzpCVlfxIu9sA+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

this pull request has only documentation and binding updates. The doc
updates pave way for even more improvements. So, to decrease
dependencies and make users happy with the already improved docs, I
think this should go into 6.0. The pull-request was meabt to be sent to
you last week, but I was surprisingly without internet access then, even
my WWAN card did not help. Amazing!

Please pull.

   Wolfram


The following changes since commit b90cb1053190353cc30f0fef0ef1f378ccc063c5:

  Linux 6.0-rc3 (2022-08-28 15:05:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc5

for you to fetch changes up to 4e2a2ed96adcb6151a15ea40db933d97f2ae7aaa:

  dt-bindings: i2c: renesas,riic: Fix 'unevaluatedProperties' warnings (2022-08-30 12:08:54 +0200)

----------------------------------------------------------------
I2C Documentation and binding fixes and improvements

----------------------------------------------------------------
Bruce Duncan (1):
      docs: i2c: piix4: Fix typos, add markup, drop link

Lad Prabhakar (1):
      dt-bindings: i2c: renesas,riic: Fix 'unevaluatedProperties' warnings

Luca Ceresoli (3):
      docs: i2c: i2c-topology: fix typo
      docs: i2c: i2c-topology: fix incorrect heading
      docs: i2c: i2c-topology: reorder sections more logically


with much appreciated quality assurance from
----------------------------------------------------------------
Geert Uytterhoeven (1):
      (Rev.) dt-bindings: i2c: renesas,riic: Fix 'unevaluatedProperties' warnings

Jean Delvare (1):
      (Rev.) docs: i2c: piix4: Fix typos, add markup, drop link

 .../devicetree/bindings/i2c/renesas,riic.yaml      |   3 +
 Documentation/i2c/busses/i2c-piix4.rst             |  13 +-
 Documentation/i2c/i2c-topology.rst                 | 214 +++++++++++----------
 3 files changed, 123 insertions(+), 107 deletions(-)

--OwbzpCVlfxIu9sA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMdC5cACgkQFA3kzBSg
KbaysQ//TQpDhQ3GWV1BEYsAqV2epehq6UBMcClghmVZorn0rUry9LTuPa52UCli
6eaXkgRRJq5HHzZwpbIAaI7rR2maEmYkPhK7fGq8YBRnBm4pw9E36U0Jc+iHsmxC
incDpikfosogOkZBMN/94KhujzdM/It8LPrrknEPwOJlejwn3YbokLvXFuckWqYK
t5n9DaB9W2uH2F7Fi4mP0aKs7zHd2Z8qYLX+gnzrT6r3uKcb+pcl2anOiKOIpC11
6v4rTYz+s1rfjdBhOOulD9v6yak8i3rS1JuhnG1v9oCTL6R9w8bMxhM3goNFjLkw
d+JToOGpvZAYCFbPHUsCFLyPCLzugXADmttLAcatRvJ2pYwGZsw5S6F5Qq+SS7xQ
bMwkRden0mhL9M1QvTTBWWKOOiLgtuwBbr4T/Ba5xJpNC6z3ByuTtA/9xjDW69RK
uDZN46XrzN+HVhZnWhn+XzYIZ4+IuANHVNhE0wD9A5EP/fA8etu0BCp0mFA19lzu
atA8FdBQxT3mMdZqAUHYEhDWc+BoyMYv3hM+0ewS6qqx+FYeE0+5U3f8CjrcdPr2
HcnATukaavmiOSvb5EpZBD+E2VitFCqc4ueIFaZDotfIZie0RuyYgM9uqJ3c37bd
N9enJ2TVljlQExz/luzkInlsiOSUN8tqY6IVHdn8uEz752mkutg=
=vqpN
-----END PGP SIGNATURE-----

--OwbzpCVlfxIu9sA+--
