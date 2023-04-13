Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3FF6E1299
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjDMQoT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjDMQoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:44:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355E99019;
        Thu, 13 Apr 2023 09:44:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA39F63FF8;
        Thu, 13 Apr 2023 16:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77BBC433D2;
        Thu, 13 Apr 2023 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681404257;
        bh=MEJrF4pyqtDAzKonc8kAzQeVxagPh+Fqh7RQBvWb4YQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UffXXbHRUvgS7TvoIA6M/muOyTbQUpPKO6fSESGydyNi9PikagA6CHIG/dPcp/yz2
         f2ecYbJk4z1qKGbgP2OrpHPEwiM6UwvX3U0M9QegjvU9j77VvB7fKx7qJH+tcuh18Z
         DurS01OxfjD/ytjWt7yRoYOYFYYs4Cs+akXei0Nf+T8Pm4p/chy1+SJ5AgEApmOT8G
         xRcMPiBCQr9/N1mCdxTlpA/T5z16HOvyCoEo1cirU2MIltKakBCk+wQvI2T0v58M4j
         ZaWeX/Uspl94hKEFYA4loAyNeyOC2y6GRp4iQVh60yPCgLnk5Hf29F4Hu5Cpmiswm5
         2/9tH/MWHprCg==
Date:   Thu, 13 Apr 2023 18:44:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: cadence: Add reset controller support
Message-ID: <ZDgxXDZGy/Waz4ad@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230406154834.171577-1-lars@metafoo.de>
 <20230406154834.171577-2-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUAUArd4fom54vN0"
Content-Disposition: inline
In-Reply-To: <20230406154834.171577-2-lars@metafoo.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fUAUArd4fom54vN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 08:48:34AM -0700, Lars-Peter Clausen wrote:
> The Cadence I2C controller has an external reset signal that needs to be
> de-asserted before the I2C controller can be used.
>=20
> Add support to the driver to be able to take the peripheral out of reset
> using the reset controller API. The reset is optional in the driver for
> compatibility to systems where the reset managed by the bootloader.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--fUAUArd4fom54vN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4MVwACgkQFA3kzBSg
Kbb6jw//U1R9s146HmDnj14qmP7Z5rhSD2euR+AvFdYI8zxIMS7ThZ4+nfvdpNYa
vrFNwLgJ5EWlfPI9f5zkcU2tIps1GFj0FoPnOcLA4eJQFwyarPPBipVq851taeWl
5K6fYUpYb1oIB1SZmewDudumWnTdNVDMo6QVpgBYZFvkfS8qApao5qeUX1HTEMl9
HgkTGp2WimJOzn2iCBOHjbxiQtF91aBm3H8s28OzDFj/ISDTKbjor+k9gmtxHTrN
UHXRVpyFR9otD/o5TxN/aZbU/+1OZYFQVSMP2bfi2tExrKjiG1S6ITmSaiYX7D6+
Pqb7tUdc3MUmRzaJzqB9tKlGLH4ZIDJYx+FNvWwIf3j/du2Yj0WcPqF+EyeBDCuW
FPFD9/cVBMlaJSsFtHPNv2oRTErOP1RCXdExVRaW7zkx/eu/1ud6GXi/WgJQfoaz
vQpK60Q5o9X/NAt+iQDokKsXo4ICQ6wtPhGMQ9b6sTgMdr3tp1bj+f7K67t3n9wg
EKlVj5CAXi9u7WU9Sapzv8mWd96i03xin/NnQD9ErUvCe2TKZTgXGHXq2Mf7oQBm
wBacPL51+sNI7F95wIwlErBiftq9locPdZTwLEnctZu5uLOeeA6OjaDZ4jzXrE78
7sYtC41abL5OV+GWNybeYVKTH0ntWCPSktaEgaRGSmGbipSVurs=
=qkyW
-----END PGP SIGNATURE-----

--fUAUArd4fom54vN0--
