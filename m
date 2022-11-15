Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD37562A352
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 21:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiKOUse (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 15:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238008AbiKOUs2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 15:48:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7A9C77;
        Tue, 15 Nov 2022 12:48:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACE0461A1E;
        Tue, 15 Nov 2022 20:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4549C433C1;
        Tue, 15 Nov 2022 20:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668545304;
        bh=uwEuA4GREzRp23O5lavaUji5n0WuGVv3/gYO0DX4QTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PIIZzcIC4EL5OoW8DO5ottcHSEbOUKw7kshHlqNwzyeLAV0ya+VosaOXooFtmsFmq
         2EByZwBoezW4yc3zrty0UW9gK3qIXqMutgsxuOJRiUHdZ2AMzm/RvuAU7RgjGY+ANy
         7gXGHmYT5WG1lfYrVyCLWkx7V+aSs0uknT8AOtTQvc1GHI/d1PTpB3Q0onYFSMvUXh
         Nh6jVyipNu2EWaYW10o06DJPJTaWo4fXmc6igo++pAHpTuqB/r9OfnaAen+4lhhNPm
         YGMEn0puKEhfRAqQyVZactU1TFEKkg+uEHJBouC1Ds6nz/qy3Oen3VefbBK7CuGooE
         zGl13YiKzJv4Q==
Date:   Tue, 15 Nov 2022 21:48:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     jdelvare@suse.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: smbus: add DDR support for SPD
Message-ID: <Y3P7EgfBpnOowBIY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>, jdelvare@suse.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221114115606.1967080-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QRO14Og76H8opU6a"
Content-Disposition: inline
In-Reply-To: <20221114115606.1967080-1-clabbe@baylibre.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QRO14Og76H8opU6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 11:56:06AM +0000, Corentin Labbe wrote:
> On my x05 laptop I got:
> Memory type 0x12 not supported yet, not instantiating SPD
>=20
> Adding the 0x12 case lead to a successful instantiated SPD AT24 EEPROM.
> i801_smbus 0000:00:1f.3: SMBus using polling
> i2c i2c-6: 2/2 memory slots populated (from DMI)
> at24 6-0050: 256 byte spd EEPROM, read-only
> i2c i2c-6: Successfully instantiated SPD at 0x50
> at24 6-0051: 256 byte spd EEPROM, read-only
>=20
> And then, I decoded it successfully via decode-dimms.
>=20
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Applied to for-current, thanks!


--QRO14Og76H8opU6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNz+w4ACgkQFA3kzBSg
KbYsBw//aTuCnarfB39zH8pir25y1A6SV/fitLLbuzekq2/Ai15LzZjSDcVAzz04
EnPb+dLeMQ+InoQZUahW+M17hliSWXtsfgap2EwFqTXfl9Yzfjc9pafT6IX4VXLz
qxtb7qSjiAOICb5956sUf+PtSHjv0THDi0YOKaT9ccffYHauHu6FHf4VWRkNzolB
8XEU6uApqhCiPjKaGzHlHkekDiizXSbNU3jB0Q3pYb+WBcq0fv+fKdObntgi2T1T
ofhikSOrP2iartLnpLPHBJwi6O7bp/MA+AaVx/YBC3nELJIxXnCL86S1MMlrKnBT
iQGgDzTD/t2TjqQDkl87U8n5G+BMg4BI88UtLiEtBcb3f/xj9INwgigLS6ENJ9+k
QpmsO4pkHM4hvFFeBDLdJ+1tcNJM4byeN1PPZnvqtPKAAqLxhaUs6uV1HKL+MCLp
maNDdDZ/T26T8kVBjTD6LoyOn8/5Gu7+IxIVdHbYCw/0xnZliUGSHDUz4KNDJcUA
TxIFYlNfkOIBtx0mvTPSIvQKsRjQooWhnUTd1zM57NsK6mlvkpDOKjQeZ+7gkAJJ
fBgFj6abHPQHKDBuaRFpYs6RwjPSLzHg1+v6LNtx0N4oBWiXKgDwtPjtIPblnZz8
beoCD/AcEIexMYSvnAy0Misc6KwJbFCh4UrL1n5/HQwxZo7Wzuw=
=E8Rn
-----END PGP SIGNATURE-----

--QRO14Og76H8opU6a--
