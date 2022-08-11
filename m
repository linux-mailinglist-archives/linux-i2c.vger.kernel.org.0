Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2217758FC30
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234432AbiHKM2y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbiHKM2w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:28:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E2394ED9;
        Thu, 11 Aug 2022 05:28:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 65D3EB8200A;
        Thu, 11 Aug 2022 12:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5036AC433D7;
        Thu, 11 Aug 2022 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660220929;
        bh=c8Y2E34GOZsE+B+cd7pLeLG8EqKiYDSr5sXQHJ7Blw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tH6MMysdDpI7Ben7qGsixHiBjJKQeDMGReGyJDlr9A54c+nHsz5YRIWIFrfGhb1D0
         CvdawGOxGE4dilA3GRVXUmPS87a95vtrV5Eunsi6RqGHdPKmBv/+ctuUxPnDfUn1EV
         xygzKI7zoB7NYXHDSFFTO0A6z6T8+pgQYOzBQz2ClWDwtUoT9zbHigdVzYrfy82juf
         nncQPh5R6xU7GzjVG7xoWqIrFi7SSjqIfi3TaLiyxkoXu3XqJd6bSvL01YwrGtDVvY
         E/6RXAuAlaXkb3aE7rHNZcwatZjRbecwQ6brFUNtjb8jytLI88a1qGRxMQllJgU8HO
         qbrpiV/puYbGw==
Date:   Thu, 11 Aug 2022 14:28:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Daire McNamara <daire.mcnamara@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andreas Buerkler <andreas.buerkler@enclustra.com>,
        Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [PATCH] i2c: microchip-core: fix erroneous late ack send
Message-ID: <YvT1/LOr4udX+jhP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andreas Buerkler <andreas.buerkler@enclustra.com>,
        Lewis Hanly <lewis.hanly@microchip.com>
References: <20220805074346.4123650-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A9kgKCj9QHN62IsE"
Content-Disposition: inline
In-Reply-To: <20220805074346.4123650-1-conor.dooley@microchip.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A9kgKCj9QHN62IsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 08:43:46AM +0100, Conor Dooley wrote:
> A late ack is currently being sent at the end of a transfer due to
> incorrect logic in mchp_corei2c_empty_rx(). Currently the Assert Ack
> bit is being written to the controller's control reg after the last
> byte has been received, causing it to sent another byte with the ack.
> Instead, the AA flag should be written to to the contol register when
> the penultimate byte is read so it is sent out for the last byte.
>=20
> Reported-by: Andreas Buerkler <andreas.buerkler@enclustra.com>
> Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers=
")
> Tested-by: Lewis Hanly <lewis.hanly@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Fixed these checkpatch warnings:

WARNING: 'contol' may be misspelled - perhaps 'control'?
WARNING: Possible repeated word: 'to'

and applied to for-current, thanks!


--A9kgKCj9QHN62IsE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL09fwACgkQFA3kzBSg
KbY1UA/+JM5owg65euU6DLpg9DLxO0C5Fw1lBtCpyP/h2Aj3v3PKmpj73fDD0rRP
KV4xe9ynECq7YW41vPgNLYDMtuDDugXoIIGuAW4gmF4G3uTwGbMQHX4mlOJJZt1b
GTKDcFVi9wbLt7Ys69fPg09MrMkHRQgi9Pr5ao0rTpXaPaDMrT5uRxq/vzpC9TUG
pHfKzl40kpqGk0QB94oadnhBQejgRsjWVRts3rnp6Y6vXRLpiK6pKUTH7kMYzSQY
M3qQPYPwlwd8qJN92tQFWXn3FNkDYmVdS2ZlaaJ6krv965JS5sU4VqUZTpuI9G9L
spzOFoN52+NGyB1QMwSVvvWQJyB4+f8W7x+iDQZBXkK1cYy1cK7V7QvVjd1CWCoo
Uvl5/bMs4Z5tBzBWqf8vztDOvbAUj9TDKOX9TDLiqHW7zHA/msHTJVwpJxL+hD/u
tEFqwfv7V8MT1QrC8NNZ8LOBbyqnkK7Bfy6peP+dCHMoVb/PBW6heh0znl5YPxsj
39jCci5/6dIdbXWo611Ci8ov6XlOwB1uRi34gJkD5Vj5o8q34tzxADnaRmS+JO7o
8TlSGDkO1iXp/JapzlKae00KXxfOchJ2OHj9louxfpkAsxFvgpBT3LZDLv7MaK3d
yk5KxOCIeuNm1iDzn9bRgumb0Yt6GE8UOgy9k5ZoUHk/ZrSbos8=
=9/wy
-----END PGP SIGNATURE-----

--A9kgKCj9QHN62IsE--
