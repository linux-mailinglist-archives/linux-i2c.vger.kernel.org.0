Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD3546EBE8
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240391AbhLIPmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241291AbhLIPmE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 10:42:04 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFE6C061353;
        Thu,  9 Dec 2021 07:38:00 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g14so20271032edb.8;
        Thu, 09 Dec 2021 07:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8lxkFDRMwg8pNfKVoAyUh19eKSO8wmq+MV5O7kUhYxI=;
        b=esWLlSPHynxWr5honL+GAEx/gqvDANyWuVRIgrW1bOxZBXPPpdzkngm0lr3iTi31DN
         taGQfbAYqHrKHjUhKXSMXiU9OZoBhG7h+0YIYUBmWV6MBnoEHyK72T0MJnQu93fGrQF/
         A9bXGbUTXq5mENYIV3z2bA93OHTcySlsg3LWFqGQuLj16ZIMJ5FaUHlw4jYj5dxFmFwR
         Ehh9Q9b3zbJlHwxaWmX9UNO7aREverDxv/1pcPAmXbdqyZDscw3Njt8a/fcAyp5Dm+WU
         jqsoCBAo2UnZKc9hd8Qsu2Hv+tGSaHlD31TP/LCI7md1zpzZ1o/mKBQaimhi0G8/JLby
         cEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8lxkFDRMwg8pNfKVoAyUh19eKSO8wmq+MV5O7kUhYxI=;
        b=KvKBITjj1VtMwW1hfhX9Uo+7FkLqOCSNuQ9vopldg8lS4AUR5mD/iSsbioCgUgEkwz
         8a8AZv7jovk543LYdadAT4xuBzEqRxhD95pa+flbvtuEj8G6aPkxzJ7cbgrReOXa0USx
         IMq7Ziyp7dZG9KefjVyD8n6hwIEEoG0jg4wKNqA8ZOgkHusGBr0wePoW2NC4Da/N2pFy
         nILJ7MFIANhZatkEsmaXgmtRwrOSp3KHdboiZJF65KlgeDWAmcq53BG+lz7a6XT2UmT+
         vMxowSvjGF1Pg/xOPO+LTEFwES8W+hp5NlklAX8lxdA5d0w2e8NbrW2SOARwZL2zwQk/
         vS8w==
X-Gm-Message-State: AOAM531pbnsiwve/lKhcX2onuirCuLXPvr8Iyj6dg12DEP7bl7o75OAN
        mLvOxeulkWyWZRuU5rShUi9kQuTthTEH7Z9BzJo=
X-Google-Smtp-Source: ABdhPJyMKzJQYJxTsKbBv+y62UDyk4QFBVKlhVjI7qC3dvWq418bPqN5fQgjAP7p0KHuljU4XKmV8Y+t89+fa5Sh8eA=
X-Received: by 2002:aa7:d0d1:: with SMTP id u17mr29711824edo.135.1639064121144;
 Thu, 09 Dec 2021 07:35:21 -0800 (PST)
MIME-Version: 1.0
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com> <976c8d73-d137-2050-ca82-18326456c9e8@gmail.com>
In-Reply-To: <976c8d73-d137-2050-ca82-18326456c9e8@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Dec 2021 17:33:46 +0200
Message-ID: <CAHp75VdzrT5z13qx-mMRdrS2=GrMOv87WaEPL5eoPO5cBiqjDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert functions
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Christian Koenig <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 9, 2021 at 5:30 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 09.12.2021 18:05, Akhil R =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
> > +{
> > +     struct tegra_i2c_smbalert *smbalert =3D &i2c_dev->smbalert;
> > +     struct gpio_desc *alert_gpiod;
> > +     struct i2c_client *ara;
> > +
> > +     alert_gpiod =3D devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN=
);
> > +     if (IS_ERR(alert_gpiod))
> > +             return PTR_ERR(alert_gpiod);
> > +
> > +     smbalert->alert_data.irq =3D gpiod_to_irq(alert_gpiod);
> > +     if (smbalert->alert_data.irq <=3D 0)
> > +             return smbalert->alert_data.irq;
>
> 0 is the error condition.

I'm not sure what you implied here. gpiod_to_irq() returns 0 if and
only if it goes to the architectures where it might be possible to
have valid vIRQ 0, but this is not the case (at least I never heard of
a such) for GPIO controllers on such platforms. So, looking at the
above code I may tell that the '=3D' part is redundant.

--=20
With Best Regards,
Andy Shevchenko
