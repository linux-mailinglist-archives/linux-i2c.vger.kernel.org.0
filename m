Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABA6B6111AD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 14:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiJ1MjA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 08:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiJ1Mi7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 08:38:59 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923BF1D52FE;
        Fri, 28 Oct 2022 05:38:58 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id q9so12724690ejd.0;
        Fri, 28 Oct 2022 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6b7kwg2WdDmY6cz9AakvTDLGqm+2/XRfuZcHo4JzlI=;
        b=edsoFRNhow/344HliqnP78Nu6McqtN0HTJNgsIUWyOp7wcqLGZrRmFA0ReEx5yhUOD
         drAU+pubF3GbxOcNo98+s4tjxNvrZZm3ovUE6xCgNBWKln3d1UggSKFeHG4VnU3n4rPp
         VAnFdOKGxOPSlLGWHCbkN/9kspeI+K7YWDf2YduR35stoHRzpdmCKjAhG/3Qp/zXSt6K
         V11AHANMQ7KgC8X81S53RBwF+UcFsGebZSRM+lKbnFxETvh4SX3WxilbhUmeFBBF/+w4
         A2LEWO/soXzEYGnKYr6HPr4AkTM511tgEyIzHEw2h9Vzf8M48tMVUEOl+JZ9nF3aCvTi
         +vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6b7kwg2WdDmY6cz9AakvTDLGqm+2/XRfuZcHo4JzlI=;
        b=DUoQ2mHlNpsIIXx5NyaeOoflOE992eSqsa0BQ2nIEqkRA1w1kMlpaGoxCaDZfJlSPF
         qHqyjrsh1+6HhI5xf18FTjhCgKH5yRGhk4jepEebZu16IaiBgmdplViJaWpBC4UYqjTm
         uwspRNOXh0nKMZxCYYEjISIYNlNJfHC1qctYbVJM8UPDewIZmMAyhvc+a0iFK8mCIIAU
         CpuPDs0nqapUJ35CDtGiBz6c4o1ayWTZ1cLQHhVw6EMxXMP1l+EJ5GTriHcN3nzIgKpE
         LJ2tAWKLSQwdaCtioHFU5QeCIGJeaXK1/5t7KcWWVl8IUhgoEMTAccwHI4CAFvTpWHJ0
         0n7w==
X-Gm-Message-State: ACrzQf1M9sh51jgg4zAEwY1oP1s/vW2YSMpQVWiZspVCnqouNcz/mA4o
        F6yo3g9lciFPQGky6+MWQszQeFdvzrk=
X-Google-Smtp-Source: AMsMyM5KnL1wkxqYW6p6I6VHF1z1SahRA1W6Hhu9pGmq0/xsQhltyL8KFY/7jc2NLhLwrk9+dKqNrg==
X-Received: by 2002:a17:907:5ce:b0:730:bae0:deb with SMTP id wg14-20020a17090705ce00b00730bae00debmr48272599ejb.181.1666960726223;
        Fri, 28 Oct 2022 05:38:46 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id pv3-20020a170907208300b0074134543f82sm2075974ejb.90.2022.10.28.05.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:38:45 -0700 (PDT)
Date:   Fri, 28 Oct 2022 14:38:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Wayne Chang <waynec@nvidia.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/11] arm64: tegra: Enable XUSB host and device on
 Jetson AGX Orin
Message-ID: <Y1vNU1KeUH8LvG0r@orome>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-5-waynec@nvidia.com>
 <2059dfe5-b084-42a4-7f35-9da9561fc12b@linaro.org>
 <b803bcf9-fc47-5239-ffe9-707925f324de@nvidia.com>
 <5676bcd2-14fc-4e1d-643e-89e575d190c3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/hNVoH5xZwyCFIYG"
Content-Disposition: inline
In-Reply-To: <5676bcd2-14fc-4e1d-643e-89e575d190c3@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/hNVoH5xZwyCFIYG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 07:27:09AM -0400, Krzysztof Kozlowski wrote:
> On 28/10/2022 05:33, Jon Hunter wrote:
> >>> +			ucsi_ccg: ucsi_ccg@8 {
> >>
> >> No underscores in node names.
> >>
> >>> +				compatible =3D "cypress,cypd4226";
> >>> +				cypress,firmware-build =3D "gn";
> >>> +				interrupt-parent =3D <&gpio>;
> >>> +				interrupts =3D <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
> >>> +				reg =3D <0x08>;
> >>> +				status =3D "okay";
> >>
> >> The pattern of redefining full path in Tegra is confusing - I have no
> >> clue which of these status=3Dokay are correct which are redundant.
> >>
> >> Do you?
> >=20
> > I understand you may not like this approach, however, this comment is=
=20
> > not really relevant to just this patch, but a general comment. But yes=
=20
> > we will ensure that this is correct.
> >=20
>=20
> Just to clarify - this status looks redundant, but I have no way to tell
> for sure...

But that's independent of whether we specify this using the full path or
reference the node by label, isn't it? The only way to make sure that a
status =3D "okay" is not redundant is by manual inspection. I don't know
of an automated way to do that. Perhaps it's something that could be
added as a check to DTC?

In this particular case I don't think the status is needed. As Jon
mentioned, this device is first defined here and status =3D "okay" is the
default, so this is redundant.

Thierry

--/hNVoH5xZwyCFIYG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNbzVMACgkQ3SOs138+
s6E9wRAAvxEstA7fsndJGHjQBJ1VnmgD/ut80RMq/RbIlNqAXTvWdomp7Kg0qf/z
HicY0UPrvJyw+8gSLQJ6Pi5syvsYlT15ORzmmui1lTylQ37EwD/z+gh1YoW5ajws
8K/p8ax7ivzd1O1ARWfdP7NCdocn3HJqgrIFvgcYC1wjlf5tqoxklBU3YVqrlTDI
TeULZVqjsV85W9x7Bi0BSbkRbiHcyCbRMRnlz3rjBynmydO/Um6CDZvpGysukVik
oz4uS7PGfMm7yDcVSEiVaqXfa551Z3AckA/trp2Py+8/K5qMc5PI58EOzQMQhHF6
6SNSdmmPhFWK6HcYx6XMB7q7retFEdAJErNXK9ko6izVmXmJ5sPjHCg00vxElGCm
jnVajKP3Okc59tWcxOauCw5ATbyqsifxF2d5AnPWgflEIpjZuAUWdhYZOich+YcE
7hyCZaQ73kUhVMJkiTTVaI22Va3Aql7UWoPS2ZfJhV/U0NbMykhG+rlqz+JHGo+o
ya+3Fp5nStQCGAUyNcsxDsEycsRRwhCKWNvI2EaqrWmMOg+tSfV+AjZVyOcXyPuy
nqtLr6u+wJ3dob/P9dza5p/RepoeqpxEsaEHa5AUQs32ckFdltiT2pSZT4WxUggA
dyOMFtaNlN83jb74q22ny7ie3OUSyi1TtmriJRFw19+gnNmCsd4=
=PpVN
-----END PGP SIGNATURE-----

--/hNVoH5xZwyCFIYG--
