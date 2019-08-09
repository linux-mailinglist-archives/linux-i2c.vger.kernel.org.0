Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5FD88290
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 20:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407120AbfHISeZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 14:34:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41707 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfHISeZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 14:34:25 -0400
Received: by mail-ot1-f67.google.com with SMTP id o101so1338319ota.8;
        Fri, 09 Aug 2019 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AKmwT4Oi8XTfOBRZ+EHljM27mGDbATZqErOPdgBZ4Co=;
        b=uNRSX3SRj+xP7NvVoVokIMCRX8HCckf6BPeA7+psneOxE6/T6dicMcRo/VV/vCJxhH
         2ah1jUGPfiEAX0QZe8uTSWR6gFWhgEkVpd7BLRD+hlm1cr791u27ba3ZV816f72C1ok8
         DJvRUpLPV43j5Uaws2WuWHOl5aDZAhlefm6RklI/GKafNpFMkZ7uGhbJLlx6oN0VDFGK
         p9qsSUzTb1aagLcVK1DFaMoBq3cp8E+gw3IHnqJRv0XMMx6N9H/htf+j/p8DpyKdONPx
         7eeraJq2zzFsYaU+6cMltnQHj6kObut6IugXtD7G6VOMY3hT8BtTcsGD9yo4ss/GdWjx
         jZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AKmwT4Oi8XTfOBRZ+EHljM27mGDbATZqErOPdgBZ4Co=;
        b=mkFlhg9mKuybD05VadrXtaYj4DA+ykbi8CQLwYxYL9eGls7zBmXMx8Cg1PSkq9WNPv
         8Z2AaxZbkYL6v6tRU17a8E8V/UJIASI65JVNwxeL307bv78YxW7j3g30kR1QIp+nrui+
         um8ag6RbF7LUT5DRqKP1HAOZe6B+A2j2yCaX1RItq377pQq2U78/luQ56mPsSKzwk4av
         kCcm53ncpDod8hicd9+tQpMv0fn+ssjhobrfhxII06l7dZ1kkc8Zd9Ulis437TOqZAba
         UHN7MXtfcMP5+Zs3ui9J7uvjXqGf4sIedV+Thz/bsCh8T0JDwNzuUmZuBP80OdeaLmH8
         A23Q==
X-Gm-Message-State: APjAAAWTIvrTAryC35K5peaqSpDoD7sCPzPjUIK64lRUashjI3crI80R
        0lbIo6IBfjkaWowAse5+4iwzvUkoiIxzgmbcCQg=
X-Google-Smtp-Source: APXvYqxeNb9oXB+s8Utamw3Uuce2Zu+9B+X1DtgWilPG1ZjoTGNqEEBHw02QzXop4CuNga1GSGo5G+1XOzKOUdUwEcY=
X-Received: by 2002:a5d:9a04:: with SMTP id s4mr22651344iol.19.1565375663936;
 Fri, 09 Aug 2019 11:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190809162956.488941-1-arnd@arndb.de> <20190809163334.489360-1-arnd@arndb.de>
In-Reply-To: <20190809163334.489360-1-arnd@arndb.de>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 9 Aug 2019 11:34:12 -0700
Message-ID: <CAA9_cmdDbBm0ookyqGJMcyLVFHkYHuR3mEeawQKS2UqYJoWWaQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] [RFC] ARM: remove Intel iop33x and iop13xx support
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Russell King <linux@armlinux.org.uk>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Martin Michlmayr <tbm@cyrius.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[ add Martin (if cyrius.com address is still valid) ]

On Fri, Aug 9, 2019 at 9:35 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> There are three families of IOP machines we support in Linux: iop32x
> (which includes EP80219), iop33x and iop13xx (aka IOP34x aka WP8134x).
>
> All products we support in the kernel are based on the first of these,
> iop32x, the other families only ever supported the Intel reference
> boards but no actual machine anyone could ever buy.
>
> While one could clearly make them all three work in a single kernel
> with some work, this takes the easy way out, removing the later two
> platforms entirely, under the assumption that there are no remaining
> users.
>
> Earlier versions of OpenWRT and Debian both had support for iop32x
> but not the others, and they both dropped iop32x as well in their 2015
> releases.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm just guessing that iop32x is still needed, and the other two are
> not. If anyone disagrees with that assessment, let me know so we
> can come up with an alternative approach.

I'm not sure who would scream if iop32x support went away as well, but
I have not followed this space in years hence copying Martin.

In any event:

Acked-by: Dan Williams <dan.j.williams@intel.com>
