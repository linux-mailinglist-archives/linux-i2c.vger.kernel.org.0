Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1658A5D64
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 23:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfIBVQ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 17:16:26 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34216 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfIBVQZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 17:16:25 -0400
Received: by mail-pf1-f194.google.com with SMTP id b24so9537181pfp.1;
        Mon, 02 Sep 2019 14:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UzPPEolNh35wWErUe2k2fZkCpaurwJuZg/+ELGsiOFk=;
        b=Yw0hv6WPGdzg89CqQgm2pjeaLxqK1SCjR9n0FGD5Y3r2LiFeW+G9UtCLiznr5RxuhI
         7tE3P5Li0aUEBa2fZHPoHoot/SSNCoFmsbvAnqNg9aZX2mbt5QhkqpDML4MSTi/QpcpM
         lxoK1qzZaPS5EA4osYjqQ2CDcDD+DBrRlxvXe3RImogXOtyntEvvi2ecDgvwyaHy84XK
         RitqIfgPXhoh1+oroTx4tktLbK5Kqc/1Le9S3MJUcn/vj85LdAkINB8xrvuPRrvcF1wt
         XG1FcNeH0sAxpcl72s4C6ov/yEFMMPgQchAya1U+z4GvOBJqX/jHRkG2XgpuDvMlv4Jh
         ZY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzPPEolNh35wWErUe2k2fZkCpaurwJuZg/+ELGsiOFk=;
        b=ARQ3o811yRXmggLTx8OkI3mbSVpG6KMzb1MGHaWrZAin8K/IqLuEP+5qGwCiuzjIqb
         y/jnvglpTn2SDYI7QXVQBX787+BExjxoa3nYf4/0vFGkgJaiUax0WLu0iDm/Ue6Ynkco
         sej8Y+FNVMAuIcPfT1mNtoI99Djpc11iLnJs25W8YkB7rmbqkJcpwETVAYHzrKrsmV+6
         pS5IyNtuSpkoiPFmFO9tzXiltihAdtXVreYrZIj/gAI6OaDrkQWlaEgrxVJZrc0zK0x0
         U37tMxh7e9msNjuHqRvBqFnV3U8BS8KaSTSQVvmFDMLiSyduCqIQIj1jf74ODbiBoFb9
         idhg==
X-Gm-Message-State: APjAAAXLlRdE0X02u4waistTfWei/DwEUpv5/ng/4mimR9VfveE9aywx
        wmlSp1F5CIeIU9aYD0G8NbYlY5dJfLVVSEPwcf8=
X-Google-Smtp-Source: APXvYqyg9Tkgzp+liZd++CYTKTIbIPE7/kBlL+HXD5OkDBg82HGev2/K71w5cyXBHT4FgJomex2UHjw/TsfC1ly8MEY=
X-Received: by 2002:a63:6eca:: with SMTP id j193mr26308059pgc.74.1567458984928;
 Mon, 02 Sep 2019 14:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190711102601.20582-1-chuanhua.han@nxp.com> <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
In-Reply-To: <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Sep 2019 00:16:12 +0300
Message-ID: <CAHp75VfFtMMQhetRFHrx=Ft7OWwyMqLrwP3sPjT6YVtr8xCHoQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: support for NXP i2c controller
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Chuanhua Han <chuanhua.han@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 2, 2019 at 11:58 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Jul 11, 2019 at 12:35 PM Chuanhua Han <chuanhua.han@nxp.com> wrote:
> >
> > Enable NXP i2c controller to boot with ACPI
> >
> > Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> > Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
> > Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
>
> Wolfram, any objections to this from the i2c side?

May I propose amendment(s)?

> > @@ -44,6 +44,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>

> > +#include <linux/acpi.h>

If it's kept in order, better to go with it. (Yes, it is as I have checked)
However, property.h should be included instead, see below.

> >         const struct of_device_id *of_id = of_match_device(i2c_imx_dt_ids,
> >                                                            &pdev->dev);
> > +       const struct acpi_device_id *acpi_id =
> > +                       acpi_match_device(i2c_imx_acpi_ids,
> > +                                         &pdev->dev);


> >         if (of_id)
> >                 i2c_imx->hwdata = of_id->data;
> > +       else if (acpi_id)
> > +               i2c_imx->hwdata = (struct imx_i2c_hwdata *)
> > +                               acpi_id->driver_data;


The above altogher may be replaced with

const struct imx_i2c_hwdata *match;
...
match = device_get_match_data(&pdev->dev);
if (match)
 i2c_imx->hwdata = match;
else
...

> > +               .acpi_match_table = ACPI_PTR(i2c_imx_acpi_ids),

Since there is no #ifdef guard no need to use ACPI_PTR().

-- 
With Best Regards,
Andy Shevchenko
