Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5D25A5570
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 22:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiH2UTI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 16:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiH2UTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 16:19:07 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183249A9A5
        for <linux-i2c@vger.kernel.org>; Mon, 29 Aug 2022 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fzuTow6i2u3EjlizZYTU2j4Dxo4Y
        WeobcJx3wYrulD0=; b=EoYYYQxYKbfdkS8YgRyezaYIww0TNpBurO+M92m+HL2W
        RlxZKm/v5Y9k0EYKT/LRcTdquXlockHinq2mwAqWGScvbAeLgCNCjviNjskLwDHl
        HSfBa3pgH3R7vx7eOaqPBgbUUbWhbx95Gr2oocbY1GZgox+Q1aMuoxQZz2S+lkY=
Received: (qmail 257057 invoked from network); 29 Aug 2022 22:19:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2022 22:19:02 +0200
X-UD-Smtp-Session: l3s3148p1@DJ6A+WbnUZkucrIF
Date:   Mon, 29 Aug 2022 22:19:02 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     robh@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Message-ID: <Yw0fNuOWtJbe/OT1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220822195725.12656-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7Ba7C5FXgFqMN/r8"
Content-Disposition: inline
In-Reply-To: <20220822195725.12656-1-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7Ba7C5FXgFqMN/r8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 22, 2022 at 03:57:16PM -0400, Asmaa Mnebhi wrote:
> This is a series of patches fixing several bugs and implementing
> new features.

What did change since v1 and where did Khalil's Rev-by tags go?

> Bug fixes:
> 1) Fix the frequency calculation
> 2) remove unnecessary IRQF_ONESHOT flag

Is this really a bugfix?

> 3) Fix incorrect base address passed during io write
> 4) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
> 5) Support lock mechanism

Here, I am also not sure if this is a bugfix.

Thanks for the update,

   Wolfram


--7Ba7C5FXgFqMN/r8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMNHzUACgkQFA3kzBSg
KbaOng/+ImN7GRwp7C2SQyYFsjDX0RUTohS2gENjCPiLlss5aDAbyrEazQxNSEQN
lecyEn7Nj6szbnfUAc/VspcUXLmOEEywGLBoMPkmnKrSefeUnE33ONO71+gTkrOx
Liq+ceKWHn6d/W6qZPKj2JGdETMo1UWtnhuD31Jw1sCNfogiLuX36w6Qgij9vFKN
30zjs9KZkd5ViZbyfs5S3yc0OxI7YMvuWWa8JCbiqgWUutsfRbYl1JjoqFuBY/RF
822lxwLCPt2R7JEMwjtPJ3nh6mmX6yihxXLXIkSAEsCTI884BsKsMqg5qWGEBhuV
HMTwC1y9+DcjDoPs4BoYbb0ZkzfiWNNV61DPFFWpXnp1zSQbwBQMvdSl9Wl+nNQm
SHhHgN0nshIvubZC6cFydocBUPNpH5NxsgxOvdRFvI47K5SzJqMXpsoPhgJX0fvD
LoarAytnyVPDUGEBqnJH2YTrUZFYBdBrXH5oPBrvyo0rhpeEJWAdkI8iMQQoOTFV
ZTnqIOzjd5zSqrZL1TAquM+3n3tkUmiycqkZaPdt2RANECgjKmSZS7kWERckqORO
flUXYEczRdt5W3CMuH8L1txVVEfOnRWq1oM0sPdUAXf4OlaX0tqxccMy+/aiN/cJ
4HttwLKPirVi7Vi0Hjg2aWvyK1KMIunFsTL6ACLHNmAUUQE07XU=
=JJtI
-----END PGP SIGNATURE-----

--7Ba7C5FXgFqMN/r8--
