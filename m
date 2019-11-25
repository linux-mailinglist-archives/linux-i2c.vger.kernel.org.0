Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05015109343
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 19:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbfKYSGe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 13:06:34 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40211 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbfKYSGd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 13:06:33 -0500
Received: by mail-ed1-f66.google.com with SMTP id p59so13613750edp.7
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WTWwAKuUWg6UTMneoPZbAREPm14DI1ekGnAm26buzY4=;
        b=bWRY1ezwpLymA3aar8+vP8SxFUOc8S0tO/Kjgt5KgdQEJkpCltoXTQELabIwT9rEqv
         31RQnGq0zKY1Vf3zn9YliA+PtZ2tM9ePuU9el2Mq4D3Dx628BY+TEP6Z+JJjoV6S6Hcu
         RatAxqGLf2b/6L8ayW+1UzV37ZjRpVdFyItvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WTWwAKuUWg6UTMneoPZbAREPm14DI1ekGnAm26buzY4=;
        b=eXLMegXVw3oh/tpsNLjPZ9nOZ3TRakwecsBWbVlNroTt8/YOZcZR63axAtmN+9IiRg
         iXVc3FHdWXA3J0Q1ZDf3a2Bgg7kt8SfwVgbQhQ4jXMjGHXFWsGI841pPV2Ahti0itNl8
         m2OsPoGlHo2sikFJ/5dBvU4suc4YT4DKVTj7kkg8trYV1cVynIV/5PY2oNKrk4GcQxSh
         FiXUAiq2OoqANfwS4y1BEFw20lm7At+E2ecBeIDPBgJxjMB+w9at5tetIJoMY5adD8J4
         8JUXe7UsjBt0YIFClukrL9O+NL7PgBZZlduGTGU+qKVMdojQXXqzRywWsL6eXqvcyk/H
         knOg==
X-Gm-Message-State: APjAAAU0/llZoUm3Hg4g4BX/B8KieQpjdzGZJtDLnsoo8YwSErFKH6Yu
        FioUA24FdxAZFA7/x8/N0gVSai5V1/U=
X-Google-Smtp-Source: APXvYqydu2j5tglZUxSPQMmmxnI4/YFnr72xB6Tho9v36DDXmMTtUMo2yywj3+T7TLSiP4UrbHM4wQ==
X-Received: by 2002:aa7:d2cf:: with SMTP id k15mr19971991edr.267.1574705190855;
        Mon, 25 Nov 2019 10:06:30 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id i25sm275635edx.72.2019.11.25.10.05.55
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2019 10:06:17 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id b11so268101wmb.5
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:05:55 -0800 (PST)
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr114777wmi.69.1574705152759;
 Mon, 25 Nov 2019 10:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20191121211053.48861-1-rrangel@chromium.org> <20191121140830.1.Iae79baaa31014e8b1d8177bcfbcd41514af724f9@changeid>
 <2dcedacb-8d08-6a58-23af-e834ef9e80fd@collabora.com>
In-Reply-To: <2dcedacb-8d08-6a58-23af-e834ef9e80fd@collabora.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 25 Nov 2019 11:05:41 -0700
X-Gmail-Original-Message-ID: <CAHQZ30AXvNbT54LsYtF=W_xgnY35QByzGYbjaY0xc92O6h+SRA@mail.gmail.com>
Message-ID: <CAHQZ30AXvNbT54LsYtF=W_xgnY35QByzGYbjaY0xc92O6h+SRA@mail.gmail.com>
Subject: Re: [PATCH 1/4] i2c: i2c-cros-ec-tunnel: Pass ACPI node to i2c adapter
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Akshu Agrawal <Akshu.Agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 25, 2019 at 9:06 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi,
>
> On 21/11/19 22:10, Raul E Rangel wrote:
> > The I2C bus needs to share the same ACPI node as the tunnel device so
> > that the I2C bus can be referenced from ACPI.
> >
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
>
> Hmm, isn't this change the same as https://lkml.org/lkml/2019/11/21/208 ?
>
We both found the same problem. I wasn't sure if it would be better to
include it as part of this patch set since it was required for the MFD
patch, or to reference it. Let's just take Akshu's patch and ignore
this one.
