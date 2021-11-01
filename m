Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A96F441A1F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 11:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhKAKsO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 06:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhKAKsO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 06:48:14 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEA0C061714;
        Mon,  1 Nov 2021 03:45:41 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id m14so9928815edd.0;
        Mon, 01 Nov 2021 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YrYn8HwkWu9IjsAY6uUUxMRIsoewZD3Zbqzhh/3VGa4=;
        b=gcQ/W/pfScTsVlIdnaYRMAJfaCGT5vIoV/HBDj3pBRvGqLyB77tm9U6uQTjzvi5CDh
         kDcbsYKeN1DOtJVn0yLMEEpD5t0Fn3Q+Vim709sGzTfh94eCQ9QI9D7G0A3J9wYXH2L4
         ctKEc1sFdbJ+xK9jqFqyGFSRTd7ASax35cAhTEK0/xcY7v5TCenjNMz9dqfwpBuenqRM
         viBH7V9FdsMuNcHYvnQw28DLA3n4f1wS0p07BvtfdNJHBFuBzOisXnQPIlXcEMLPTcCy
         lTp4CcQ3U53ajAospJ3Q1pTt+jeK/y7DtOjf+2DRnx1srVnRFLzxle/PbKv0a2sjTs84
         Kqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YrYn8HwkWu9IjsAY6uUUxMRIsoewZD3Zbqzhh/3VGa4=;
        b=extyXQ4JMyfnIWj25l9gIBEc5F/W1UC8p2V/0SG0IUnybwwao+SYwz+uyk9xVGIelK
         HV62KO939/RneV5oqDrvLGwhQSHLRsnmSO9fV5TnE/zSYN6COiRg0mRZ39iISh2Q4cWx
         TXJE0Q4eyUkFOhbUcZOTdGPdkeXsTEjLlNyFGyERaZVe8G4LJofaNx0NbpDrf9I/c5Cm
         rSfs8u3SVHAydrtksEJLFWMXvlb9jV0fHWUE2QhfmxeHPN92c8K/43ERWjhcm/KFUtfU
         NKRUXD62fJcvCU7Po6VWsAE34eTXWyLUsDXd11u2BSAP1cbcQa2pLGjaH9uYOOcfrApR
         dRSA==
X-Gm-Message-State: AOAM533AlKrlUtYJ0/VsH0Q/1tLv/X4u+4JiScra+Nq5azoUK5pbIpvN
        fDiKDkZ3BmsGT3n9zyu4+9n9Qpy10/yePEPru5U=
X-Google-Smtp-Source: ABdhPJwlk7yj+LnqpGtUa24O/09WH38yisRxJGg+DakfxGjwjisBLvrxXASwHyz72wFB/a950EFjZKDxi1ATHq9GK8k=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr34660453ejd.425.1635763539634;
 Mon, 01 Nov 2021 03:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-9-hdegoede@redhat.com>
 <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com> <8804fa29-d0d9-14a9-e48e-268113a79d07@redhat.com>
In-Reply-To: <8804fa29-d0d9-14a9-e48e-268113a79d07@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 12:44:49 +0200
Message-ID: <CAHp75VcdZV7NLEgQnEbsG951Mo2s_eRwfijgjSConXGF2SaSGA@mail.gmail.com>
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

On Mon, Nov 1, 2021 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/25/21 13:31, Andy Shevchenko wrote:
> > On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +int skl_int3472_get_sensor_adev_and_name(struct device *dev,
> >> +                                        struct acpi_device **sensor_adev_ret,
> >> +                                        const char **name_ret)
> >> +{
> >> +       struct acpi_device *adev = ACPI_COMPANION(dev);
> >> +       struct acpi_device *sensor;
> >> +       int ret = 0;
> >> +
> >> +       sensor = acpi_dev_get_first_consumer_dev(adev);
> >> +       if (!sensor) {
> >> +               dev_err(dev, "INT3472 seems to have no dependents.\n");
> >> +               return -ENODEV;
> >> +       }
> >> +
> >> +       *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
> >> +                                  acpi_dev_name(sensor));
> >> +       if (!*name_ret)
> >> +               ret = -ENOMEM;
> >> +
> >> +       if (ret == 0 && sensor_adev_ret)
> >> +               *sensor_adev_ret = sensor;
> >> +       else
> >> +               acpi_dev_put(sensor);
> >> +
> >> +       return ret;
> >
> > The error path is twisted a bit including far staying ret=0 assignment.
> >
> > Can it be
> >
> >        int ret;
> >        ...
> >        *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
> >                                   acpi_dev_name(sensor));
> >        if (!*name_ret) {
> >                acpi_dev_put(sensor);
> >                return -ENOMEM;
> >        }
> >
> >        if (sensor_adev_ret)
> >                *sensor_adev_ret = sensor;
> >
> >        return 0;
> >
> > ?
>
> That misses an acpi_dev_put(sensor) when sensor_adev_ret == NULL.

else
  acpi_dev_put(...);

?

-- 
With Best Regards,
Andy Shevchenko
