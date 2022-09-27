Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A4F5ECD32
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbiI0TxX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbiI0TxW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:53:22 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562C4B7746
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 12:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=7rq6/YbBY2i9SbysqJB/dbqcHjdb
        S1xgF2AZGBtVDb4=; b=XvvxW6RA6CZNZP/u/0PbsymbrxihLdJQI7ESnLy41Pww
        feCQ4y+jqhlEyJSBa68xfejFI5a2MEJXc9h9IehLCRjfU8KdXtslswBAR9HKMHqE
        omPrnpabDi20XO+fe9i4dLFAWGevnvvEdpaQ2DmR9MGRC1d5/oFPxoVKPv9JShg=
Received: (qmail 3699698 invoked from network); 27 Sep 2022 21:53:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2022 21:53:19 +0200
X-UD-Smtp-Session: l3s3148p1@qqXq/q3pw6sucrEr
Date:   Tue, 27 Sep 2022 21:53:18 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v6 4/5] i2c: i2c-mlxbf.c: support BlueField-3 SoC
Message-ID: <YzNUrsFbG0vfP1Rx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-5-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LsKVTd9G7RT3E3Yo"
Content-Disposition: inline
In-Reply-To: <20220926194507.24786-5-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LsKVTd9G7RT3E3Yo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		ret = mlxbf_i2c_init_resource(pdev, &priv->smbus,
> +					      MLXBF_I2C_SMBUS_RES);

Did you maybe forget to check 'ret' here?

> +		priv->timer->io = priv->smbus->io;
> +		priv->mst->io = priv->smbus->io + MLXBF_I2C_MST_ADDR_OFFSET;
> +		priv->slv->io = priv->smbus->io + MLXBF_I2C_SLV_ADDR_OFFSET;


--LsKVTd9G7RT3E3Yo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzVK4ACgkQFA3kzBSg
KbbjRxAAgQ3lkJxXqlFha8yvCuRq2qKymMaMUBl3a0wAK+SGz8JErgmcb67jaBKP
wTnkii8oPmVAoHHiGd1hBVHc+Gcb9UsiSmmdSBtJ2q9rNPQmF7UcZgxj7K+8KrZr
Q+6oJ1vMX4URTwMJu8sQaDbFgwkZXPSYlFAs2YDZCoIs2MSgNu56HHW+rqmggTMS
NqUx9qISZ1bf7nX9swPQryHIPgP3oOLJ54Oj5v4IGpzCJ3TEAb3WyZdKu+yHAf6O
RTAQAQ6kQ7H8KPix7hYDeSwJ6g0vfqud4bh6gwuua27HfSQcFsP728cBiQBvmuyn
OApxQ76bf1XPdDNuRnDugs1SkUcOK5Rh5I4Mvt5E4OSZI91ksxDwxIbiCvdQGe3I
7BrW/A8QnUdwubBsBl8GC+JPrvt8K3pgx7n3XI/4/rVMh5axXkTS5Dj8WJkMBKXJ
vCkeH1sye8TxfHjYfT3fVNWzK0KYp4azJiN73WdEMpaSuMnPONOQyNlB7lEB/kF8
lwAalivBlshCWR3B8Ne+aGDk8R2LElCzcQAbmm025fBiv5MWe2EodizOgJO8EtW3
oM/chkUCnlbaemjEGzAZmcDlKAPNS4g/fcpD8oXXizDWgfZviMzi+g/jDTxOqLAQ
UYblrXi+p3XzbqbHfprfStP1z1oohasDRhvm1sUaXggvAoZCC8o=
=GUre
-----END PGP SIGNATURE-----

--LsKVTd9G7RT3E3Yo--
