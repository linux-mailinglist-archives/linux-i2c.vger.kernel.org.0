Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38104B1132
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 16:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243369AbiBJPFM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 10:05:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243366AbiBJPFM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 10:05:12 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1A2DB0
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 07:05:09 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id y7so2063792plp.2
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 07:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mfykEeq/PTWMM19FDkGyT6i2vjI4PN8vGRSXZaauxBA=;
        b=J99beh/dFKbwczl+iefr85tYXygTDqzfmcp4hD5snVXbMessrrsZcFNMwOihVibpjf
         l0zGtzlnzw5SD3iCmXiusUnz1nRyHcdbs05hmQ7s5vaaNX8n8YVxawCGYYB0RbDUzmPa
         nKicx9V4k29lZtUW5XcLf5qSj4Yh9RPGSUqwYt2Ypr4sEGQrYLdmZ6knOfjJ8D5AvMyw
         bS3jU2Zocl3m1w3iYKzy90frCk2g6+k9igHjJ6fXlZZ5h3UH4cbwJN+5Qet/TP6pQs5C
         Ug+CjjEI1+XL6I9wAobYFdmLYRSzJbpDrXi2nXDTQ3nta5yP6HRXyuMgRtDawx7GTmMI
         olfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mfykEeq/PTWMM19FDkGyT6i2vjI4PN8vGRSXZaauxBA=;
        b=B99lZxQ0zf9q0H6RS53auIsM8TXsxdLbJi1Wa7H/kyvCCa8Twe0knT5BO5CcksaJDr
         7X1tYfw0ziqSITbCDen4Lds7yG+nYi5NZQh3JZ7c1qP3N9voiXDCO/4QbWEiO2Qnm85l
         uPXLe/tJxq/hDY+ui1bFryDUnjth5fJfGT8O4cSXLbkrjwuxh4eUnZXpGpU1rZn7N4D+
         dQ0OHCOjr2oh2L5nyOLkAtApHEmhBYzAQFk6hcPmxVhmXWvyQHpVEXxARiTMEFIo1qJo
         NwHh3FPK5zGm0Izm1rPpwMhWLudLbmr0D5hWBuoIlhYsLy66KnGvVDT8Gpq4m2GBtAlT
         6ZGA==
X-Gm-Message-State: AOAM533hFvORFc/zhX8LcCu+p9SKze2JjV9OibUMeUiYIs86n2vghAN8
        rRFs4CllGuhX80yI0cxo0honb7ddgGhWycaxBVOVpw==
X-Google-Smtp-Source: ABdhPJwr4x3i6Nf67loyk6jbAiodHIl76q6PyyG31Ql4a+v7heG0BPTUUYhiy61JclAE3o6aFw2oDqlYIQIEv9cDwGE=
X-Received: by 2002:a17:90b:4c08:: with SMTP id na8mr1472697pjb.90.1644505508583;
 Thu, 10 Feb 2022 07:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20220208141218.2049591-1-jsd@semihalf.com> <20220208141218.2049591-3-jsd@semihalf.com>
 <YgPdYw6hDoN198Hf@smile.fi.intel.com> <CAOtMz3OJNopHKgKDvGNfVWwvvo57=LyiRcnT+x6TxwLb+hgkyw@mail.gmail.com>
 <87fcba54-b54a-ea20-63ba-f447f4d34506@linux.intel.com>
In-Reply-To: <87fcba54-b54a-ea20-63ba-f447f4d34506@linux.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Thu, 10 Feb 2022 16:04:57 +0100
Message-ID: <CAOtMz3P1ZC7euRJK0e1Fn7W4EGx6J-KqevUbfaGGZbVOuu0q8g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
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

Hi,

czw., 10 lut 2022 o 15:43 Jarkko Nikula
<jarkko.nikula@linux.intel.com> napisa=C5=82(a):
>
> On 2/10/22 10:18, Jan D=C4=85bro=C5=9B wrote:
> > =C5=9Br., 9 lut 2022 o 16:28 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> >>
> >> On Tue, Feb 08, 2022 at 03:12:18PM +0100, Jan Dabros wrote:
> >>
> >> ...
> >>
> >> I have noticed code duplication.
> >>
> >>> +     status =3D psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> >>> +     if (status) {
> >>> +             if (status =3D=3D -ETIMEDOUT)
> >>> +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP=
 to release I2C bus\n");
> >>> +             else
> >>> +                     dev_err(psp_i2c_dev, "PSP communication error\n=
");
> >>> +
> >>> +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive h=
ost usage\n");
> >>> +             psp_i2c_mbox_fail =3D true;
> >>> +             goto cleanup;
> >>> +     }
> >>
> >>> +     /* Send a release command to PSP */
> >>> +     status =3D psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> >>> +     if (status) {
> >>> +             if (status =3D=3D -ETIMEDOUT)
> >>> +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP=
 to acquire I2C bus\n");
> >>> +             else
> >>> +                     dev_err(psp_i2c_dev, "PSP communication error\n=
");
> >>> +
> >>> +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive h=
ost usage\n");
> >>> +             psp_i2c_mbox_fail =3D true;
> >>> +             goto cleanup;
> >>> +     }
> >>
> >> If you are going to update the series, consider to introduce a common =
helper.
> >> Otherwise, consider a follow up.
> >
> > Thanks for your comment. Since Jarkko is running some long-lasting
> > tests with v4 patchset, I would like to keep this as is for now (and
> > make a follow up commit). If there will be some additional comments
> > for v4 from him and will spin v5 - I will introduce a common helper
> > function then.
> >
> Test run fine overnight, although I wasn't expecting this breaking
> Baytrail since patch is practically touching only semaphore detection at
> probe time on Baytrail. I'm up to you would you address Andy's comments
> as a follow up or as v5.
>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thanks!

If you don't mind I'd prefer a merge and a follow-up improvement on
top. Current version is tested and in case of breakage it would be
easier to track.

Best Regards,
Jan
