Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041F24B66D0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbiBOJB1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:01:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235506AbiBOJB0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:01:26 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E358115948
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 01:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=y7Ojvod9+ZpN827MzLnUKiSkc9CW
        wjhDbQFUG6dvktQ=; b=gXMgV5XDsyJL9zRSNeM5aP1wv1TSc/ONmvq8N46jMsKC
        TcygaTHUr9ADML0lfdQzasKtdZqpg9wjXIw4DAVzXagsPndplCHNxnw7MDdvd3xp
        cUp1ov6E7LtFHPqhS8j57eQQZWJ9AxhwemEbWT5UB6hQogsqBbY0MkzDQWcIOto=
Received: (qmail 3495615 invoked from network); 15 Feb 2022 10:01:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2022 10:01:13 +0100
X-UD-Smtp-Session: l3s3148p1@pRRnxgrYTsEgAQnoAEgfAAKtE+bAt3OE
Date:   Tue, 15 Feb 2022 10:01:13 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: don't expose function which is only used
 internally
Message-ID: <Ygtr2dHh93+rTbnu@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20220210213341.2121-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N+V3hSAFVQK6Gk6a"
Content-Disposition: inline
In-Reply-To: <20220210213341.2121-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N+V3hSAFVQK6Gk6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 10:33:41PM +0100, Wolfram Sang wrote:
> i2c_setup_smbus_alert() is only needed within the I2C core, so no need
> to expose it to other modules.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--N+V3hSAFVQK6Gk6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILa9kACgkQFA3kzBSg
KbZRig//SYzvRA2Mz5bCZoYnhySXwRnrBo47NJW2nH+MaRX0d7Br/KgDBz2OYrh1
y33Blyu6PbC2eWTxaS53nGLaZcV1U11lY9MgQW0iu7rf/29/9u73SH1HRLM8eaTz
PUB32dOCp8kxxlPElukwyFGFFjeUgOGzHaxHCqxKd6ows5SrQ0avPVdEDw3hqYB7
w5ha1p85JqYXIkYaVrqGo5uYSlXHBNFyamGKf3faDaGI1uO45dPxrJmizHmOunVO
dsZtplSHp6I3lluCTMphtkT1re0g/JJlYnxnoeUkZmIJGJFITg2A5oWtW8FDAtjY
2GzKlBz1Ra9BQeN1zPC+/Tsr/2IBjuDDCZEw/iOuV6kUh1/0xJXYcXk8XHmkXzPi
MB+ul4i7XvUTgvnbXNY48t96+OYqb7msBdhxxL69U5uEzu4pP/e43Q/zAI37XRAU
AlToq+iUSBl3CH93Ff3N5NdHV2IA8htycF7M9ieE+Gt/Wpy0A8eOs05W34eS0eYA
ZVzLVykdA/w+iafeSMGZ0E2sL6CS8lXzEnL8cj8MK/qDRVrdMl+LE/ZuzLv4EHA5
BZyudr1t4Alyb4GnQ4DRVpWaPzGEGWoVn+42mXByth4QluEfUvgaHd11fN7G8ZrR
XCuSUUwjqczPbReHcEZrNcyXp6zDwidRZXhQql0ixijEVvTxYvM=
=xuVw
-----END PGP SIGNATURE-----

--N+V3hSAFVQK6Gk6a--
