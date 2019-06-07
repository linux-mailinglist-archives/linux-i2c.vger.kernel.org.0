Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56161393FB
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 20:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730422AbfFGSJr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 14:09:47 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38234 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729815AbfFGSJr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 14:09:47 -0400
Received: by mail-pg1-f196.google.com with SMTP id v11so1557915pgl.5
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/3m639ul9fLGHczHyKn0H1zZg+5SVSXXo1Nl+CYKby4=;
        b=PzFmnwe5R9+tXehwIXZM6y8FoShB+B2G5A0MZe7+0cyb/EOpN+t4FPLENdAFQiY4vp
         snMFvVlNDWgHWDB2eUSQIPp1jPpux+sTG071CiSoW9pKxLK4lCyinxlVC7k40V6c7NyM
         z5pTl9+LJCEFZIC3Qz7jsfCfXo3GXCw4hr6fH/Of0zai00v9lD1BaHATpmLQ9qqU0zRI
         HEJWGafkIT/mIu9OHFbD7peMSgFffJJnzRTXUZh94uyM4rRLf4WGCbHpAYNJSgv6Pp+D
         fd+lIHwpViriTTXjPu1DqDEtndYAxhmI9tO3EsjbdeUbHvIlHX+VrJDGetgrOd1J7w40
         Dz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/3m639ul9fLGHczHyKn0H1zZg+5SVSXXo1Nl+CYKby4=;
        b=HuwOoCAjV3xxtaxJyESdjLrY4v5gD/7Z1+t+r3cA+rxRu3KrCdC1ZXkzjzLXcHJ2Fk
         EaOqVIxsHGv/LP7Ff3SYLiplk3fkLAUV6GA1VfhWC+8LD+y6TK2ZY34PI3wCU4P8kVCI
         j/OAJ9fdS1GtNItBHDoIPFtpVYg4L7dtNsGitag9gJLxYTZ0R1idLWmDCXeXYckVOhdL
         qmV7XExwcC0zM8EN+eysJBdAnHZD0Kpu9ZeRN+ZNh5JwX/1U0g7v4hF661zJHbeKQLWq
         IdOq7rc01YzDYY9bMS61LsJBUpslHPQYgpsnEfRfNm44TDJE3Gd6d+LgLDt2LuXKgai4
         Kqig==
X-Gm-Message-State: APjAAAXao9tYclGALMmG3VunbdvakXZn8h5ioN+CSLzW0WzM3sRcWLdr
        EPTn70EFapzoYzG/VYo0w0NUrw==
X-Google-Smtp-Source: APXvYqzt5gwdXKwtn7ZORpYSN5ZFetcAiXsBwVaXb6cj35kEgitwNjg1kWrl11fOzV9tGYSsCfKnXw==
X-Received: by 2002:a62:3287:: with SMTP id y129mr4134583pfy.251.1559930986308;
        Fri, 07 Jun 2019 11:09:46 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l44sm6897224pje.29.2019.06.07.11.09.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 11:09:45 -0700 (PDT)
Date:   Fri, 7 Jun 2019 11:10:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, alokc@codeaurora.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
Message-ID: <20190607181030.GX22737@tuxbook-pro>
References: <20190607082901.6491-1-lee.jones@linaro.org>
 <20190607082901.6491-3-lee.jones@linaro.org>
 <CAKv+Gu-1QhX-9aNhFJauc9NVe6ceQQueE8Kd14031XJ-2yaupA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-1QhX-9aNhFJauc9NVe6ceQQueE8Kd14031XJ-2yaupA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 07 Jun 04:10 PDT 2019, Ard Biesheuvel wrote:

> On Fri, 7 Jun 2019 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
> >
> > When booting MSM based platforms with Device Tree or some ACPI
> > implementations, it is possible to provide a list of reserved pins
> > via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> > However some ACPI tables are not populated with this information,
> > thus it has to come from a knowledgable device driver instead.
> >
> > Here we provide the MSM common driver with additional support to
> > parse this informtion and correctly populate the widely used
> > 'valid_mask'.
> >
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> I'm not sure if this is the correct approach. Presumably, on ACPI
> systems, all the pinctl stuff is already set up by the firmware, and
> so we shouldn't touch *any* pins unless they have been requested
> explicitly. Is there any way we can support this in the current
> framework?
> 

The only reason why we do this (at least the initial reason) is because
gpiolib will read the current state of all GPIOs during initialization.

But due to the sensitive nature of the application using these pins
Linux is prohibited from touching the associated GPIO/pinmux/pinconf
registers - resulting in a security violation if we allow gpiolib to
touch them.


When it comes to pinmux/pinconf those are only poked explicitly and
those seems to be described in PEP nodes, such as:

	Package (0x02)
	{
	    "TLMMGPIO",
	    Package (0x06)
	    {
		0x2C,
		One,
		Zero,
		One,
		Zero,
		Zero
	    }
	},

So the pinctrl-sdm845/msm drivers gives us GPIOs, but for pinconf and
pinmux there's a need for something very different from what we're used
to.

Regards,
Bjorn

> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++++++
> >  drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index ee8119879c4c..3ac740b36508 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -607,8 +607,23 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
> >         int ret;
> >         unsigned int len, i;
> >         unsigned int max_gpios = pctrl->soc->ngpios;
> > +       const int *reserved = pctrl->soc->reserved_gpios;
> >         u16 *tmp;
> >
> > +       /* Driver provided reserved list overrides DT and ACPI */
> > +       if (reserved) {
> > +               bitmap_fill(chip->valid_mask, max_gpios);
> > +               for (i = 0; reserved[i] >= 0; i++) {
> > +                       if (i >= max_gpios || reserved[i] >= max_gpios) {
> > +                               dev_err(pctrl->dev, "invalid list of reserved GPIOs\n");
> > +                               return -EINVAL;
> > +                       }
> > +                       clear_bit(reserved[i], chip->valid_mask);
> > +               }
> > +
> > +               return 0;
> > +       }
> > +
> >         /* The number of GPIOs in the ACPI tables */
> >         len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
> >                                                    0);
> > @@ -964,6 +979,9 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
> >
> >  static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
> >  {
> > +       if (pctrl->soc->reserved_gpios)
> > +               return true;
> > +
> >         return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
> >  }
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> > index c12048e54a6f..23b93ae92269 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> > @@ -121,6 +121,7 @@ struct msm_pinctrl_soc_data {
> >         bool pull_no_keeper;
> >         const char *const *tiles;
> >         unsigned int ntiles;
> > +       const int *reserved_gpios;
> >  };
> >
> >  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
