Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A995B7715
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 19:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbiIMRCK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 13:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbiIMRBP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 13:01:15 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC0C72B58
        for <linux-i2c@vger.kernel.org>; Tue, 13 Sep 2022 08:52:02 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id 138so8971697iou.9
        for <linux-i2c@vger.kernel.org>; Tue, 13 Sep 2022 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=CGLCtRbWwRCAf6WmqGJBYksHAfnT5oX5xIBwMzUyvqg=;
        b=Gjb/1drlC0T1KT6qKQp+EOjvuce3jT3ddBuZmCIhUCD1JjfynIXluqq+ydAE0YYAmG
         p+5JnSpv26BEqUDuJzeFgV+cDv+pcrHfjXDLRRItnLSsP1xlI5YcJEZJ7pEhDX8zjIh3
         cRbSM6dRKjNE1AtZwiNsW22tXNeNU6ZbagvXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CGLCtRbWwRCAf6WmqGJBYksHAfnT5oX5xIBwMzUyvqg=;
        b=0B7kqH0AW33vTSnshLbRwfVXg3Bs+/cwLKtz8TlodL05/pbeIroLxc2dXpiJ3Pq/Da
         /8NFy0EB0snbVNNJMcqeswxTTbTcMTgk4MDEijxZAKS7oaJsZG5uYynigWI3bYBe4JY+
         nYLXP7mXrpCm4DB4pUpbUDleeOp/pWFMuSZM4E/lt/uxfaFqk3004Lkbjtm9hg+VTF+j
         toDve+aGj0iRoykZY/VfmCaoRODkIpQmZmEdt7dGiW+Z3oCyXqlaz7ooxLEl97ynfq+B
         YF/yDpHDCUOH0Wdt0tGyUDR3ln7bI/vJjV8Bptuwafr35fM9bs/0zrBDWYzsjz0SgJsR
         45yQ==
X-Gm-Message-State: ACgBeo2+Nx34iREyHg0asrLn9JnUqTQZ59GC5BYQbOWUaENED45Z6YyM
        m/emUNcYnISXC4NEC4KD/JgXZ3SNjypssQ==
X-Google-Smtp-Source: AA6agR4lR7lhuTYXu5u5ye9DRuYRpG8I0ocCVAqPS1DEcowoL3JWC2aZLGP2C8ePzuOuH9mGwXwuYA==
X-Received: by 2002:a02:6d4b:0:b0:35a:40a6:5730 with SMTP id e11-20020a026d4b000000b0035a40a65730mr4607327jaf.198.1663084321094;
        Tue, 13 Sep 2022 08:52:01 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id p8-20020a022908000000b0034a55b557f2sm5641032jap.85.2022.09.13.08.52.00
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 08:52:00 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id g12so5933589ilj.5
        for <linux-i2c@vger.kernel.org>; Tue, 13 Sep 2022 08:52:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:12a8:b0:2ea:f53a:2d06 with SMTP id
 f8-20020a056e0212a800b002eaf53a2d06mr12701463ilr.223.1663084320106; Tue, 13
 Sep 2022 08:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid> <YyAxBtAD2wL91quT@shikoro>
In-Reply-To: <YyAxBtAD2wL91quT@shikoro>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Tue, 13 Sep 2022 09:51:48 -0600
X-Gmail-Original-Message-ID: <CAHQZ30Dw8XvNyok-BJ=oQEROC+Z6hfK8D93YHS4v-KGZymNXZw@mail.gmail.com>
Message-ID: <CAHQZ30Dw8XvNyok-BJ=oQEROC+Z6hfK8D93YHS4v-KGZymNXZw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 13, 2022 at 1:28 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
> > Device tree already has a mechanism to pass the wake_irq. It does this
> > by looking for the wakeup-source property and setting the
> > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> > ACPI interrupt wake flag to determine if the interrupt can be used to
> > wake the system. Previously the i2c drivers had to make assumptions and
> > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > If there is a device with an Active Low interrupt and the device gets
> > powered off while suspending, the interrupt line will go low since it's
> > no longer powered and wakes the system. For this reason we should
> > respect the board designers wishes and honor the wake bit defined on the
> > interrupt.
>
> I'll let the I2C ACPI maintainers deal with the technical details
> because they are the experts here, yet one minor thing hits my eye:
>

> > +             irq_ctx.irq = acpi_dev_gpio_irq_get_wake(
> > +                     adev, 0, &irq_ctx.wake_capable);
>
> That line split looks weird with the open parens at the end of line 1.
>
Ah, looks like I missed `clang-format` on that line. I can fix it in
the next revision.

Thanks
