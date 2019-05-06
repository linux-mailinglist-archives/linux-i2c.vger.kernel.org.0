Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE2315320
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 19:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfEFRyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 13:54:44 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46585 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfEFRyo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 13:54:44 -0400
Received: by mail-ua1-f68.google.com with SMTP id n23so4959803uap.13
        for <linux-i2c@vger.kernel.org>; Mon, 06 May 2019 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/hieHfzO8noPDNoAxk691xfv/UVSgo8EHet25ThOxA=;
        b=K3dHADv+pUO4Jys+GSog3efxohLaI5rNKm0Cz5eSJUzFXyet2diAyz+f0fLjUL3yZt
         +F6kBpL4uL+xYYvw0UOhc9tMAnwBCXjgnB4hThOFCaQL9EAXB+5ZyIyq3GQGq3JYWO+Z
         qEGlLm5H0EC7fbXNGXns50+HIKOtDbofkoRLRK17tgePEaynXSsLUHxR0IqVP6XL4Gu3
         9ho0A+xv6gzjOG8zWMbCIS5Zn1HMiJeVZrHGX++a+fs1RRBpzBmy47AVao48DaPn7ZdC
         yLPLfxfvlt/OdI/0m8QX68HyJxuyQJ6g9z6+yMag8L4LUDO1Y1aBi16/CVEnli5U7hnX
         00jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/hieHfzO8noPDNoAxk691xfv/UVSgo8EHet25ThOxA=;
        b=JKQa3nlvGeye3kzVhJzD54lmZw6Ld54c165VqCSMT5JY8S27wcH5G+2fTK7PJGtXrQ
         G0TkI64BhQhbGj337zH8Q/g2xDHT4abXnaZ1RbNO8wLTuNgnsf3sRLdk9W6/DUDecrvx
         t2MNzgIVXNqTU4M754HSZ80sCnItChEEDRZL6Cqt55mS+Qlx36F1qCZSqzOKJryg8Pmk
         N642pxUDkLBJ8a8r6mmSjg/7hv4iF5acSV+oCulX9K68rHXIAkTsJXGp+s2zzdL+JMF6
         N292lWXfHXDmm0lpcCQljKSN8FU3/43f0kPAmz+YQeXkJHVQF49B/U0SpuXzHzS3CS+L
         Abcw==
X-Gm-Message-State: APjAAAUssxiwv++eJjdKtGBXiSBxP575Q2/68jmQ/r7Y06ojxXLt3nAl
        xglOf/zVsIFuWLhPUxq30YQfp50j7FmiFN92jGDYZbJDVSU=
X-Google-Smtp-Source: APXvYqwqwTUCzjDWfH3EHzsu393rI6tVpwgwXSK391tnxObsqcMP1lfqzmFm+qWPa/9uzA+kfrKWqWPRe+HKZXMG/uo=
X-Received: by 2002:ab0:59aa:: with SMTP id g39mr4867600uad.124.1557165283581;
 Mon, 06 May 2019 10:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
 <1557147240-29551-4-git-send-email-sagar.kadam@sifive.com> <20190506132924.GD15291@lunn.ch>
In-Reply-To: <20190506132924.GD15291@lunn.ch>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Mon, 6 May 2019 23:24:28 +0530
Message-ID: <CAARK3H=9frKMTB6aWBwEmCxXxQuZgjAij_Uam+U8of48hjq=bA@mail.gmail.com>
Subject: Re: [PATCH v1 v1 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, peter@korsgaard.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 6, 2019 at 6:59 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  /*
> >   * 'process_lock' exists because ocores_process() and ocores_process_timeout()
> > @@ -239,8 +240,13 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
> >       struct ocores_i2c *i2c = dev_id;
> >       u8 stat = oc_getreg(i2c, OCI2C_STATUS);
> >
> > -     if (!(stat & OCI2C_STAT_IF))
> > +     if (i2c->flags && SIFIVE_FLAG_POLL) {
>
> Do you really want && here?
>
> > +             if (stat & OCI2C_STAT_IF)
> > +                     if (!(stat & OCI2C_STAT_BUSY))
> > +                             return IRQ_NONE;
> > +     } else if (!(stat & OCI2C_STAT_IF)) {
> >               return IRQ_NONE;
> > +     }
> >
> >       ocores_process(i2c, stat);
> >
> > @@ -356,6 +362,11 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
> >               ret = ocores_isr(-1, i2c);
> >               if (ret == IRQ_NONE)
> >                       break; /* all messages have been transferred */
> > +             else {
> > +                     if (i2c->flags && SIFIVE_FLAG_POLL)
>
> And here?
>
> > +                             if (i2c->state == STATE_DONE)
> > +                                     break;
> > +             }
> >       }
> >  }
> >
> > @@ -406,7 +417,7 @@ static int ocores_xfer(struct i2c_adapter *adap,
> >  {
> >       struct ocores_i2c *i2c = i2c_get_adapdata(adap);
> >
> > -     if (i2c->flags & OCORES_FLAG_POLL)
> > +     if ((i2c->flags & OCORES_FLAG_POLL) || (i2c->flags & SIFIVE_FLAG_POLL))
>
> You can combine this

Thanks for your suggestion's Andrew.
Yes, I will optimize this.
>
> if ((i2c->flags & (OCORES_FLAG_POLL | SIFIVE_FLAG_POLL))
>
> >               return ocores_xfer_polling(adap, msgs, num);
> >       return ocores_xfer_core(i2c, msgs, num, false);
> >  }
> > @@ -597,6 +608,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
> >  {
> >       struct ocores_i2c *i2c;
> >       struct ocores_i2c_platform_data *pdata;
> > +     const struct of_device_id *match;
> >       struct resource *res;
> >       int irq;
> >       int ret;
> > @@ -678,13 +690,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
> >
> >       irq = platform_get_irq(pdev, 0);
> >       if (irq == -ENXIO) {
> > -             i2c->flags |= OCORES_FLAG_POLL;
> > +             /*
> > +              * Set a SIFIVE_FLAG_POLL to enable workaround for FU540
> > +              * in polling mode interface of i2c-ocore driver.
> > +              */
> > +             match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> > +             if (match && (long)match->data == TYPE_SIFIVE_REV0)
> > +                     i2c->flags |= SIFIVE_FLAG_POLL;
> > +             else
> > +                     i2c->flags |= OCORES_FLAG_POLL;
>
> Please take a look at the whole code, and consider if it is better to
> set both SIFIVE_FLAG_POLL and OCORES_FLAG_POLL. Maybe rename
> SIFIVE_FLAG_POLL to OCORES_FLAG_BROKEN_IRQ_BIT?
>
The intent of this patch is to add a workaround for hardware errratum
of FU540 a SiFive Device,
hence I had named the flag accordingly. Yes,
OCORES_FLAG_BROKEN_IRQ_BIT is a better and generic term,
I will rename and resubmit this patch

-Thanks
Sagar

> Thanks
>         Andrew
