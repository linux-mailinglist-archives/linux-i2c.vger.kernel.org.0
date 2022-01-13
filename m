Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0350F48D5A8
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 11:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiAMK0a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 05:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiAMK03 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jan 2022 05:26:29 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C09C06173F;
        Thu, 13 Jan 2022 02:26:28 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id c71so21289043edf.6;
        Thu, 13 Jan 2022 02:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=DwMuqUmXYlR2GaYYSfQP01V+oZIjMgFSYkUX0ZCqdlM=;
        b=OV8Mez2AjciehpAOr00nyvDb4Q4GWJH2Ts7Ke7IpoKHUijGliUUjnTjNNs3sznvO3i
         IEnr+UkfjcXKUUSWehRlZm5+vUnZ74FX+afKc36lgor+2sFsj/sWKAGvOQceN0y7mBoV
         Vsl1hIYZdKyHF2fRAQH/UhWrhBMQLRwfgVfvfDtqdmTLMRGir9Hi+k38re6pg8/rFQJo
         i9/jjTf00X0l8tfHC4diKbexx0dV04XqqFAhjfbJBIrs/yD7LkDLN9wUEiU6KVxlxfjU
         4iCeb5OhLxHSVT/+ZdWwdoFrpPblkf1nwFEaTeqPq9iTG1WFR+tRGJsyxNJ/7jaRph0r
         lI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=DwMuqUmXYlR2GaYYSfQP01V+oZIjMgFSYkUX0ZCqdlM=;
        b=BOBiHb3gy0keUF6LiygNa+jCsmm8MXSNZEjT4odLDEWJ6QoT0Tu9l8NQek6fzlpO4C
         gNi9p18nEwVmnQemeYgOrfVZTm14/1tTeAJ7sG7dSSBmofQe5C9R6o07Hqe+cov/MPIQ
         55x16ochZUkObcS0ZnN2ls4mgQMX9qVizwtBzyLnzx4flq0OIQ76P6yrMFRUVd1HALR0
         u2+Hq6TXGw3EbAu0LcX4k1fDpqcQHc/fIH+6YQB5DeFLtmoZY2VJv1PuWlZd2KtspQ6A
         onwcChIYbXxWWuW8IRxai+GgN1YSWXzIZcG1eBmeYYhv5KOVzIf2PGSKueOAbxAP9jwa
         DKgw==
X-Gm-Message-State: AOAM531O+2wvTw493jdufEakjYjU7kpiFEVDkNYEDsayA7gDR4/6oN5E
        +vdVXX4z1t0Oetj/DGAB8a4gGvzdNwiRggoCvHE=
X-Google-Smtp-Source: ABdhPJxbt7fzvkaekB8W9YzBhSXsfm5NiDkJE4l52p3nVzrO7bDC8JCiFe3oxPctIGwhHWWRl1pm8lS/0WfOu/iWVhY=
X-Received: by 2002:a17:907:97cd:: with SMTP id js13mr2970333ejc.497.1642069587473;
 Thu, 13 Jan 2022 02:26:27 -0800 (PST)
MIME-Version: 1.0
References: <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com> <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
 <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net> <YdoG+en5Z/MaS/wu@ninjato>
 <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
 <Yd16cw0AaYcf7eSf@kunai> <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
 <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
 <CAHp75Vf3G1ftL6VrCchCTC7UbEyWD65wdjRjYOwxY9ONxZ=DCQ@mail.gmail.com>
 <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com> <Yd/X6DlWjACLODe2@ninjato>
In-Reply-To: <Yd/X6DlWjACLODe2@ninjato>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 13 Jan 2022 12:24:41 +0200
Message-ID: <CAHp75VeR4sL1URhf+Vj6_fUjw3wgG98nZd8Mu20NzH1zM590SQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
To:     Wolfram Sang <wsa@kernel.org>, Terry Bowman <Terry.Bowman@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Robert Richter <rrichter@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 13, 2022 at 9:42 AM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > > On top of that I'm wondering why slow I/O is used? Do we have anything
> > > that really needs that or is it simply a cargo-cult?
> >
> > The efch SMBUS & WDT previously only supported a port I/O interface
> > (until recently) and thus dictated the HW access method.
>
> Is this enough information to start v2 of this series? Or does the
> approach need more discussion?

I dunno why slow I/O is chosen, but it only affects design (read:
ugliness) of the new code.

-- 
With Best Regards,
Andy Shevchenko
