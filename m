Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53D14B07F9
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 09:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbiBJISS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 03:18:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237301AbiBJISR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 03:18:17 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831D3DA9
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 00:18:19 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m7so4536246pjk.0
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 00:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H574A7XQqJ2i5NOk/wD0S3rN53fezDZ1/ELWgryWgFE=;
        b=Oa+Tp3QxHuRcJB/aSgRGxHd8UwAsGvC3gacfclP4+/ahWcAWX74FK03OqlzxB3iBsg
         GQRhf9gVxyecKNxaNPkl1qjXL2lnsB8O83NCkNiO/A7Jt+oknUlyF0fO37yQ/2ImHDLT
         1n+YJWq+QEdb6y8b/PIqwgTS7NuBURzoo8L/D0jG0zeyp7Vn5wjBeGWHOadk8R8G2+lm
         8pmbuy1OZkrXQTwZKvvmerXrEQW3k0QX/rOcQfJcxMfYFY4+vupO18VqImPsRvMRs5Ax
         xCEHrzMO1kEVBFtwoU91hXPH+o4EQZBQkKmyt23OQQ5uZoJRI2lYAA5N0QVsSmI6mN+4
         mC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H574A7XQqJ2i5NOk/wD0S3rN53fezDZ1/ELWgryWgFE=;
        b=ZHBJmc3qLy4s6BQJG15imVIEeWNZnVOUqPrPNc4uBwld1z9nhXOFoAT/Szxk9D2TW5
         2evU0SJUt/Tir1oliHWI6XnfImq3ZUd5maKLWkZV6J5O6SYnjwN6BJ5u13eawdAb3Ac8
         IRiJt1h7/ES2GDiCLFvxdJLLygtVb1fWfFof8hD1zhWcPuHs7/lafnbMer38jrxMvhxm
         k7AldZiSqbBzXP1YteQV/cV9ZFr3U06DKtykjb3HNP/54gD7uSdOZ5RdL/F1dt4bZ6h4
         AE72iitGzqjcaRnYrL+U6ga+AWce+zZjPogWql/w+p4nFqaUPmupH0Q9PC0DxraoMOUk
         ZxHA==
X-Gm-Message-State: AOAM532UDc1C6uzzbh+T7vBZ0oAdbfr0YSdxOi5/+8r7KhWiXfu3YJ4H
        SAcyUqJcRKHVQqQTHxH0M5TFuxZEfXl1ZEW/rNU48A==
X-Google-Smtp-Source: ABdhPJwrKcbOYPJEbU39Gd2dmmbqdwqqtinc327Thc2Xjkz4zVZ//YkeDIVkAuLI2XRNsUtZ+htTSuFHX/0/KqwX34Q=
X-Received: by 2002:a17:902:6b4a:: with SMTP id g10mr6467923plt.57.1644481099048;
 Thu, 10 Feb 2022 00:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20220208141218.2049591-1-jsd@semihalf.com> <20220208141218.2049591-3-jsd@semihalf.com>
 <YgPdYw6hDoN198Hf@smile.fi.intel.com>
In-Reply-To: <YgPdYw6hDoN198Hf@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Thu, 10 Feb 2022 09:18:08 +0100
Message-ID: <CAOtMz3OJNopHKgKDvGNfVWwvvo57=LyiRcnT+x6TxwLb+hgkyw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: designware: Add AMD PSP I2C bus support
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
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 9 lut 2022 o 16:28 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Tue, Feb 08, 2022 at 03:12:18PM +0100, Jan Dabros wrote:
>
> ...
>
> I have noticed code duplication.
>
> > +     status =3D psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> > +     if (status) {
> > +             if (status =3D=3D -ETIMEDOUT)
> > +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP t=
o release I2C bus\n");
> > +             else
> > +                     dev_err(psp_i2c_dev, "PSP communication error\n")=
;
> > +
> > +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive hos=
t usage\n");
> > +             psp_i2c_mbox_fail =3D true;
> > +             goto cleanup;
> > +     }
>
> > +     /* Send a release command to PSP */
> > +     status =3D psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> > +     if (status) {
> > +             if (status =3D=3D -ETIMEDOUT)
> > +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP t=
o acquire I2C bus\n");
> > +             else
> > +                     dev_err(psp_i2c_dev, "PSP communication error\n")=
;
> > +
> > +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive hos=
t usage\n");
> > +             psp_i2c_mbox_fail =3D true;
> > +             goto cleanup;
> > +     }
>
> If you are going to update the series, consider to introduce a common hel=
per.
> Otherwise, consider a follow up.

Thanks for your comment. Since Jarkko is running some long-lasting
tests with v4 patchset, I would like to keep this as is for now (and
make a follow up commit). If there will be some additional comments
for v4 from him and will spin v5 - I will introduce a common helper
function then.

Best Regards,
Jan
