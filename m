Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E2D63FAFF
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Dec 2022 23:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiLAWy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 17:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbiLAWyw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 17:54:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393D4C7241
        for <linux-i2c@vger.kernel.org>; Thu,  1 Dec 2022 14:54:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBA9961EB0
        for <linux-i2c@vger.kernel.org>; Thu,  1 Dec 2022 22:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D87C433D6;
        Thu,  1 Dec 2022 22:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669935291;
        bh=5PfRw2YyLzqdVchXGKuZh/fhr8p0eS4YqUxS8U+bke0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FPifu1cohFTznKldTinWq2Xzb6lLy18wKupufXG/W5FyFo78mCGUWC/rlCGffcnSx
         RvFJ87hShcpb+MscA8Tl/Kw8WBZuX7FEnh63U9V7H6/Y0QDJC/ZK0NnqZmLFzyrwK+
         wXaMgYzDtB8RTLvzxQOOlgETkN6UJdn+uh2twVVuv6jIghOthrlKO7xJNtkaDbQ7Sn
         rFBZTYb4b1tKIkE7gX0umPNr59tH07gpzRaHNV4u6SmHcWkJUQ11F4wYhPOeZK9qYF
         5/1BXN736cwUmwT1UVVe2H6amXmUli0d/dmKLW6zXFIH9IrloJFUFm7g3Woufv32Mh
         tQdqzH1nrWSig==
Date:   Thu, 1 Dec 2022 23:54:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Michael Riesch <michael.riesch@wolfvision.net>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: cadence: make bus recovery optional
Message-ID: <Y4kwuDzCvvKx44Np@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
References: <20221023215121.221316-1-m.grzeschik@pengutronix.de>
 <20221114155700.GA18924@pengutronix.de>
 <ec30bbb7-88f4-f24c-c080-d195d91c2b95@wolfvision.net>
 <20221128130723.GA4576@pengutronix.de>
 <20221128132410.GJ18924@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NMFyWoSHXVcZAjP5"
Content-Disposition: inline
In-Reply-To: <20221128132410.GJ18924@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NMFyWoSHXVcZAjP5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ignore my comment. After reviewing again I can say their patch is fine.

I read that as "Rev-by". Thanks!


--NMFyWoSHXVcZAjP5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJMLgACgkQFA3kzBSg
KbZLGxAAjWmFEU5Cs92HBfcDs+/4S38ofT+9/MLfEU8PI97ngwMsAKnzBzVOyUXZ
y4o83cDQLRyiW5VIiRYejrmRqzRhhBqPNUsJR2HIylsNmWP2zS17T4szoUwpoige
4aC/XL6KEx7sE6hXpel7tKzOG32TyBX+vOtoa15NNTIrU8bc3z+aZqK63aW5+QcJ
JMvJOun+X2BSfgLR7xVEVWlrSFIYmEGM5Y8EILj46amPLsZNOpDiMfk/a05MCtiA
g3vbk6jpfG42k5uRHDeyOeRzN+3KcYDScdillXTKa3SDEAV5v8Z/SDSMuCSR8aq8
rQwSct6pvidDNrlhzBUN1CoJkrjJNyng7Jqk0yaWztRF3aYoRtsDpBvN6s+b42Io
yvtiC4x6xqNP4KT3zc/dchK9b5GQQYDfs5JLFE9LF1RYEfM0o1/eCp0uhXMaKNea
2JHmZBhezi83mPw6Ki+MbgOlPhnjUjLTwmGMk4XKX6feqiO1pDFqBL3N0fRqz/+s
ds9Pp4vAhysmBeGgNTWNW8dd7M5qU6vf2PlIlXY4TrSxusmZoEeoYeGwKz79/FZD
AMq2I3ztdoTYZwZUMtntFcoABc9Y4ZOaq9abd5SwEmaKbis+yg9BYaQmBw5E5FUK
xrdVAJIlROrnp0m5jcmpVR2RXkPOxdpBj7Yoia5um8i2/YJCu4c=
=8wJw
-----END PGP SIGNATURE-----

--NMFyWoSHXVcZAjP5--
