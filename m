Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB22229A96
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 16:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732568AbgGVOvC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 10:51:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729642AbgGVOvC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 10:51:02 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1537020781;
        Wed, 22 Jul 2020 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595429462;
        bh=UFg8p6XUT3wel8u+pTVmAEQCqcMZyxNqpCVV4vZzVMc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VcRRbZrD6WNnKeyKewcJj9tHSrLiYKaq6m364i5sVnALdpBTaDVlKnhHT0t8WBf3K
         E9PvkOgMkx4Fh5HLEq8fzsRlTkYNy+GV0xC5uwgJaZm3meFbN0iC/3VY8Dr4GSViYo
         jTWlSXbIWnPZp3Jm3OtmqjO/Ngmz1S0tdyysRyyg=
Received: by mail-qt1-f180.google.com with SMTP id w9so1999860qts.6;
        Wed, 22 Jul 2020 07:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM5338apLtI3/ZvFV8XDWlaNzGFGMPwVNBsc310l4e9W+kR4hIXoav
        ogzwX75J/G8C378JZcmf6DAzw2ZqoH35zBJruA==
X-Google-Smtp-Source: ABdhPJxethsoctJJB0o77sxPGUSotqTgfoUhSN0xia9aMDrxFanpo8xBBYO162v9hQXL4xR8Wr9VZjmxIPSoRoE1XL0=
X-Received: by 2002:ac8:3981:: with SMTP id v1mr33942454qte.134.1595429461258;
 Wed, 22 Jul 2020 07:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200717160407.378140-1-robh@kernel.org> <20200722105036.GN1030@ninjato>
In-Reply-To: <20200722105036.GN1030@ninjato>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 22 Jul 2020 08:50:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLVpzo6hoycwbne7td8x8un54y0X0qm-_+EqnV+D3SqWA@mail.gmail.com>
Message-ID: <CAL_JsqLVpzo6hoycwbne7td8x8un54y0X0qm-_+EqnV+D3SqWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c-gpio: Use 'deprecated' keyword on
 deprecated properties
To:     Wolfram Sang <wsa@kernel.org>
Cc:     devicetree@vger.kernel.org, Wolfram Sang <wolfram@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 22, 2020 at 4:50 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Fri, Jul 17, 2020 at 10:04:07AM -0600, Rob Herring wrote:
> > The i2c-gpio binding is the only case of 'not: true' being used for a
> > deprecated property. Update it to use the json-schema 2019.09
> > 'deprecated' keyword instead. Define the type too in order to keep the
> > meta-schema happy.
> >
> > This will disable warnings for these properties until the dtschema tools
> > are updated to handle 'deprecated', but they are only used in a few at91
> > dts files.
> >
> > Cc: Wolfram Sang <wolfram@the-dreams.de>
> > Cc: linux-i2c@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Your tree or mine? for the latter case:
>
> Acked-by: Wolfram Sang <wsa@kernel.org>

Thanks, I've applied it.

Rob
