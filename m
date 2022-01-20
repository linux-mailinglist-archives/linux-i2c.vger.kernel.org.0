Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3973494CF5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbiATL3x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbiATL3x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:29:53 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4163C061574;
        Thu, 20 Jan 2022 03:29:52 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id p12so27286549edq.9;
        Thu, 20 Jan 2022 03:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rVXPQD+T4dndPhuh05MprEXrNciF2+Oy8j9nTyFCUU=;
        b=QVtMGBcmw7aIRGePBEkEDBybAaTba4c9oKg0m+dy2+YSl7IMLCDYs96kWOoxRs+Ozm
         R31b9zmEK+EI1Uz+qOnmmT2lxRaU2KW5K+uzqZzp8g93KB54daAxOd+M3k05sHm6kpXx
         Y71niBy0iiaqP8mOVcK6zkCsXnumnqKgX0w1k+pGni/lwP92sdT9De7yHzNf/G+TNgkp
         t2SW9zKM/Z74Fe88tzJehDdkReAZFrrgVN5w4E/oWL4xjSdpJHqj0Vo7hkR5+BYOlCuX
         1IsIwNqHm6H975vfEz8Va+30i9dxoqjpJ6A6ucWPsWsqqLnnzgB3uPavKe+jmwufFJkH
         RBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rVXPQD+T4dndPhuh05MprEXrNciF2+Oy8j9nTyFCUU=;
        b=PYOQHalu4jmYxjvfppoLJh3GgcBc4KWIkzQGqn50HlL2h3PRx2JeOo3P+6GR79AcOh
         OMCEZYapWm45IsTJgfLT64EEB+jjGUSZvGUTvuBo1HjeQIes90fGh+G8+k9NYT7kQLBb
         7F831kuy4SzMxktniTM1VXWNPAAtF4kU4Dho1D307yRT7AOdZ16ACxsNftQqE7d6WJds
         fTMxZskU5ipGiCSMAdincCgChAu5q8AJ3IMwXROgcOg2HYwF4m/x+TIZFAAk6zbET8Yq
         QTqwEifSzHTrjJVXNiz+/DqI6G57Cj05UXJyjislCWb9xP8zI+7vmrO3D9Nul3FusKuf
         fqfg==
X-Gm-Message-State: AOAM530JL6670+6m1HcaWz/XZIbtPBTFbpVHFxqnYVVSF3YJYDaF6fHF
        jCtCTq9uLkGQCOXhHVx2y8uSe6Y1paCa/uXbm3g=
X-Google-Smtp-Source: ABdhPJzeUYMA/JTG3LubYn41e+ve59DUy98mnVmG5v1k9gvkPJC/WxFIwzH8g5bIDVZC9YAX6ECcI1ZwwtUo9+neCZ8=
X-Received: by 2002:a17:907:6e0b:: with SMTP id sd11mr29384847ejc.132.1642678191307;
 Thu, 20 Jan 2022 03:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20220119230626.31560-1-terry.bowman@amd.com> <20220119230626.31560-9-terry.bowman@amd.com>
In-Reply-To: <20220119230626.31560-9-terry.bowman@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 13:28:09 +0200
Message-ID: <CAHp75VcGmmRpRD99tFHd7WOPs6uyz3uWuTEoc=G+VmbPYAUvuA@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port select
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

On Thu, Jan 20, 2022 at 1:08 AM Terry Bowman <terry.bowman@amd.com> wrote:
>
> AMD processors include registers capable of selecting between 2 SMBus
> ports. Port selection is made during each user access by writing to
> FCH::PM::DECODEEN[smbus0sel]. Change the driver to use MMIO during
> SMBus port selection because cd6h/cd7h port I/O is not available on
> later AMD processors.

...

>  }
> +
>  /*

Stray change.


-- 
With Best Regards,
Andy Shevchenko
