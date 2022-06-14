Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3CDB54BAA5
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 21:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbiFNTiO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 15:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbiFNTiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 15:38:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CBF24BD0
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 12:38:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD1FE60DE4
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 19:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94487C3411B;
        Tue, 14 Jun 2022 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655235489;
        bh=f/aXpnE03p1UC7Jn6KS/o5cf/o6NFhYcIXE6zMoacqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O7sSD+EGjv4xaPzvbSr9Ezit2B+fkQ5/IxTSENegZ95hOXoJnWPMZw8gIXhBCon9R
         a5Sjt+kbJBOsCSS9HktG90T4hKBKMzEtwOLIq60ImymimbHawkcUJh9HDJ7CTAG421
         8O4FxvuLtDUDPAFtmRNYVLe816llxAkkr277qf2DSFXXoyDHCiTofDqq659BeEa9CJ
         4AKwn+U70CNXt++rX28m5qO4lMhaYpJaO1KGicSj3s8+nIKXJAsymE8KcDJO1npCpg
         7HQnMKvSBDlwGCX8fpCPFdN9J9a8eAiiRcUOMYTZE547DksTbC4RB5PSc+jvODSH/H
         E7R5UWOsUORFQ==
Date:   Tue, 14 Jun 2022 21:38:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
Subject: Re: [PATCH v3] i2c-xiic: Fix the type check for xiic_wakeup
Message-ID: <YqjjndOOfD02X4Xl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
References: <20220614061855.24210-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zunbC8hr6yFfF6Kt"
Content-Disposition: inline
In-Reply-To: <20220614061855.24210-1-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zunbC8hr6yFfF6Kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 11:48:55AM +0530, Shubhrajyoti Datta wrote:
> Fix the coverity warning
> mixed_enum_type: enumerated type mixed with another type
>=20
> We are passing an enum in the xiic_wakeup lets change
> the function parameters to reflect that.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--zunbC8hr6yFfF6Kt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo45wACgkQFA3kzBSg
KbYb/g//agHDK4SKxeiHPzmIVSyWFFzNsKqKtM4ybIEl4nItcLSLwutRAKTlQHij
fEKPceUTiEykRDX+P1/BVFQdb5eGHDu6XYFa6W4ZHbKF87Nwq8CSi8cjICVd7qD+
20GkGIU7u3Q6yaITqDRSQfzhQo/Mk//hOA8blY6a5bmHBc89+z+qYAlyxuL9rY8I
7KZN4u9jPyKDVLYYFEhnXfn0iBK33nXShiVapraLnrVMfwLD4H+b9E2GaELuBI6S
kMT9dSe5wjQ1+owEMG5UboL7Gw9Rl9tYoEmgptgrpXc7ohDFKMvs94Gj/9ewjrPk
Qdqt7OB4daj+SWXvy4lJGLOi3zkCBlOLLU/ObrCwpEmcO+nDieKfPO8fixjKn2MP
8i3UaQ9jwuyPIk47IblenYgUFtKlUYO+Tv/EtC6/9DO8WK9Sygkwtbic2QrBNIoh
kdcKxfRpyRY0C2y9eIbZ54/ztP8a9k9ZwbRSF39Qc4wJmWFbusA6qBtsZjFc3CXb
6enn0vtG/98KcEcYfkbOP1ol98cZD/klTmUWYKoI7ptIxorAofORB3PybOumMI5m
DsRqcOeECDaZpTrY+8Q/sXtci4Iq6GSazr5OV5c06xCPiwWY+Z4uUKmSDhOBvO7p
JUZLhakjRT3Pj5PDGKpDC6y1Ok2VJ8Bct/htxDhMegEQWdp3H1Q=
=eBa3
-----END PGP SIGNATURE-----

--zunbC8hr6yFfF6Kt--
