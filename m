Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52872112022
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2019 00:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfLCXTF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Dec 2019 18:19:05 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43759 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfLCXTF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Dec 2019 18:19:05 -0500
Received: by mail-pj1-f68.google.com with SMTP id g4so2124913pjs.10
        for <linux-i2c@vger.kernel.org>; Tue, 03 Dec 2019 15:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9aXu3KlzmsFJZ6e1TagDw+H66vR2neNxwDhx8plTDXE=;
        b=P2ym4D4fL1+2jZqsid93tZ5apni+LjMsWc92QordN593FLqJA+W4QsDirE/huNl5P1
         knTb5ViKDuyT37oe2VN6u4X65E0qoBXrLkTPFAuJUi/5puCIe1qhO5AoFzYvaAhJhDJ/
         ZGHsuAM2+IsfbemFqexEjQZ4n4aB/Wh5ZwyttSwHl/fUGPvWV8l/4obp0kKZH4Bn7wN8
         NCNmGeMIhEC8bdCNINKJ3DfitAYpZweN1bWtt3twrfio7lymvab4N1QAZRZDbCoA8ly6
         E8ZrLQ9Zp/SCypjcbsQgMv1HiPrzTDj5AEqazdjiq8h5eXDuVNBII9xFODUIIb0IxZ2V
         PfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9aXu3KlzmsFJZ6e1TagDw+H66vR2neNxwDhx8plTDXE=;
        b=jSg93CyEy1F1/UnGZErs0WhmCm4iSjctfeSqWRjvY4JUCFkG558yWLXc5VQxKbQ4or
         F5AK8H9611EDga4oyU85SIxPA2XhR77kXzR7fiOnJh/7q9l7Lp49eI7KR3KnP+vlgSdu
         2zG1ZKud35WnSi/vbgb2IEpuJDADaXDUbSx9Voo11FXClOJ3DvBumv4AuPu9VnCxLfeg
         ZlXvl4D0bkzZkZJdYB+2Q4Ye+hvsCcDzCeO/oSVZJ1M6AOPqPsBw+wkvpx9k/k69T9S+
         5P5W8ngvw6PygtsyMSbaAoCcwuVuTLTmW5DG2VujVQ+Z4Q4VoJaeeWvmPqVtXaKVk7jI
         glWA==
X-Gm-Message-State: APjAAAUhDEbkliJdEfJEkiXdlLDtv1ngCyeDHzMLJ9iMPaNVLYYCY2eb
        9fDIePSXg6zBe16eMEU7qQpQmtSFd0HH8VcKdUX2BA==
X-Google-Smtp-Source: APXvYqwaPUhrCsgUEC6zT/MsYaJdSktVjMyOaLL/ZwQxaZzTYw2kYgyCxNVMDYa3yDWpwXTVusT3MTlJbF4W8DELTSA=
X-Received: by 2002:a17:902:7c84:: with SMTP id y4mr417290pll.297.1575415143951;
 Tue, 03 Dec 2019 15:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20191125202937.23133-1-roy.van.doormaal@prodrive-technologies.com>
 <20191126074025.5112-1-roy.van.doormaal@prodrive-technologies.com>
In-Reply-To: <20191126074025.5112-1-roy.van.doormaal@prodrive-technologies.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 15:18:52 -0800
Message-ID: <CAFd5g450nWm47mFi10W+J=oiaO_sV0fXh3SwH0zxX6ZF1qZ-Xw@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/aspeed-i2c-ic: Fix irq domain name memory leak
To:     Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 25, 2019 at 11:41 PM Roy van Doormaal
<roy.van.doormaal@prodrive-technologies.com> wrote:
>
> The aspeed irqchip driver overwrites the default irq domain name,
> but doesn't free the existing domain name.
> This patch frees the irq domain name before overwriting it.
>
> kmemleak trace:
>
> unreferenced object 0xb8004c40 (size 64):
> comm "swapper", pid 0, jiffies 4294937303 (age 747.660s)
> hex dump (first 32 bytes):
> 3a 61 68 62 3a 61 70 62 3a 62 75 73 40 31 65 37 :ahb:apb:bus@1e7
> 38 61 30 30 30 3a 69 6e 74 65 72 72 75 70 74 2d 8a000:interrupt-
> backtrace:
> [<086b59b8>] kmemleak_alloc+0xa8/0xc0
> [<b5a3490c>] __kmalloc_track_caller+0x118/0x1a0
> [<f59c7ced>] kvasprintf+0x5c/0xc0
> [<49275eec>] kasprintf+0x30/0x50
> [<5713064b>] __irq_domain_add+0x184/0x25c
> [<53c594d0>] aspeed_i2c_ic_of_init+0x9c/0x128
> [<d8d7017e>] of_irq_init+0x1ec/0x314
> [<f8405bf1>] irqchip_init+0x1c/0x24
> [<7ef974b3>] init_IRQ+0x30/0x90
> [<87a1438f>] start_kernel+0x28c/0x458
> [< (null)>] (null)
> [<f0763fdf>] 0xffffffff
>
> Signed-off-by: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>

Sorry for the delayed response.
