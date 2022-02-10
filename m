Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB604B07E0
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 09:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237016AbiBJIN3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 03:13:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236402AbiBJIN2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 03:13:28 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706231097
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 00:13:26 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id r64-20020a17090a43c600b001b8854e682eso4872589pjg.0
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 00:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bO+Jcgpt393mmvw7hWqpbnpyQZTC3EQ5YNZf+mvO9Jo=;
        b=bhUyXrrl/fStj/Fh/OyKQCL0uj7GVwTOaqiqNoImZLt8mbSfBxz1s9YHa90GH50xju
         fLB1kUWp6kNCp/FuMt2VI/naCioRLhe2eISZqatWYyAULvXPm+M1+kDDGyFLIU2tSPHz
         ky5jcxEQUtv4TJMhllTMaGL6eB4U7R2foF11jx+NdziYQ1KMT6IAmmw4A09Xev89YkmW
         xw7YKZc/qXCBc9L3zhbShL8fwTdJ3skyINkPO8nYfcKuY+OPEcQSiVv0Rn3dCvH4eHyb
         s0H2ur7mck3uxoR7mJHMUkXXLFWsilwkMk8nPQ2DdvW5xtU+ezAj4m7XUg+CR05uT5/2
         00mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bO+Jcgpt393mmvw7hWqpbnpyQZTC3EQ5YNZf+mvO9Jo=;
        b=EATAYCOdXIcpQXAiVmG4QUAAp6wY3uXEycp7AZVGqRQolg73uVC2oFzzKg9v8UoSa0
         usnSFVOawi0v8Cm7FKWyKoYIA4pkUUX0U5abunil+OkX/BufA59AndxuUp54/4381FqW
         CulGNjZReaJIhmrhOEjWZFrE54twwWZZAtaHdFP02Crc/JG02dyfbz0FKpwY2okEmgpj
         L8QMlRODx5d4Ju1oKqALZ3gi2dv9k4TsMqLEqyy0n2k1fgqrLYXPKkfyRiYm6ijaD1bA
         lHx+WEnh7lJyVFg7/Sqv8QTNdG28iyznyr9wYwjFvCuLAUbIO1oadkVRBNx5Gpkf3JV2
         iF+A==
X-Gm-Message-State: AOAM533KohPmbY64MVfcyUuv5XxSsWNsx3Qx3aTgbnhIArMvJDFpINQ/
        3qnGWBfokj7AW6Fis6k0YU5T2yRR3T83+TPmxZJRIg==
X-Google-Smtp-Source: ABdhPJyT5/JbvvVvpH2gdfpK9WJPLlUlqqwiwN1MC0YK332Oj1cOtTLaNGarMrSWWTO1Qo/JHFoy2RJWCkYXB8lDd28=
X-Received: by 2002:a17:90a:348e:: with SMTP id p14mr1555020pjb.71.1644480805969;
 Thu, 10 Feb 2022 00:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20220208141218.2049591-1-jsd@semihalf.com> <2551b3f1-0dc0-aaf1-680c-9634d2a6b65d@linux.intel.com>
In-Reply-To: <2551b3f1-0dc0-aaf1-680c-9634d2a6b65d@linux.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Thu, 10 Feb 2022 09:13:15 +0100
Message-ID: <CAOtMz3NX=J3YZa=1tORZA6eLxYpFQb=zChB5gRrQX6BHG2zTLg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] i2c-designware: Add support for AMD PSP semaphore
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 9 lut 2022 o 16:11 Jarkko Nikula <jarkko.nikula@linux.intel.com>
napisa=C5=82(a):
>
> On 2/8/22 16:12, Jan Dabros wrote:
> > This patchset comprises support for new i2c-designware controller setup=
 on some
> > AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the s=
ame
> > controller and acts as an i2c arbitrator there (x86 is leasing bus from=
 it).
> >
> > First commit aims to improve generic i2c-designware code by adding extr=
a locking
> > on probe() and disable() paths. I would like to ask someone with access=
 to
> > boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to veri=
fy
> > behavior of my changes on such setup.
> >
> I'm going to run overnight with both patches a test case that used to
> cause some activity on a shared I2C bus on Baytrail based MRD 7 tablet.
> Test below used to trigger system hang after a few hours - days before
> some PUNIT - graphics related issue was fixed a few years ago:
>
> #!/bin/sh
> X &
> export DISPLAY=3D:0
> sleep 2
> xclock -update 30 -digital -geometry 500x50+1+1027 &
> xload -update 60 -bg black -hl red -fg green -geometry 1916x250+1+774 &
> sleep 1
> xsetroot -solid red
> xset s noblank s off -dpms
> glxgears >/dev/null &
> while :; do acpi -b; sleep 1.2; done

Thanks, looking forward to the results.

Best Regards,
Jan
