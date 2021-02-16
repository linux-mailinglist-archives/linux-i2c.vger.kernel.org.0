Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF18B31CBE4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhBPO1X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhBPO1K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 09:27:10 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D792C061574;
        Tue, 16 Feb 2021 06:26:29 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id z68so6337394pgz.0;
        Tue, 16 Feb 2021 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=faHK0cyvGGeTK0Lu2KFV2g1IzncYxmvTiObKgbcKmx0=;
        b=qRlbmw9QjZCjMvUcUGVN8zUC3MT5NH+dYnEVedbk1SZi/hod3HnSm239TTk2FHeNkJ
         47kpT0p57IWaSec4PR9BFHfJ8jg52O/paiSrSEaYF2BVX4EdeUYREInTzKa1SvGmxqfw
         05bwsThstX++KCMslLXP1SgjzvDSBk+XCe/yc3DFAjmryMHMM54cpZ/AmqSIqJtVQxtf
         Vif7+CBybed6x9vCFHj0QNLoQRFRdSbarw8AZENJgoIm2ayyyN9V6KLSpkyuKkUs1H/H
         8TkNhjds0aFcVmiaXvPsNa9Uq0QbKHam/pt+Rv5nxXrgVw0wXaiviNQrn9jYK2ayYByY
         5QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=faHK0cyvGGeTK0Lu2KFV2g1IzncYxmvTiObKgbcKmx0=;
        b=PVzVHW0+cIVND28siBgn5ME+ZiTYltipgLrXo5D7vJsovbtuIuYe9Z9shZEkGWxIGy
         tNZAGeT3EVRvYLvzvH5fMKIv/XqwXTtaNBFum2MSYyBkmcXWJCOWczSmDJVPUVY/V3UR
         mJPX3ljqG43ijbD5DHhUlIT84fe8FtQNPdlGal1cR3roq0ocksFg4I4waDdchSp6ZyBH
         I53goXJt07+5OQMC/2Gz8L9Kgc5vi11Yeb4OWTlCsmHbd9G2UYSNfTlThLD9ZSXk/mzP
         QJwNes/o+Ufa4nJDyI8SUh/UtO9ArejGkg4A3i/rNYxjhn0ydOhdxir0ADUSGNAb4V+y
         bE9Q==
X-Gm-Message-State: AOAM533B+CFikrlbHwlp1XTrq3bn19HK+HmHbet3yA4mWnd1O9xM4m54
        KEKg+G87JY5oFwODsPlH9GE=
X-Google-Smtp-Source: ABdhPJwiT1RhR1WEFZ7nGGATonnaewsEVZLnFdy6/orkPw4DRiIJmMOFovA/RiTlQCYGzqf5YWP2vQ==
X-Received: by 2002:a63:af1b:: with SMTP id w27mr19028491pge.162.1613485588909;
        Tue, 16 Feb 2021 06:26:28 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id t1sm22289668pfl.194.2021.02.16.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:26:28 -0800 (PST)
Date:   Tue, 16 Feb 2021 22:26:26 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        helgaas@kernel.org, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210216142626.GA747814@nuc8i5>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
 <20210215181550.714101-2-zhengdejin5@gmail.com>
 <YCrfqungNSSxe5lK@rocinante>
 <YCual+Fq9mcnxbM4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCual+Fq9mcnxbM4@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 12:12:39PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 15, 2021 at 09:55:06PM +0100, Krzysztof Wilczyński wrote:
> 
> > Question: wouldn't you need to call pci_free_irq_vectors() somewhere,
> > possibly to pcim_release() callback?  Although, I am not sure where the
> > right place would be.
> > 
> > I am asking, as the documentation (see [4]) suggests that one would have
> > to release allocated IRQ vectors (relevant exceprt):
> 
> It's done in pcim_release() but not explicitly.
> 
>         if (dev->msi_enabled)
>                 pci_disable_msi(dev);
>         if (dev->msix_enabled)
>                 pci_disable_msix(dev);
> 
> Maybe above can be replaced by pci_free_irq_vectors() to be sure that any
> future change to PCI IRQ allocation APIs.
> 
> Yes, I have checked and currently the above code is equivalent to
> pci_free_irq_vectors().
> 
> Dejin, please update your patch accordingly.
>
Hi Andy and Krzysztof,

I have modified it and sent patch v2. thank you very much!

BR,
Dejin

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
