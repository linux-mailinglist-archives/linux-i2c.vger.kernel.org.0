Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CA431C391
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 22:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhBOV3s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 16:29:48 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:41499 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbhBOV3s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 16:29:48 -0500
Received: by mail-lf1-f47.google.com with SMTP id d24so12701416lfs.8;
        Mon, 15 Feb 2021 13:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yMya29PG04OtYlPhJZ9gQ9s2018PVhvFg4KgHYMuBIk=;
        b=gtbVmeaN4yrr4uUtj81i90OnNpSWXsmILD/pNMzISHyDMVDAT3M528GQ3n6awiXLOo
         sbDs+Up5GIEFT/pNAM0hLF1URfsihZqWiawFFq8CLNfY1DZ3y2Z6fDBD77OIbM5kHYdd
         isDA6pmm/QdBHYiQZNu5CYxVzbw52sQhX82tNLrMS8jyaca41L4jj5VqqFYiz3YUE0zl
         hF5XsFKULIn5F1yHvuYaboXGaC+w4YZxRnLcJfOcOpCZ+0x0RZ7e4+tjjZs545vBe4t5
         8s0XDzAbH4Y6XXWse+gSHKgvCGb72rpjSAjHCrRIKu4CflhhA63IRPoDozzBJMl2ziNF
         Ma+Q==
X-Gm-Message-State: AOAM532MlCQUqahdIN8cElta30DXO6nNeXe1Lvr/6uYBxy2o9XnZAbwP
        CDiu+8wN2eqgMNLX7lNeaV0=
X-Google-Smtp-Source: ABdhPJy3F5BLiaJqLKLJJFL0LdFlNbb1FCGHW6EhaQDMOTrKTlILCkSvcnqcTCtt161Y1Mr1fzZfmw==
X-Received: by 2002:a05:6512:308f:: with SMTP id z15mr6897976lfd.409.1613424545614;
        Mon, 15 Feb 2021 13:29:05 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id c13sm2557641ljd.4.2021.02.15.13.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 13:29:05 -0800 (PST)
Date:   Mon, 15 Feb 2021 22:29:03 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] i2c: thunderx: Use the correct name of
 device-managed function
Message-ID: <YCrnn+L42SR4N1PA@rocinante>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
 <20210215181550.714101-5-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210215181550.714101-5-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

> Use the correct name of device-managed function to alloc irq vectors,
> the pcim_alloc_irq_vectors() function, a explicit device-managed version
> of pci_alloc_irq_vectors().
[...]

It would be "IRQ" in the sentence above.

Perhaps the "Use the new function pcim_alloc_irq_vectors() to allocate
IRQ vectors ..." would read a little better - generally, the above
sentence could be improved.  You might also want to add a more details
about why to use this new function instead of the previous one, etc.

Krzysztof
