Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C07262E7AC
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 23:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241193AbiKQWDr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 17:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241199AbiKQWDY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 17:03:24 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026B0898E8;
        Thu, 17 Nov 2022 14:01:52 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id x102so4658727ede.0;
        Thu, 17 Nov 2022 14:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbZpZfvfvRImepPng90QD1DqUNkG0pRMbRACnwrWAMM=;
        b=YEDRLdiDdoPHaATINISDQxWSY3x5BUvGGua6Wu3oIRZ3+mnHLKMb+o99Rp7QMAYZPl
         +P84jSylMlye79DBKyYsQw7RBEmRftL+/xYJzEe8cuTyrp00TvI/UdjZ7pTxBwKyemGA
         NvRZ6SVqKu19xYKQHO+jn/RhEoiliRDwSJZWOeFMjHvYWLDUMKkoe0nBLYZpDY2CGYa/
         QuTSVrQYQBXG82FomtVP96LTNfTT/uZ/vRq7xWJoCzlNZZAMzVXZyK3bZ+na4coa84hp
         D+A1Wsd7PyqBK5xEDJ10Vq7jpMyQOJW5uIVsHfBIjMpDOjzUfyytMk4+Zxh3imwVK8wb
         v5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbZpZfvfvRImepPng90QD1DqUNkG0pRMbRACnwrWAMM=;
        b=hHctPC/+ZQfftsPCqRueomf9WYxQd5Lctrar22SXqv5x9qIwG9VNWJij1zJewPbCZa
         BQibkvX1OI67WwpC7WMokTuQk5zxvBRsSuHTCTMu08c6mUjmr9QLl6dN7cFW8BJSFSmV
         HH72I1vGiKmslieHKv2xgmaTnumtxcOji2n6C5nRV68wbhI7D9aEATuz6DbPkndr2bex
         R6wNk1w5fZXCwd6k4s0BQq8iCjU9v0ZZMrcpjoZxVf70WZUBZ9/fA8IMl06l6q8CJC1N
         2Ij/1QDjug4uNBFFYmX2Fh5cUCne/6Z6/0jTHGi0KBNcLDEceuMlxGIcqfSCsNd4Xf0w
         8uZg==
X-Gm-Message-State: ANoB5pk7ZNUxtsKq8oilddI6UzsekBNfbkAP/B/kRugm7YKo+ACO64WS
        ydEQp81rrFrz57ZsecZAUpQ=
X-Google-Smtp-Source: AA0mqf46P8qtAcmbB0hEi6K+/f7igE1ezoYdNaHClTdkK+gsDH+y0VhvhBMta7ktwMB+Tg7uyK2+fw==
X-Received: by 2002:aa7:cc12:0:b0:462:79ec:55eb with SMTP id q18-20020aa7cc12000000b0046279ec55ebmr3767547edt.151.1668722511424;
        Thu, 17 Nov 2022 14:01:51 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bc3-20020a056402204300b00463597d2c25sm1028751edb.74.2022.11.17.14.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:01:50 -0800 (PST)
Date:   Thu, 17 Nov 2022 23:01:49 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org,
        Zubair Waheed <zwaheed@nvidia.com>
Subject: Re: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Message-ID: <Y3avTc3s+wAMR4IS@orome>
References: <20221117100415.20457-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KYzKTqeFwuxwrIi9"
Content-Disposition: inline
In-Reply-To: <20221117100415.20457-1-akhilrajeev@nvidia.com>
User-Agent: Mutt/2.2.8 (2022-11-05)
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KYzKTqeFwuxwrIi9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 03:34:15PM +0530, Akhil R wrote:
> Set ACPI node as the primary fwnode of I2C adapter to allow
> enumeration of child devices from the ACPI table
>=20
> Signed-off-by: Zubair Waheed <zwaheed@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--KYzKTqeFwuxwrIi9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN2r00ACgkQ3SOs138+
s6H8mBAAmxRq7078F4cXQITxE+/9Ub8lJ7cwoZ4Wj+bwtqCLE87FiUALOKVR5tQA
BQ1PGs+80K5qZ9O0BeQva6jTx+VDtBFik7wqHUVuozBWSyoxZoEi4DnjojtqhNw7
NX5n8LPNOwRRQSpv3/mZVceG0aQsDyl3bbzatVU0osNhLNUfr2xI6R67OOp8dJq9
K/jEILrqcDi2P2dDA3mW7inerYKImrjNctVSHFXMEolnOg4aVWWZlgSOo928BV2O
BpoRK8IFZlUCNaAW3OrKFgF3ULDTFOUi+vE8c8uytr9q7gsJDJmjTuD/C4CDEr3A
Lj/HWHAAwJDLpIlNLXE4xq/gE4VgZO86yOY9v0BveealPWyr3Pbb1wMQXpI2ufbv
u+Qh62lUk9erI3zkIX0IzR4ASz0Hp5Zbr11KTlGGmC9Y9t2h6r9G91568+yLQYr0
zn4TNEFki19dL1OkRboO+Dida7zDadD+aLxb1uUh6RYFaAhTfhcYaRay5RkJVdN/
e8m/02GBe7tWXtk1akGamkmQe3sJnhRKJYKYB4riP4guREDcvei5NibCsvAHRgq4
t+ol7Y+LphanjzIE7F8fYk+0aSK9dNojyNH/Cx/KrS3SeOHXtZukA47ncnQrnQVp
e9IxwtJHhtUzwMZ94KmTidq+5BgaNzmFd1ghw0PLcC67wRu1Djc=
=V8HW
-----END PGP SIGNATURE-----

--KYzKTqeFwuxwrIi9--
