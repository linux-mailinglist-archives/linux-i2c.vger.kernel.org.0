Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB48C543D62
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 22:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbiFHUKl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 16:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234374AbiFHUKi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 16:10:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250F8CFE25;
        Wed,  8 Jun 2022 13:10:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DBE52B82AC3;
        Wed,  8 Jun 2022 20:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6CDC34116;
        Wed,  8 Jun 2022 20:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654719034;
        bh=+v8of3jnjnzn/h3EdB5DuPrm891S4ZFc92BTLhZg5Uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XzrvHbZXcBsUfSmbukPLZVcboumF7O1BRQcUcRNrRxYjblR41PkW2HI7krp3F3dCL
         N2yigY+0av3SJEbgzrZtIIoZjs0TFdKt/2cYl0Lal/KfuHfEVqld1bkhNrNwnnhHwT
         Xd7QguRA8B5z908kWOKl3AOZqrfgUHLZOmKwsAPYySsQUtIIkZBi3nBKDUePLhDWad
         nKz+rTi6ug2G8E8r//q5BKmN7zskWYKX+nZ20zedJB08nX+PmsiALEc44vixNdAYZR
         h9DFdFJrkEaCVGgMwg23BucB5nfDnj6u78SicDXQiVCBiithRHyz9S09PXFvKYED3J
         twH/ZciSdDfkA==
Date:   Wed, 8 Jun 2022 22:10:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] i2c: qcom-cci: simplify access to bus data structure
Message-ID: <YqECN6yz3aWhZ/xC@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220602165258.2247056-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="klSzXGj72fUoifiF"
Content-Disposition: inline
In-Reply-To: <20220602165258.2247056-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--klSzXGj72fUoifiF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 07:52:58PM +0300, Vladimir Zapolskiy wrote:
> Trivial non-functional change, which adds an alias to an extensively
> used data location.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Applied to for-next, thanks!


--klSzXGj72fUoifiF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAjYACgkQFA3kzBSg
KbZOsxAAlAAx0jKzW5KjP3Y49MujRkuXNzwRfn1bccx26SFqENJjmndNwU+bBO1N
xuoc6RokENklz8CglMFBTk5Cgm7J0MLpZqG3t7SdpiUjI6CmdzmE+bdNOy7w56Sh
YaWZbRrCie4pzgP68dnlkxv7HCojzXy6s8bk4OS3RBPwuk0acSqiRaGXIbOuC3gu
KZAXmanbqSbroEqpPs2RgQ92yLn3GjPxr9IFNyRJY7AO9orU5Bg4Q9i/b5DgFHGF
n6AEMepORkKTtbPnrIyz961G8CCFkRRe7/For74k/LgO1YBfnaLZ5EBpXYTsbvWG
3DhIy4b/v5fHP+TMo94CXBH/TTmoXME+FFS1WQNpjPLsEhlIop+f7+bQSHcvKFEI
Vv0s2EEA80td3StLcxS9GPHc/nERCivyZtfGpk5RRcyM0cp8gWN6j/ue9zsA/NzF
fJsnAqow14gXSZCALwuXKW+DyuhOT+jPAlJpriAAMDNAl1ElfFzQcbAX+xiKttuZ
OekW86SH/AhSi35PepYIOpdyQgebtzTNlPPniWwyPZEOc+oX23wFrqbpr1R7yHhX
X79H0IbSvOQacFteGufRJHLWsbZhDrEegkvb5uKcoiPAp/AlB5gSJAJwbnn2EVKJ
gzZakU3ucHlGw8jTPnh8W3ux1AALaIXjSy9yt5ZwMZHjvpaRsa8=
=QD3o
-----END PGP SIGNATURE-----

--klSzXGj72fUoifiF--
