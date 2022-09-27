Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66305ECD09
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiI0TkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbiI0TkR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:40:17 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B0D9259B
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 12:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=cKxIZN3khKpnsPC+P3OOBmRkjRbm
        Dy3nHaq3Dubd/hM=; b=2//AuNlASRVkyzrwzXn2RAbmjpC6rafCtjqCtnq3Mr2w
        Q6vPdT4vaz5WaESnbd2ZK+PnYCJEUYxB63koXyE04q+RFikGhcFMjwS5CqRGjAga
        v8RIPXt3epgLDgJcZiMTOFaapFi8RrX+V3K/AaYnZ+EwdYpGP8TrwWhxlcE6d+c=
Received: (qmail 3694815 invoked from network); 27 Sep 2022 21:40:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2022 21:40:11 +0200
X-UD-Smtp-Session: l3s3148p1@8LTsz63pkbgucrEr
Date:   Tue, 27 Sep 2022 21:40:10 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v6 1/5] i2c: i2c-mlxbf.c: remove IRQF_ONESHOT
Message-ID: <YzNRmlSjOS2/jyvC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-2-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p4Zk6pn8hQyVwPxR"
Content-Disposition: inline
In-Reply-To: <20220926194507.24786-2-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p4Zk6pn8hQyVwPxR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 03:45:03PM -0400, Asmaa Mnebhi wrote:
> IRQF_ONESHOT is not needed so remove it.
>=20
> Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueFi=
eld SoC)
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Patch already in -next.


--p4Zk6pn8hQyVwPxR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzUZoACgkQFA3kzBSg
KbZjmQ//e7Dn8FasdGSQSqd3XAf5GjBMXx402nYMxEVh9y/JBKOz2SKpRi1YnU1p
lA5yJqv+dyK/rXCRAJwAFzeXrxEYPtzZk5vEtHg0H2V+GPIN7xcFJodMYTkiYCqE
AEdI29LWJNsMdtmr8PsCvWbY8IKchQKjZsNyPuZbKjKEctgtuoNexCurEdnI8zze
9VpsSc8i6lenw2SiEPMB1qdLPc/z/hz5MfgKghIgGNpilbVXPXfd3EPXi1G1sEq3
RrrMqtn132e2rt6PpB/WeHrtbLr375pwCXA+PA+cBEHe2FFT9FRrlHeCpb/YW+5X
GahfxpSujFfG3PCq7UuxyQOSdCkFK3fHsbQz0tb5PolQlwRRZGfoasB2vZ7HOia+
hwre8s9Aw4cc7cj4bbfx05p19ogBBI8z5xp84YzLkMLJmjZIwmkhakr5g7BdiSCT
HslyVFppAVRk18ipGyrUNcFE97i0CPvYS2ZOTHuK0BJ7qJn58KXuHVdsVbZu+CiE
hNwrRHOmBY+GmbcwMZ3CYpnNE/ntjeBmuB8nqqOmDPHfJ3nFX/jrYW0+ZL/48LDz
pVInvK1pNwkawvi+IRGJixa9wB0+lnKf6/MW9xiKwgpajSTOh1AEPHaDzGZHqSpj
3DQBtLc8Z/2fkCxvWc5OrCG+PeF+DVJ9AP3hvvU5I8aeRu5tPzI=
=kOT1
-----END PGP SIGNATURE-----

--p4Zk6pn8hQyVwPxR--
