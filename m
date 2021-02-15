Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3658931C3BB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 22:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhBOVmM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 16:42:12 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:44945 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhBOVmK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 16:42:10 -0500
Received: by mail-wr1-f50.google.com with SMTP id g6so10750487wrs.11;
        Mon, 15 Feb 2021 13:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1hd4+cHjB/VGp/H5x8gxIpoGgJ92CAnP2iy8ZSV1Dqs=;
        b=GIhMFWImDJauxCnvYUSC/QJYlW3DkHrkcUXMXrc659fmHYLqjOz7CYT8sivMDyFz60
         5VA7Yt1Q0NSFEwc6V63zsOTjIRmyvRqgK4eZs8qVyyYmpvQoQgHFNGfEOIfOf79hH9ba
         i3e1YIwPkWPyM2tUL0eqpu4Y4hSwj/KoBTWW23v3aCGuuMGFBvi3G+Y3+3xoDDYqK4Rz
         rDS8BuqxQ6sRhPNFNq5BFUhmKAl8o1NSxh+zBYs+UFCDzriR7rnvnftM9Rb5q4sf3izj
         tCl633UbvcrAIVTI2ILhPHx9qRGhoRAAiUPjlHdwZ9wofsv5d4B6ElfIgmoTIiYu8DjA
         u/4A==
X-Gm-Message-State: AOAM531LzFmLN8/du9LOPC27o157qtDNiOfUcWsddlNwOOUUmze1g5V+
        3pJ8FtB5JdZcU0eEEYmyTAs=
X-Google-Smtp-Source: ABdhPJwuxsALHvbRUf/auKOqjzM3BZ//wMc77VB4iZ2Qkrk1K0N1oDqa5WlHjjoZRPK3Q3FUemP/ag==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr4697994wrv.381.1613425288469;
        Mon, 15 Feb 2021 13:41:28 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id k11sm24839616wrv.51.2021.02.15.13.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 13:41:28 -0800 (PST)
Date:   Mon, 15 Feb 2021 22:41:26 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] Documentation: devres: add
 pcim_alloc_irq_vectors()
Message-ID: <YCrqhtAIwMio+PNw@rocinante>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
 <20210215181550.714101-3-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210215181550.714101-3-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Dejin,

[...]
> add pcim_alloc_irq_vectors(), a explicit device-managed version of
> pci_alloc_irq_vectors().

It would be "Add" at the start of the sentence.  You could also drop
the "explicit" word or replace it with "an explicit", if you want to
keep it.

Generally, this commit message could be improved - you could explain
that you are updating the documentation to reflect the addition of this
new function called pcim_alloc_irq_vectors(), and also briefly explain
why it was added, etc.

[...]
>    devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
> +  pcim_alloc_irq_vectors()      : managed irq vectors allocation
[...]

It would be "IRQ" here.

Krzysztof
