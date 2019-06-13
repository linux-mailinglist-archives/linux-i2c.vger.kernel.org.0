Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2535B43E10
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731878AbfFMPrT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:47:19 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39114 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731769AbfFMJc7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 05:32:59 -0400
Received: by mail-qt1-f195.google.com with SMTP id i34so21720278qta.6
        for <linux-i2c@vger.kernel.org>; Thu, 13 Jun 2019 02:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/0wpLIS7FS7jhfZMMu4pHMqQtu6yoM37ibHoRt1LgU=;
        b=IrpaN1kXcCdI8EjQlFpfCjwQuUabxpKs+Xbin1+BAp2/TZgC7vtw+0KJ+DiHUZsQVU
         KjGSf/FMM00YtWRlj2P5Uz06MZmMS33K2GsV/wDSLHGaiItMrvi1H8OcDXpc8d64EDDv
         g0P+hPyyYS1T03I+Z4sfE+lnISAlheaK2Ag0kvYEAb8Ci51DEdxg3vBAOnejG6fM0AQc
         IYaufscTgoI2MzLbnfnZyE51pFqZnazKI7esuSV6mCYddn+kJYW9PvBRTemr/ciZLbbn
         2KzFDen7pHdtgf1YhR3+smJkXnjdD/IAXiNO+uzLJ3/wLykAgU5BIEoRwTdE5As9n126
         ApXQ==
X-Gm-Message-State: APjAAAXmjR/WSE/QuPdcYRSz8SNSJq+nqQ7Pf7zW78dqvHBUBX+0AJyL
        mtEt2gzPOG2cgtrAmUEDd8En7hSmaOs+Xkbkk0ev6GSp2WITaQ==
X-Google-Smtp-Source: APXvYqw/sQ5mcSwPf8226TuS+vkXk4CpLpVjnLElzksMN1ydqMV4lnQn38CN7pVjb+V0MEL78hfXr9xatbC4c+/4rMI=
X-Received: by 2002:ac8:224d:: with SMTP id p13mr54002135qtp.154.1560418378757;
 Thu, 13 Jun 2019 02:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
 <20190611123101.25264-5-ckeepax@opensource.cirrus.com> <20190612152718.GC2640@lahna.fi.intel.com>
 <20190613084858.GU28362@ediswmail.ad.cirrus.com>
In-Reply-To: <20190613084858.GU28362@ediswmail.ad.cirrus.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 13 Jun 2019 11:32:47 +0200
Message-ID: <CAO-hwJL-U0n5oFP-QXX8rD2Fxt9mDOKp-AknRN6QwXEhZsUBYg@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Jim Broadus <jbroadus@gmail.com>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 13, 2019 at 10:49 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Wed, Jun 12, 2019 at 06:27:18PM +0300, Mika Westerberg wrote:
> > On Tue, Jun 11, 2019 at 01:30:58PM +0100, Charles Keepax wrote:
> > > In preparation for more refactoring make i2c_acpi_get_irq available
> > > outside i2c-core-acpi.c.
> > >
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > >
> > > Changes since v3:
> > >  - Move the change to use the helper function from i2c-core-base into its own patch.
> > >
> > > Thanks,
> > > Charles
> > >
> > >  drivers/i2c/i2c-core-acpi.c | 15 +++++++++++++--
> > >  drivers/i2c/i2c-core.h      |  7 +++++++
> > >  2 files changed, 20 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > > index 7d4d66ba752d4..35966cc337dde 100644
> > > --- a/drivers/i2c/i2c-core-acpi.c
> > > +++ b/drivers/i2c/i2c-core-acpi.c
> > > @@ -144,8 +144,17 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> > >     return 1; /* No need to add resource to the list */
> > >  }
> > >
> > > -static int i2c_acpi_get_irq(struct acpi_device *adev)
> > > +/**
> > > + * i2c_acpi_get_irq - get device IRQ number from ACPI
> > > + * @client: Pointer to the I2C client device
> > > + *
> > > + * Find the IRQ number used by a specific client device.
> > > + *
> > > + * Return: The IRQ number or an error code.
> > > + */
> > > +int i2c_acpi_get_irq(struct i2c_client *client)
> > >  {
> > > +   struct acpi_device *adev = ACPI_COMPANION(&client->adapter->dev);
> >
> > Is this adev checked for being NULL somewhere below before it is being
> > dereferenced?
> >
> > It could explain the issue Benjamin is seeing.
> >
>
> Yeah could be that or just for some reason this isn't returning
> the same adev as we previously had. I will do some digging see if
> I can find any likely culprits.

That was almost the culprit: client is NULL here.
So the call of i2c_acpi_find_client_by_adev(adev) fails.

I guess this explains why the next commit is also not working :)

Cheers,
Benjamin
