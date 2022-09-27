Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9094C5ECEEC
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 22:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbiI0UrV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 16:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbiI0Uq7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 16:46:59 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C33D10D657
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=wfbFlT7Fnw4rxLDLwyq17dXmR0gJ
        5Qam1ux0R1lQHWc=; b=MIczD5cJT39tZ9klkaFPGmkFWRtPRbLdqC1B0jE3X4cr
        UJXn4FxraA5YYt3iQ/ms8B42g3v9Ty0VpDEUZjXZzvvI12mbfx5GkWXcpNZxabUx
        3w6lKWBM46Gn2y8dovBBGn4XGAHfqSGG1P/YfC6mqKsHS1T6NSvGvyR2fomiygw=
Received: (qmail 3715985 invoked from network); 27 Sep 2022 22:46:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2022 22:46:53 +0200
X-UD-Smtp-Session: l3s3148p1@SoqBvq7padUucrEr
Date:   Tue, 27 Sep 2022 22:46:52 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v7 1/2] i2c: mlxbf: support BlueField-3 SoC
Message-ID: <YzNhPL0lUeqjCymv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220927203924.22644-1-asmaa@nvidia.com>
 <20220927203924.22644-2-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qVngq7oWP5SexGFa"
Content-Disposition: inline
In-Reply-To: <20220927203924.22644-2-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qVngq7oWP5SexGFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 04:39:23PM -0400, Asmaa Mnebhi wrote:
> BlueField-3 SoC has the same I2C IP logic as previous
> BlueField-1 and 2 SoCs but it has different registers' addresses.
> This is an effort to keep this driver generic accross all
> BlueField generations.
> This patch breaks down the "smbus" resource into 3 separate
> resources to enable us to use common registers' offsets for all
> BlueField SoCs:
> struct mlxbf_i2c_resource *timer;
> struct mlxbf_i2c_resource *mst;
> struct mlxbf_i2c_resource *slv;
>=20
> Of course, all offsets had to be adjusted accordingly, and we took
> this chance to reorganize the macros depending on the register block
> they target.
>=20
> There are only 2 registers' offsets that do not fit within this
> schema so their offsets are passed as SoC-specific parameters:
> smbus_master_rs_bytes_off
> smbus_master_fsm_off
>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Applied to for-next, thanks!


--qVngq7oWP5SexGFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzYTwACgkQFA3kzBSg
KbaqWw//YiVATDdKJKtgq28rIlc01pCVSOtVA5ytf+MSSmE/FCScYbjwEWIdq4nW
4IQRbWU4u41FQUVyjMmX6PZUl7mFL86jqLzZjtyVu0I0oMF+Tk3pK6G8tlazuU/1
YZ1dtJG+A8Ooo84sh2pykPKAG3ONlat8zzWBu3Vvliki2owcLFPN+27ZyyJp0iqn
IftCw5D20BCix5nPWj+PgabZacGl51U/3J9CHxs87Q8LvaVF54DlGCgtZ11oXJG5
rohxVtpItFzjJfANWiY79XMVFqyoCLWr0UXq1V5W5lgr7XFtvZRTyUBLYhXt1w+R
8vfTTz+v+WqAsZuGZnbHjImC+nssLYA6ddSnKniPEsD/O0scQWPBgVyXEPzYhVam
sdqOAa4fuHXMw8FcbLbq86n7FMOyiS5AgDneJFUDp8y/JvML6bP1rkLFi4az+/kc
m4VaSN8ROJ/m0vR8YXBRXZ0LLya4CKAL/vZ6MbAF9fnbnjZSEiuEvahSnKzvDOOr
Fl0pNJ8Y5EdjVeojuHWXd5x/f+8mw7g5c8iH2phcZNzIrKYrfvqhuv3ueF7EqwyR
2STFyJNzT5kk0NRv7DQJtD0Y9bLovCE51lY3Gro0WsAiogr+jOUiKyXE7KtfJXjR
3i79ubMCJ8KpprPluemEgNd0a7Mg6qAHnmr3F4FVHTSMhhF0xrg=
=9tLB
-----END PGP SIGNATURE-----

--qVngq7oWP5SexGFa--
