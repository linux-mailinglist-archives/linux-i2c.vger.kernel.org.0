Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CCD5B0F9A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 23:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiIGV4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 17:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiIGV4k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 17:56:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BDF167EF
        for <linux-i2c@vger.kernel.org>; Wed,  7 Sep 2022 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=nbIPgz2/mbzDJkH4gApsZZdgWIL1
        qFJqywpG4Baw9E0=; b=ULvVoE/rxfExDIes7i4B+5SU5MBC8cTlMJhYktpwNft6
        qt9ItXKu6vjeWfOxOY2rz0E4alqr4necOzpsUp9EI2nRX6hl04ntr1T0K7oVHuch
        FqRzaZr7JvyplzkKmiJQj0qVbiiUxByse7zAuah3sV977T2g2U7ZaJ6EJHtlxIA=
Received: (qmail 3900094 invoked from network); 7 Sep 2022 23:56:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2022 23:56:37 +0200
X-UD-Smtp-Session: l3s3148p1@W6YKYx3os60ucrBp
Date:   Wed, 7 Sep 2022 23:56:36 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Message-ID: <YxkTlIJFczsEaL4w@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220822195725.12656-1-asmaa@nvidia.com>
 <Yw0fNuOWtJbe/OT1@shikoro>
 <CH2PR12MB38951B9B8F189E1B991A7950D7769@CH2PR12MB3895.namprd12.prod.outlook.com>
 <YxkPKpPNXg8wEIDf@shikoro>
 <CH2PR12MB38951D3E64BCF82A2A0F3FFBD7419@CH2PR12MB3895.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tl9O591Jt5BkV7w6"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB38951D3E64BCF82A2A0F3FFBD7419@CH2PR12MB3895.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tl9O591Jt5BkV7w6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I was going to send a v3 patch after I get some feedback on the other
> patches unless you'd prefer I send it now?=20

Your choice. You can wait for some more comments if you want. But
frankly, I don't really expect more comments.


--tl9O591Jt5BkV7w6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMZE5QACgkQFA3kzBSg
KbaZdw//VkXXGWtwaekWQebeEEenKeCD8uKXwbrb4PP9/dorRZ0uipc+Vbe+9euH
pOENKA5+9puynutplbGVABYAWkam3u76gzLxWzPlad3f7wofd9hZCq9TMFAWv38n
RK0qc4vlXv8uxYKo2WZbBmdaokveBZ0yvv1u0mHtnQ047OnZr8MQTKcVlpbBJTvT
VtaAfz8JY4sH1UuBY8VX1CE1uvlPmwEVe8RGwxPJru/6jeB9iCKy3U+y6nQiRW3Y
oF1BYCYPd5qAySNFbTESddFc90ZnwZS5vHL2c0N5hK6DZW1tmLvSicvqhxzGJd76
dFrZLnSMf/N7fjaiGrRw9fCccvU5qDxuJ+uNLGRoSbcnP0A3gj43JRDPplm/qucn
jRRfAidq2mB08X05dSdByPSRCB5p2arCiimC+vZ3pcGe3dYtUgZyotzYAJHJltnr
4lZUzwNNnVns1k75WKMEC+k+pFSepSLGqDuanX1RXedVnMxBbIjk9m4UusmWJ9dW
fc+f7t92cKOds8B8iUB2rbqPFGRcil10ccO8azfGmqo8GYnioOUyh8OP9nbvNqYz
r+U7z5vK3k2R0qxyGIKZGxFDnux4ttEzt9dUmrB6PMx8D5nhvEJKLHkuQgUcDIdY
LwLwex7+osztY1jSBeSReKosO8bu1aT9E4T0eVjyrQcMKuV6+A4=
=JxYk
-----END PGP SIGNATURE-----

--tl9O591Jt5BkV7w6--
