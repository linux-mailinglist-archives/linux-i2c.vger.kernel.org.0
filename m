Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C3C610FB3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 13:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbiJ1LaV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 07:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiJ1LaT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 07:30:19 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6757F58E88;
        Fri, 28 Oct 2022 04:30:18 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 21so7449799edv.3;
        Fri, 28 Oct 2022 04:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUajMV/FZ77vjl9lwbZ6ebll6IaBZ9txNULgu7luk0c=;
        b=V35aEfXkL4i2nEW39sxqEqLq9c3kFAZbvrkGTLPgapAWy5irosIDiEr1KcSremRZx2
         17S/VJPuqjyxG6cMBd2FG1kB/1XbQi8JM8/9lf416FgvIPPz8WNFVCvQi0cIkwB+O9uE
         FHrd9PllBJk0pEESGQLi/zy49AbX0EXND5f7yfEfHTiPUOxq7GLxBstLrkJ/WoZhESe1
         FWjZtpMJj/lx/PcYPYaUcwxxtv0v5pWs+u8u9/X9wQttzCFBPGqE2pi5m2vOfVtoZZs8
         wHl6NETeCEIl+lGGNH3K2EkiFmECYa2mCJYv70irNCrdpsXRNi37C4YFIBSPapwaM2kA
         nlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUajMV/FZ77vjl9lwbZ6ebll6IaBZ9txNULgu7luk0c=;
        b=LW2WAjL/51yv4vBZcTn5vENvLcYbfouDAue0+2aUqGj3w20xpfIs+tFANikGuw+gCf
         L3TvJ3jMkVG8eGC+xaaBM5XBmhMiXe5PRQ2gZxUvnW9r6N2tb4bKVfF84f70aGlapSYF
         UfSg24TAdQ1qpfS+c+Itbl2ocopM0UvDDhta48BQejjnY5FsmteETymubl/d7iyTuVtl
         9DgDmppyuphz/PhG8jXIKbg9HDHeXZm1guby/1VdY7mPg/H76Gh0ZvPHPdcDjOoe3XTn
         XlxzP6jJvcTN63Ia1tislXh01kW1W7XH70Eum5RogqYjP29WvbQC3ztuo/CN0HmbDKPs
         JfmA==
X-Gm-Message-State: ACrzQf1RhillkA4q+h4Ncv0qW6re2IKpH5AVcdFw/0Erogu+UYR0ZfJV
        VqIzESnW1nXyM5EtzhD2l9Y=
X-Google-Smtp-Source: AMsMyM7hAXpqKzHa0WUK4Hxs9UhGHtgO9AD83G2D+y9hWbTPUXY13S6uplP0CcPryl4w1cWe6VA1Kw==
X-Received: by 2002:a05:6402:4006:b0:461:f4e2:82e0 with SMTP id d6-20020a056402400600b00461f4e282e0mr20987189eda.68.1666956616920;
        Fri, 28 Oct 2022 04:30:16 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b15-20020a170906d10f00b007abafe43c3bsm2031144ejz.86.2022.10.28.04.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 04:30:15 -0700 (PDT)
Date:   Fri, 28 Oct 2022 13:30:13 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wayne Chang <waynec@nvidia.com>, Rob Herring <robh@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, "kishon@ti.com" <kishon@ti.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Jui Chang Kuo <jckuo@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Message-ID: <Y1u9RUv8twZF9uwm@orome>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-3-waynec@nvidia.com>
 <20221024145446.GA1763588-robh@kernel.org>
 <52ae737e-eb4f-9eb7-8b79-d58251062276@nvidia.com>
 <f5d2c979-a61c-e0d4-7a08-5b6f5b38dffb@linaro.org>
 <c8039494-9fb7-c72e-a852-8bde13c0a61d@nvidia.com>
 <8194796b-9845-cd02-a542-0bc0d66b4617@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7Ij0/INtbn8XA1A3"
Content-Disposition: inline
In-Reply-To: <8194796b-9845-cd02-a542-0bc0d66b4617@nvidia.com>
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


--7Ij0/INtbn8XA1A3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 12:07:38PM +0100, Jon Hunter wrote:
>=20
> On 28/10/2022 10:25, Jon Hunter wrote:
> >=20
> > On 28/10/2022 03:19, Krzysztof Kozlowski wrote:
> > > On 25/10/2022 04:02, Wayne Chang wrote:
> > > >=20
> > > > > > +=C2=A0 power-domain-names:
> > > > > > +=C2=A0=C2=A0=C2=A0 items:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: xusb_host
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: xusb_ss
> > > > >=20
> > > > > Drop 'xusb_'.
> > > >=20
> > > > The properties are constant and we use the name to get the power do=
main.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0tegra->genpd_dev_host =3D dev_pm_domain_att=
ach_by_name(dev,
> > > > "xusb_host");
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0tegra->genpd_dev_ss =3D dev_pm_domain_attac=
h_by_name(dev, "xusb_ss");
> > > >=20
> > > > we might not be able to drop the xusb_
> > >=20
> > > These are new bindings, so why do say they are "constant"? New bindin=
gs
> > > means you did not use them. If you used them before bindings... what =
can
> > > we say? Don't?
> >=20
> > Not exactly. However, what we should do here is convert the legacy
> > binding doc [0] and replace with this one. But yes we are stuck with the
> > 'xusb_host' naming.
>=20
>=20
> Thierry already has a patch to do this [0]. So we should fix that up and
> included in this series.
>=20
> Jon
>=20
> [0] https://lore.kernel.org/linux-tegra/20211209165339.614498-3-thierry.r=
eding@gmail.com/

I have a v2 with at least some of the comments addressed. I'll go
through them again and send it out. If we can get that reviewed, it can
be included in this series and the Tegra234 addition be applied on top.

Thierry

--7Ij0/INtbn8XA1A3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNbvUUACgkQ3SOs138+
s6Fa0Q/9EKJnNz9Xf4kL0Qh2galCEt8TqgYwD0b9wPG2Y0qT48Ruux/nxUQsmqAp
NNh9qsA8QDQq7dPeyQu98rnPmeiA4QYXI9VEtqxwdwJS4L3S8M+lQSd1SfrWJh7n
RJZXVYmiqddCjoVbNpr9BNNgHwzEBy/QmugeQRQl4PadheM1VpF1CGocd1x7sI30
aIjMmjO8yzVyfj9WHNoiWq+IjiByk9Yrgnrs18JjWR/6vFD9lBxIUqSKEbap9Fck
HqiPKdF4Bi8Ha0Xa5Ztp49L86UkWlKa7/162BKPaxS27XpFYBmQaCb8ZA7ZFjLCH
v7u7KsxscMEac7riJwV2KEZGQLyqtI6M8eSlBCPR/7Ra6utKCxQeCqd4EIR52bij
pYiFQgFJCwK5gLfLUoFarfhcmZ2TMpiAPU8bt4Erp6qrC3GA/gV66LLAXuDGkR64
n8u5ARPNC+WztYokhWpctiujRBOa8VWrK8wPQhM+Ng3lJbKWEJwG0/4/ZWQFTljQ
GVErNKlx9f0sBgbh/qWTa9geGJI9hhFp77es5u4r0rymFr8vd7+EnZjwBp1BzQqJ
yFyL8rWkJ6j8tPZBqC63+QTBuTHS5XludSuSvzuGS3fAIgvcNuhAS6mAoQuL5ZI9
7Q8voktDR5a94kkLK0qQYjFewCCcjqrk+BoZNWbBbP/wxpsSaBE=
=pOcc
-----END PGP SIGNATURE-----

--7Ij0/INtbn8XA1A3--
