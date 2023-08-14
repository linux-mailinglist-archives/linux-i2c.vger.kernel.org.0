Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3A077BA0C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjHNNa3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjHNN3q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:29:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9B412D;
        Mon, 14 Aug 2023 06:29:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7837765299;
        Mon, 14 Aug 2023 13:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265B8C433C8;
        Mon, 14 Aug 2023 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692019784;
        bh=KG5qnp6TRmWxZyERaKzUZB+FydnTzOAnNP0HIao7J7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rvpK1SfQEN6HsOtJK+IXNagXo9jlOgktkOFiGluVUVVDfltnoil9txSusmKtQO/xG
         pJOCLxQo8ISRhJsaK+DYCxXm1wbmYV1WriIjU7VRv1Bwjtrmtjn2X++OOEBhTy5DQ/
         Ko4nM/fw48laL8NyS7sRauxZ+sx1JLqcmXyKNmKqs6y9kNiTsJVduHeT7w+8cPdBt5
         Ctyi5vfY8U+TX2ssaC/YBonZ8YWzVtwquW+/5gFUhiBoKE4evm6opFzwAh0WxnHZpP
         HZxsoraBDi8VYq/fUg5efRsWnAnvIcO0h3EverB7IBEc/oEjpPs837cE9u4ERYopxZ
         P6Rm5TO6WpnXA==
Date:   Mon, 14 Aug 2023 15:29:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: designware: Handle invalid SMBus block data
 response length value
Message-ID: <ZNosRDSWSa4Pbs37@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
References: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
 <20230726080001.337353-3-tamnguyenchi@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xx9nXRKiwsLwjCR+"
Content-Disposition: inline
In-Reply-To: <20230726080001.337353-3-tamnguyenchi@os.amperecomputing.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xx9nXRKiwsLwjCR+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 03:00:01PM +0700, Tam Nguyen wrote:
> In the I2C_FUNC_SMBUS_BLOCK_DATA case, the invalid length byte value
> (outside of 1-32) of the SMBus block data response from the Slave device
> is not correctly handled by the I2C Designware driver.
>=20
> In case IC_EMPTYFIFO_HOLD_MASTER_EN=3D=3D1, which cannot be detected
> from the registers, the Master can be disabled only if the STOP bit
> is set. Without STOP bit set, the Master remains active, holding the bus
> until receiving a block data response length. This hangs the bus and
> is unrecoverable.
>=20
> Avoid this by issuing another dump read to reach the stop condition when
> an invalid length byte is received.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>

Applied to for-current, thanks!


--Xx9nXRKiwsLwjCR+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaLEQACgkQFA3kzBSg
KbaNjQ//cL9hyUlb/YsOw6TZXERSlcClZONDZ/xXroiSw8X7+Eg5ffPzotwQfRs6
woAwI5pT01wQWY2HYHi/Ui8Wywa3HqXAH1ihgkQOMa6mnUg6eURSKM5oz/UEflfP
fmO6d/hinXRfCssJWB02Qu+F6rHyogqexmI4igqFFCavQ4NrUkCXYUB5GXeFS3fC
WZ9nGJnnUQbYl9p58NHta0hibokRl4NGqVu6sVxt+11E4Ndb85yf4ZxhNAAFl8+6
YzsFexGTfg9yQ0lc3KMTIgD5Uf7Bd6kFPHJ1KctBNbmrbsMUn/acZ8W0h9+ujos9
hLnGxlWDng2wBVV6fTDqw0gORacmzT690FBLlpHjcGqCEf7ArV8FUlm2zotEHVNU
78jkvWcs8wmU/tA12JN4s2hBLbzGMlmppujtt7XwAuxSEZ9zHT/1NCAmBl9h8McY
nXB5bvRh2eI3xyxzCqyQL9Ping/5aG+eT/WXZhAcT0orryBS2alBMg9AxkLQgk78
JKivYUIYWXvEhBbBLGEGggA7TljPlOvLbE4ihaFpyo6VPUWD7c4AnYUC1kPpDms2
5PQcRrBjNLJtH4YomMgLisElXn3RrS2vS/QwTRtx1S+UYyYMIXkcsY0mbpx0a6o7
a2emHxym5tAUClTnBNtimKxXsgRYPfcaf8w9+te1vS3tKacB5rE=
=5joj
-----END PGP SIGNATURE-----

--Xx9nXRKiwsLwjCR+--
