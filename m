Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9547E77BA07
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjHNN3n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjHNN3h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:29:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABEF10D5;
        Mon, 14 Aug 2023 06:29:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD86A63D44;
        Mon, 14 Aug 2023 13:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34B2C433C8;
        Mon, 14 Aug 2023 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692019775;
        bh=vL0Rp5Rao9UZ/BTg2YYC/mT9fxEqJ1wE21HPrTYhQ4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qWtIvnuATKTld70yR47P3L8R/BFnk3ykveU+GR0wQeD/5/Lg9qkooJ3jxArnG0jRh
         N10Il8qvl2xVztlh+xNYr4QP6M9fzR9mhdsT8FlTsarhFyJeRIG2kBsMm4rDG+bn/X
         wmvLfnU2KNURxYeRHf0odxBNtEWESisxhv7n+tt8Wwa5N/ow0eidfg+fO2Vp8VTliM
         R70LVmBumP9gg+ifFLSG1XzpFCFmcQhGV5HVqnGOErm5dFPaYTsB6Q8MQM6ZACPISx
         HxfiTxP7RjREY9keqoBDVGbNBnKi9TtM+h9gqvJOJWCViUIVi2hnp6FaJnqO7rlkfh
         PYxUwcdx/pouw==
Date:   Mon, 14 Aug 2023 15:29:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com,
        Quan Nguyen <quan@os.amperecomputing.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: designware: Correct length byte validation
 logic
Message-ID: <ZNosPK3M4/bZ0vc9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com,
        Quan Nguyen <quan@os.amperecomputing.com>, stable@vger.kernel.org
References: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
 <20230726080001.337353-2-tamnguyenchi@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Va0SrhCIqzaABToJ"
Content-Disposition: inline
In-Reply-To: <20230726080001.337353-2-tamnguyenchi@os.amperecomputing.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Va0SrhCIqzaABToJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 03:00:00PM +0700, Tam Nguyen wrote:
> From: Quan Nguyen <quan@os.amperecomputing.com>
>=20
> Commit 0daede80f870 ("i2c: designware: Convert driver to using regmap API=
")
> changes the logic to validate the whole 32-bit return value of
> DW_IC_DATA_CMD register instead of 8-bit LSB without reason.
>=20
> Later, commit f53f15ba5a85 ("i2c: designware: Get right data length"),
> introduced partial fix but not enough because the "tmp > 0" still test
> tmp as 32-bit value and is wrong in case the IC_DATA_CMD[11] is set.
>=20
> Revert the logic to just before commit 0daede80f870
> ("i2c: designware: Convert driver to using regmap API").
>=20
> Fixes: f53f15ba5a85 ("i2c: designware: Get right data length")
> Fixes: 0daede80f870 ("i2c: designware: Convert driver to using regmap API=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Applied to for-current, thanks!


--Va0SrhCIqzaABToJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaLDwACgkQFA3kzBSg
Kbbh6g//azQ4qtqndnhpbxP1Ujc5PyG55chGeQ7kmcTlXpJaZEJq/rTc7y/HbNGG
6/kIeriOMA2BU4xJKk6ipIK8OiM5Kk8WD6ow7LhICxzi4xg2CAy+ILTiaWnflUtn
XGW6GNFx02+iiHwv3Dfek5CJ9NF/Kk4CSw3EV9umFT1GPzbCtGLSfX69BW7Abbod
o3vLeUu5y7P56RYotEjUJPIrM961G/pnPh0p29EkJkFmg/6rdy1bS6FSilT8KgyN
uLlxqJiSBu1yRJTmPE2wPKlppfNmtCg1VojbDsZaJN9PUxqF/m4+uh6//1spj1O0
2lh5t/YkbdBAT7u7JH2OuaveQIssgaPFRkt9I9ugda1kAvCeEjBAYVL5wyvIm0mi
kvHk+2x1HizQfOCRxIWAlEvz3IT1PSjQQ2Daqg1FFSD96jay/6gcFXnkQBXSbVWW
oiumMrTwHm8yT1uzfN2Srd9j1/OOAnckxC4VPjoMcEv1sPBb9sohssNdMF1Bgzoi
h2L0thsS4lHgP3KzCAczSpmOT4kbW71h4WMQli2wCnU1fTGyhHX/2GjblEefqyrE
8o7hTZedd00qhzeKCGZKE+2UuQL6uqKqGaqcv2HviOIu8g3MYThkam3Kr/WQsSov
//P69PLYuat/fBbVrM5r7AdreNgcLcYuc73L2NlPqnJmneNWQew=
=cdP5
-----END PGP SIGNATURE-----

--Va0SrhCIqzaABToJ--
