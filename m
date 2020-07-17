Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291F7223614
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 09:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgGQHio (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 03:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgGQHio (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 03:38:44 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098A9C061755;
        Fri, 17 Jul 2020 00:38:44 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a8so6959505edy.1;
        Fri, 17 Jul 2020 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HYlYHaXrSBXNi0NVDqqqHS+e0SeY67sAsg23gifnEls=;
        b=EyE6mm8hEbMtxJ+oyKyxzn3TqzKqFG6VN8VirfUtyDZKe8t0Qw+Va9Dg1tJSaoMjeb
         40wVa4SukSIw80AHHt+iSsSGftd8HWeVwXEhYxbIRrrqKG7v0227ZsuiNYk5FcGFq3jv
         OELSbp7utYhT5EDGe1O9GEOylhsBK39Nf8vJUIHtrsdCf9V9CUFU2iREu9qJXseas9QZ
         MzneKq61QmKfC0EKHS76qAQFDp5PnXyp3zCsufMAP+bbx1rKtAYvddpqTU03sMHM+1im
         Kbhs6aS5NLMsULVy72wkf+ORqSycTQBmnK4nt5WKrw0Jku8FdT/f6RFJJg7xu47yqZPk
         ga3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HYlYHaXrSBXNi0NVDqqqHS+e0SeY67sAsg23gifnEls=;
        b=oPUx1h2CGIdMi4Fv+HafVD/q3oE785LrHxJIY47MFMeChtni+SXwtcRrFvVCAmzrwg
         wyK5urfNR9OhqEoDUehyjNEK9IcDjlrRhBDPdiv0P1QfgwAAwNWJ4rfk96mHS1tmE4z/
         TA6GHuLWwEH5fs0xo8UYvftTycWvBABWa3IhHJPw572UyJYraUXEOSW20mMHoL75ZWzi
         H8pQkScn+9lHsASh7aejfk5n6uEpqDQFCMGB/srb2AFzASw2yZqkWoobD6fDq2BRRt5X
         qZDUIvmtqUj8mrCgJ35M8m0EGEoeHvySjHLz29AbuL8cTohYdzoYq3Z7XDlOy8d5C8s6
         oUaw==
X-Gm-Message-State: AOAM532G2cMq6JD6mVuAHmILChebia8ZO/M57s2/Z8uLucPI8wL+6wsC
        AfthNVSgJw7vs7epb8oaY5GJ54LPkTrm2r1gKqk=
X-Google-Smtp-Source: ABdhPJxQYjnXkfM8fJrQdkfzoCNdIh8vAoQXVxzKyrXC0Fj3imagKRKKoeb6nvJLoOdtJ7W+TxVYoP2s03ArnQ62KTU=
X-Received: by 2002:aa7:dd10:: with SMTP id i16mr8203210edv.227.1594971522683;
 Fri, 17 Jul 2020 00:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594708863.git.frank@allwinnertech.com> <ffd5eead-571c-6548-0527-1e685ec869ef@linaro.org>
In-Reply-To: <ffd5eead-571c-6548-0527-1e685ec869ef@linaro.org>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Fri, 17 Jul 2020 15:38:14 +0800
Message-ID: <CAEExFWss+KWSDu4VNa8JCkT7QOrgeYCausO0KxkXCbnXE3+-0g@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Allwinner A100 Initial support
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Frank Lee <frank@allwinnertech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, gregory.clement@bootlin.com,
        Thomas Gleixner <tglx@linutronix.de>, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Lee Jones <lee.jones@linaro.org>,
        "p.zabel" <p.zabel@pengutronix.de>, clabbe@baylibre.com,
        Icenowy Zheng <icenowy@aosc.io>,
        =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>,
        stefan@olimex.com, bage@linutronix.de,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 17, 2020 at 12:28 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 14/07/2020 08:55, Frank Lee wrote:
> > From: Yangtao Li <frank@allwinnertech.com>
>
> Do you expect me to pick patches 7,8,9 or ack them ?
>

Please pick it.

Thx,
Yangtao
