Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C286B46FD05
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 09:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238747AbhLJIzO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 03:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhLJIzO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 03:55:14 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C948DC061746;
        Fri, 10 Dec 2021 00:51:39 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w1so27471255edc.6;
        Fri, 10 Dec 2021 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qoy86E6xdZKO6S/hVw3NpThoOmfROdvRvdZsaI2avXI=;
        b=Zu4UsWq5769nhyV6CnhQ2qvKw8Bu5hHU5DRymcELHiP/DE978ugrtzbx7ta8ylw4yL
         oy+E6fnToerF3hKGE5eMAXtdwPVM1sH93UF5lkjshucBWNbTI+GCrwK19lAbUg+kdR12
         ijRNYeLL1J58LQh2aG+ItlrKWN+u/6tuyxFzJNJVGGkSMHhrL6fPgr1vXYw288boqYQU
         BP3fdHD9hIE5Bu2aqfMGFYzX36adVVIgF1twARfJJLbpu0TWgB+qyZ9QosCLUrDuRgEg
         lv9II0DHGBJURGwXfQUwP2HJbgSMIz67klpAMbSqJkoCA65gyV/cE49Sa+st1ozg9QLK
         vT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qoy86E6xdZKO6S/hVw3NpThoOmfROdvRvdZsaI2avXI=;
        b=ukdaiYg0rQibE7rCc+HYPiYtGncAFkP6DlF4hB5zc2gxtKPALY6H4cIGnI7jmYrAOl
         y4RRDoH0GuDMpl2XsoqGvt6EUMwiw0Y+g45XJHdQYiLSB5/PZRKUh40UTOlPV/pmBj1u
         qT6ak1F26J/eIQDhk4i50YDBioYvPxzk0g+0YMQWkMyNA0eCK5Qcnc6neg7ekvvCMPZs
         oK90MHLQAFFNKXPFReTZffc0dIr/ejQthhyyHlLSNfrD0mxrkfdc2PUmRLzLCVcDdmHB
         oO5PY5AmCiJ+BmyH21ctR6TNbMCsgto07mQFnacrOdiKU8WZova1RKxcMrwewzdAxWQt
         O61A==
X-Gm-Message-State: AOAM53266Om08XC7BqvT839ELFXZHyZiyeoF/KSmKjl7ebvsPDMJdbGU
        9EIi41ObbCUYFP5DRpRWVeEN3x5xdjzBFeDU/oI=
X-Google-Smtp-Source: ABdhPJxHNSUve/zOGwzcv3MOGMFIFLskV6+kpZsEcy6Ojesw+HwCpEVpm+8mALw689m6K2essJt/qel6eRAdZ92B/Is=
X-Received: by 2002:a50:c35b:: with SMTP id q27mr36451152edb.154.1639126298341;
 Fri, 10 Dec 2021 00:51:38 -0800 (PST)
MIME-Version: 1.0
References: <1639067318-29014-1-git-send-email-akhilrajeev@nvidia.com>
 <c9eceaba-df4e-0e75-d6a7-87cfdf45fced@gmail.com> <BN9PR12MB52739E656160D234F5694C54C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB52739E656160D234F5694C54C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Dec 2021 10:51:02 +0200
Message-ID: <CAHp75VfWrwPmMzbX5uYPgiXo_h=wtG=qc-VMFujJ37hR1ntV1A@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: tegra: use i2c_timings for bus clock freq
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 10, 2021 at 8:43 AM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> > 09.12.2021 19:28, Akhil R =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > -     err =3D device_property_read_u32(i2c_dev->dev, "clock-frequency=
",
> > > -                                    &i2c_dev->bus_clk_rate);
> > > -     if (err)
> > > -             i2c_dev->bus_clk_rate =3D I2C_MAX_STANDARD_MODE_FREQ;
> > > +     i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
> >
> > Was this patch tested at all? Apparently, it wasn't compile-tested.
> Sorry, it got somehow missed as the build did not fail when prepared
> the image for testing. Thanks for pointing this out.
> Would fix and update.

It is because Dmitry runs `make W=3D1 ...`. Otherwise these types of
warnings are hidden.

> > drivers/i2c/busses/i2c-tegra.c: In function =E2=80=98tegra_i2c_parse_dt=
=E2=80=99:
> > drivers/i2c/busses/i2c-tegra.c:1635:13: warning: unused variable =E2=80=
=98err=E2=80=99 [-
> > Wunused-variable]
> >  1635 |         int err;
> >
> > BTW, MM, DRI and media mailing lists have nothing to do with this patch
> Even I was wondering on this, but apparently those lists are shown if get=
_maintainer.pl
> is run. Would remove the mailing lists going further.

I would recommend using my script [1] which has good heuristics.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.=
sh

--=20
With Best Regards,
Andy Shevchenko
