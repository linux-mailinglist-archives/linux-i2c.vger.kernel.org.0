Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA7431CF98
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 18:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhBPRuB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 12:50:01 -0500
Received: from mail-lf1-f49.google.com ([209.85.167.49]:42280 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhBPRt5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 12:49:57 -0500
Received: by mail-lf1-f49.google.com with SMTP id z11so17229904lfb.9;
        Tue, 16 Feb 2021 09:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rhXSTtfn16k/YSiMHB/4XVuKLVtDP6rMuBO4AtkABUY=;
        b=jScHYxap6aqNk2srk7XkFe8tmXg9mZm/dxDkrd2DO/8Jco2MeBATox9H4Rp7JMoh0H
         jkVuoNyDjnPUaasZKeOc+IN5OJSaLD0eXnWN5hHpMrEDNMntLOmHPU70Z4B0boukLFaJ
         zzecDM7NpQJnj7LiYLKmH1YJT/3SgeSWH5Sjz0whQfuXxPiwUSoCoywAB1CYY7wR86E0
         kuNz5hq9POsqxNildNZ6KPvKRK2u0raoKjuroetOGBuk4y2qnFRdh1L1sr21naIBGulc
         r3fc8jV4Jp08z9kMauv9JXsaszLwx6R7L8iXimkrE968acxHQbthTOoaKnPzpSOGcuV7
         kJzQ==
X-Gm-Message-State: AOAM531+Un0rkbweaqxVNSYltaG7c3A03lXjGQLSizZ0Bjv8OmIrMhwO
        plUaknmgw2k71Xl9O182+xE=
X-Google-Smtp-Source: ABdhPJxh+NfnO3L6QnP1l9eayvSWVl/fDbTvmyDgLHeVozSXQ9g+4cVE1Dr4Lh8Cse4IkD/szHOZMg==
X-Received: by 2002:a05:6512:1195:: with SMTP id g21mr11878572lfr.512.1613497754960;
        Tue, 16 Feb 2021 09:49:14 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id q16sm2313140lfu.153.2021.02.16.09.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 09:49:14 -0800 (PST)
Date:   Tue, 16 Feb 2021 18:49:13 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] i2c: thunderx: Use the correct name of
 device-managed function
Message-ID: <YCwFmc2O/wNSvFch@rocinante>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-5-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216160249.749799-5-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

> Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
> the pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors().

A few suggestions about the commit message in the following reply:

  https://lore.kernel.org/linux-pci/YCwE2cf9X%2FGd6lWy@rocinante/

Krzysztof
