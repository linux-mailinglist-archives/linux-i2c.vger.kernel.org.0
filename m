Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32A625FD13
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 17:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgIGPRT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 11:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730143AbgIGPRI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 11:17:08 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48B5C061573;
        Mon,  7 Sep 2020 08:05:37 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f18so8747755pfa.10;
        Mon, 07 Sep 2020 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g55vNSScTrnl+nisc0fzhDkhn78LFpHMxyI7HLx4yqM=;
        b=OrbjCYeWU0twm1C/qjMLKL7D6tarVOqGoCfT0SpRgISsPGKNNGjHe+Px4V67XU5AqF
         mZcLDbD81Ei0ZshuZGZXepXnc9fy1HokVN26MQbh1qyK0NpGwYnHu4DgLZYrnXFzZ2pj
         bD5E1UBkVO+w2bq8WHMSYT0lNgHFGxSq88Mc5MQJnV7g7/eTL2hUGhLGTcwNbDCpwbOi
         rAnoExVQA5qaYoeWgmsQ1AyILlZAba/mZyLKlV8UAy03JUocnKylC8FsMZpXbZTrzqqV
         1Vy9ZbUADVrsg7v/R0fom51ZMmYdtFz95B/3O23UtyF+lFF/6A3mCaMA7W3Dt9mksx+G
         mL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g55vNSScTrnl+nisc0fzhDkhn78LFpHMxyI7HLx4yqM=;
        b=msugEuevyEGAoDWOzkF51GN2uTh/xYMB3DXRpX2b8nsrhBx1/B2YYL59/tJgi+NJls
         pr7XB4j7abGgoBaNnjClKK3eJonan1eqZ+nIKqLDSfcX/MD4hcJ+STt+c9CHzfPOAG4o
         GTwd6sHIgqmKdV2FfdvvEvMApUnIQeF96iz+vU7DsGufw8XNoWjO/O2/62+UTGjP7JD+
         zpSpct/fo0nsrSrfX0ZvBBqwoHwpTKRTxcJUVWUCFr6NqQzPVBll+G/AwcXou//SVku3
         Xfhq6iHDEL6o/Un/S5Pe0UgN7L1kQfbYkLAYqimV4cQGeNcoWQsAk52jUNFupv6Cw0YP
         ms6w==
X-Gm-Message-State: AOAM530AVvK9zWDX3LL8S05izRYfWre/f2XndZiiAIgGK4Be7Vvy+oje
        G6itDVTg/ExUTacqeAJADIzsBYTw9RDjMuCluGE52AY8HumR0g==
X-Google-Smtp-Source: ABdhPJxzr2FY7bs9hys6mid148H/qqm5XvQo2/UwhF8Nv355RQMyi/UDgdQM79Sxmv11q0L8exV6O7seZ9b+LZgy7uc=
X-Received: by 2002:a62:6083:0:b029:13c:1611:66c4 with SMTP id
 u125-20020a6260830000b029013c161166c4mr19211310pfb.15.1599491137175; Mon, 07
 Sep 2020 08:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-7-digetx@gmail.com>
 <CAHp75VevXe3c2LGF3jZyDfvPpRAz+-GQKvXEO4OKvuur=RgXCQ@mail.gmail.com> <f9ec5178-e38e-ed9a-25f8-21e53ccd31d1@gmail.com>
In-Reply-To: <f9ec5178-e38e-ed9a-25f8-21e53ccd31d1@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 18:05:19 +0300
Message-ID: <CAHp75Vdj7HYN0SWt9StqB8K6JrUCk7dtDhAUwYDkkBXc1R8ueg@mail.gmail.com>
Subject: Re: [PATCH v5 06/36] i2c: tegra: Runtime PM always available on Tegra
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 7, 2020 at 5:32 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 07.09.2020 11:10, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote=
:
> >>
> >> The runtime PM is guaranteed to be always available on Tegra after com=
mit
> >> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remov=
e
> >> all the RPM-availability checking and handling from the code.
> >
> >> +       ret =3D pm_runtime_get_sync(i2c_dev->dev);
> >> +       if (ret < 0) {
> >> +               dev_err(dev, "runtime resume failed\n");
> >> +               goto disable_rpm;
> >
> > As in the original code here is a refcount leak.
> > Should call pm_runtime_put_noidle(). (Possible to use goto put_rpm;
> > but in that case the code a bit confusing to the reader)
>
> Good point! I already forgot about this RPM API problem! I'll add a
> patch to address this.
>
> Would be great if anyone could put effort into changing the default
> get_sync() behaviour and add get_sync_nofail(). Otherwise this will be a
> never ending problem.

I didn't get this. For time being the API (yes, with its all cons) has
the clear usage:
a) don't check for errors -- you are fine
b) if you start checking errors, keep in mind refcounting.

So, I don't see how nofail() can fix b) case.

--=20
With Best Regards,
Andy Shevchenko
