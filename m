Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7621B6C640D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 10:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjCWJwc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 05:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjCWJwH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 05:52:07 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D024F113C0;
        Thu, 23 Mar 2023 02:50:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id x3so83807780edb.10;
        Thu, 23 Mar 2023 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679565019;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtPIjUfsWdlwSV6rImZ+GnLBsBre2w3xZOSEdd58AR8=;
        b=K9ucQhY65SoKMVGWQt+Zbte8kRJICazFnVNi+8FJygkxC+7hJLCdLiA2MwIBWM7k6H
         BiFHTYXNMYUteEwA+HTZSIoinfhHq/+jC+a3LY6n51UngKyWu9EThBg9pXxtj0tqQ6DK
         HdzTeO62MdC318HO0PjR4yL1HYebTVbHnYPgOcSw1x4fKNr3lL4eVTUVcC13EZLqlfXQ
         16BKQI/dmqLcbTyyL80j4ZSkW3NDf7E3gJSWkeTJoVQDu/gyX3AvFYOlYEuIoMP4wUAd
         isigwtTNt8CcgFwrfLd8JYp5CsRS0SFtzE/IZaRvuv6PQXnan+yAoMObrADTID8Ivn9F
         Ir0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679565019;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtPIjUfsWdlwSV6rImZ+GnLBsBre2w3xZOSEdd58AR8=;
        b=AhEWfzq4pCii731kHQg20p+t6ESr/Hju2hl/7cq6NYbbhhcl+I4qkg4Oh4/ePdKjhL
         AY2iYvGpJmHijtlinAAglRPTZwOLquwuXGjkS60fYOtdTBIVGfGz4LTSjJQNy4mrlE3r
         tWOMZ4BmxMBSO8Sg8TVpHU+OTqudN55wH/uEVb2rh5zq5s8gmm8K1T3/CrHyI2mtzzy8
         PnVjE2mSn6W42uw2WymAuy3mEiU2hbln8CjCBZ6rmxx2hdlm4+pu/p2R+Ybs6BJe+5wx
         jY51JBFEWfkPRNTFhDOJlxz5u6yHrX2HCHeQ8IJn3W1B+lm/vzoXRJm77mSqsJ43GLR0
         fVBQ==
X-Gm-Message-State: AO0yUKW+CnVszjsIMBuYT89StHIjq2JxT73w7qCZWDuF+jh0v4Teh/Ih
        SZOkAexH1F+2U+4qUYJu3GI=
X-Google-Smtp-Source: AK7set+Gc3YhjaJaQlW/wLDkoHxO6Lhe7FSdbzBK9ql1Wg6MkJYALcc1a36+syNrk7dCjVh9BE4ihg==
X-Received: by 2002:a50:ff08:0:b0:4fb:6523:2b38 with SMTP id a8-20020a50ff08000000b004fb65232b38mr10075244edu.27.1679565019069;
        Thu, 23 Mar 2023 02:50:19 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n4-20020a5099c4000000b00501cc88b3adsm4982468edb.46.2023.03.23.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:50:18 -0700 (PDT)
Date:   Thu, 23 Mar 2023 10:50:17 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Message-ID: <ZBwg2Rnc6d5EQ3pu@orome>
References: <20230322102413.52886-1-akhilrajeev@nvidia.com>
 <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
 <SJ1PR12MB6339FC0B9BB57D1D2300D46CC0869@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <b9235dfc-10dc-1ed0-1510-fd98902491e3@nvidia.com>
 <SJ1PR12MB63395F16F399E67733EED69BC0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/U2W7SI2pG14y3lP"
Content-Disposition: inline
In-Reply-To: <SJ1PR12MB63395F16F399E67733EED69BC0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/U2W7SI2pG14y3lP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 09:26:00AM +0000, Akhil R wrote:
> > On 22/03/2023 12:00, Akhil R wrote:
> > >> On 22/03/2023 10:24, Akhil R wrote:
> > >>> Allocate only one DMA channel for I2C and share it for both TX and =
RX
> > >>> instead of using two different DMA hardware channels with the same
> > >>> slave ID. Since I2C supports only half duplex, there is no impact on
> > >>> perf with this.
> > >>>
> > >>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > >>
> > >> Just to confirm. This impacts all Tegra devices from Tegra20 to the
> > >> latest. Does this work for all Tegra and the different DMA controlle=
rs
> > >> that they have?
> > >>
> > > Yes, It should. I could see in the APB DMA driver that the same chann=
el
> > > could be used for TX and RX and the direction is configured only duri=
ng
> > > dma_prep_*() calls.
> > > I did not test it on a Tegra with APB DMA, but since it works very si=
milar
> > > to GPC DMA there should not be any impact.
> >=20
> >=20
> > OK. BTW, this does not apply cleanly on top of -next. It appears that
> > this is based on top "i2c: tegra: Fix PEC support for SMBUS block read"
> > and that one needs to be applied first. This can be avoided if you send
> > as a series.
> >=20
> Oh. Okay. I used 'git am --3way' when I tried, and the conflict went unno=
ticed.
> Shall I send a new version on top of -next?
> The two patches were added in different contexts and that=E2=80=99s why I=
 did not
> combine them as a series.

It's usually best to combine them in a series even if they are in
slightly different contexts. This is especially true if they cause
conflicts between one another. If you send them as a series, you can
resolve the conflicts yourself (you may not even have conflicts locally
if you create the patches in the same branch), but if you send them
separately the maintainer will end up having to resolve the conflicts
(or apply in the right order).

It's best if you resolve the conflicts because you know better than the
maintainer (usually) or specify any dependencies to make it easier for
the maintainer to do the right thing.

But again, in the vast majority of cases, it's best to combine all the
work on one driver in a single series before sending out.

Thierry

--/U2W7SI2pG14y3lP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQcINYACgkQ3SOs138+
s6Hb7A//RY4yqQJDFVPWvq6X0vDHSAkMuIKB7cNKAOOdg9CnwUHXTj/CTqFFYAt2
Ifv+bhqJq0f+/jUTGpicyLO+Sb/OBIBpfIeg3opqG7gA/xt2BXkqSPuALZk1bkua
lv0IQ8GEgmynhsSUeVYbdorzpmbBND4emJE/v/IBd//9EWZdqb1myM+zuNz2ixLW
ifEkDDR9WkrSBWCHCXByC8pFcLtnLV4XUVEFCBUmFQsJfTcIcQrlzTJ1kzJZv9NU
T8skz0Pm3Oai4cBWuDtFsgZVnsmn687RppTnB4vDPzG4ttQe0dxnhbwUZfuHANVY
zgasJjYNoh1xT/FMiWHCXRIjyAt129F+T2cnC+Cews5kCuIM04gn20aYqNa/6BSX
1kEwbgWEebIUxJAI/4/MmbMdDtjiFjYeN0diBCRwNILciK9mHqyr96Rzn7y+7Z/C
wTRNEs1WBkCDGDy1Sv9IYx9VArdfz8YP0woru8JTZNdR66/hQO926e3nkHWuNwqX
WD4UMi/9OvTEapsiP891ZL/E8I0NUFAhI1RigyuhCgWHGSIYBOPpKHVxVvzDaoAA
AVaqs0jEqDFOm8ZbRM3VcbgBdCyoFLJhGqavhxdvA0i6fcvPYZ7CUfINYYJW0e5D
J0oIxWt/AceiOnTqmKI5GjjN5Kee4ys/F4SLfq4/5+g8qMrIO/k=
=vz4Y
-----END PGP SIGNATURE-----

--/U2W7SI2pG14y3lP--
