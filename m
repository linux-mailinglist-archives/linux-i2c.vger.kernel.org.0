Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16626441A29
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 11:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbhKAKuC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 06:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhKAKuB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 06:50:01 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3755BC061714;
        Mon,  1 Nov 2021 03:47:28 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 5so61906188edw.7;
        Mon, 01 Nov 2021 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zg/2TadFIKEh7TRYW+cbcPrXXMeYP+uLlK5UKpxBpLw=;
        b=cNey6RR/2MQJMRdV1twInABbCQh0fWlFumvTn9ZmvZjapQQ0R6ZZMgVUBVxuPrDjsT
         CNzD0L5zHXDHvZm02Wg1spSvN5SmmU1gWamirBxIUAjr/2JjLV5RaK00l5GA7dEd2685
         sRDKiQq3coI7Ho9Y0riGk//V1pA6JNOXNvRpczAW4diQFzdAOW9Una++uCDaRRx80nIb
         C1TfXP6fNUMojFQgBU+v6nYLXgaOztwr3VGNMfby1a8bp/81/wLdlChIrRJ2HvGE9MB6
         pz+aCRmBpYdkXsk3QONCcyjaCnqb5DF0yw6hk8933tXxaIk2J2iM9SYGe95mMT/Xf5gT
         +d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zg/2TadFIKEh7TRYW+cbcPrXXMeYP+uLlK5UKpxBpLw=;
        b=k4p4/j4Y2bx8KTuVJb82zHNDqEjkoUXXYzSNDO/YtqylNzZK20lM4OenGT+wARmuKG
         Ekb7XApX0q/sHtZ9ZdJ+XZptXDpIrgFQoNhvt9JpgtYAkHBii1z6u8Xyav0kdYrf/gyA
         qHDO3gILZmYMjgSXjCb7wF7ySbPhHYB6ArCdaw0wexQBXygJ/hh+IQ9KmC4y+CGeI8Rq
         QWW0UdIjycfrkAh+ZsnCWIEyPZf5MU2/f1LEK1J9bN1BRbrriDFHP3TDweJYfMCJkJNU
         /pI5lzO9pE0Cf7gm0Z95ikwXA8fvnkoG4GmHaaf2IfIbvVJ7b1NLzeKKXm7qFnEBbM4a
         Sw/Q==
X-Gm-Message-State: AOAM530iBMJWlaRLC9TFH2NRJI89dJ3dHkGIe56weoqSK5EtGyp9xFBz
        fBpHlpXb0gMToVoUQPQAMUKY/W/nA8CMJOAtdtg=
X-Google-Smtp-Source: ABdhPJySaCcDBrU6r8SzLBhTIbJZlf+fF53ZHRxezNfwopiw5Zt9GadJlgc+nytfqMugPh8RZuSg6C9nEq4qwg0wFg0=
X-Received: by 2002:a05:6402:207c:: with SMTP id bd28mr29631823edb.240.1635763646840;
 Mon, 01 Nov 2021 03:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-9-hdegoede@redhat.com>
 <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com>
 <8804fa29-d0d9-14a9-e48e-268113a79d07@redhat.com> <CAHp75VcdZV7NLEgQnEbsG951Mo2s_eRwfijgjSConXGF2SaSGA@mail.gmail.com>
In-Reply-To: <CAHp75VcdZV7NLEgQnEbsG951Mo2s_eRwfijgjSConXGF2SaSGA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 12:46:37 +0200
Message-ID: <CAHp75Vd6CNkys7E3P_hKAoZ29hA2dpFEqzFWxrSkS8GbC_ivGw@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] platform/x86: int3472: Add get_sensor_adev_and_name()
 helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 1, 2021 at 12:44 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Nov 1, 2021 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 10/25/21 13:31, Andy Shevchenko wrote:
> > > On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > >> +       if (ret == 0 && sensor_adev_ret)
> > >> +               *sensor_adev_ret = sensor;
> > >> +       else
> > >> +               acpi_dev_put(sensor);
> > >> +
> > >> +       return ret;

...

> > >        if (sensor_adev_ret)
> > >                *sensor_adev_ret = sensor;
> > >
> > >        return 0;
> > >
> > > ?
> >
> > That misses an acpi_dev_put(sensor) when sensor_adev_ret == NULL.
>
> else
>   acpi_dev_put(...);
>
> ?

Hmm... But then in the original code and with this proposal the
acpi_dev_put() seems a bit strange to me.
If we are fine (no error code returned) why would the caller (note
_er_) go different paths?

-- 
With Best Regards,
Andy Shevchenko
