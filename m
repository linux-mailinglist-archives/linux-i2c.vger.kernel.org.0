Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E34272214
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgIULPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIULPl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:15:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C0EC061755;
        Mon, 21 Sep 2020 04:15:41 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s12so12284947wrw.11;
        Mon, 21 Sep 2020 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wClfm+RU3xl+5yhIUC/40symO9pQWUClshjXpyXDPhg=;
        b=dNbznspCUB9NWlhHlue5W+MgQvYy3SRlaA0rqQAsOB+vYlY29DXwJ8n7Jw8a4CnJX+
         9a5qQqvefV/kMv2nMlYQ/XTR9v6d8nHJi8bMlLx/FCl1x7TyZKdClpraWH+CW7D7TCIu
         Brmf8c7lmKOBCCuvO0uz2TUQZsFNAqRdZ7Ewe6dVW66LCufwOMtnHmXDLBpZKU2UsbIj
         d4iNS2oe9jfcRQ7jC3R7kmksGEOkCMBuzjNi7ODVow7MGAZeGUhq1e7Ukx5QfpuGrDpZ
         YxcgcChguwx2PIFb1pUwE9GsoQKPzCMZantxbrS7B7tRWrU1IXmrVDRff/wNvVXLVsZk
         99wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wClfm+RU3xl+5yhIUC/40symO9pQWUClshjXpyXDPhg=;
        b=d3xpkyramuDr4TDHObQ7Ot2q/PbNaXD3bgwrY4kcF3PIYMtFVii8CjSKpwOG2fDTai
         HrBh+OILwLpayStWq7doHXMl5zRsgV895Y/wrPQ8qobR1cI4BBDKf1Q+HnRzAMbpx8vl
         kqUafaSGcUMPkFbN7Zbp2ptI95M9y4/6f8Ex3D1PCAzPhrebsre7setDMHtp423JUcxP
         aL8piG6WmTQTilcO5Cd1QvEPzdP+O1oQyEHnsKPMluIoMIrZnmCx/bUZgLu992jhS5bh
         vH1YtkWf+DfPGjGh1MB7Z+MoxLiuL3ydwYosAUhNcKlOLtv70u077AKxt8CO/6Ul6CTd
         vkyw==
X-Gm-Message-State: AOAM531tEr08GJjSmVopa4PGrlDSe5Lb8zYGKmMMRpgv+s3urRRZwPUh
        MzLLfRTSsOlsa58wiwueHo4=
X-Google-Smtp-Source: ABdhPJwbuNbewhCeSLiStKYxwRC/uidvhQOnlGLEkB6asBpFLOeW616vpjOdmtML2EBIPTpDFv0flA==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr55201719wrr.207.1600686939822;
        Mon, 21 Sep 2020 04:15:39 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y6sm20410238wrn.41.2020.09.21.04.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:15:38 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:15:36 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 14/34] i2c: tegra: Clean up probe function
Message-ID: <20200921111536.GG3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-15-digetx@gmail.com>
 <20200917123755.GO3515672@ulmo>
 <CAHp75VeWq_GzJ_yZag2yceuUDqPiMRWEa4XNYT5uPwXCzrsb7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Content-Disposition: inline
In-Reply-To: <CAHp75VeWq_GzJ_yZag2yceuUDqPiMRWEa4XNYT5uPwXCzrsb7g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 04:46:45PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 3:37 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > On Wed, Sep 09, 2020 at 01:39:46AM +0300, Dmitry Osipenko wrote:
>=20
> ...
>=20
> > > +     ret =3D devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_is=
r,
> > > +                            IRQF_NO_SUSPEND, dev_name(&pdev->dev),
> > > +                            i2c_dev);
> > > +     if (ret)
> > > +             return ret;
> >
> > Is it safe to install the interrupt handler at this point? What if,
> > perhaps because some bootloader didn't properly quiesce the I2C
> > controller, an interrupt triggers immediately after this?
>=20
> It\s easy to check with debug shared IRQ, but here IRQ is not shared...
> So, with a hack into the code and enabled debug it will be achievable to =
test.
>=20
> And you probably meant that IRQ triggers *before* the handler is in place?

It shouldn't be possible for the interrupt to trigger before the handler
is in place, because requesting the IRQ here is what will unmask the IRQ
at the parent.

I'm more concerned that the hardware may be in some state where it
already has a pending interrupt and therefore unmasking (as part of the
request here) is going to immediately trigger an interrupt. If we
haven't set up i2c_dev completely at this point this may cause issues
because the interrupt handler will now have to deal with a partially
initialized structure.

Thierry

--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oi1gACgkQ3SOs138+
s6FcFw//RlEH0g54qtu8PGnLh8rFz2mm5O6zc8lmlmkoqrQGm3ZP2izN2u4k54ti
D5ndkjiSW2JvYeixx9qRzyOKjrRlwNFAHU6Zo/BkqVlTryKbmjiDnqtFW0khbFHm
Fg2GrMsVRQKc0UayPjQhWYQFn64y/msmevPUZ0ipwV49vxQoS7A4aVhoZFkBjkuX
S55np3zEmCBb8Pht/atCcEUpd1U2/RZwkgI9NVdKdtAXicAeM+Juh7a0VImW1CsI
KhG6XPJaDsUjOcZLWxXHgeHTWU7J/rvHVsWcVH4EQht5TIEl+el0gAGhdQVGsgaD
K/UXZT4DEhvflIbuQeMPe/4p1o/jIoNhbSDZZCZhNSkawuHDSvoMcSCCaTIP/9W6
UygShkr5j64QEBxzybB+9Ab+AHp9w0SoBNZbBpGj4DeLGog2S/PN0pn6LhuOc5By
qiydmGr+VoEpCyq+hY8t+PfCl3Q1YSFa90Hpxssc+NZ0HXz5Dsy9x7Gc90MtIv3P
tgyMpvchOwQCWzhypDUPe7126Uap7ebb1KA65yskBHpzD5bSAXzmQD5k+gpxE6Z1
qMsThtdOl28ZnveAOh8C7EA+8u3gxnKU0/Ib7j/pm46RBR3eTGuM6FV1N73DSUOe
Scaioz/OR5k+Q/vvxz8W4itv6XO/zEcGy9GUlzcAqWKV14i8dlg=
=/pGp
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--
