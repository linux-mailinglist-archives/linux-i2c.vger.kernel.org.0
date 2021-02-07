Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B11312428
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Feb 2021 12:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhBGL50 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Feb 2021 06:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhBGL5Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Feb 2021 06:57:25 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45FDC06174A;
        Sun,  7 Feb 2021 03:56:44 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id gb24so221129pjb.4;
        Sun, 07 Feb 2021 03:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kmi9Bv1wf11kyJmpOZllaMRnrfULVI+MdqdrZMwhik=;
        b=dhjmPXxmKtoQUvnWeQWGSfw45ptjN2V+wOcEnx4LqE1nygAEDuUD2ql862ajIqHkqk
         ltDoBZbUqyberZfkktkN8CE9dE6F0ZajV6D46EtLG7h1OaLiOMbvbI6JVSKbwKsePjIn
         e0s2loiP2trhaj6ZpSVaAHjqKi4wXD7GiMr4oRYY5GcMkoLXe1iUETGD7cLByaZZgR6g
         hOibKuEx7ZAYso9ZsaK09wkf7Qnm2taNiq5KqIwviXTOdUWIrVL2pt45g2+Z0yaWQf1P
         dy9zNzdh1o9MAXcCuTXuFZHppvEeCBYgUEi8xugs6YZcIjDqG5a0Z+5lnsPtAD9kKyjh
         rUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kmi9Bv1wf11kyJmpOZllaMRnrfULVI+MdqdrZMwhik=;
        b=C7OWJHEB+Wdhpde4/UaGAhsqL0sxANoBPFoqAtKb7vLGfrG4k6rExiMfskvWf+VAZF
         olTUxVSyyHPDGh8RfO8dgTViy8oHWhhul4vav+lGJJfgZtaIIKf6T0Wwm1e2k+UAGjQ/
         isnbLFlA04CvPkTyMItaCymK9DF42Q5oEGBnCIsvtsVpGVMAmdvYwzjKGLsNOloYEvpp
         cxxoFZC6GpD+9juiyVC34avkksMgr59mbu4QO7bPD9O7K6p2OY5W2hi4CkcpkzR1Rfyw
         mF6o+8TxbUCyULTdlEIUU9Z5H3Rk6EgBvWgEGV1QUM/ziJO552xlbC0+Qp4nycC4duf9
         HK+g==
X-Gm-Message-State: AOAM5325xELPrmcG9cVE/2Gz+5Wd6nj8DaEzk1p25vRkFA2yBdwk9CIX
        uWvI28vGQbaFYqh+wZJ4a7IE1397J1FgqrvpYy8=
X-Google-Smtp-Source: ABdhPJxyov8fsEZoH2TWRM8JNb+Syk1zxYcMhXgpWj7GUonnfuFdUhquX4fCCdWDhyc7B+7eUCNJ5SCm5096a6J/HSc=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr12538609pja.228.1612699004182;
 Sun, 07 Feb 2021 03:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-7-djrscally@gmail.com> <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com> <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <20210119092448.GN4077@smile.fi.intel.com> <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
 <20210119110837.GT4077@smile.fi.intel.com> <YAcNT1d5zQHGsoe6@pendragon.ideasonboard.com>
 <YAccEtQIBrbKPSmv@smile.fi.intel.com> <YAev1YviLVfEHSg6@pendragon.ideasonboard.com>
 <YAgo06hhlael1/rm@smile.fi.intel.com> <e8f697c9-821e-1d15-9e57-cda71626cbb9@gmail.com>
 <2f85ec6d-b47e-6d86-02bc-5563cff7576d@gmail.com>
In-Reply-To: <2f85ec6d-b47e-6d86-02bc-5563cff7576d@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 7 Feb 2021 13:56:27 +0200
Message-ID: <CAHp75VeF_tZdi8+fMYGtuzMH_jWit4cHy6kHM2OVuBkDA4+=uA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Feb 7, 2021 at 1:00 PM Daniel Scally <djrscally@gmail.com> wrote:
> On 21/01/2021 00:18, Daniel Scally wrote:
> > On 20/01/2021 12:57, Andy Shevchenko wrote:

...

> > I'm not sure that one's better than the other, to be honest. Either the
> > multi-function device functionality lives in the conventional place, or
> > else _all_ of the int3472 handling code lives together in one module.
> Can we come to a consensus on this? I would rather be in agreement than
> leave it hanging...I do see the argument that it's better not to rebirth
> the MFD driver away from that subsystem, but at the moment I lean
> towards the view that having all the code handling this particular _HID
> in one place is probably preferable, if only to make it easier for
> anyone coming in the future to understand what's happening. That said;
> I'm not particularly precious about it, I'd just like to agree an
> approach so I can move forward with the next version

So, my priorities of rejection (first is higher)
- open-coding MFD subsystem (that said, if you shuffle the code, at
least leave it as an MFD driver)
- moving out from MFD (although I understand intentions)

Summarize, go ahead with your view (leaving it as an MFD driver) and
look forward to what maintainer(s) will say.

-- 
With Best Regards,
Andy Shevchenko
