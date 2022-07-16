Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBDE576DEA
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 14:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiGPMaU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 08:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGPMaT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 08:30:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA511EC48;
        Sat, 16 Jul 2022 05:30:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E50CD60FEF;
        Sat, 16 Jul 2022 12:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93421C34114;
        Sat, 16 Jul 2022 12:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657974618;
        bh=LnUHuOaNQ5KqAKAllWWoZ6SXQjJBD+lBOGMjjEHXNxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lKdioBztS5V9tonS5DE9kY5op86kZ38N82srNWZdQ24Ko80HEBsscngI6cqvOKxEy
         vUdR8Z1Ph1+Zi+7z/W5h9j5j48/Mc0yKJ7aXjwMY90utvHupCn2Bl6Fh7nt3rv5/mz
         LEybawNgDPylQ3DJNcAtZZmadoW0tSf3YGWtAa7r9aPgrBKC2/GBuvN/glpwn6zhBT
         5J+4powA0N5jlXXuF9kDEZHigLt2+lcl4UmNYAkPkRQ0bf54zmhdOrMEES591Ss6Aw
         rsRShZKeFS3fxp3up9PZxlcej2PWwF+XkOKxRulQ6mEj8tDL5eKXwBMUdBdf3NYVlR
         kitBL7HjO/qkA==
Date:   Sat, 16 Jul 2022 14:30:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <YtKvVc6lxmo1yk6O@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220708120958.74034-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sblb2DLXLMvW8rmG"
Content-Disposition: inline
In-Reply-To: <20220708120958.74034-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Sblb2DLXLMvW8rmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 03:09:58PM +0300, Andy Shevchenko wrote:
> Replace open coded device_get_match_data() in acpi_smbus_cmi_add().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--Sblb2DLXLMvW8rmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSr1UACgkQFA3kzBSg
Kbb4WA//XKtPMKHNyUVQAG6T/Bb2TeL1TU0f4R6inGJgy1q4ycJrQqWny2TLvSUJ
cY/0Mbp3NCJPY9xU1Sa+ef6jXNSnEm4SZXeorrQFJ6PLRpaOQtK7jQBqaL55W6x2
u9kGeEv43f0Ugx2zu79uYGM6ZZj0OZzuXsv+VesBAlhtymC/e03A8NN0/POXB16B
ES/tLnvh09EcC4WlB0lampBtwuk4JbMraOTFznetWlfDh2/unTnfHzL4J6sMkdeB
zfjnhBbKBJfqset1MNLp0tZPSVD8udE+0Pcoek+o0J+4d91+AYGzoaOZtn1CeQuI
bkc2+jDxga+xaUGqmRjG3tw4KFBGQ3uwwSrrbWKs89Tu64hKa+7j3zOU3f6NJphd
0v/Jskpsw8751043lx0cEVtsnZU2ZVCIO54zMdI3y7AyA8LAChwH2oGbFsGVE33E
9w+Z+gA2Ib9hJngY99/pAUiXoYfquSiwRdDRfAaXhiZWHSfzixIeUmKsD+bfcddt
j8DcH9z92UAds1x+aJlN6W97EFwfDiD3JLvyYLlvtzd+ii+FiFEOY1HATvV+BnKI
vNLQZBvQ9uySBXcNK5gzPj47Io3Wf4CnRrnZJLGA4Ili3rQkkaTP94WqCR61BgGX
RHlPH4A66CWOt/dUqrFf3xsP4+VGbRTt0nOnbv6GFsddpZ7wFxA=
=si1x
-----END PGP SIGNATURE-----

--Sblb2DLXLMvW8rmG--
