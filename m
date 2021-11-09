Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A67449F40
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 01:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241072AbhKIADF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 19:03:05 -0500
Received: from mail-lj1-f181.google.com ([209.85.208.181]:45756 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhKIADD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 19:03:03 -0500
Received: by mail-lj1-f181.google.com with SMTP id s24so32704687lji.12;
        Mon, 08 Nov 2021 16:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lzVxjpwAxTNe2TEKzKAiwEFiBi7nYAra651uyu9v/IM=;
        b=OgVPZfzN3nIxfqW/1pQ7RiJCx1+6kUOQhGhGX4+BHGWc4QCnkRhoBGWtxVNoEDu+LF
         9gJrcLxRlVpsSWHPrx9i6D80tgyQND13RNokVIdCKysAhh1jLMyOy+T/E9WKvuTmzxYq
         U7Ti++kMG4Gt3jA/PejUyQPXfnmjHuGEhr14oOJo6Fz/Uun4rkUAREZicW+sKgR8h4yq
         s0005D7TsUl1hNuBSxBqBuQpO8zEPhNsHSJY25cI3SVzvmd5kqlzyMl+kVsryYZAMgI9
         tgN0x1V9C0507ypNm+qKGFMeOsknbKqbBlse+i6EUvdhUdeF5J1vTyyNjTxzQJf4k15u
         mNuQ==
X-Gm-Message-State: AOAM533DxBNIIGY1AwsVQaQ0MTHvYeBPqXxTjVGP21jxN8lUjiPCES/d
        Re05xgAW4Ro7RYGgi7x6ZHw=
X-Google-Smtp-Source: ABdhPJxQQHCrcfDajOrmynVLJgPGK9pjXl945B8H0LTmsJmrVThefr1xqxjmdWHO6dlKaupZJbdVeQ==
X-Received: by 2002:a05:651c:1595:: with SMTP id h21mr3027880ljq.77.1636416017400;
        Mon, 08 Nov 2021 16:00:17 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id t5sm312522lfd.80.2021.11.08.16.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 16:00:16 -0800 (PST)
Date:   Tue, 9 Nov 2021 01:00:15 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <YYm6D0YMGEXGFsZL@rocinante>
References: <CAP145phj7jEy6tkdFMdW-rzPprMTUckaaSrtrVysE-u+S+=Lcg@mail.gmail.com>
 <20211108185823.GA1101310@bhelgaas>
 <20211108212226.253mwl4wp7xjckqz@pengutronix.de>
 <CAP145phFHh+pMTXbdwwQK6bgxLBcF2JgQKwz2L+2vJRs2dMiVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAP145phFHh+pMTXbdwwQK6bgxLBcF2JgQKwz2L+2vJRs2dMiVg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

[...]
> > I didn't test this patch, @Robert, maybe you can do this?
> >
> > Best regards
> > Uwe
> >
> >  drivers/pci/pci-driver.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > index 1d98c974381c..202533654012 100644
> > --- a/drivers/pci/pci-driver.c
> > +++ b/drivers/pci/pci-driver.c
> > @@ -1299,7 +1299,7 @@ static int pci_pm_runtime_resume(struct device *dev)
> >          */
> >         pci_restore_standard_config(pci_dev);
> >
> > -       if (!to_pci_driver(dev->driver))
> > +       if (!device_is_bound(dev))
> >                 return 0;
> >
> >         pci_fixup_device(pci_fixup_resume_early, pci_dev);
> 
> Yes, that fixes it. Thanks for the patch.

Thank you Uwe for the patch and Robert for testing!

	Krzysztof
