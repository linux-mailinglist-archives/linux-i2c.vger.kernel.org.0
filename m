Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D504939BE
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 12:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354252AbiASLmF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 06:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236274AbiASLmE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 06:42:04 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5845AC061574;
        Wed, 19 Jan 2022 03:42:04 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id cx27so9989980edb.1;
        Wed, 19 Jan 2022 03:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1+B4sq8/6TEaBWgWEnV3mLAtHSqc2KRS8IDGfcK24Xo=;
        b=n8nJ15XTj9DsA1iPCd3e/D3UZrS/N4+PGtIrYUgw7kROEgh1GxwowG6HwoXX05BAWO
         sGHJLzDS1rKJs2Zq9cY3XgtXlLUMtVgVUwQDxzzNEx/xehkXRQCxquUBWZYqfSiP9hE/
         Gtazz9zgEhcnGsHP4RzwMwa5/D7CrJQeQUnFLOsfwcucW4paZmomSPA5K9m3KEoj1Aon
         JYcDxhzUyq/FmN7uF4ivkqMna+1myZndfJNRlBkO9Sk17KACxC3VStABrGHFzVveCUE7
         8mo7rZWl+ruqq0X4iZ+2adcfVUZyvYfv98Z0qxROLZ2oZNgpL2kZ/kZ1hgIK02YA9UTG
         3QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1+B4sq8/6TEaBWgWEnV3mLAtHSqc2KRS8IDGfcK24Xo=;
        b=OsPBZXGMcv2utlYGGjKUF6dKR6kUvsu2qlGOKQw7DCAgU3fnzkTQIc3Ou3J7CTlJHr
         Zv14AM12bIv0STKM9XiWZEl/ChcYKv6q3iAZdKz8pCoNMD4Flr7GayKbHoyPSX5JSwuJ
         yrrnHtKUwmgUrZ/hzz8FdfNAiZ/rLmsOSLP8TK1VL0KReFFDosCwtwiER2TeFJrK/DmA
         WxtQlyWLHRbC3ED8hx+1JxJSTVa+duy29aP8ivB4rr3kq88ZFp7ls9yRfuZVsPn3fNZH
         nIvTSOLvrzPAwDpm1xwbdMJRCZJkqgjZ54Ouv0JnPlpBLxfj44BJ8Hz/NHvNcAjMgS2Z
         BP6g==
X-Gm-Message-State: AOAM530qBGwCDosPGICgCx+nYtTXmoocuToI+mEpqWSjEM+6MHrE/82F
        aFioK0zf7x3ks3P+rPsm/cjT3cMfTbeBoCFJrtw=
X-Google-Smtp-Source: ABdhPJzAQTlv0R11jEPsza2Ux5Y3MNDCkdqf0w81jskUcd0V7TchTarD2HHgi0MIvTsTn5aA4xMiP5RJxiqLIh+bn+c=
X-Received: by 2002:a17:907:968c:: with SMTP id hd12mr23728698ejc.639.1642592522875;
 Wed, 19 Jan 2022 03:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20220118202234.410555-1-terry.bowman@amd.com> <20220118202234.410555-2-terry.bowman@amd.com>
In-Reply-To: <20220118202234.410555-2-terry.bowman@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 Jan 2022 13:40:20 +0200
Message-ID: <CAHp75VfD2iOF+nkCtOGyAd7sadxJWL2yFKo+zXcrv6E-ADU98g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Watchdog: sp5100_tco: Move timer initialization
 into function
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
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 18, 2022 at 10:22 PM Terry Bowman <terry.bowman@amd.com> wrote:
>
> Refactor driver's timer initialization into new function. This is needed
> inorder to support adding new device layouts while using common timer
> initialization.

> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>

> To: Guenter Roeck <linux@roeck-us.net>
> To: linux-watchdog@vger.kernel.org
> To: Jean Delvare <jdelvare@suse.com>
> To: linux-i2c@vger.kernel.org
> To: Wolfram Sang <wsa@kernel.org>
> To: Andy Shevchenko <andy.shevchenko@gmail.com>
> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Robert Richter <rrichter@amd.com>
> Cc: Thomas Lendacky <thomas.lendacky@amd.com>

Please, do not pollute commit messages with this rather unnecessary
list of recipients. There are (at least?) two possibilities:
- use --cc and --to whe run `git send-email`
- move them under the cutter '--- ' line below

> ---

> +       val = readl(SP5100_WDT_CONTROL(tco->tcobase));
> +       if (val & SP5100_WDT_DISABLED) {
> +               dev_err(dev, "Watchdog hardware is disabled\n");
> +               return(-ENODEV);

Missed space, too many parentheses.

> +       }

-- 
With Best Regards,
Andy Shevchenko
