Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18CCA542E60
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 12:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbiFHKv0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 06:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236971AbiFHKvZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 06:51:25 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145041E7AF8;
        Wed,  8 Jun 2022 03:51:21 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id d14so965517eda.12;
        Wed, 08 Jun 2022 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6hYfUhU7mRYwVUWV1xGzdqXXNAttpIl10AtMQCOSgI=;
        b=DRmwxIkZoL4DqetzrcoZfZzVNax4JPN3514EUieQo+WYusBkzmwNoM3bIyiy/eO2oD
         2RPdMoJv5i17WqdhHNx0ygl6WDG0VOkLBNCcVFxlgvFfl9HHDOEl0qtK8cxzKqc0NgxQ
         MmL5Ijv2vFv/2k3DSxKoPr7l2PZ11uuUTj/O3uWMZN+AYIddD9Sonwc6SgJJV/tqfv05
         vJMtDRmsgBLpOcO13EL88pFXx+MHFmCowiXkadU/u4fWHcGLmEMvTETyl+ZECY40wF7i
         VDTndhEBm+eWs9JQfuvWvSQwuPIi1nG0gMZ/5gjKtJJu3IO0leqswYYz8aJ/mTjxiKwj
         UASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6hYfUhU7mRYwVUWV1xGzdqXXNAttpIl10AtMQCOSgI=;
        b=G7u7CuCglQSdZP6Y5BCrT07j4hKmDuXnYuWaJxmEETh6tA3uujYNTGcvMp4TDDGs56
         oJSU/ahMpMfguoUboc3FPnNKbdZC18By3Mw3TtqofSQX5VI+gp5nGYT42C6v4U/GVWM1
         KWdUYkFIJ1YWVq5bhlUvQlC6boarvF89VnA98kP/J4PcmmmCQ9YY7/zg9/41n7kdKNgL
         CKcgORry5oWYgorcY3WUDYoODRQq0SyleLdkUdjnGVjbGlYsQ0bxb0cYD9eJz84WcZUa
         cO9TACIxq/V4CocSkwrUpQ6N0RSUSKM0i65Y7zSvPitpf6oe8igdxWD6pvZRDSJvx47s
         Y5dQ==
X-Gm-Message-State: AOAM532AhR6SRxkPY39nVxk9sAfPBWK2x79vl8iGB8sx0ZjTWB9HVOo5
        kZonTd+YUBTm4pi+pi0DFhm2FSYpTtsA4f8THCs=
X-Google-Smtp-Source: ABdhPJyT27iK6nu3n1SZGfqncYVgcfI2rm+neMbh7OrIHWE8u3KQraEwyLH1GjS9Y+7iJb+hRPt8Qu3n7OBk775xVRw=
X-Received: by 2002:aa7:c396:0:b0:42d:8b86:a8dc with SMTP id
 k22-20020aa7c396000000b0042d8b86a8dcmr37783861edq.54.1654685480497; Wed, 08
 Jun 2022 03:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com> <YqBS8I62YBPFC9iS@google.com>
In-Reply-To: <YqBS8I62YBPFC9iS@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 12:50:44 +0200
Message-ID: <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 8, 2022 at 9:42 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 06 Jun 2022, Andy Shevchenko wrote:
>
> > There are a few users that would like to utilize P2SB mechanism of hiding
> > and unhiding a device from the PCI configuration space.
> >
> > Here is the series to consolidate p2sb handling code for existing users
> > and to provide a generic way for new comer(s).
> >
> > It also includes a patch to enable GPIO controllers on Apollo Lake
> > when it's used with ABL bootloader w/o ACPI support.
> >
> > The patch that brings the helper ("platform/x86/intel: Add Primary to
> > Sideband (P2SB) bridge support") has a commit message that sheds a light
> > on what the P2SB is and why this is needed.
> >
> > I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> > since we have an ACPI device for GPIO I do not see any attempts to recreate
> > one).
> >
> > The series is ready to be merged via MFD tree, but see below.
> >
> > The series also includes updates for Simatic IPC drivers that partially
> > tagged by respective maintainers (the main question is if Pavel is okay
> > with the last three patches, since I believe Hans is okay with removing
> > some code under PDx86). Hence the first 8 patches can be merged right
> > away and the rest when Pavel does his review.
>
> Can we just wait for Pavel's review, then merge them all at once?

Sure, it would be the best course of action.

-- 
With Best Regards,
Andy Shevchenko
