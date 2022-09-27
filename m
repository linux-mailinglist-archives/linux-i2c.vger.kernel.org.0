Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578D55ECD0E
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiI0Tlh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiI0Tlg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:41:36 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C94558E3
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=kKnY16krnNDyPeAGlH7BwNZ1qj1H
        Vt48A930wSBkuZA=; b=0bBy9qj/91bGEFkukusvdUwBKYPa2u+eGLXRkg4t0lCR
        /th1wpAHjqrLZ/OBwvajsKPuhsvz79hLcMpP+ALuqP0+lHBnDt7rim58ETuMShOc
        FUgsQ/u9YdqayxLUgK0Y/V7Lbs/FHDd9lE+EsVmgr+ogD/9pCimGuo1K7mB4FhE=
Received: (qmail 3695310 invoked from network); 27 Sep 2022 21:41:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2022 21:41:33 +0200
X-UD-Smtp-Session: l3s3148p1@5y3T1K3p8K0ucrEr
Date:   Tue, 27 Sep 2022 21:41:32 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v6 2/5] i2c: i2c-mlxbf.c: support lock mechanism
Message-ID: <YzNR7Go3EsOZY5t+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-3-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fvLYwfYdd6hp0APE"
Content-Disposition: inline
In-Reply-To: <20220926194507.24786-3-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fvLYwfYdd6hp0APE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 03:45:04PM -0400, Asmaa Mnebhi wrote:
> Linux is not the only entity using the BlueField I2C busses so
> support a lock mechanism provided by hardware to avoid issues
> when multiple entities are trying to access the same bus.
>=20
> The lock is acquired whenever written explicitely or the lock
> register is read. So make sure it is always released at the end
> of a successful or failed transaction.
>=20
> Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueFi=
eld SoC)
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Applied to for-next, thanks!


--fvLYwfYdd6hp0APE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzUewACgkQFA3kzBSg
KbbFuQ/+KVwdaYw5SSxxtfn2d8bTWmggc/ru+HFRSLIJboOIi4E0GaNgckOe+vwC
uu06qdNvmqBEvYpxa7fAvbBqgzEPlNlbVx4bcxEqrsoGdm66IJ1sfnjiscYWn33r
MQIkM2LW5OXADot+rVjvjk/5jAGNFSS5tIKfZi+lppTLoLiSISK2mcuM7dMmFhsZ
Y+/6ASsPl9XXMndamP+L/v8qqYyq4xNjq40Tqfv70CZMR143VAAwObAElgdaNmyu
4SoUgFuIlfIeovChMiC8fCB0IYSvgxTOe/0Evwd12/PIM4Ole3JtQOMQV/LRTWaW
7p9ZPXRQ7HU/LCMluiO0KYd4exWjGR4sVr2idyipC9O/34WlZpF9a1sU8MrpxYwj
rRaLPdMKQxtc2fXpPZCptXnEmAleUO2izKtuzHUUrU7iT0xmoM8AKnTWE3o5ecHX
M35ujC5V6fN/0gY4WNlbTfxT8lGWpWFAzJfQgFQNz/jepCrESnPnhnVB3zKjzvx4
P1soWn1BoFk+pgBhl91Ji2MyZuz6fUrzdv8PkDDnke2jWMK0GBTSd8lUqwksJhu/
zXQVofcDTTNwDMnjIjw307uVhWWXDUD+LiBijzyIUshSn1Gdd1HLrS6C32SRKVlj
2b64lbsvvP5k9vFhsSGknuWVvFcUom+BpYaHwNDtJXNcHK6LZQg=
=SC+w
-----END PGP SIGNATURE-----

--fvLYwfYdd6hp0APE--
