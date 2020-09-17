Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E155E26DA9C
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgIQLok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgIQLoc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:44:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168C2C06174A;
        Thu, 17 Sep 2020 04:44:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so1726802wrm.2;
        Thu, 17 Sep 2020 04:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1GGN+6G9krYwS7+4QvPgXEXU18pdubW8T8iKUwUjjrQ=;
        b=T+yMaGF8K5wCJIbw9pclQq+HMf7igC/UWJtToVnFwpH3pK3DAMLo1YCSaiaYQ0E48E
         wurSf10yYVffLUfvcjByog8k3JXMMNZUIEGi7Q3Q2UvDpfl0ajVIINZdyA9ZCD3whQ6w
         PfOt6Q0ArjJGDrDqcqhalMxYBUNFtmuBKjkQkE/6h4wJu0PFr35bCq5WwrCnBS9abSDK
         L1mq5H/4EXAXv/flvhiMQ3KR6SM+RqGlRjuJSpjth81V6S/Y/Ryph0YENiJa6iuBsEsU
         q/12LhZYzb1sV24D2n7ik1P6dA/SYsY6B9eCtafvt5Y1tIHwKznU/FmT+Yen3y9Va5v8
         6jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1GGN+6G9krYwS7+4QvPgXEXU18pdubW8T8iKUwUjjrQ=;
        b=ISoCho3sY6iw2k47U8rGlWxFuz4a6wUe6wwdCJRWS1AATdNKk5yFhxUWDmilX+VyPu
         /T58DCc8egAOETd/Jagf2hNIcCT1UGS1T+pMeRqERkFN6KbHL0dL7t7tLmkbkRdnzdyw
         ULP2uq9uRIzapeTHnwpanLjY/nQTYTjgQfoUlKEE2/rdxaGRE2cvjKaxFbWIl7tFu8RW
         UbKG0myG7pRKQEExsKy0wTrGeo01Z6p6hRuQUl0F1s3E3Ko/yRfePiZ7M3K9IYDkb/7Q
         wbp5yipJlSCNmh0mNFt0i0czGQIOvR5p/V5vxIoEsDzPcr64npLFZZt9VFBmdIB7pbfq
         3S9w==
X-Gm-Message-State: AOAM530rbJu7d4Mhq4ApSHyifXaHdWXT3sbuplrMO1y8keid2ynjfraB
        6/xLEbfQRYS5qyIUpNPh1Dw=
X-Google-Smtp-Source: ABdhPJxQFm8GwF7T0Z3hRvcm495YnZgcjLmtrXk1yvWUkZMQ8QFbDAwJSI7ZbDhyShvnl4vPamrGyA==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr8654031wrv.215.1600343070824;
        Thu, 17 Sep 2020 04:44:30 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g8sm10616789wmd.12.2020.09.17.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:44:29 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:44:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 20/34] i2c: tegra: Remove "dma" variable from
 tegra_i2c_xfer_msg()
Message-ID: <20200917114427.GY3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-21-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Tln/wzp9jsNjmSUr"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-21-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Tln/wzp9jsNjmSUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:52AM +0300, Dmitry Osipenko wrote:
> The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
> regards to readability and generation of the code.
>=20
> Besides readability, it's also not very nice that the is_curr_dma_xfer
> is initialized in tegra_i2c_xfer_msg() and then could be overridden by
> tegra_i2c_config_fifo_trig(). In a result, the "dma" variable creates
> slight confusion since it's not instantly obvious why it's set after
> tegra_i2c_config_fifo_trig().
>=20
> Hence should be better to have the variable removed. This makes code
> more consistent.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Tln/wzp9jsNjmSUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jTBsACgkQ3SOs138+
s6G1HQ//X2i75V4eshvomPdZxueOPlRm94R+wDAKAPtQvOlwON++lsuhDyUY5jSG
8g+XLWb9KUmIWl9ZS/hItiD0OfPWyssa1yoIqGp7FIL5RZooCfJjRhf2bf7Bp8cC
xdheoPdHxpAGEb23UQ0tt55RsJLmsxu0wde3WXnmMzxw2ApMo4SOAngkFQLYldA5
POOen4bcCGQuAx2JaJPqIbzft+G/tC9smaoH1hdsifNOHoRa6yetXvXTLw4VYmUv
VdiyK2KXZXR6sSZk0fS8XSL5wZEqPbs4YXpkcr3rnXewP/BHMkpnWSYoLZbVzxiE
CnBB2XI83qdAJBUfyqP+mQ7AE9MRRXzR++yze8h+TaXbAF+957Xo0VadaES9lTLe
tifsCA7ImTKtB9h7G/YjJnpxaKQUtODChzF4aIQX3I/0oDLlnzeBShMngCRlPZ+b
mJ0smwdlGtk/F+i2IdtcRr4gWNf9JI/Exvqsjz4BnwR+5FBAs3Ou7KLgscrXIROP
+2sCzrXAYd6pDjypICEyNjb9w1iwMRy7rxVa5dcPglfTbd0keJZiQ63WE2Y8kyEb
SpAFhxhtzYmlksvHj/pDng+9tJu2deJL6Fqr1GiYDWI39yhIiqUCDr9v7IO0xOs5
9FTQCBATFaRLR04hh2E2RDZVneKhawDYVZFQUaTaH1vjB3jv14M=
=wy4C
-----END PGP SIGNATURE-----

--Tln/wzp9jsNjmSUr--
