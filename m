Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C864F7FFB
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 15:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbiDGNGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Apr 2022 09:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343583AbiDGNGj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 09:06:39 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE4225CB84
        for <linux-i2c@vger.kernel.org>; Thu,  7 Apr 2022 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=C/8/ksrMJeH5Wt54M5R3dsIUAkVb
        JzRxMLyWX11GEK0=; b=OG5N0PKKEIGZ3iiUEfS/JeCyrP0xlz+MSNCYUGRM1nCU
        sbDIRPU09RA4MJfqLTvstNlwGQypaaKnFfgMiWKnuK+Vh/eX6MM4Zwb4vUKU4K1N
        yNCpEuyx7ESfzrXgaIwmnlPKPsCjcJ+UxKhxLcHDLBdRwJ0KYgiCLYuRZK4uehY=
Received: (qmail 3186926 invoked from network); 7 Apr 2022 15:04:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2022 15:04:37 +0200
X-UD-Smtp-Session: l3s3148p1@9ky7HhDcANAgAQnoAEUrAF1rv4rSPqUC
Date:   Thu, 7 Apr 2022 15:04:36 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
Subject: Re: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Message-ID: <Yk7hZGvxucOpcXhw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
References: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
 <1649330034935.59928@mentor.com>
 <Yk7WfPUVa6l25RbM@shikoro>
 <1649335378392.75260@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2MSBGhHXUV3er9w+"
Content-Disposition: inline
In-Reply-To: <1649335378392.75260@mentor.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2MSBGhHXUV3er9w+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I withdraw my proposal then ;-) Sorry for the noise.

Not noise, this was a valid discussion :)


--2MSBGhHXUV3er9w+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJO4WAACgkQFA3kzBSg
KbYomg/+PFpslkgf5f29T9iHTIPY7GYHjFQr92oWEhBOa738XYAIb/s4hxRMykAN
LH9SOVFALetXf1hVaIZZ+8SmoZSs9Sb3QLj8L8zGaz4IaitORn9mfDvRnlJP93c9
2LdEVUh+6ZUpo+GUdY3yaIOvOoMfieZensT7Cugc5hLJJLeVKbzs4IOvtRtURXP1
80NNHmFIv2JTZjspwruSxVjOJ+RRLM44S8gwzhzHnI+qgqW+NfZ9VdvfU4K9ixoh
nbE5m/9Vu6BSNpt+a+393BAVs2uw6uqSInmAbWW9fa9gSDzOTdCU4amqzQQZ3fck
imvdBVuAoUHd4ClLPb/KNOENnL9reyTJxdPsHlwsLs+eSN15lUNQN0WupcfNfNQp
54/jj8QxVYTPDyNxRA+cdBVD6QoEZcP0GG7MrfOXC/2AQ1wbfmmYZUhIZbrNWi++
JZ8/Aw8frmeLR0cvrdZFfA3L6BveUK5sLyspUMVMtV2ZU4/lCZhyiGrjcwL/Ag9C
V623gOEX9fJTez45t4eTw7M3VVdZKocruc9o1oXNN+u5WCaXA753IGJvxR6Oz0bz
iDAQAdQVYpUJLTp+dMh7pQMU4W2u1S5lDUDsFESUI89l0ggZPA3hh7bpEyGhLYER
5Nxu8/0B1yQmtaLy3ENdbqwVnXyDhqqOIqpoUyvBH9w6XSkWv4k=
=ZbZV
-----END PGP SIGNATURE-----

--2MSBGhHXUV3er9w+--
