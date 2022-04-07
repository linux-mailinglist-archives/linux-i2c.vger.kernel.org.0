Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 787034F7ED9
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 14:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235351AbiDGMUQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Apr 2022 08:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbiDGMUN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 08:20:13 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351CA35A90
        for <linux-i2c@vger.kernel.org>; Thu,  7 Apr 2022 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9ddJ7iQn18igVpmAx/lejB/cCguF
        kW+7+aVI29w6xTY=; b=p8nvMosxDUUp4IZOA21P3tLS5PA5xyswnYnXndtzJMqE
        Le8T8IkDbish+Nt+TzgORpsi7s7IHvR1WAx8ryOrFzrFRhNKmhxFK5geV46p0IXK
        OV390h2TyGj72emaq4Dfpj97TWBaQlRKXpf2g1f/WJRogz3H5W8f9im7vWHLNmI=
Received: (qmail 3169665 invoked from network); 7 Apr 2022 14:18:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2022 14:18:08 +0200
X-UD-Smtp-Session: l3s3148p1@9GJNeA/c/s8gAQnoAEUrAF1rv4rSPqUC
Date:   Thu, 7 Apr 2022 14:18:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
Subject: Re: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Message-ID: <Yk7WfPUVa6l25RbM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
References: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
 <1649330034935.59928@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="an2J3NV83W8m3l8v"
Content-Disposition: inline
In-Reply-To: <1649330034935.59928@mentor.com>
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


--an2J3NV83W8m3l8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Besides avoiding of double assignment of that "length" byte to the buffer,
> this move will avoid pollution of the buffer in case of an error (invalid length).

This was intendend as a feature not a bug ;) This was the reason I put
the data to the buffer at the beginning, so people could see the wrong
data length. But yes, it can be argued if it should be logged somewhere
instead of being in the buffer. I'll check what other drivers do.

Sidenote: It is planned to add SMBus3 features somewhen. Then, there
won't be an invalid length anymore because it allows 255 byte transfers.


--an2J3NV83W8m3l8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJO1ngACgkQFA3kzBSg
KbYHLw//ZDLju3yPcDc25c0v8U3JbDFDTNqSTZMrL/08EeRrSVMYiWISRiKjhqkB
E8BCxKGM7tpw7vNl0bcTYn9bC77bE9kmzDjU+xNF4tvu+5mkNBKx9FU03oOCrOog
47i3awt9kZeMRt39Mk+6/mMyLLLSVgoWmkvnfN9tT46Lta+dJ4xVhPyjEuNGqI/i
GAHJszCELqv1KFbHlm1rEkjJR88vYAHFOpizjPmA0RuokLZGKvvV3zHaEdCWFOPr
gMXas9muRDMUtqLD20io7IWSo5XB8qmEKUJrXko1Ozx54CU14QXwCyZUm94b+Yiu
VzUa97qS1ocG0izNdV18WEixjUza/viCY7ZK5rdatG6KeCnBPGXpIu+xJN59KLp4
CXo9Ue3GzG/oaqbxxJzwhKvneGLzrJs6ZP6+qRU/QNEMzlAvMSDnI4TGvoY8V36J
+m8uMp0vI5LBRZgDgEsYSbOGGYRqeHSvQUSJPs+qzujteiI2UcheMTdIrJI3h1dI
70MbG0+nyIZHDug0G5P7LrFHVd/ZKakN2FEEp3TkUP4TjL3LObWADi5FhJS6A3Pf
qyDKwJCUIO2spZ/uBXamho27/BT/IT4+KctKVO+0en7UP/cc9mIzeG2eQseCDKDw
Fwqo1T1TAUKhpzSNn/OG9lYY3a96PdAoIAqGfJOspn+NHXkD2/E=
=RwaA
-----END PGP SIGNATURE-----

--an2J3NV83W8m3l8v--
