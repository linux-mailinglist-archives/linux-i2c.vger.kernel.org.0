Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2FCD7656E0
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 17:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbjG0PFr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 11:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234363AbjG0PFh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 11:05:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43A235A2;
        Thu, 27 Jul 2023 08:05:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso1367275a12.3;
        Thu, 27 Jul 2023 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690470326; x=1691075126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jyo/nccvw95s+8VYmZBvThGWRkgiUlycWNZdafG0GXI=;
        b=MCKYhREz2C19N5IprJJPIdSsX9AwlPn9Bsyam8Q3xZuOqKINbUSIzW+F+LkVIdxGKz
         P+GnTOvvYsw9v2qOp9ME9zNz8hslQxa6wqzqrK+cxso5D/bPLCztzXqIiFYZDUzlJnDd
         9TuNmMbmoLHheVxcSV9SukgRLsE4i98w49pohnI7lU762SmlmPcIAXrfAtqDkImOGnhb
         zENAcd3cUfFXymUBmx5SEBrsOX4gpC1i+wwYY1gsaPaW9+O+8d8E1SLTx5+Ejo3bPScF
         cCNewxVPs4m9sGCmJ62o0L/zwvTFf5Q8QDZuZPul8prqvafA1YdJFRXzJhMBDfqtch/D
         nrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470326; x=1691075126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jyo/nccvw95s+8VYmZBvThGWRkgiUlycWNZdafG0GXI=;
        b=iVINLLE1c6+G1FBDVCeUNVp+tYMZ3BUp38ME4jLHiKMc0Jb3lNr17+C4Yrwor2Q7LB
         7cKLGlsiMyIwBvG03S2uTpaZ4VKme/tEhLp1YIf+zZUguIKeCBzQIB/6FGyXqAo74qv0
         CZUuuMiMghwhmJYhjP033iK1BiyhSduBHdhRj1xzDpOG1l18Nqh/nWTa03ndLW4r6DBi
         jmpcVmKyU6TImk61cCGse9a0fHx6uEfg8EGxf9qwApFpupGAm8O8KX7ewNGQF0wvUrPr
         5ikblbIPk+nJHOstY7fi7Gxgd7j/RkJOVdKvw7g+phNHKELUR4fc3Mm8ZO3NrvSmN4Wj
         /E2Q==
X-Gm-Message-State: ABy/qLYCdNSEVTdmxqR+XQwLfWjzIhxNVKeJSrqR3IodOesL95slPhB1
        gk2axhAFD+mcxGhcse+2a+Y=
X-Google-Smtp-Source: APBJJlEhMZYs5LMVZTyzeOoe6Ma41v0BKvaxFcFnnpgH/2VwcnAnym28v1U4I/WO/EjQRmq52cL+jQ==
X-Received: by 2002:aa7:d0c9:0:b0:521:e544:f3 with SMTP id u9-20020aa7d0c9000000b00521e54400f3mr1777456edo.41.1690470325657;
        Thu, 27 Jul 2023 08:05:25 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b00522589c6204sm737774edt.54.2023.07.27.08.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:05:25 -0700 (PDT)
Date:   Thu, 27 Jul 2023 17:05:23 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Message-ID: <ZMKHs9WwPNhR3Z_o@orome>
References: <20230707132619.2998382-1-thierry.reding@gmail.com>
 <20230725213404.gj3fjiuz3wh4ak2i@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4oi1CKDmvbIuKhVK"
Content-Disposition: inline
In-Reply-To: <20230725213404.gj3fjiuz3wh4ak2i@intel.intel>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4oi1CKDmvbIuKhVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 11:34:04PM +0200, Andi Shyti wrote:
> Hi Thierry,
>=20
> On Fri, Jul 07, 2023 at 03:26:19PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If the driver fails to obtain a DMA channel, it will initiate cleanup
> > and try to release the DMA channel that couldn't be retrieved. This will
> > cause a crash because the cleanup will try to dereference an ERR_PTR()-
> > encoded error code.
>=20
> while this is a valid solution I think the best thing here is to
> clear the exit path by adding another goto label.
>=20
> By setting dma_chan =3D NULL you would go through some extra checks
> that are not needed.
>=20
> I guess that by doing this we could even remove the
>=20
> 	if (i2c_dev->dma_buf)
> 	if (i2c_dev->dma_chan)
>=20
> in tegra_i2c_release_dma(). However you see it cleaner. I'm not
> going to be picky, though. Let me know if you are up for some
> more clean up, otherwise I can give you an r-b... after a little
> clarification...

The problem is that DMA support is optional, so we will typically
succeed probe even when the DMA channel cannot be retrieved. The
tegra_i2c_release_dma() is going to get called in any case and if
we were to remove those checks, it would try and release a NULL
buffer and a NULL channel for the non-DMA case.

That's also the reason why we set dma_chan =3D NULL rather than use
an error label. We could technically skip tegra_i2c_release_dma()
when we fail to get the channel, but we do want to run it when we
fail to allocate the DMA buffer. So that would mean we end up with
two different cleanup paths rather than just one. So overall the
cleanup is simpler if we treat both code paths the same.

> > However, there's nothing to clean up at this point yet, so we can avoid
> > this by simply resetting the DMA channel to NULL instead of storing the
> > error code.
> >=20
> > Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
>=20
> ... is this the correct commit that is getting fixed? I think
> it's this one:
>=20
> Fixes: 86c92b9965ff ("i2c: tegra: Add DMA support")
> Cc: <stable@vger.kernel.org> # v5.1+

The original DMA support patch didn't have this issue because it was
storing the DMA channel (or error code) in a local variable first and
only assigned it to the i2c_dev->{rx,tx}_dma_channel fields after
checking for errors. Hence, those fields would never end up with an
error code and therefore this wasn't causing any issues previously.

I hope that answers all your questions.

Thanks,
Thierry

--4oi1CKDmvbIuKhVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTCh7AACgkQ3SOs138+
s6H7sQ//dJPWVSWhZt5IRVhpE9HtdCxYXQ8iM6vmDV69BD1fpogXxpAxWYPGUDfe
94clRcnjy1/tHfE76S1e2Ra1ZIvm4MkuPJ1lIKKWV4UH1kKX6B5+MpMxgs6iRnSI
cdU47q7C1M0D38KvqH7jMDddHUPO2QNW7WedjO0YoostS8rU6M+5OKkx8AOGjq0M
pWVqiGMEJWLifU28Dl0QRL02rDis01YVkQOIf4Zjxw0mttLnRX75MTgxmlumCzXK
U9zl8YoB/XzpyQHNekNvzIwXQPwJ0AjgwNrzyo9lZx7ce+SMBfhyKczn91/ldQuh
Hhg0pJeWxm2zF8lpNJpoSrlYdkmi5KwQ0xzgQiaQYjfe3z4CHk9Y+rSso07XJNAX
qLZpEzV/zA/kxN6EnheRt2XQ8xfmkiq4R3qECvt38mtxm1k+Eu1bV1tKUsPq37JO
StFh7ap3vu9kNLLQX1hqsw3ukZ0/RN6OFzvGP4nJJsmV2wcS7IJZTGhucBVXBD01
CHd4T50tA9nhxU4w2kn7zKifnkEE54up2w7/4/LxBOorzZ1Os6/P0jbUuPAgdKHk
xPtgzBNx79Tk25JS0smaDtIJBSCbwe1Uzc5GeT98PsYayHBfFc34SsocxfdYUoVU
9M2tHCIiQ/Tu7Vb7bEjlyb3sNn7dUkLnIDWtDNu6CSxWjgvlBsg=
=lqB7
-----END PGP SIGNATURE-----

--4oi1CKDmvbIuKhVK--
