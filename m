Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD7269B4FB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjBQVoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBQVoo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:44:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697BA6243C;
        Fri, 17 Feb 2023 13:44:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07B1561FCF;
        Fri, 17 Feb 2023 21:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63DCC433D2;
        Fri, 17 Feb 2023 21:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670272;
        bh=/AvfVU+78rZe2p4leCZ4Ea/FcQW6kOmR2J+YAkdmZTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KAz4rKgLvdnnGBbeFxYldTzlFS/wFDXb4nYOnjviV8Zgs4vtdUeeBoGWOtXpRWgEx
         cuLHozWE+DZfjXK0JsFVoUwGXaeBt4Ac2EY7z/BhQswE3MciLSLBWNi1jpk90vS25e
         D3AjH59KSNNAgeUFdd2ddg42IaR4g8eLmt+T0JalOM/Kf909w3avjpgWkNP6gGYrPK
         2H5wFlkT0n6taxDQwFuxEcz727oOak8nSvTcl+4mCc+U4djDzJ49ABDJcvsOLaTu21
         ABsN5XliV9X7CMbb4gPk+iVY6IvI/4dTqVEOgMG67woR8nX5F7liyjD+tdB6Gwzg4a
         rLqASo5WmjoHA==
Date:   Fri, 17 Feb 2023 22:44:28 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V6 1/3] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
 compatible
Message-ID: <Y+/1PIJPbos3szZP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
 <1676467944-17426-2-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GiDZk7VKlAg5kl3B"
Content-Disposition: inline
In-Reply-To: <1676467944-17426-2-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GiDZk7VKlAg5kl3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 07:02:22PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> Add xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible.
> Add clock-frequency as optional property.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--GiDZk7VKlAg5kl3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9TYACgkQFA3kzBSg
KbbMFg/+Jnol7d/g6vgkB2AsIFJ/fVZ2lyCNA60ZqNQK4EDrT4cJldATZKwCYnF5
gyREEBgQHemfxqAC1kuyC+HRLR9r36ltMi+iRloywvgglUwWVYZQt9B/QzeGUHYf
V7KpBL+L3T5cPOWo2TNfsTGAJsq1uEB1wyXCor6xYegLKXph7EXLAsn2Ilf8b5yi
lzX2YMSVJ39KTVzClRkBwv9Nmp5/fHY8jqIS2NiOy6sC9ZE36npHlErHq3msfTRW
bxOwr80Vpq1OqMmjwyoWgzVwTDvW7ywwqoc5w9cLhEp5Cj8er7U3crKAe3Wzgh3e
9BWNCO2dO1YHx9reBe7AIWWWDdh3GATLsn3SM+fJLNKnu8iTppDn2xOztepSbZIu
vnKR9vo2OtoRY7ypfjvxunX7hzSfAx3S8cLFP4lckj2uY1dN/SWbNLjpgP047TsO
NJKqiGrOqngRqe6z9WZ6rgC78aQRTc5W6PlhA71pHvjJ4ri6Ql/+GWNn7S016BRs
h4QFUYijjgSzXnXjY8ObMWqA7xdPmbIoMNg32g5zBA6foGYCsufbu96tFpz9gGJ0
kCw/Lcxxo4CKqiRUV8rka5zG+MlePpbjr4MFQBUXANw1vo5Da1FAzQ5Z0qwNDDse
jN7chnql31kOA0yv1J37sb+IEpNcsAOH3NwAnr7LPimTNI8gwoQ=
=QAmP
-----END PGP SIGNATURE-----

--GiDZk7VKlAg5kl3B--
