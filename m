Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91E0F4B1901
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 00:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345399AbiBJXFU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 18:05:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345396AbiBJXFU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 18:05:20 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB7B55BC
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 15:05:20 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id x4so3179425plb.4
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 15:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=qNkOMQl8A7JQLLAN3dPQVZBYTQmGZfJ4kUvqGnhtRTk=;
        b=xdBflYLnhxEHNH6JIJuACj7OdWdgrvGdKoSrMPDYXmcLbjoiN+G1T37ecYmXol7rXR
         B5vW+i/XKfhbdlk4c3Z6m+rXdO42mLs5N/2Ez/yio5Kyu9Az4E8eWKVrqALUXh7YEPc9
         knBXltFv1ZPUzGFiiwHGeq2VY4hb/gOJzUJpPI7T0+qQJ1ZPDq7TBqfHin5+ywTLUBuh
         7XPTS0bdKu7tvfqjIIbFXDGvJfz7FWYf5Rn4EWXK4IV2lkV7c8d4ENtaF/Q5a6gcvW46
         pbFnGl1rAhyQ1lHgKmKSRugUVy303WZBK0T4pZQV4aKzeL5mStH5SfI8q9wkIQGkLHCc
         Eisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=qNkOMQl8A7JQLLAN3dPQVZBYTQmGZfJ4kUvqGnhtRTk=;
        b=Cw/kD3Y2RoQ6nGwa9Dw5jfCBKTOGAvm2HKiHvVTqgqQ0gv9Z86pCFfuXPKZaZUk5JW
         RfhzaJZCzaZhhmT8BofYRO219JARB7aDKk82AQMVtCLZaC0EnjBCNzObTdBw9/GzqP/I
         YE4PU37wky0MMdYxjqi6AA9TbEjvVkBIWxP1kpKku6Uhvm1cj2SEHytY6xAJcpqlOkwL
         zF6tuywkXzD2qYt3Go1tM8qPCLDSbcWg5a1DiqAI1BgWMDDqBJPjXuYOYm+vqlyO0PF9
         hlsGd3LVp9H6J1AS+WTzDrnZCkNEaOGjyC2R4kO9k1zQEGqgJd+CTy4s3PtpfrJAhanv
         xD7Q==
X-Gm-Message-State: AOAM532RS0SVTqOfUOG2zFaN+Su31sRxfsujgLdaYSRvYXHfC1p1lS8E
        sPZB/VTZDq1XdZTxSPgNMtJbiWWXVPCdLydgBtDu2g==
X-Google-Smtp-Source: ABdhPJxaI7jmbXG/8FmqFKX7oMH4/7grnAKgz27+XnP7j6Wyj40STiwkaL0zsugwZ2UI/3p5t0dwMy6xeaBf7lvTR8U=
X-Received: by 2002:a17:902:ec82:: with SMTP id x2mr9821081plg.139.1644534320059;
 Thu, 10 Feb 2022 15:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20220208141218.2049591-1-jsd@semihalf.com> <20220208141218.2049591-3-jsd@semihalf.com>
 <YgWNE05eVK+LijL/@kunai>
In-Reply-To: <YgWNE05eVK+LijL/@kunai>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 11 Feb 2022 00:05:08 +0100
Message-ID: <CAOtMz3OyYXeyrpcSUpHZCR4tqroKWd09gYsjsU2W_idt8udMbQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Wolfram Sang <wsa@kernel.org>, Jan Dabros <jsd@semihalf.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
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

czw., 10 lut 2022 o 23:09 Wolfram Sang <wsa@kernel.org> napisa=C5=82(a):
>
> On Tue, Feb 08, 2022 at 03:12:18PM +0100, Jan Dabros wrote:
> > Implement an I2C controller sharing mechanism between the host (kernel)
> > and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
> >
> > On these platforms we need to implement "software" i2c arbitration.
> > Default arbitration owner is PSP and kernel asks for acquire as well
> > as inform about release of the i2c bus via mailbox mechanism.
> >
> >             +---------+
> >  <- ACQUIRE |         |
> >   +---------|   CPU   |\
> >   |         |         | \      +----------+  SDA
>
> Applied to for-next, thanks!

Thanks a lot!

> I fixed the following checkpatch warnings:
>
> CHECK: Please don't use multiple blank lines
> #232: FILE: drivers/i2c/busses/i2c-designware-amdpsp.c:92:
> +
> +
>
> WARNING: braces {} are not necessary for single statement blocks
> #361: FILE: drivers/i2c/busses/i2c-designware-amdpsp.c:221:
> +       if (ret) {
> +               goto cleanup;
> +       }
>
> Please also use checkpatch next time.

Ooops, sorry for this. Actually I used checkpatch till v3, but forgot
to run this on v4 where this change was introduced, my bad. Will
improve going forward :)

Best Regards,
Jan
