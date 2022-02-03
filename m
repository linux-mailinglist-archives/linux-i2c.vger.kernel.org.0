Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD8D4A8354
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 12:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350231AbiBCLwP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 06:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236153AbiBCLwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 06:52:14 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FEDC061714
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 03:52:14 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id h125so2091693pgc.3
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 03:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AKYL2kdA69UA9aARWAmYaY5qmBbSeF672IAs1r/nhoo=;
        b=jtKOX3HB3HAeRg8WKXaU/me9qlfEubRFX545xdqAabzwYtS8jLSTZySOLZLLBw69Z0
         B9BAkriIQYKm98IV3FssgVergEaioaWs4EscsNZTnX8wCcpc+iICIfRaNW1Afly+0OWP
         bdHEypm+CWl8YpnExV5H5sLuuFrezMtPmZ03SKcG3nWRRd10x21AiUOzUKoa1ZSxa4cO
         31CHFZ3D+DgK2+nY72jg3B5QCCxHno1AlmTghuyGMG1lqYMu1SKbpuUI+sVYfSqjhlVf
         7cylTEd3qZu2veaO/2OnM7cdp0Vdz9bFTmkS8RHF96JtZRxWA1dsfyuiwwhaXICmaZOr
         1P+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AKYL2kdA69UA9aARWAmYaY5qmBbSeF672IAs1r/nhoo=;
        b=iiv161XrBmupkklN7hKrPMbWfGAAdK0sqdT1V5Qc8cQmzQ/ggjrjuvzZVK1QnXHMII
         W5b7H9AWFGsHrmrH81tPVEegTCeZufykHovlzQ7Hmwb6tKdMPi5QEbxlTv6gp/4m9OHl
         nE7apcFtnNILWeqvdzD/0Me62PJrnOdBI5H2hlqo2XgvBPmUbzkXVqzKTFAmcdy1xft9
         MSUsrN0eS/Q+pq+tgjghvQnjS9SX4tIXPPjwt/Z9o1KZmki7hS3MqW102n7/c3NzxWee
         BHR3DLxdy8gtzWQUX9rrz1crxjS27tQ6zVQTXTveeG5+7jNyfIfJMDhozqQ2hwEUelJK
         /PPQ==
X-Gm-Message-State: AOAM530h+7xTVgQR0qFlMNsn4YqLBjqm5udEMtawk1OLBpPjvq3yIH14
        s2ENUgfXYM34O0VKMBn4bFunXXzrU/9B+xHasp6jQQ==
X-Google-Smtp-Source: ABdhPJx3SOm6QitkPfEg+DVbsz4taQcIK3ZPzk1ds8C/gXMxUeO5l8y1OkIlE9qwCNGqmdorVYFd8AFIyvMoRk0Ybzw=
X-Received: by 2002:a05:6a00:1a50:: with SMTP id h16mr32054954pfv.74.1643889134395;
 Thu, 03 Feb 2022 03:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com> <724bbaef-8ee5-0904-d871-750643b4ff89@amd.com>
 <YfuxcTFnWQ4MLxvp@smile.fi.intel.com>
In-Reply-To: <YfuxcTFnWQ4MLxvp@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Thu, 3 Feb 2022 12:52:03 +0100
Message-ID: <CAOtMz3Po2y0=8gDo=4vTV+PBgYHhFBaX_Bs9NOWwP=ZbqsEAMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        "Easow, Nimesh" <Nimesh.Easow@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy, Mario,

czw., 3 lut 2022 o 11:43 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Wed, Feb 02, 2022 at 04:49:40PM -0600, Limonciello, Mario wrote:
> > On 2/2/2022 08:43, Jan Dabros wrote:
>
> ...
>
> > > +   { "AMDI0019", APD_ADDR(wt_i2c_desc) },
> >
> > Did you already check with anyone in AMD about reserving this ID?
>
> Oh, it's a very good point! I was under impression that Jan operates on
> allocated IDs...

Yes, I received this ID from AMD.

>
> > Considering this design is specific to arbitration used for Chromebooks=
 I
> > wonder if it is better to be GOOG ID?
> >
> > I can see it both ways, but if you didn't already talk to anyone and th=
e
> > consensus is for it to be AMDI****, I will ask around internally about
> > reserving it / making sure there are no future or existing conflicts.

It was agreed with AMD that we will use "AMDI****" format. This ID is
already reserved by them.

Best Regards,
Jan

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
