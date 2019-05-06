Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3981A152ED
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 19:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfEFRll (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 13:41:41 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41669 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfEFRll (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 13:41:41 -0400
Received: by mail-vs1-f66.google.com with SMTP id g187so8659911vsc.8
        for <linux-i2c@vger.kernel.org>; Mon, 06 May 2019 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dH/alIcSKffA1y2RRlZpvtM5MZ4euuymjniYCSBueNk=;
        b=KE53O3Y8F/GfFN+9A4pCqL+PxAzhiCWWW4PA5x7wEj5ThydBOQWLySloLsIj1r94/l
         jge3nd+TBY5mcxaVry8MdgIBTFR2FuPHrxJ2jWnfa90EasrHNeOepJlAzznWKOeQGtwp
         uuOmngpZD6le8N8O0uiBiOjnOAbTxdVZCjHZhGQDixeIoy/oBSc/IZVKAP4q9xRSgg4W
         cUXcmYsQtJJhZJEVvqptHnyfSqCp/zwykrlrE7OYpCm71Ir/uOeR9h2ctg04s8FvQOGj
         /J/1gmdLZMW7oe6cJGAIaivR3YgmhWlYZggjlPgl2s03vtClNZzBgwj3R66mWkF75Zxz
         4Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dH/alIcSKffA1y2RRlZpvtM5MZ4euuymjniYCSBueNk=;
        b=uTid58K89PR9HPCYJLX/oDalZ9GX+qq5LDPQzJFy40AyGaqaZC7CXjmQAYqxhefYk9
         E17t1kbZwvEF/qpK63l5ZxYb2qrTm66hZvJxAKaeUWGx5m8kLtcecigwSiiVAHRK5xbW
         jM9dmhTvZVKGPvCaC7V9yI7zM7W7RzLYVFip4offdx5mxdYBN9Mi0Tw7XOvsIpuHW7hx
         +QxxdiGTjYMvT9FS++XziK2fI7RARfNnD3/zYxtDiBtAwZFv62VACfKlY5TtJUjfud9E
         H+ESZYs5ixWIA72v//ou+1YzU+69vzs7ksQJ7FrnOmGM+EyhqChh42fTig6rJloddVxp
         XdNg==
X-Gm-Message-State: APjAAAXJQIBZUeyTL0arjIjcEtts558U7SsVPDwaFyYDRsod2HEK6fjm
        Qgtf/BMdMBlLs2ZVo9V8Rk27HtAigZGqZ10HbFF2YA==
X-Google-Smtp-Source: APXvYqxyqvGFoX7WBWffNIKwJK+F9jk9BgOypI6lRO8xNum7HGbXRziLtoNK+1GxA8rZtYpvDoC6d7TT7WItEsI3tAo=
X-Received: by 2002:a67:e9d0:: with SMTP id q16mr14654015vso.178.1557164500244;
 Mon, 06 May 2019 10:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
 <1557147240-29551-2-git-send-email-sagar.kadam@sifive.com> <20190506131919.GC15291@lunn.ch>
In-Reply-To: <20190506131919.GC15291@lunn.ch>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Mon, 6 May 2019 23:11:25 +0530
Message-ID: <CAARK3H=fY=Y9GDR-t6RLBV4wOEduPD++F5NKAayNGeuHudrtew@mail.gmail.com>
Subject: Re: [PATCH v1 v1 1/3] dt-bindings: i2c: add documentation for adding
 SiFive I2C driver
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, peter@korsgaard.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 6, 2019 at 6:49 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 06, 2019 at 06:23:58PM +0530, Sagar Shrikant Kadam wrote:
> > Add DT binding for OpenCore's based i2c device as found in
> > FU540 Chipset on HiFive Unleashed Platform (Rev A00).
> >
> > The doc explains, how to add DT support for I2C devices.
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  .../devicetree/bindings/i2c/i2c-sifive.txt         | 29 ++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sifive.txt
>
> Hi Sagar
>
> Please extend the existing i2c-ocores.txt file, not add a new file.

Hi Andrew,
Thanks for your review.
Yes I will extend the i2c-ocores.txt to support sifive devices, and
will submit a v2 of this patch.

>
>        Andrew
