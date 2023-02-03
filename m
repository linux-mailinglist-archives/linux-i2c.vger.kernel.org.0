Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA05689F67
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 17:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbjBCQgG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 11:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233184AbjBCQf5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 11:35:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02F1A8439;
        Fri,  3 Feb 2023 08:35:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F1B7B61F7D;
        Fri,  3 Feb 2023 16:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FC7C433D2;
        Fri,  3 Feb 2023 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442150;
        bh=1SaYB0bF1JaTvvvfx4hwIoT1gSdhOhVOUjcAnW9ZiEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GXHv4SapiOroCtFw7BOFlKzKjMwK2S2SWMpKsmLbWa5FWoTHyiBDsSCzhJecto1IC
         SHnPt+Ept602QXjWLtOmUcZvh/duCsDX4xwYLKu41/560AXd1Iy6QSXd3/BGF7TOwJ
         wK1Gsqogm9WHbF3FuBHRpbvDv2DKGctlx7Uj/QsjR5PDrlH07EsYySsjNTOQyDYvxW
         Wbr+1HVoiM0eMbVetm+0dyu6wL4ziP2d3mZypkqRWib0dlct5FFv/hRQ1rbHxbbP4M
         6hXILGpYEoHW3qBSgLAD7jh6Y0uJ0qTuHlJtjLEw6gzBMN0ZRurt94gv8328XEPC5A
         TtuJ50m8aJELg==
Date:   Fri, 3 Feb 2023 17:35:47 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V4 4/9] i2c: xiic: Add wait for FIFO empty in send_tx
Message-ID: <Y9034/vvjBehZXF5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
 <1675330898-563-5-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pAsRdv62yj1l9JQI"
Content-Disposition: inline
In-Reply-To: <1675330898-563-5-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pAsRdv62yj1l9JQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:11:33PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> If the tx_half_empty interrupt comes first instead of tx_empty,
> STOP bit is generated even before all the bytes are transmitted
> out on the bus.
> STOP bit should be sent only after all the bytes in the FIFO are
> transmitted out of the FIFO. So wait until FIFO is empty before sending
> the STOP bit.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--pAsRdv62yj1l9JQI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPdN+MACgkQFA3kzBSg
KbYFRxAArxOL34lU5Ic30/HXV4AsFAxSpnwqr3FlKjW6eQpkVo+kYhMpalfQ94w1
YZvBk5JQUSTaFRjza1sE8lQVnFiTQEhuH4pW4PgdOZ48TXE9DQy4PoTtzMmISMf9
URwkYwk9Ls2tJCyM9kjKQdA+uNDMq07MYuPpFUpY7/fE1t8D9uA4jNdXGndaje3Y
CLdxOkPHHdu28PsjAEr3EdDho2CB0LUD1rqc4Hfn5aulkzxcMdddqaHNaVzeP3Kb
PkyrrZn/gMSuZZzTr4rATUz9bRBgTuRC5+tEc5VARR0ftZuw2WbmSGZ2xdmNxvI8
6v9Gr9ta3MgCbh/NuxMVCCyTPqycwjiVTGNhOcXt+2gttdp7i/5DUn98cnHsLd5H
dqKqY8tPUNE23hKGGfsMgVE+CNQVv/kEF2e5LGXg9ilIUONZ+dPZsRiHYCdJZ9VJ
4uMCUZ3o8YpEimZxjSCksVjpSBcgMqrVclbEjaAletPDs0sc1qkoZH9Bv+ABt7hx
VIEthHXYhY8P7IgAZ97mpRx5KOI27VRed7wAeitU/3enJ9g+YxCCEn7Ui1y7EYP+
nunMAjXol07vqkX2sej1DeXkDnYg8O0eFE1MZX8d6p/+5ybkr9XQN1OnE6SnBVrE
MoT6Cu49rJiIWp/qy254mYOD7YScGLNEMYTqIx/7mUAaJIHePQ0=
=ejvd
-----END PGP SIGNATURE-----

--pAsRdv62yj1l9JQI--
