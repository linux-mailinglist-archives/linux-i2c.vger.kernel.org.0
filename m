Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42AD46BD98D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjCPTvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCPTvH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:51:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F5B6C894;
        Thu, 16 Mar 2023 12:51:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1CF6BB82344;
        Thu, 16 Mar 2023 19:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE5FC433EF;
        Thu, 16 Mar 2023 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678996262;
        bh=YyAB4zTINlVaoeomkIjTN3h6RJa2BLsMtOZxv9V+64E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pZBXxaeaATqBP72oarAsrWl5k/z1dNW5PlkcQsyHJYSjTd4MF7IkwIcLUFY+OnjX9
         MRnrKaI2uKxj6c5RVEFkOSOwALTDwbu4KG6wYfoO94ryxOdRNhrV66/CvIkVTWqmfh
         Bkwh9szM0fMsUH1SgOlnHc6CuVw6g/x4wyz237b0PFTujz2EHfYRYgaaCpbLM1+1Uu
         7o6MQb3YBM7V0S6+Rj9b8PAU2IVh8gZXrunYhsY83jsXgZYjNgmcaDbu1DQ2OM7x3n
         8opqyWwyx0w22NwoHqS3glKZEPr3cSleIf01Cl43sc7PZJvTMjyW6rGBdy4InjjHMz
         MzzIxNxbfVcJQ==
Date:   Thu, 16 Mar 2023 20:50:59 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Dongliang Mu <dzm91@hust.edu.cn>
Cc:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: i2c: remove dead code in davinci_i2c_probe
Message-ID: <ZBNzIw6ti3kNbi7s@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dongliang Mu <dzm91@hust.edu.cn>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230306024523.248216-1-dzm91@hust.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SX8TjVAtNyHHmONC"
Content-Disposition: inline
In-Reply-To: <20230306024523.248216-1-dzm91@hust.edu.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SX8TjVAtNyHHmONC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 10:45:23AM +0800, Dongliang Mu wrote:
> From the comment of platform_get_irq, it only returns non-zero IRQ
> number and negative error number, other than zero.
>=20
> Fix this by removing the if condition.
>=20
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

Applied to for-next, thanks!


--SX8TjVAtNyHHmONC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTcyMACgkQFA3kzBSg
KbZrwg//X/WvAJt/VYdCVJLoFELNRUQVuAWMiVjXZGqD7odn+8E0qu9bKctQdtD5
UUzx2diTJDLnavOA470wpvTL9MFPLarB4P83wGqIgiA8esz1QJi9+HLVY6ePZqZc
vU5MV0gzgvoP1wX8IHtjej3kirM3l53OlwC2Nb2Bh88+yuBH1Hr8FB6J+gBU0ZfV
LiKR1DSSoj9AR7nSrwzF05KICvbA8xmH4l+S3QPso+0/KXHTCHybW4p+liJ7MpEo
L4Ma3tUT1oZwiY8Ru5R2AkcYBh0uTH8eM+0VTH7jYjZOrR7mNOlv9VeKaX2MtPgo
qpZYO711yvi1mMeWlV8OZ2qxVPb0vr1DKuuBHuzIEHwT5KITBUsyxBUEzt1VhjMF
EbPIuy25/vHXpkRDrA5S8UpBtIhHeXB/ibp9BBE5v4dTix84iKKWIAYOKHzn51Yn
4eUfSaDA9dFqNKPSYI/cYCUEhvLSQsCUAVfEK2XCV3PhOjWW7rLwRLF7WgUSHz1Y
jTWZ8kHQ6gRQuGZQ9FF3aN7f1IerdX6TCicKDkIMmxot8K4J7QiReh/njVSO+PZg
OMkpHbPHAHregaA9UYW7MV+Srm6e32wWwWNZyRLhELHOcDEl2/O23vpYIStdyHSj
OfZd65gL2iMesZPehna20PF+GFOC8bTC86MkgDVIrPKUfEdec4o=
=/BZ1
-----END PGP SIGNATURE-----

--SX8TjVAtNyHHmONC--
