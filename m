Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B2E4ADAF6
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377874AbiBHOPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357033AbiBHOPg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:15:36 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908DAC03FED0
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 06:15:35 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id b3so583877pfg.7
        for <linux-i2c@vger.kernel.org>; Tue, 08 Feb 2022 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LXSv8hqgFIfSvy/vUmuBy6laJV3E0bBQocpR/QGdDDw=;
        b=q3nUTbmKIFWlU/OTXUEa/H0xEs+ZfN4sePTEYisCm0njLnygF6ppTYefATn5TN67lX
         8dXGUyHODY36+JV/0UuGAPi5C9Ea5VKVknAWLWdVkvKAXwZ8kXnxnLLY0xa0Hxev+oYR
         TTxM+OGm12dgNPatAcad/6ktnL+Hq5HVm/G/Bbu5dS6wqlh5dHCc7uVvHT3gPvcGz6ye
         XFDsFLSygCJ1NLklUGHDaSkBALVhdbNxfM/ZJSJc/ftasrT2v5afz4pW2JsLLLcPNFSV
         FazjNI8bO6HAJ84xRZsDUEMIH5eAt04ejbgyd4CNx7Yw4x/88e2vK2r7jahLOCPBdE7g
         Wcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LXSv8hqgFIfSvy/vUmuBy6laJV3E0bBQocpR/QGdDDw=;
        b=YMrj6KFNAO34TC/LSk/XUQkXboEV8W17yFEa7jGAaKm0Jq9Ht0TJdnobDuc8EKDtc+
         kXlPUrMI/je/EUAjqsu/ckv4yE7nOIaL7HTjM6yqI5hYsiStys6cEqEZzQYsb4CmZMAH
         BinUABbUhGzZEN28sgEIAZwaEHwyqPxMWiXCYw5gWerDca1ZkZQfhwBdCWgu85DAHQB1
         tVIp4TkgxXg/WDa8XXZxdP5nX3IXJguVQQZKG/2dk6y9RiL7xeV1pch4cJtl55SZQPdl
         IH4stgqdc/VFlBLeR+ADiY2/z7jibjxowU8QPxl8/aglxD1rUM8sWec2ZrXX8kSdQrEY
         /cvw==
X-Gm-Message-State: AOAM532JVyOZ+Krkhj3L/JA3jmhZ9B7CvaAj8igYkKsbNyZ/KhSGBA8q
        5bJ88ZLIV0qoIwKfgQYfjSrdFJWhorYqEBER0F49HA==
X-Google-Smtp-Source: ABdhPJxi1fRQv5HfPGz6ZVLmAdi+/PJyFOytcefJpm786JHMNaapMLTxE7gICjI7kTmTb9uj1eI+LPha+In/oZrHTy8=
X-Received: by 2002:aa7:8484:: with SMTP id u4mr4550457pfn.70.1644329735103;
 Tue, 08 Feb 2022 06:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com> <YfqtkBIZZxp2Au2l@smile.fi.intel.com>
 <CAOtMz3O_j5-0ZLJngQpzQSGduhZVnQ8awBvGkMdUQWAX8nN5Hw@mail.gmail.com> <YgEFWN8K7Yh452GY@smile.fi.intel.com>
In-Reply-To: <YgEFWN8K7Yh452GY@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Tue, 8 Feb 2022 15:15:24 +0100
Message-ID: <CAOtMz3P18emF_1tPvXzckVS8V4DWYB6Evqu+V6PsXN6L2YH2aA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 7 lut 2022 o 12:42 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Feb 07, 2022 at 09:27:12AM +0100, Jan D=C4=85bro=C5=9B wrote:
> > =C5=9Br., 2 lut 2022 o 17:16 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > > On Wed, Feb 02, 2022 at 03:43:02PM +0100, Jan Dabros wrote:
>
> ...
>
> > > > +struct psp_i2c_req {
> > > > +     struct psp_req_buffer_hdr hdr;
> > > > +     enum psp_i2c_req_type type;
> > > > +} __aligned(32);
> > >
> > > I forgot if this alignment is requirement due to DMA or so?
> > > We may use ____cacheline_aligned in such case.
> >
> > I used some old code as a reference - this structure is mapped by PSP,
> > thus alignment applied here. I'm checking this with AMD whether it is
> > really needed or at least can be somehow limited - still waiting for
> > their response.
> > I propose to left this as is right now and eventually remove or make
> > more liberal in the future.
>
> Would be nice to clarify sooner than later.
> In either case it needs a good comment.

I confirmed that we can remove this alignment completely. Removed in v4.

Best Regards,
Jan

>
> ...
>
> > > > +     return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp =3D=3D=
 expected),
> > > > +                               0, 1000 * PSP_CMD_TIMEOUT_MS);
> > >
> > > 0?!
> >
> > Yes, we are checking for readiness of PSP mailbox in a tight loop. We
> > would like to proceed further quickly as soon as this bit is set.
> > Actually checking this twice per every ACQUIRE&RELEASE - once before
> > sending command (to check whether PSP is ready to accept requests) and
> > second time after sending it. Do you think we should increase
> > @sleep_us value?
>
> It depends on what you have in mind about hardware. I'm fine with either =
way,
> but 0 has to be explained (in the comment).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
