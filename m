Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4AD82721FF
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgIULNB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIULNB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:13:01 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68730C061755;
        Mon, 21 Sep 2020 04:13:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d4so11716544wmd.5;
        Mon, 21 Sep 2020 04:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aGQZ+zvLne/Tl0HTMcPjUIvi6nJGRMzLlovQnLzLW44=;
        b=p6nWO5BP/thYVZ6nsz2mnRLBWhAaPl0w/ti2E4A3F/j0gxEY3V2HcTgsSLnM9shYeJ
         Je7CHhW0ndG046Z2/V1k0prd92kPdoK38wA0F27DUaa9DpKq1maGSdGJkpY14Xv/X3OM
         4ZAVBjNOtDF30mLhdLZCY+esJA8ManJNoGMIHHuBgSJTrIUtzEcELD5ldu8ZFMl4UB2y
         FeSDY+BunZFG1fRBZZRDguRazQceNYQXsnXn0GfwdAd+lZDHdokxeJk0LZBR1lkqhHD7
         AUChd17TRzthLbb97nALhqovJN6dFPPu1HjDlyIHE4qJBINc+2W2MtdQsFi4tZUohZX1
         G+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aGQZ+zvLne/Tl0HTMcPjUIvi6nJGRMzLlovQnLzLW44=;
        b=YYpxUeGlvSPvBErZxJa9+jm6jtmVaDoCEMtshNXY7NK7EdjmU6uB48YhYuIrqORfjB
         wcYOY7eKlt06Tpp0d2tPwTbzndOEDEWk3bzmXSWaFrZShA/1AhLg6xL0rIzhAG/IISA9
         wvnEmln+0W22s0QMUiXd4wTsoE1f8hvd+px1OOE1A1zTOzJ2Cf56yRvCdLiGjkRc6kGK
         tFiPiz8chY8LOeUNSYMptnhI8ADnDhBm78TfUo+Gc+W8S/n+d6OLS/khZmGx1IDE7F3S
         OgezjJT4yWC9S8T72mSZl11fzbXYUR2z2lDiBiZQr1PkEjVbMu0J8EJINsN2G8+izOWQ
         53Ww==
X-Gm-Message-State: AOAM532app7QCbFf31iNPiZzqOPOpJNr63wLa9h1pbCDxKUkBxzgV3pL
        TQoRLAPgNjp4sWFiuzRXEJg=
X-Google-Smtp-Source: ABdhPJz8RMaUPMCL1oBmyzPX/XvwYv5cUT3bIGu+Ax8V9O17mF0Ff0Byz7JyXWRUEcF0O8/LuYG+eA==
X-Received: by 2002:a05:600c:2252:: with SMTP id a18mr31710479wmm.154.1600686780177;
        Mon, 21 Sep 2020 04:13:00 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s11sm19714402wrt.43.2020.09.21.04.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:12:59 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:12:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
Message-ID: <20200921111257.GF3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-13-digetx@gmail.com>
 <20200917113846.GX3515672@ulmo>
 <175e7f54-36f0-32c6-35a3-14c5b5e89e95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline
In-Reply-To: <175e7f54-36f0-32c6-35a3-14c5b5e89e95@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 06:01:56PM +0300, Dmitry Osipenko wrote:
[...]
> It's still possible to add the clk-num checking, but it should be
> unpractical. We could always add it later on if there will be a real
> incident. Do you agree?

There's also clk_bulk_get(), which allows you to specify the number of
clocks and their consumer IDs that you want to request. That seems like
it would allow us to both avoid the repetitive calls to clk APIs and at
the same time allows us to specify exactly which clocks we need. Would
that not work as a compromise?

Thierry

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oirkACgkQ3SOs138+
s6G3nQ/9Fr/udPPV00Y1T3dXw9LlQcfj8lbFEjOKtgjhWhA3NRMCuo70HOKb6gWu
RrpYd2j3v+ZqoB/5B1eVwrx19bENRwD7ttC+fi2s8X8gyiNBcAv+7j/BoLOqCQPq
4JyLxJmx1GQaOq3E178hRnp9d+GDLNWtWCNTHjustzfHbW8w/Ax9mEoEfZwPt73W
fLk+PCPrC/JAvHvyF9NhnLXRR3K2VcebCyupNZef/Wma8ziNoiWO8UehZF0H5EeT
U0AgyULpfi2+iHVp9Ho9nE4aVPHYKwyzRk4qpYB1qydBk3Qog4lgv2twwXM3KNnU
XHbSX6wGfn+xWp5oppVRzJ9eNPhDZ46z+LDEMgiriIeAkfz+V1reHjYRqiJcQsjW
6zXr/8VLusO4J5WejXaCuagTbrWBxwt1qtRJRL8XJzJwLe7hb2N3wXmqCa2krNLG
6MhTojcAOosw25nfFgmcXLgpzFTqfUA4u3x4Uac/hwPLsO1bpDnYY/EXxOxITGC6
n/qsdaqrnwD7uDMioBXD9WiFr20qsCP8J5AH8hXU44GDHgBjDi+eQZSChKfyc/G/
e2tZMcOYhR/fW+qW+4AzLTgJBTY9pu97g1G0K96KjHfjSXk+et8ZZcQ7+KpYhl1H
EU5Cg/03KFsM0dQA8hs0n/XkPFK0WWUtMpvD0UFhgM8SjkhEkDI=
=2mPD
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--
