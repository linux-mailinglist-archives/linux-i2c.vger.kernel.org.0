Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61D85BB9E0
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiIQSZf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiIQSZe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:25:34 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F694275F8
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=n2bpolqB14Ot+jcxf50f8Pl2cGg1
        DdrE9u2NzEhv4oo=; b=iIPHXvrIhGjHZ7d4hemsLzvg8WKVxgCuMGz3N13JoyNW
        dVJVLVqNDA1QEp7PhZNXyzl2m6ACQi5jXNF6v8nyIu7Ny5j/XjwvWWFpposRiA8g
        +8mto9Pt8fc/pn8sjx0VbmM7qvC8GDrsU46q9ErfbWTkY3BeydBhgEfSfQHWbnU=
Received: (qmail 3859220 invoked from network); 17 Sep 2022 20:25:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2022 20:25:31 +0200
X-UD-Smtp-Session: l3s3148p1@d1R1muPorsm5aIoe
Date:   Sat, 17 Sep 2022 20:25:30 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 5/9] i2c-mlxbf.c: support lock mechanism
Message-ID: <YyYRGuXeXAT4FH0L@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-6-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BfdewmI/2eSZUoFp"
Content-Disposition: inline
In-Reply-To: <20220908173544.32615-6-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BfdewmI/2eSZUoFp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +	/* Try to acquire the smbus gw lock before any reads of the GW register=
 since
> +	 * a read sets the lock.
> +	 */

Please use kernel multiline comment style.

> @@ -792,6 +824,8 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_pr=
iv *priv,
>  			priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_FSM);
>  	}

Dunno if this is taste, but I think it is easier to follow the locking
when we have central acquire and release points for it. So, I'd suggest
to add something like

out_unlock:

here and then goto to this place from the other locations.

What do you think?

> =20
> +	mlxbf_i2c_smbus_master_unlock(priv);
> +
>  	return ret;

--BfdewmI/2eSZUoFp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmERkACgkQFA3kzBSg
KbYCAg/+P7vPLz2WlrGJtLuwpeEyQhciXzFNQBS1+gHkHVrvf7qFRtwFZPFA7wgB
rB8r4W/yduKFbk1cj7OyOsW89QDvGQr0jIwhnA2fkaOgJFiKV9bYEiMhyjRsANhp
FR2YbGKWEq9LIJT/LOb8gdx9wl2YYEAxbDJeHPZ6fDLHLF+myKO9Zt3IgUNxajNl
D814aHE+LRlrEN29yHK4OX6AXPBI5oZfxg5W7lsP8oOGBdUFJ9WcGQLilMerwglf
Y/vqL+NImUpVlsBUtyU02/Un8NOcGzafRmLmJydFCL6c83j9QHQDc7ZM6rMS0m7j
m6dJiMqGScRkFs8iC/azpcvq3NvEMY3LdFdP2g2ydQHRx6OsR46s/mU+ndY3f/zf
ffopUOlu878oFqd0652YRfiUDlEDXDw7HswhysezWHneiOb3uVvsqxnHsbFdxKij
9KcVWo0qS9fWDsGfBCeDmoqY+kGswOIOJg2pQZjYx3C1Nc5JcuOvVzp8YA1veC1L
5s15k47BH/O/5E6CcQ/S7HJ8PmzvIogSYNliRJuuWb6UXJoa1UG3jOo1vmwXzS4I
GrjXa6a8YtOnvbV14lDQSMJVx7HUCMS3KdATVXpLX7rnBDocYSocU/WoV3mye87E
4NcgkWg5RZ3ZmTSLW75wNwFT27kSrBAzmuFsZe7/XmFbh/gLM1g=
=CrSs
-----END PGP SIGNATURE-----

--BfdewmI/2eSZUoFp--
