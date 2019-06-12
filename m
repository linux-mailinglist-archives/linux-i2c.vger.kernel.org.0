Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5BA41D71
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 09:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405050AbfFLHSh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 03:18:37 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41645 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731297AbfFLHSh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 03:18:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so11223980lfa.8
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2019 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eLHfkrcZKTo38F+HaUI6ckV79OZ0o6Qwqt61e1BrVrE=;
        b=T3WDjTm70bMNjTMTCWqVSg7AlbbkPQ8m68HplITNSif9lb4dM1J4+qSqh7Bvp7O3Ww
         Yysk1R0j0bTNnoYt8zCSs1qZ2Mvg/HDYnUQjzbxPpjFkVJ64dq01UEDZ8S/Rt6thbZw1
         5NajMHZbFg4j/a5wyeEch9lfQlmmQ4wly/T8T+D8yAuCtTqPsuadEWmNpYEWD+qI3Ujf
         Qsiq2AHo0pbd9cDZZocdVrxiX+rjbf5XzFWkKficu/3zleLrwS4ImuQ7oGn//+LMWp8f
         mTOFKEPWKMLqcqWoNsoh8P7l1Xaz0bzm+e7F2zYbglE2PY28+hh/H8bTV2RSeAHKygwB
         hNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eLHfkrcZKTo38F+HaUI6ckV79OZ0o6Qwqt61e1BrVrE=;
        b=AxIEUezsS4PLYFmMYoJvQ8fe5bj70qqn4NanTGAgRRLxR2750XVnuughq37XSQqM1a
         fLpH6/Z5GYWQpMzlzoYqFu6RWMgeQanJukVlpLfKrrR2uvpT+OpiHjLsTfvH4k0Z/AOF
         25Nop7hwWliklUQ1xiPzsO8S294Fw+BhzGmJ1faxb1GAUaWkirUgFA9IQbBuHe3Wwl5B
         xefrCYn8WEm0Yi4BzDyT90dY45CrxXL2Tr5h8Slhlnky6A7vAsYAxtTYg7apy/txFEPq
         NGSuqX3Gc1nPWuqicaR771A0yOw03sA62TnZfP50m6p+rlGrXUanzVmgHBPmnZGnaJ5C
         dZJg==
X-Gm-Message-State: APjAAAWtExOazOnJkBGJvcK+kufxEOqoT5l5Sdqmq6e5wOCZ8yYrXEO8
        QJuLo5hC1XWl0uk67vOahg2ztXYBaDtPTAsr5gRi3Q==
X-Google-Smtp-Source: APXvYqzDh4d8Jgxhz1KUU0UefThe5Mfao7GnQlNr1l1ciJMnwpzLb6ZT/NclpErH3pe+BXltkLCsA/57T4H+XLB/VdE=
X-Received: by 2002:a19:7616:: with SMTP id c22mr36520290lff.115.1560323915112;
 Wed, 12 Jun 2019 00:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190610084213.1052-1-lee.jones@linaro.org> <20190610084213.1052-4-lee.jones@linaro.org>
 <CAKv+Gu_s7i8JC4cv-dJMvm1_0cGzzhzf+Dxu0rxcF7iugF=vHg@mail.gmail.com>
 <20190610085542.GL4797@dell> <CAKv+Gu8rhxciy1cOG3B3pda9+p4R_COGrrqa7S_Rj9y2HeBxYw@mail.gmail.com>
 <20190610092245.GN4797@dell> <20190611183945.GP4814@minitux>
In-Reply-To: <20190611183945.GP4814@minitux>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:18:23 +0200
Message-ID: <CACRpkdZLO0tOuaribTWK5eMYD6_drdGJk9x7tG7YDxJKVJqOVg@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] pinctrl: qcom: sdm845: Provide ACPI support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 11, 2019 at 8:39 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Last time we discussed this the _only_ offender was the loop issuing a
> get_direction() on all descs towards the end of
> gpiochip_add_data_with_key()

I think that is still the only offender.

We were a bit back and forth: adding that code, removing it
and then adding it back again.

In a way it is good that we detect it so users do not crash their
kernels by asking for these GPIOs at runtime from userspace
instead.

It makes a lot of sense for us to ask for the initial direction for
all pins, as they get registered as GPIOs, which by definition
makes them available as such and we should be able to inspect
them.

"GPIOs" reserved by ACPI arguably are not GPIOs anymore
since ACPI have dedicated them to a special purpose
(no more "general purpose").

Yours,
Linus Walleij
