Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25AC6D1F96
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 14:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjCaMDp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 08:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCaMDo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 08:03:44 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2151D2C0
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 05:03:43 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id i5so88850452eda.0
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1680264222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvpanDpmgQzo+IJuKwRssPcOKKFhL0eqeo7b4Notpck=;
        b=uQKOmGp0Gybt7jzt4El8hPVsNIq2plfx94hOpHU08LxZZmwI1iQymIbCH3eeKzLLmC
         SvHw4yAHKpfb0e9HDbWVg8d6d/SLXlkOx+2DfyFy1yv28JHAD1X9pLJyMT0aaFw9pMwv
         wdKLLhwSnsN+3oJYFqTDsAqTLaV8z5cISbkt7xqfqJLUu8/XA4pgmEiZ4CmeJ3vx5F9u
         vEjcMrarCShuZrwhc0bQONmrlioL2IQYJn8DhWwJUdWuezvpJhbrnz+B5/Nkv4T5VDX7
         GN/WSEMBG3ZImDtp8XXw1ElFWIc6FYAMOuaCjlf5sEMW9Mk2ZRZYlFL5+XeW9TafuU9s
         3dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680264222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvpanDpmgQzo+IJuKwRssPcOKKFhL0eqeo7b4Notpck=;
        b=2evkcV21XsS1w92KVlbRjq1tRVdaVVpdRBfuo1FsYO61+5IwvAcHS9aH78lPgfvQjA
         dz9svsEH1VD2trCTJAhpxP7F2/mi94lA7ybq1Me5ITnz0t2PHb5Xyrk2aovKIh5WK4sO
         gR62T/pNyvMdNrknPBOQMPzdTm/X7tVIMegUp42yiVV2er/Exkc/Pq3w6AGWtk+4vldp
         FW1Iighps4lrM/pCm5olSIs8MXhBf0+/dNvpa6qYCDQhO044r5vaICEjVrsH+OzgjFhr
         SyHbI+92cfHvVD5biGVUF2yoiaFDoZQl+IGN33cw6OpR5/PFY75+JY051BbNt60ZHQ5R
         mANw==
X-Gm-Message-State: AAQBX9e/4vqMzbBHhmcfhS+w8VnvVQK/WGR9PN58JWoeX/prKAIrog/K
        TIwj27r03jkIXnDzuyQGy3at5n3qSeWo5YZwUBM3cw==
X-Google-Smtp-Source: AKy350auLwK/f30Au/YR5qV3+qpAk+WWeAUxkC/6ZH1s5UJlAZng+RL0EVVFDgiaVoWt7EX217UteZS/1CvRyPZ/ZB4=
X-Received: by 2002:a17:906:2416:b0:932:4d97:a370 with SMTP id
 z22-20020a170906241600b009324d97a370mr13090651eja.14.1680264222072; Fri, 31
 Mar 2023 05:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230329220753.7741-1-mario.limonciello@amd.com>
 <20230329220753.7741-6-mario.limonciello@amd.com> <c298b247-1bdc-340c-ad7d-df3653cc9027@linux.intel.com>
In-Reply-To: <c298b247-1bdc-340c-ad7d-df3653cc9027@linux.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 31 Mar 2023 14:03:30 +0200
Message-ID: <CAOtMz3P5eCLZiQiPDs-iG6EdwLZHsNeEmSpPXFjJXcEBQ=retg@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] i2c: designware: Use PCI PSP driver for communication
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Felix Held <Felix.Held@amd.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 31 mar 2023 o 13:53 Jarkko Nikula <jarkko.nikula@linux.intel.com>
napisa=C5=82(a):
>
> On 3/30/23 01:07, Mario Limonciello wrote:
> > Currently the PSP semaphore communication base address is discovered
> > by using an MSR that is not architecturally guaranteed for future
> > platforms.  Also the mailbox that is utilized for communication with
> > the PSP may have other consumers in the kernel, so it's better to
> > make all communication go through a single driver.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> > v6->v7:
> >   * Also imply CRYPTO_DEV_CCP_DD to fix build errors
> >   * Fix error message acquire/release inversion
> > v5->v6:
> >   * Drop now unnecessary asm/msr.h header
> >   * Fix IS_REACHABLE
> >   * Drop tags
> >   * Fix status code handling for Cezanne
> > v4->v5:
> >   * Pick up tags
> > v3->v4:
> >   * Pick up tags
> > v1->v2:
> >   * Fix Kconfig to use imply
> >   * Use IS_REACHABLE
> > ---
> >   drivers/i2c/busses/Kconfig                  |   3 +-
> >   drivers/i2c/busses/i2c-designware-amdpsp.c  | 177 +++----------------=
-
> >   drivers/i2c/busses/i2c-designware-core.h    |   1 -
> >   drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
> >   include/linux/psp-platform-access.h         |   1 +
> >   5 files changed, 29 insertions(+), 154 deletions(-)
> >
> One note below in case there is a need to have another version of if you
> want. Not a show stopper for this.
>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>
> > @@ -214,7 +95,7 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2=
c_req_type)
> >       if (ret) {
> >               dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C=
 bus\n",
> >                       (i2c_req_type =3D=3D PSP_I2C_REQ_ACQUIRE) ?
> > -                     "release" : "acquire");
> > +                     "acquire" : "release");
> >               goto cleanup;
> >       }
> >
> This looks like worth of being an own patch. Maybe even for the
> linux-stable. I think it's very useful to have an error message to show
> correct information what operation actually failed.

Msg here is "TImed out waiting for _PSP to_ %s I2C bus" - when x86
wants to ACQUIRE the bus (i2c_req_type =3D=3D PSP_I2C_REQ_ACQUIRE) then
PSP needs to RELEASE it and vice versa. If you think logic here is not
straightforward and should be adjusted, then we need to change the
whole sentence.
