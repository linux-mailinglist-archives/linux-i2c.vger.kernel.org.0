Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D7D540490
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 19:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344687AbiFGRQ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 13:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345486AbiFGRQZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 13:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51961104CB3
        for <linux-i2c@vger.kernel.org>; Tue,  7 Jun 2022 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654622183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IXEuAxtdK44RWYeCxDOJ3NCkadlV5+P4l5LCOSSL0CM=;
        b=VldMzXRoYerReGAecfLrI4zOMKTRX2IUBhly7NVLeg2dWDvuEbY0H2iVvA3RfrAG1A5zEB
        bVgyOm9tzUBKIj9L3IclSjckEl0EunwuoIwBT4cgkfI1DR/97oQrxenQriGonk8/BQ5w7d
        SSr5a948j3+Cadx9Q1W1OyecfA2Mf3w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-h2XIOdebO2ejrZMJavo9_Q-1; Tue, 07 Jun 2022 13:16:22 -0400
X-MC-Unique: h2XIOdebO2ejrZMJavo9_Q-1
Received: by mail-ed1-f71.google.com with SMTP id k21-20020aa7d2d5000000b0042dcac48313so13160123edr.8
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jun 2022 10:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IXEuAxtdK44RWYeCxDOJ3NCkadlV5+P4l5LCOSSL0CM=;
        b=dWcrskOK/+tdGRdhwsre+PAsUT5apP5SYmb4vgmLLL6ZqFrqZA9sltgEPktDz52Bze
         Yr0BrH3chKPKiVoquBAO6sLJ9pmK6VOSweVBJp2wTBCImodJy40MPmEZ6RYmqwmtO9rH
         fyYCxjL3MiIuykdio+AA+NiEzD4wdixMG3T/kKLJN5NSJ7d22DB0dbWp3Cw7GDzK+YoF
         lmmJk5KFPt0ou/1RCW/EEafZ7S8KLIwASB2rKugJDE5x5KVpP+DS+xLKbq3JDTGxJOoF
         7cwnjzbsiYn4AD2X/cpRI0mkSOaFgB/QmVRMUgQpJjdga5ePhh19XlQWOPCWnjrO7dCA
         EUxQ==
X-Gm-Message-State: AOAM532NFVYMQQA6XRTfTCib81LdDNfF2DdA7XScjdzcuJGyXeg1sSUP
        xU5FBkLZl2TlPhSgb6IUUUzbIhOqHu1oBqo1WOLNOl5GjG3u+9GBo7UHB9q9h1Qwq0ycbsuO+Ja
        McxVZzzA94Sxqa8Ncsc8U
X-Received: by 2002:a17:907:6e9f:b0:711:d2cb:63d8 with SMTP id sh31-20020a1709076e9f00b00711d2cb63d8mr9708515ejc.232.1654622179441;
        Tue, 07 Jun 2022 10:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygX9k/gltKfeagReGyy6GfPh4jDhAQD4hT60Nsn75EUxfKbAYHHTu7noGrC7gq+8HKZe2OtA==
X-Received: by 2002:a17:907:6e9f:b0:711:d2cb:63d8 with SMTP id sh31-20020a1709076e9f00b00711d2cb63d8mr9708471ejc.232.1654622179223;
        Tue, 07 Jun 2022 10:16:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u15-20020a05640207cf00b0042dd60352d1sm10784675edy.35.2022.06.07.10.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 10:16:18 -0700 (PDT)
Message-ID: <251fa028-9ecc-f7b0-078a-e96c7063bd96@redhat.com>
Date:   Tue, 7 Jun 2022 19:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 6/6/22 18:41, Andy Shevchenko wrote:
> There are a few users that would like to utilize P2SB mechanism of hiding
> and unhiding a device from the PCI configuration space.
> 
> Here is the series to consolidate p2sb handling code for existing users
> and to provide a generic way for new comer(s).
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
> The patch that brings the helper ("platform/x86/intel: Add Primary to
> Sideband (P2SB) bridge support") has a commit message that sheds a light
> on what the P2SB is and why this is needed.
> 
> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> since we have an ACPI device for GPIO I do not see any attempts to recreate
> one).
> 
> The series is ready to be merged via MFD tree, but see below.
> 
> The series also includes updates for Simatic IPC drivers that partially
> tagged by respective maintainers (the main question is if Pavel is okay
> with the last three patches, since I believe Hans is okay with removing
> some code under PDx86). Hence the first 8 patches can be merged right
> away and the rest when Pavel does his review.
> 
> Changes in v6:
> - added tag to patch 5 (Lee)
> - incorporated Henning's series on top of v5

I've taken a quick look at the new patches and they look ok to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

for the entire series.

Regards,

Hans


> 
> Changes in v5:
> - rewritten patch 1 to use pci_scan_single_device() (Lukas, Bjorn)
> - rebased patch 2 on top of the new Intel SPI NOR codebase
> - fixed a potential bug and rewritten resource filling in patch 5 (Lee)
> - added many different tags in a few patches (Jean, Wolfram, Henning)
> 
> Changes in v4:
> - added tag to the entire series (Hans)
> - added tag to pin control patch (Mika)
> - dropped PCI core changes (PCI core doesn't want modifications to be made)
> - as a consequence of the above merged necessary bits into p2sb.c
> - added a check that p2sb is really hidden (Hans)
> - added EDAC patches (reviewed by maintainer internally)
> 
> Changes in v3:
> - resent with cover letter
> 
> Changes in v2:
> - added parentheses around bus in macros (Joe)
> - added tag (Jean)
> - fixed indentation and wrapping in the header (Christoph)
> - moved out of PCI realm to PDx86 as the best common denominator (Bjorn)
> - added a verbose commit message to explain P2SB thingy (Bjorn)
> - converted first parameter from pci_dev to pci_bus
> - made first two parameters (bus and devfn) optional (Henning, Lee)
> - added Intel pin control patch to the series (Henning, Mika)
> - fixed English style in the commit message of one of MFD patch (Lee)
> - added tags to my MFD LPC ICH patches (Lee)
> - used consistently (c) (Lee)
> - made indexing for MFD cell and resource arrays (Lee)
> - fixed the resource size in i801 (Jean)
> 
> Andy Shevchenko (6):
>   pinctrl: intel: Check against matching data instead of ACPI companion
>   mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
>   mfd: lpc_ich: Switch to generic p2sb_bar()
>   i2c: i801: convert to use common P2SB accessor
>   EDAC, pnd2: Use proper I/O accessors and address space annotation
>   EDAC, pnd2: convert to use common P2SB accessor
> 
> Henning Schild (4):
>   watchdog: simatic-ipc-wdt: convert to use P2SB accessor
>   leds: simatic-ipc-leds: convert to use P2SB accessor
>   platform/x86: simatic-ipc: drop custom P2SB bar code
>   leds: simatic-ipc-leds-gpio: add GPIO version of Siemens driver
> 
> Jonathan Yong (1):
>   platform/x86/intel: Add Primary to Sideband (P2SB) bridge support
> 
> Tan Jui Nee (1):
>   mfd: lpc_ich: Add support for pinctrl in non-ACPI system
> 
>  drivers/edac/Kconfig                          |   1 +
>  drivers/edac/pnd2_edac.c                      |  62 +++----
>  drivers/i2c/busses/Kconfig                    |   1 +
>  drivers/i2c/busses/i2c-i801.c                 |  39 +----
>  drivers/leds/simple/Kconfig                   |   6 +-
>  drivers/leds/simple/Makefile                  |   1 +
>  drivers/leds/simple/simatic-ipc-leds-gpio.c   | 105 ++++++++++++
>  drivers/leds/simple/simatic-ipc-leds.c        |  80 +--------
>  drivers/mfd/Kconfig                           |   1 +
>  drivers/mfd/lpc_ich.c                         | 161 ++++++++++++++----
>  drivers/pinctrl/intel/pinctrl-intel.c         |  14 +-
>  drivers/platform/x86/intel/Kconfig            |  12 ++
>  drivers/platform/x86/intel/Makefile           |   2 +
>  drivers/platform/x86/intel/p2sb.c             | 133 +++++++++++++++
>  drivers/platform/x86/simatic-ipc.c            |  43 +----
>  drivers/watchdog/Kconfig                      |   1 +
>  drivers/watchdog/simatic-ipc-wdt.c            |  15 +-
>  include/linux/platform_data/x86/p2sb.h        |  28 +++
>  .../platform_data/x86/simatic-ipc-base.h      |   2 -
>  19 files changed, 464 insertions(+), 243 deletions(-)
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio.c
>  create mode 100644 drivers/platform/x86/intel/p2sb.c
>  create mode 100644 include/linux/platform_data/x86/p2sb.h
> 
> 
> base-commit: 40b58e42584bf5bd9230481dc8946f714fb387de

