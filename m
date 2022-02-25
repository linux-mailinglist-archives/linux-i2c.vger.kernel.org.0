Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B5F4C4537
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Feb 2022 14:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240871AbiBYNEc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Feb 2022 08:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240846AbiBYNEb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Feb 2022 08:04:31 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848AC1E374D;
        Fri, 25 Feb 2022 05:03:59 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id x15so4403484wrg.8;
        Fri, 25 Feb 2022 05:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FiLW0R7L/dZRfqfxW28BOR12U87eLnNRWa67PzOy/CI=;
        b=HHrWK7ne97eI6fFX7Fv835jZNK5hk+zS0o37dYh4zMpZ48ZCsoXwSBrbFhU31sgYQi
         lAUmjiRExX2V5fdeAloRqNXELDIpBAxEbWOWpAGphmSnP8L8jdKvBF3DAY1auH6V13Pn
         CHETEmfIKf+kEuXvDei7y3d/AwbzD1BHsDrtOSAd/wnIClLCgO+kg9GpTIweShTsb9Tp
         4EZULZf4/o4Lh/+ETyx5qscnWrmt0HyafLeqaJY2QSNNSrifH1UTDS+1bZ1hJNnWwa40
         UQRQpmORxDXiJOuy7DYefgqqgDJdS/qMATk3j20ycljtYTPEwdBtef4QQD50dWwYPmhO
         UBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FiLW0R7L/dZRfqfxW28BOR12U87eLnNRWa67PzOy/CI=;
        b=jEjCSBqp7ZZ8S7KdxuhY0LWPIBeWenfWfBn+HUKbjKcbAv7kjNUL4KAUEVCSw5EXbq
         5l+3a+50LIcPc1draTneONLS9BNY37iUw5mAwhot/pbWZCq8dVN+I5za/t5+hU7OGK9p
         +YmCOA/n7nD2qkIUq0oxD2ApGvtrBzmV5FmktlHhS31K+6T3n5/RSdhfkEI6/mZQtFM7
         i5GFwlewm4FSku1uHkjf0NLK9y5gASfNOqio27PwJfq5N12GhcknJ+WfjZNWrYaQt8bg
         GxxMdsU3DRszwEdN7j08K62Tidru6UwDd6VuSyDTQ9StXN9w9GywyV4K1PaQYREsQ+U4
         qtnQ==
X-Gm-Message-State: AOAM532IbLJgBrsqPwSOo6Uv0f4VGGhKvdBMxCYe1RpxcydFKBaU29NB
        OGsHNcSCwzXi+8gx+dRc8Ws=
X-Google-Smtp-Source: ABdhPJyz0Q8QDhOWS3XCU+i92LkHDxlAgtGQ8dY8haf/uZWkN5FsPOJpWFC2E/2dJxW+SQiXbc6W1w==
X-Received: by 2002:a5d:598f:0:b0:1e3:649:e6c3 with SMTP id n15-20020a5d598f000000b001e30649e6c3mr6182784wri.520.1645794237992;
        Fri, 25 Feb 2022 05:03:57 -0800 (PST)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d550a000000b001e30e81afd1sm2293641wrv.2.2022.02.25.05.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 05:03:56 -0800 (PST)
Date:   Fri, 25 Feb 2022 14:03:54 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        mperttunen@nvidia.com, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org
Subject: Re: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Message-ID: <YhjTum2zWhRF3Ya4@orome>
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lWAEqUEAsHWaCsS8"
Content-Disposition: inline
In-Reply-To: <20220210153603.61894-1-akhilrajeev@nvidia.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lWAEqUEAsHWaCsS8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 09:06:03PM +0530, Akhil R wrote:
> Emulate SMBus block read using ContinueXfer to read the length byte
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--lWAEqUEAsHWaCsS8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIY07oACgkQ3SOs138+
s6GwVhAAmLZXYPEtR5O+sa6Wbv/sGE5ainR5eQ4QkP3KEsBu65zUsivQF0e/gL51
nU3UWLjbgW6r+KL+0rlb/p55E5n6OwFPHsXZM9oSBtBfg75TuhJT8JCqvEnV8oKS
edblc5WW2X32hhYpZOo5/EInl2kXM6gzluasrC+ZAjz8dIcF6ynuNa6uotFMcujI
ZG+iOtPt7AaVEP0u8MBJU1u+Ni4UXUw8tMaJ+5QoiXqVI4dtnbsNr/3fGEE4lc/O
jVIbKXM0fwMfcGuNxfBoM8Yq5vIJshpnNsyJUjTyiWNteeZkTqAA8OcDXejoh6x9
En8QxZjO8s/l8DAW5u1ZiUvqLSYBZoJG8NrhjnHLb6GPbN5JtbCCyMo8YeOD2lG8
prCLh9LVSbcM0zo9xoBFIC2N3alybgH2THZ3IeQCMW7/2ITnZwk0FISOoXnEFOmp
98hZNgPQ436PHB15iSwF2FuaWq95Tfoinnrf0qWedMGCkOY0CdocvPiOnuMLW9o1
2XYXEagCwLKO3H0SJdsofPvGLPx5tuWqu2sXL/yyzy4dhwcmtMqjywkIuSkF8aHD
6UpZMqApcaE82shB3jtFIfX4rqDD0oOos6JRvVskesLhlXxoGck0fdBE7POLOCwA
ZTjRhKuFZLmOEGPBUyOHrBQSvx3lSiur8Rqus+/6hR5ke2mxmlE=
=PNMy
-----END PGP SIGNATURE-----

--lWAEqUEAsHWaCsS8--
