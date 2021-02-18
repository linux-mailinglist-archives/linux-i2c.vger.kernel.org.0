Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4CC31ECF2
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbhBRRKb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhBRORQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 09:17:16 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038C2C061786;
        Thu, 18 Feb 2021 06:15:36 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id e9so1557757pjj.0;
        Thu, 18 Feb 2021 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PSqyUdGTB3twfGzpr0rkJfuAQ74/BJdntEYk2Uew8j0=;
        b=ck8xl5ZO5ojgD4zXc67R7gGKF7xdyJVwl6tcsHOy2lAcTlvB0gFEROTdFMaFeO2FCe
         Oz0fKsG94vTHd0hEAx4dXr9gGJ0H3wonwZ0IdPjoQRWdEMAm2YSt22+2ju3pakDkUAS9
         032lELSemywhEgLHRAna6DRdfGOSKPOmdOYjMw8o3zAoRzGZUaVcV1IIrhvM4yPsSHYt
         mCo2cwDD0aiUOoItU+sHeby+5SbQX0CluJ6qfAEASjWXG4VuwXScuKdSnkBBKoMrfD+d
         LdgN5421dX09iVKR6qahCBguMoYrtIsToHZ3XmlboPnuWEnuo5Bt+fdtHXT5u7MmvxDX
         IL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PSqyUdGTB3twfGzpr0rkJfuAQ74/BJdntEYk2Uew8j0=;
        b=LqJBbgm3f9OGlwDnkvnzkOZnD/P2JrTvCcm6Cfv7m+0KsiIiBW0iEoY5PYfR5rh3k6
         XujpRor2eI70MyP9tJbEvqjik4rYBIznTguMLQljduakM1a0jKG1odifskYpiQjx8JJ5
         vLD2rihJ5SHDusxGcqeSokC0ARbvh9MD89DGO5dkoumy2qLKrAd61jTpWXshyLATto5w
         efpihJQ4L7InC1kZMLpeCB3mHf/XwPCQrFAbcBAavJ2nAiSc0mC3ua3DsQIDaRRu0I4x
         uYb2dF+gGUooiHJT40QUr7uRfqRTt3JvC0toe1BgYPIfm+Ua31dWm92J3Gw6tbfPGyEZ
         uT2g==
X-Gm-Message-State: AOAM532JC56KmCP5cpHSpxb6OGRWVorM4JvsoVwycLmx8t0MX5m+NHX/
        7PbZsDtf2GN54HNwHCe0zEc=
X-Google-Smtp-Source: ABdhPJz/cGXsUNcWYRM5m4W0CCThC5C9l7KWYZzRgAQFScVlKxvVBmli1ifUZWY1HQtD64OfkBVkZA==
X-Received: by 2002:a17:90a:77c4:: with SMTP id e4mr4067588pjs.185.1613657735492;
        Thu, 18 Feb 2021 06:15:35 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id g3sm6387903pfq.42.2021.02.18.06.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 06:15:34 -0800 (PST)
Date:   Thu, 18 Feb 2021 22:15:32 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        helgaas@kernel.org, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <20210218141532.GA783878@nuc8i5>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-4-zhengdejin5@gmail.com>
 <YCwE2cf9X/Gd6lWy@rocinante>
 <20210217114014.GB766103@nuc8i5>
 <YC0eVZf4Xci0IF5+@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YC0eVZf4Xci0IF5+@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 17, 2021 at 03:47:01PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 17, 2021 at 07:40:14PM +0800, Dejin Zheng wrote:
> > On Tue, Feb 16, 2021 at 06:46:01PM +0100, Krzysztof Wilczyński wrote:
> 
> ...
> 
> > > The change simplifies the error handling path, how?  A line of two which
> > > explains how it has been achieved might help should someone reads the
> > > commit message in the future.
> > > 
> > To put it simply, if the driver probe fail, the device-managed function
> > mechanism will automatically call pcim_release(), then the pci_free_irq_vectors()
> > will be executed. For details, please see the relevant code.
> 
> Perhaps as a compromise you may add this short sentence to your commit
> messages, like "the freeing resources will take automatically when device
> is gone".
>
Ok, I will do it. Andy, Thanks for your help. And so sorry for the late
reply. Yesterday was the last day of the Chinese New Year holiday. There
were a lot of things to deal with.

BR,
Dejin
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
