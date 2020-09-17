Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94FB426DAB8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgIQLts (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgIQLti (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:49:38 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EDCC06174A;
        Thu, 17 Sep 2020 04:49:36 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d4so1660507wmd.5;
        Thu, 17 Sep 2020 04:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ipaIXtdnfdapV0FL+gHTyV3GkM39n711cS0zpgq3i18=;
        b=C6GAUfc/BA2rei5gLihXacyaNrxXpx7rGVDX9u08kd+7Tjf9IyaV13Ike7YhFw/pWT
         nn67lFNY+QySn2ZHbx4LlBqA/G7CfV/+LALEyMXkd0Q11A7Mr1yGMV89qMIXqnNAOKYG
         AoMAOEj6vd8eRBr5LGGWfvGFud0aAdOUnXZu5RY63qYimWOihWPZhBH9ISjrVhINfiYo
         NF59X6aNajgZTxP5/iiXaqx6LPWtKfbpGK1SUWx4+lUfUC4dY0poMOr7knscu/88d/VR
         G2mFYf1fvoinX82x5JTwzvYMpGVl1ac+DFen2O+SldZeghAg2RcEVgCYscK5Ytr8vNby
         TMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ipaIXtdnfdapV0FL+gHTyV3GkM39n711cS0zpgq3i18=;
        b=WqWfh7M4etxGGCoHqvdLvLDrCL5/CAQV0olai0CyexmXDXQpUM3C0dTCwiuYxiohty
         UHiFn/7X3eLSqHYtWjp/Ra3KcKoGFVLxi3iuxMexeskEE39KUIF7RbKmDRPWDf8L1Ek3
         dP21u1CjxqZdzBeCEptdC/PlERF25an2Cl7SnQcua5KXjFFRU2DofmKmgvKtc2JUoDGT
         gFSFeErpxBQCqc4Fo4/qnyodlbvMyTYUcR+DTU0K0dskI55TNpfW1vNBsNfIWuXwqNHq
         cyOz8p002ud1fC+O/Aybke6Y0TNLQvLueuoad7/hWl++ubRfWqNJ4fz2lnIvS1dgd6Ot
         S92A==
X-Gm-Message-State: AOAM531EmWE7l10Z+xfJdHD2F5gbBHU6wO+45+BukphAdPy/iPAc0BDI
        fFfLNBE8LRdBtIt61en8Wq8=
X-Google-Smtp-Source: ABdhPJwwhnqPNR8X+qm+gtESyv9btcqsm2yGgTLm4X/HvKZX5rJwvFk/J2IUySgPbjhBw1dsctjutQ==
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr9082920wmt.166.1600343375557;
        Thu, 17 Sep 2020 04:49:35 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n3sm10576377wmn.39.2020.09.17.04.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:49:34 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:49:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 23/34] i2c: tegra: Factor out error recovery from
 tegra_i2c_xfer_msg()
Message-ID: <20200917114932.GB3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-24-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bSr84fpmRhc6ULjY"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-24-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bSr84fpmRhc6ULjY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:55AM +0300, Dmitry Osipenko wrote:
> Factor out error recovery code from tegra_i2c_xfer_msg() in order to
> make this function easier to read and follow.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 16 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bSr84fpmRhc6ULjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jTUwACgkQ3SOs138+
s6HB+w/9HSObPTCa/4tN+5r/qnSfKkTOa9GduJjLwfvkg/Vmb1pdm+hk1IEtuN4z
tUP83ZJfTkdi0idxbD9mHjTU2oHj2CnCNSk6dEJjdv1kEajxwTaPL6TCT1NdDQvc
dWMCMn0dOonWvpCKk3MhADAvlDpg/pnWqc0CAyZLzDcqF45d9rzYfo0Rl4QwL1Rh
tFG2irC5RH1dlXwyqQRPd60TSK7HUaxvuWAxfvneRav7vfSkC8ktKMnefDEuiFEZ
7rwstEFOzxw74qXAeQpsz3tXdDESDJYWacmZ4Bg36Il7UZyWulrkGZP/D0JVy0sj
l8uVZ8B2Dt/9DUgpi7NwQJwSVjvF61VatZ+BrAPyYph/FJ1RECPg4/Nth4k1mc3R
smpTfPmEI4YCAj9A9o6LE6lKbKI78BHIarEN/TojYdmFMk9lXeSWduH4dwPKSuVz
Qn9l3NDzlctRQoSMt1pySz70Cdo7G91Y1ugh6quYDRBZeEQK6FtETT9CRu4a7buo
f/QvHfPC7dDpu5DT+OODSQ4JthPB821t0xHc+iEFkwsmgRlYjFHINug1HKW7i9IW
E6i++K5gcuPmTjDTQmkjVLlPKmVdE3t6JVN7e1E1/q/Buqxzcv2quo2CRLwmm6yf
f9ySNNkwVNtejBd/GZupxMzUqoeHsx2cIO/9kx7Bo4gKFcY5lnc=
=OBJk
-----END PGP SIGNATURE-----

--bSr84fpmRhc6ULjY--
