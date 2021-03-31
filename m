Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC50A34FDDD
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 12:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbhCaKOb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 06:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbhCaKOM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Mar 2021 06:14:12 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF46EC061574;
        Wed, 31 Mar 2021 03:14:05 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so917732pjh.1;
        Wed, 31 Mar 2021 03:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F1YkyOMP0wJPgBURTtt63CrNTQAoys/vYKd1J6GUTeQ=;
        b=e0ryJIaBfp29NpDIsf8uc3dX1SM61cv4hdDMQP4gpwqgQA0QeL/tWTPOZTEqjh24+E
         CwokC7cgqpYfGJEt+AxTH1odHbWLH/3TbSTLFr7FiCQr5rYh+7XybZGrrawNmjIwWfwv
         w5nH9Ik9/NcWiZgDO3kIdSpgrRkU9UBos4bogb9zFekdkBxzH9FVavDshSEMarlswrmY
         IbUUT5tj04retqZ8nH/rE/oOO5sXfow8V4sOdm4L8DO8qSzyPt29xcqTJd5GRr9EzRQw
         aXjC0VJWWO6j+s5iFgwFJUOlv4kdpaC3Gf5Q3kRVxMp6fFOYvbTG8lXDe7mIFyYr9RlM
         Y5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F1YkyOMP0wJPgBURTtt63CrNTQAoys/vYKd1J6GUTeQ=;
        b=PkdZuY/wn32PxIdnnOXy9+R5p+bHW+490hMtSaKle46PSvpG7HpgvSUjWRksE8XVk/
         YTG+2O85LtgvHe5LSBypPyWCzUqHKei2Zj3Brzs9ULFOh8DVvloEv5p43xx5elCHIG/2
         bNfUeTEJKOLzcTccK/RBpXRzX1+bPrlQLJeJQSyXh1rKJbEt1yKzCzv4VRQTHAV1RNCd
         Yv47kf57Dv+cuce4L4uPHmtTAb3mzlI/ZhmwSzuGYE0E4FjJM3VPDGd1DVyNRNfJcpld
         a0M3E1sJczav266Cu3S7Ps7VSygxKCzTZL7Ov/edzOsSV1XlcD69QFXXd0cdxdFVQo9U
         cmTg==
X-Gm-Message-State: AOAM531hjEA1vLIWLxvaohTDHoaa8xnl40V47kIK8EIPJHQZz927nJcH
        hUx8HZkS6IjDTlV7cNC5BZAHSgQ4ylf2CauCEyM=
X-Google-Smtp-Source: ABdhPJx1HDeLlxyvmhGidVheMaey/qhxP6V63IqjsHWGkeVi05wC3/bYFGgWJMFNvt3TXsjCcDwuBHQaCWb08h+DSMw=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr2860644pjb.129.1617185645305;
 Wed, 31 Mar 2021 03:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210330134633.29889-1-andriy.shevchenko@linux.intel.com> <4631eddd-1855-566e-7d3c-591e5d559cf8@linux.intel.com>
In-Reply-To: <4631eddd-1855-566e-7d3c-591e5d559cf8@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 13:13:48 +0300
Message-ID: <CAHp75VdCXuprrRpF6-DihSNJr=ghp5TuJVqh4rMs=GG7fBfd_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Switch over to i2c_freq_mode_string()
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 31, 2021 at 11:42 AM Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
>
> On 3/30/21 4:46 PM, Andy Shevchenko wrote:
> > Use generic i2c_freq_mode_string() helper to print chosen bus speed.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > Depends on the "Add support for HiSilicon I2C controller" series.
> > Message-Id - 1617109549-4013-1-git-send-email-yangyicong@hisilicon.com
> > Yicong, feel free to attach to your new version of it.
> >
> >   drivers/i2c/busses/i2c-designware-master.c | 20 ++++----------------
> >   1 file changed, 4 insertions(+), 16 deletions(-)
> >
> Please note kernel test robot <lkp@intel.com> reported some issues with
> this patch before included in this series.

Report due to absence of dependencies.

> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thanks!


-- 
With Best Regards,
Andy Shevchenko
