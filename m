Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807436AACD2
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Mar 2023 23:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjCDWBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Mar 2023 17:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCDWBv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Mar 2023 17:01:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6479E12BFD;
        Sat,  4 Mar 2023 14:01:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3CE81B8091B;
        Sat,  4 Mar 2023 22:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E19C433EF;
        Sat,  4 Mar 2023 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677967306;
        bh=UYtT1s6jaE+WlTD4IRj7qJ/n9RvpSEgfJCFqBFbQs+g=;
        h=Date:From:To:Cc:Subject:From;
        b=U30rrlEa/Hj4P/thQoOoQkI6gNTBZ2kZvf3CABuqm6l9incnZ7GBOn5PZ+V+kRHhm
         mAA3BNP7Zw+waJ5qDcBTX87d0e55MwmC4IO2uP4/k+kleJdGjXxIXIDNEwHNs9HyS1
         PLEas+slIn2TZE8Yaf+BiG99tnUcJYavIGRaNqyU9MKZXswidAhrRjrJDtA9/GPlca
         3JW1hxOcU9SjWhZt485b76idQiU4bViDDRPBxAOdgNsCXnZ7V/l22YxrS59zNpy39O
         Lnzfqeedv3po4O9BCUr7YoJSrpOQZiyTTG6r9+pJ9wvEwfkBkRTA7gAyWRD5wFbvbz
         fsBNMa5CBoXfA==
Date:   Sat, 4 Mar 2023 23:01:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.3-rc1-part2
Message-ID: <ZAO/txYiFrl9y6T0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7EIcxp6qdXqCs8FQ"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7EIcxp6qdXqCs8FQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0a3f9a6b0265b64c02226fcabb5e9a958307913b:

  Merge tag 'thermal-6.3-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm (2023-03-03 10:41:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc1-part2

for you to fetch changes up to 65609d3206f784489eb1ebd6fce64b84a42cc63c:

  i2c: gxp: fix an error code in probe (2023-03-03 21:00:54 +0100)

----------------------------------------------------------------
Some improvements/fixes for the newly added GXP driver and a Kconfig
dependency fix

----------------------------------------------------------------
Benjamin Gray (1):
      i2c: Disable I2C_APPLE when I2C_PASEMI is a builtin

Dan Carpenter (1):
      i2c: gxp: fix an error code in probe

Wolfram Sang (2):
      i2c: gxp: remove "empty" switch statement
      i2c: gxp: return proper error on address NACK


with much appreciated quality assurance from
----------------------------------------------------------------
Nick Hawkins (1):
      (Rev.) i2c: gxp: fix an error code in probe

 drivers/i2c/busses/Kconfig   |  1 +
 drivers/i2c/busses/i2c-gxp.c | 21 ++++++---------------
 2 files changed, 7 insertions(+), 15 deletions(-)

--7EIcxp6qdXqCs8FQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQDv7cACgkQFA3kzBSg
KbaBeQ/8D+wevoRxGGD7ZyazMEVC8N4mCC+dJOWDadmG0qyEwlO0oSLgayuA25JK
z5XNXxxYyCOGY3u8rmpcY5hI6jyaLiZyaGF2YQcAdmRuPg1pEhvhs+wJ6bE9v4JS
s3Vkp4FvQgeWwOUJqoJOpWvi3aeEBHlvNVf++dkwAavxuqK/US2j62NmvWUQndRG
MdizX3QGF5t1LAPb97qHgHC1mVKdVtx/GiE0RRO4dIgLl7XkSvAxark9pKZf9AbQ
Q3sPDiEFXBF7knOYAgj77gVk0nF/qAQoMmWFxoiAO1bMx0MID60GTKnAW5HHhquG
APkEYIbAxa+iH7Ae7q/+G+5vRXfeM1ND8S4opkL70WRW6g91kzdSsTGepUgzU9tq
xmZLW7WYSi5z3Cm1oo7pJpTbiJs9/le3ZnUMiHQUnoLWgwP49SYAjdiwfetF3PG0
+Bbw6XVNwYeI+fDASz51cVsLCy+wWGFmfe1SdZuCgnq4S17hUun7KaAGE9mS0uuN
Ik4fPLogvse80mPORF68aCFgjqyj+eS4mC4fOeT89+zkeNzAuczq2XuTqBgLWMx3
qVpxcoa3NqGBk9G//TJ23OTd4J7IXEEfcDL+t5EDT/wH0U0LoGeMU8+UcJvz3Vkd
/UB76GJIBGHuMVYYd2H8TsQtTK8+m0oNhZi08b5NixKdtpzsUco=
=4PAs
-----END PGP SIGNATURE-----

--7EIcxp6qdXqCs8FQ--
