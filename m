Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA9E4B17F9
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 23:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344875AbiBJWNP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 17:13:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241989AbiBJWNO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 17:13:14 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4157D1139
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 14:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qzNXjMfCsETljVkvP2LDFM/YWid3
        44fLWjDK5p9Qm8I=; b=TW/EJL+rO0K2MKiN07lwO/KLsvnAwuTxBXxHbAn9inup
        2WXLvLr2P5E4B5lEe9b4rzACQO3PPmpdcRJs3V+jTne1dQFuWGbDpWeH2TJUcLoJ
        27ODDX+X7r7eXdCicT9HcmpdVyqs5ETu0adldq019T0USoD/9B5fsRk/Ss6OTo4=
Received: (qmail 1362118 invoked from network); 10 Feb 2022 23:13:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2022 23:13:13 +0100
X-UD-Smtp-Session: l3s3148p1@9y+WQbHX5rsgAQnoAGmtADvKpjkX1tF1
Date:   Thu, 10 Feb 2022 23:13:13 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779f0: Add I2C clocks
Message-ID: <YgWN+eNEqoZpy6Y/@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <e4dcee5f6f521dccd7ac7f2fb6c86cfe4a24d032.1643898820.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HCBf47RTDvI5rhSU"
Content-Disposition: inline
In-Reply-To: <e4dcee5f6f521dccd7ac7f2fb6c86cfe4a24d032.1643898820.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HCBf47RTDvI5rhSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 03:34:28PM +0100, Geert Uytterhoeven wrote:
> Add the module clocks used by the I2C Bus Interfaces on the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>=20
> Extracted from a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--HCBf47RTDvI5rhSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIFjfgACgkQFA3kzBSg
KbZYZA//VOKwFUTaxW2efmKOSTFkuphMMrQioXjS5z7meLiKVx0tRCRQZCVZr+Kb
nk6/22dLUWd0SyCDPnwgO3X0K23ncsNghjvxo/gP4EJMI2pb/JAkXlAiDFnQaHi7
dpcwFpYx1zRmmT4thKPnY88kSNCTsnZ1QJOKJrza25/u1EZhPczWM5ttB/c9c+Pp
za9MzdR6puBo0m/S/1tud9sAR0xD2murGhMkIuMUPB4c8Pe5+TmMT0tG+1q8Mj5C
0MuB0/api/oUCGZpOeuWXhtjndfUY2EsKGO8SECPW8EBfde4vea+6ugm5+oZN/5y
TVlsH6PdGsJU1YPlHj2sh5kfc/x2FXSoiyjSSD2Ok4QBexCde69rgjXJGiFllwj/
95yMAUFCgxDIHdKccyO4yRIBX1nZRbZerDbyeEujw0H3LQ2exha/g3vO5b6WMND7
wiptg1oZ+fTY/uWvygh3cU80XzTd7rOVtSK+B/zwIfOjzwRZV6CufkPb1cooXrj4
c1PNoeB5kDIDLxTgARdY6b2No/dBCtjYVtAz0JPi6oCIacFcneeOfrNi9JlbjRN9
GvNzvp0cyas4m8boSpLovxTPDDQoDWKkq31anJk3H4+Qc51iFCPUNploU3OHCv7U
9UBeABBzs0nNg/N/LnK4BQ69RIiucglzRq9WPsn7JQiwi9Fhj1I=
=KcFJ
-----END PGP SIGNATURE-----

--HCBf47RTDvI5rhSU--
