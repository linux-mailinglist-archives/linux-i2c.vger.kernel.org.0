Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D3D494CA8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiATLSa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiATLS2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:18:28 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F192DC061574;
        Thu, 20 Jan 2022 03:18:27 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id b13so27401866edn.0;
        Thu, 20 Jan 2022 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYznKRiK5g7CfFmaVdNvA0d2kFj3axg/oPfOo8yHfjI=;
        b=dN1JxNjzaE6UypiJKF16uylqBOqi3bSxi3++gJeedb4nf+GlXG/9wwYo90YWmgQr3X
         dLV4hYuvI8QOJnTVGYYznGTVPYs64OOhUq5jERz7xSJv1ZzQAlCcQzjabSrd48mUmPQX
         CTYWzGzZgBPllFmp9xlrwlZgHxP4Zdvukenk3Cc7gdCLD0vuOn7ObG0dbrFJbwucgSMq
         XHfCYUm9pyLsJjkq9MTD6t+ojBV0zLrGmYnAsdyYEhvejybXobZ3fqB8SCDwC8hM+S/Y
         eiidnynCUtj9jxVrBhb8voK3veTIDFDMbeoNhUcQNCj7Fxl4/gZtKSVWCeBQayj/fXuc
         uN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYznKRiK5g7CfFmaVdNvA0d2kFj3axg/oPfOo8yHfjI=;
        b=d+Z6jnKGckaCdi0jGdHdDvPMbO7yGGw70BDiVmdwTRELtpTB2AZ5rnK1r1Q6kastT7
         bxV3sr4+erkEWBPvl9nuJF+2fRk8SIFU8Q0zwpYLjM2y8SAFkWbwe4/kAtqscYvNDJWw
         QsV7ZAWGQv/LSR7te76r0bkRkm6xaw+A5YnLF2vowEN96TJtKa8x9yvTWs7TKeM4oqqI
         8256IAW9pQpF91wg+G2sEAOxv7j1B2uftv00vwMQ7g+9ypxWHQZjB22LacYs07ms3biL
         icF8F1kPAafOKGZekZXTVgtFRLmX6eCaYaXtipP9QPM2eVRiYoR8f2JF0B8ZQiMM1tj8
         HVhA==
X-Gm-Message-State: AOAM531LnZGTRzJE93T7+H3ZT8dI+kbm2lvsoaa7PKDXR8lp7Hnst/L0
        M+SZ3jfybuxfb0mqI1hhiEM3toYfrKj26YtZGzU=
X-Google-Smtp-Source: ABdhPJx767rJLMA6eTAcCaq9p5AJkD+2oVe3jWOiDHLuHzoCUpNyU5SrSAyKwHIGM9AHUpjcTTRQU4a/hfKE05d8Gb8=
X-Received: by 2002:a05:6402:35d3:: with SMTP id z19mr20435289edc.29.1642677506548;
 Thu, 20 Jan 2022 03:18:26 -0800 (PST)
MIME-Version: 1.0
References: <20220119230626.31560-1-terry.bowman@amd.com> <20220119230626.31560-2-terry.bowman@amd.com>
In-Reply-To: <20220119230626.31560-2-terry.bowman@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 13:16:44 +0200
Message-ID: <CAHp75VcA56fe2Q=LGbmNDknbsupkKnxGqLBvm3ADPBJRAy6rsw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] kernel/resource: Introduce request_muxed_mem_region()
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 1:06 AM Terry Bowman <terry.bowman@amd.com> wrote:
>
> Support for requesting muxed memory region is implemented but not
> currently callable as a macro. Add the request muxed memory
> region macro.
>
> MMIO memory accesses can be synchronized using request_mem_region() which
> is already available. This call will return failure if the resource is
> busy. The 'muxed' version of this macro will handle a busy resource by
> using a wait queue to retry until the resource is available.

...

> @@ -262,6 +262,8 @@ resource_union(struct resource *r1, struct resource *r2, struct resource *r)
>  #define request_muxed_region(start,n,name)     __request_region(&ioport_resource, (start), (n), (name), IORESOURCE_MUXED)
>  #define __request_mem_region(start,n,name, excl) __request_region(&iomem_resource, (start), (n), (name), excl)
>  #define request_mem_region(start,n,name) __request_region(&iomem_resource, (start), (n), (name), 0)

> +#define request_muxed_mem_region(start, n, name) \
> +       __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)

Looking around tells me that this name is inconsistent, I would expect it to be

request_mem_region_muxed()

>  #define request_mem_region_exclusive(start,n,name) \
>         __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_EXCLUSIVE)

If you are fine with this, take my
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
