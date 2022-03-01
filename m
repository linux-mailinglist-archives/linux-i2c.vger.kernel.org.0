Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 920004C8EBC
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbiCAPQt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbiCAPQs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:16:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7065A089;
        Tue,  1 Mar 2022 07:16:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4934FB81B31;
        Tue,  1 Mar 2022 15:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8136CC340EE;
        Tue,  1 Mar 2022 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646147761;
        bh=1jOSqeUV6bw92y3QVExtAUxHs9vat1oNo6mWmMuwHf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jlI0ekrXQft3Mmqg2w0OJ1KLeJ/G9Y5PbtyJYvhC1SY5YHfxPASsEKl76VPb+QE82
         UkKDZAetmWvrwYdFXmnrk2lxip7MEm/RdAxBnufZqH7L0ara/N8nVN7ORui9Un8IRg
         rqCLWrVeRKMDQJ3qVBGg4/Gzhrsl/EnNMYjw10oac9YyVDNKFkmaxn+BIZud3YC31d
         puXugFtHPpyBiSTeA8PWS0o60NnEBHPXqrHdIZijntNvVwc+EzfuGHXZ+vLlFDsW8y
         wXzQ2OuQF3Mi3Dj+X4hIqpYIPcUxTmh6vu/5MVLHOGkZJthVrHbeRxQIDIeCaX4/HR
         lI3owD7RBdrDA==
Date:   Tue, 1 Mar 2022 16:15:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        rrangel@chromium.org, upstream@semihalf.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next] i2c: designware: Fix improper usage of readl
Message-ID: <Yh44rYi6m9csyF28@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, rrangel@chromium.org,
        upstream@semihalf.com, kernel test robot <lkp@intel.com>
References: <20220218133348.628962-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mo3c/bK1NDR43rDM"
Content-Disposition: inline
In-Reply-To: <20220218133348.628962-1-jsd@semihalf.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Mo3c/bK1NDR43rDM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 02:33:48PM +0100, Jan Dabros wrote:
> Kernel test robot reported incorrect type in argument 1 of readl(), but
> more importantly it brought attention that MMIO accessor shouldn't be
> used in this case, since req->hdr.status is part of a command-response
> buffer in system memory.
>=20
> Since its value may be altered by PSP outside of the scope of current
> thread (somehow similar to IRQ handler case), we need to use
> READ_ONCE() to ensure compiler won't optimize this call.
>=20
> Fix also 'status' variable type to reflect that corresponding field in
> command-response buffer is platform-independent u32.
>=20
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Reported-by: kernel test robot <lkp@intel.com>

Applied to for-next, thanks!

Jan, I wonder if you want to be the maintainer for this driver? If you'd
like, then please send me the patch adding you to MAINTAINERS. So, you
will get notified if people want to enhance this driver.


--Mo3c/bK1NDR43rDM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeOK0ACgkQFA3kzBSg
KbYsVA/9HFQWuNzVftyOlBekgZX9AAG3C/txBAtaKdpgvKzr8E3hsqUMmsEc1aVq
e2U8Ff81F1sM16kcq6uvSFVU2ExltUteo9moU6Uf2VZ2QPRkOgd57AfJGiWTAPDm
drGCNfiDqCpMe0fpLTjifI7Xz6vUW9vQr24TLAN0ivnyrVXIJKL9EQZXqUW5OsWB
eYbU4VIOgYMhIOcadobj0H/6dOSFCuvb/Er8YVFqpfYjqMRib6bykWFSjAyokQ+s
vbUgcJBMq8XuMSCPpvgDnL9F3Bwmv0Qy7kPUeLqCdaOkKubCOdkLOLWwACB5HU17
ks6E2IJyVu66ZG4Auvyhgt0A5m+uDnsV441ulFSa6+BXCbZQcxo/uBFfW3mnooSq
TMNY2E5k8EldMWg55qvrHPjvVQNsGVVNOiEYBzApGuIC8aPXpx7GqUWmopNI4qoA
nLc7bw3DznWOfFV7GT60k21oGLZOcTjTiAgyg6XYAjO+WjwwWgp/YqGwRhHdUyVr
28Vuh0u4t1FDr+ZxKzJHBZkIxqw3X+TTGd0Ia1mvknxNuI3Rb+xokHV8t8jIqSa+
krvEzSU/HOXDOhfV52BmzyvLhVFLaVE8M+wiTwqDoxb80PhTFct4ijnmmQsufF1C
AmoriBAaru4OG5dFNm5ODRGIE01JPq95dtb0uMg4yHXuvLSqusE=
=z0SK
-----END PGP SIGNATURE-----

--Mo3c/bK1NDR43rDM--
