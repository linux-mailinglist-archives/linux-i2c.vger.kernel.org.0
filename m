Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E1920721A
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 13:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389044AbgFXLbZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 07:31:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388470AbgFXLbY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jun 2020 07:31:24 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0610C2088E;
        Wed, 24 Jun 2020 11:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592998284;
        bh=55zvNE05ZrvmYGTKbqcYIdKeiGfLu+9inT+nvPx0ddw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=znhnOspUf0ZfFz17cYXkM7AcTZQvTU/t+55ntiFjXOb9WhGHWIJ4IJQDMLNfG1fMB
         glSEDcEh9mduQaCCRs+3whd6AzskjTYR4yfGuYKIZTHNZqs0xM9m4QW/f1tVoQGBxl
         18ni3nfIKMIUFUbJS5bYBB9uIelmx9sxSHWJ6Ync=
Received: by mail-lj1-f170.google.com with SMTP id q19so2167606lji.2;
        Wed, 24 Jun 2020 04:31:23 -0700 (PDT)
X-Gm-Message-State: AOAM5337tfvN9vlAz/BDIRqO7vTEKIbkswOh4mzUgKNXP/4x5OmlwRlY
        ZQB+YEUFXi/03qvJsdGYvBEbfGQYQyyu1ZJ65aQ=
X-Google-Smtp-Source: ABdhPJwSX23zf9KGrk5xab5Jb8TFl62SZoDeRlG1/FxZyyK/z2k7zeavc9Mlp4gLl0DO8EobqupLKJLtQ8O7Ns+uysE=
X-Received: by 2002:a2e:3914:: with SMTP id g20mr2616095lja.19.1592998282326;
 Wed, 24 Jun 2020 04:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200624091239.802218-1-ribalda@kernel.org> <20200624104655.GD3703480@smile.fi.intel.com>
In-Reply-To: <20200624104655.GD3703480@smile.fi.intel.com>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 24 Jun 2020 13:31:06 +0200
X-Gmail-Original-Message-ID: <CAPybu_1g=RAHca3=UyG2Tk6mo1E56NgCXoo0j=zc9MAa7A7r2Q@mail.gmail.com>
Message-ID: <CAPybu_1g=RAHca3=UyG2Tk6mo1E56NgCXoo0j=zc9MAa7A7r2Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: designware: platdrv: Set class based on dmi
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On Wed, Jun 24, 2020 at 12:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 24, 2020 at 11:12:39AM +0200, Ricardo Ribalda wrote:
> > Current AMD's zen-based APUs use this core for some of its i2c-buses.
> >
> > With this patch we re-enable autodetection of hwmon-alike devices, so
> > lm-sensors will be able to work automatically.
> >
> > It does not affect the boot-time of embedded devices, as the class is
> > set based on the dmi information.
>
> Hmm... Do we really need to have DMI? I mean wouldn't be safe just always
> provide this to be compatible with HWMON class?
>

I do not care :), I was just trying to follow the logic of
70fba8302adecfa08a087c6f1dd39537a55f5bd3

If it is decided otherwise I can change it, no problem ;)

> ...
>
> > +static bool dw_i2c_hwmon_bus(void)
> > +{
> > +     if (strstr(dmi_get_system_info(DMI_PRODUCT_NAME), "QT5222"))
> > +             return true;
> > +     return false;
> > +}
>
> I don't like this. Perhaps for now you may simple use dmi_get_system_info()
> directly below.

I just realised that if there is no DMI, then we get a NULL, so we
need to add that check.

With the two ifs, I still prefer to put it on other function like now
(check v2).

If you still dont like it I will move it into the main function.

>
> ...
>
> > +     adap->class = dw_i2c_hwmon_bus() ? I2C_CLASS_HWMON
> > +                                      : I2C_CLASS_DEPRECATED;
>
> It's one line.

Fixed thanks
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
