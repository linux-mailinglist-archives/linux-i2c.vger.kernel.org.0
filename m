Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 776637567CF
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 17:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbjGQPZA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 11:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbjGQPYk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 11:24:40 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AF41FCD;
        Mon, 17 Jul 2023 08:24:19 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so7252608e87.2;
        Mon, 17 Jul 2023 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689607458; x=1692199458;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6wMQ8NlFhspfoWXsmaXAqG2FeC8NNnIVDtv9cGozCw=;
        b=VfnBWuF7+FPGTuLFl7+tIBBUNVuZD+MC4vTwQPAh+ihGENY7WxmwQ5+sKAs0biZ889
         PXGMRanTT+m/oj2kntnhsIlQmvvCtSmmZr6C2tPMVpIcNARBr2kZtx/uQ+vS/I6ijAWB
         JeSlgGokB0+qFLVZ+rqPE4AwX4uC7q8eMjXUWMnNpeOHooZQCZ/lXOQ73lsdmX+7UC+u
         3a/yCU8CEUJswlaqsBHIwLWiS4rkUKCUHArKC/4uxE6SWsmpaKKwJ3SJrUQcYIJm/3E/
         D5ZV1fQljdE5OthoQllPqkFk+LwIiFELV3iXV4L0DwFskm8Elrqg4QMpiDhevLLiOa5R
         gQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607458; x=1692199458;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6wMQ8NlFhspfoWXsmaXAqG2FeC8NNnIVDtv9cGozCw=;
        b=Tk8q22SdsIQztFTQ9pq2kpA013RpM6K4CmvhWDrGaxHZykAB5xCYPLEqtsXIll0ipV
         N6y46KLsXPnaoWpr+LCK9N/8y7RE6lqLKBkg3AZxQHUgAsZEN5xmgk1psjr5Kxds2a0w
         5e1jx3/o8bKi0C+fImxMdAsYK92wgxfyfL06cX4GD0jTmreJFzAoVMZrKN4KWGUyAYv2
         blvBviUFQai0i93/f18eMb99lIVvllm+7vQvSe5oqMXmV9mmu/Dmfmwo+PKZCUetGuTo
         X+2yUL1hGX5SYWAuonHfzfUYxq3SzBKepbE8hwl9k0fFLjp8RSRzRbVVYTeYnYwC8kKD
         dd5g==
X-Gm-Message-State: ABy/qLY13KvkGHGaj6RjXoF6DCJdLH6dVHXan9nc7bg9Yxzh7/V/HL+t
        28BGYcb4NnXsy9S9BSi/3YU=
X-Google-Smtp-Source: APBJJlG/2mKpL1YqAE47LOHVBe964g4og+JAaw3KAHiSqmdstLw82lCfB0kch+jYh16jEMUF8wpuNQ==
X-Received: by 2002:a05:6512:3f10:b0:4f9:cd02:4af1 with SMTP id y16-20020a0565123f1000b004f9cd024af1mr8201681lfa.34.1689607457213;
        Mon, 17 Jul 2023 08:24:17 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7c152000000b0051a5cf5fcaasm9934656edp.23.2023.07.17.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:24:16 -0700 (PDT)
Date:   Mon, 17 Jul 2023 17:24:15 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org
Subject: Re: [PATCH] i2c: tegra: Fix the check during DMA channel release
Message-ID: <ZLVdHzFm8yngLDj2@orome>
References: <20230717151240.68899-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nLWHGpg7Oa2TX09f"
Content-Disposition: inline
In-Reply-To: <20230717151240.68899-1-akhilrajeev@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nLWHGpg7Oa2TX09f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 08:42:40PM +0530, Akhil R wrote:
> Check for error and NULL before attempting to release DMA channel.
>=20
> This, otherwise, was causing panic and crash in kernel when the
> dma_chan has an invalid value. The condition occurs during init_dma()
> when the dma_request_chan() function returns an error.
>=20
> Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

There's already another patch on the list that should address this:

	https://patchwork.ozlabs.org/project/linux-tegra/patch/20230707132619.2998=
382-1-thierry.reding@gmail.com/

Can you please test and provide feedback on that one?

Thanks,
Thierry

--nLWHGpg7Oa2TX09f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS1XRwACgkQ3SOs138+
s6FbUg//eQas1PGvjAKhlbkAfch8OIRGKxFyIfolkP8ed7bK93zPFTsGFV/OhPGJ
y5pmAvL8I4Ey7gJxi7LAUbPo8rcGnhRjS8QvsDgN9c0SO9E1mKSM71rsVKXu0Ett
E+z+vIh8knWeC6JsBDqk3ymJBtMxg9fzjhhsXd+b0TqVHTIf7SevmZN90zsdNZ4W
/0Q8kkZ/Nl0GSt1uaecEaD28KIFk6eSo5mXmKsHJPlO9JUf+FZO48zS+YGZc9BBb
pFs3iZO1O3z7CzJ9o5yctqnpqiy/Ldx1nJe5RV59DYc118EGvhuDZjsBtkj8hHqM
wgd5pSOvydwOpGFYnChMJxkKQTynTbXm3LHDxE0HJ8P8++nEqaDu9rVTU6U0N1pv
tZ977b1vQInDih23GNDveiVHf9/ZLKD/PSezxi3bGRkmUMk6O/Q8DiAwMSd4ngfA
qJ1jXjo4o4NKFpmyKUYsLNNeFlwEkRDtQhglYTWnt3MdL9VZkcgFzqDxmj4s1UYN
SOqLCOQ68tw4+apgrcotgU9Sq4A8URap2LGsG+ro5L9l0n41K28Bf+7um1DIMl8p
svl9yPnF8dHUwDVxrfNhgx6TSFKGkDvkHgY7SISPTppWpxeBiF2cgi6arLnmQ1Bi
B27SUl2OXZVxA8ilhy3A7R+NTy99Mx2yn74eIyo2wdppWmbq5MI=
=Gm2m
-----END PGP SIGNATURE-----

--nLWHGpg7Oa2TX09f--
