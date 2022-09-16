Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960005BB30C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiIPT4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiIPT4E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:56:04 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5091B7B2BE
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xKW9HCH0RRzuIKcIL0dkQ2rVH+p7
        c90a51JoGrwa+dA=; b=OdiQxvESefjQ9i5N8+V2eeYjYJv4Qps8LxuB/y8zAEBl
        MC4yg8h/ZkjUFZ3BWiDA9W3+5NSW0dHqcgazmSyvgOPbIf0hpBOSzBCfmBlwymht
        tLmLJtG2YgIUAvw46ZNHd2pdPRWYDq+kyeiNDXp7TTtlDioSQv2EwocHyaA6RkU=
Received: (qmail 3519391 invoked from network); 16 Sep 2022 21:56:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2022 21:56:01 +0200
X-UD-Smtp-Session: l3s3148p1@MxRTwNDorutSjfsd
Date:   Fri, 16 Sep 2022 20:56:01 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779g0 support
Message-ID: <YyTU0YLL2v5JD4v9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <a6a704ff5fb06218daed492010e320605a4efe2f.1662714509.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GEppY4HOh5vKE/AD"
Content-Disposition: inline
In-Reply-To: <a6a704ff5fb06218daed492010e320605a4efe2f.1662714509.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GEppY4HOh5vKE/AD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 11:09:02AM +0200, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car V4H
> (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--GEppY4HOh5vKE/AD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk1NEACgkQFA3kzBSg
KbZ+wg//ckrlMwqCpG5HfBbb1Alplp1o+OCXDPdo3//l6JSxge4A7XakhCQziiuH
7tdlBXiC0l95w54SznwzpbYJuWsCxerKTR3tS5F+JIDUIBDA/veEwT371d2MgV8q
ww2kzLMIdFwMmyrWMUGW41Ic3lKDOM6hMurIGe0HkoLkgs/1JS05ltjT4wDuXbFe
fFiw1lxUabjRSzoXKjr8S8oWrN9AwBnmJI4gbwZVUgO7K7/biLr1fFjZtTr6CMmE
GDwNVxWvsu/VY1N867ANEt/uVLVJ2tchofWwsaONhbSlPbr6gxosiqA8Bf6UfmD4
Dc8T+Tcgiw5pnGeqLitmXQ4Z3L8BJg7YnlTkbLmV4KoCFo3JiPvb0Vjk+eUbsyEO
O/uYVN2WJOCM9wXDwyfv2L7b1DnRTfFAWhMGyZXIhDFLPdB0GsdP10/kj0XGU6hW
F+L2/cteBnncF9UNbDHtNVACFiW2Ild1UgdrMqj+ZrCxU5YyWsSGEej3Y4JF2u+j
ux1r7nyPjXFSCyC+LXVQIwkESayxcAJyNpCDWln19PINiztX9T+WEW3XEUyMFWVA
kD45PjJ1/bbyp/WLc6k4gDHgWXHDLSZfCmgJGj2oRE04OxCShRhpuWUXz3m9TXZ4
QDX9JCm4K03X0Ez0OUkDi+00v/eJNjuac7PmQ377qBoxjmiGG60=
=M/hm
-----END PGP SIGNATURE-----

--GEppY4HOh5vKE/AD--
