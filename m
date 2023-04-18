Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F04E6E6A10
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 18:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbjDRQo5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 12:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232721AbjDRQot (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 12:44:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D35AF12
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 09:44:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8900B62BB5
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 16:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC0DC433D2;
        Tue, 18 Apr 2023 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681836287;
        bh=xpNMHp0lURIAq/Xli04NXJeLD3Y7z0M580CeokYTV1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XUyxHNueBOsiuRvMOLVqdtKAYQN5J5UiYGNBkJWiBzThAIrEhk1sjYHvb8SwbDGHu
         rhUASjee8lIK7yjo2dYVGkSAuIn0coyGgiID7CZxnA2Lx3dArzF4+Oxt/zwGriD3PB
         bCsvuwtokc3zzeAIg6wUhgkwgQuicU70OZkdykw3TJJH9qMvOQbY53evg6KKPrW2Zx
         +64bTTowKiao6SgvBUhEAH09qhhD8U5HwbuR5TcOKGC70MbcOOjFRUB2JRNomCnlzl
         wN50VkxPuwAMQjVhXn8BRyYaJRgU4JIk7HtaBwjoOY/9JisKYp27AL3FcbtOb89xSZ
         gB7Uxyea1YenA==
Date:   Tue, 18 Apr 2023 18:44:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM
 leak on error path
Message-ID: <ZD7I99b3LvdTUJRW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230414021022.505291-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2nugjZLVIp3tmK0h"
Content-Disposition: inline
In-Reply-To: <20230414021022.505291-1-lars@metafoo.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2nugjZLVIp3tmK0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 07:10:21PM -0700, Lars-Peter Clausen wrote:
> The cdns_i2c_master_xfer() function gets a runtime PM reference when the
> function is entered. This reference is released when the function is
> exited. There is currently one error path where the function exits
> directly, which leads to a leak of the runtime PM reference.
>=20
> Make sure that this error path also releases the runtime PM reference.
>=20
> Fixes: 1a351b10b967 ("i2c: cadence: Added slave support")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-current, thanks!


--2nugjZLVIp3tmK0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ+yPMACgkQFA3kzBSg
Kbb+AhAAiomqaA9i9joZs0mcRC64oofelDKZnG4idVqYc0Q1BD4sfiYXBjRYou1q
J6SdaGqoTfnz08wak37TEoHCgnTZNbeGf7tQASwNrpp+kA820VqBjNR/2ckNmP+Z
Yz2FMl+CQrGpbmOVBvqIUdjidPafGy9BV4TFpSKjsaFl0jv2eqfrlu/xjGQ0mcvL
tLOI1tZzKNIZgwfeYFX2/sQRP869V27Gqm3fWdkWelstz8lWcVqMtomxS+u5qosU
PfHTCsvOd67rEVluCixpO9TXG+BLWJ4sjpF80jnSsz+W9DRGwUvsl+4OlxsYnCeq
Wlgw03fjorxy4p2l7/TPeYo0gFNoh2kWjKvaUAKFMVUR/2jDSO1MkGgBuX28UDCo
8DLFg75wtYZI5AK+/ly8yH8wh6tyBWmyDLVgr3CWPmy6ysvgImZFOVkvIrC9CZHK
kCA28p1kK3tWH3uLbP7saJEczvAPDla6ex/plGgy4Ps1nQV7zHAntOkHSGu3+m0F
LkRksvzWMVrrnB8qAeC4+H6FR+bsUETQVcOlu0WB24+Ku1O4J0V08XGUEPJHtqwO
akQHs7Bb9hKL0cuDAiRgarg2jwpa1syyA4jvuXQpq9EtsXNYVMGV9zirNC15vnc8
mgZZZxqHVtqPWPAfriN2pas5gGcZyGjopRuiCtyrjnWJWiP6Ubg=
=Vx5u
-----END PGP SIGNATURE-----

--2nugjZLVIp3tmK0h--
