Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3DC524990
	for <lists+linux-i2c@lfdr.de>; Thu, 12 May 2022 11:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351986AbiELJ4U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 May 2022 05:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352292AbiELJz5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 May 2022 05:55:57 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BFB22BEB
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 02:55:52 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b19so6453006wrh.11
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8Mml8/I6dZjDQVSbpICZmHamoycoSx+AztXtLx3bWPs=;
        b=iH1TKkrS5WfQgAyOTSHAq81+XzaNS/SFjVKI4d3/BpcOtFsBqxWj3bgJ4wY28aEBac
         sG/55sB6TPsWSZFpA2WndigICY7YfyCG+PHvvr6K46+6/decyzAEHzfVRe2adr9Zlv3L
         rvRLAfsObPWEGc2Mso2ipeHw+q+ZrtNK67cQtGYWfifXG83tN0dYKb3PkW9gX1nu+tNI
         xsGzpCFigWKpCW3r6X/zacsEhongIdUz0JzN+OMRKVHUFE3DklG8AmKcPrklhluQIgm2
         3lnmtsE6m3uOnhRJXMQKV7POS8YYoYfWYm78+ZRyll34IbUFtD1yZ1Xq1fVU6DsIKO1V
         JWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8Mml8/I6dZjDQVSbpICZmHamoycoSx+AztXtLx3bWPs=;
        b=0FTjvoYxbjB4CZ1QLgH+cDhL9wcBHMzNTIAayvnjWU3SsspZlOprQpbLPl8/joVW2K
         rtj1N3duqW3oa6/B4U0FCPaAPztqMzEtoCDLPM6WHdThCfQREB/qTjkURwQl5js33431
         8cYMr0JeWksdQCYbNYPDBB1YkmqNI0A7B5sj5tetmhSthCwptXoxGFJmsobcuIMppzVA
         +44dM8fwJXZP23jTrd6q6vhYIu097e4hx7a1snnZfvM2e5uOzXWK7mHJS8b+WPeroZf5
         AlCCR/QXZA+LAeWhMGIVSorfDyHEsXCHbMx2CkwHmdFdHc64fjr7+wB6dj+gGP6J6/tr
         Iwgw==
X-Gm-Message-State: AOAM533yaPH+BKQbWX2+I2bBmcJgHsPl1AK4d8+iBoaiOKGVM8vErJ/I
        tJ1S8EFCI50XOm+xGaf5U5nFIg==
X-Google-Smtp-Source: ABdhPJyeg+3xggI6uw+b1bSLWxaJSk3lJwrHHEn3ulHOjlGlq4yeoq8w9RWSdcvpl6PMXoJGur9TQw==
X-Received: by 2002:adf:e812:0:b0:20c:dd44:b06c with SMTP id o18-20020adfe812000000b0020cdd44b06cmr6707154wrm.714.1652349351033;
        Thu, 12 May 2022 02:55:51 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id m126-20020a1ca384000000b003945cdd0d55sm2167193wme.26.2022.05.12.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 02:55:50 -0700 (PDT)
Date:   Thu, 12 May 2022 10:55:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v5 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <YnzZpE4JOLlxsjVc@google.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 10 May 2022, Andy Shevchenko wrote:

> There are a few users and at least one more is coming (*1) that would
> like to utilize P2SB mechanism of hiding and unhiding a device from
> the PCI configuration space.
> 
> Here is the series to consolidate p2sb handling code for existing users
> and provide a generic way for new comer(s).
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support (*2).
> 
> The patch that brings the helper ("platform/x86/intel: Add Primary to
> Sideband (P2SB) bridge support") has a commit message that sheds a light
> on what the P2SB is and why this is needed.
> 
> The changes made in v5 do not change the main idea and the functionality
> in a big scale. What we need is probably one more retest done by Henning
> (*3). I hope to have it merged to v5.19-rc1 that Siemens can develop
> their changes based on this series (*4).
> 
> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> since we have an ACPI device for GPIO I do not see any attempts to recreate
> one).
> 
> *1) One in this series, and one is a recent merge of the Simatic IPC drivers
> *2) This patch can be postponed as Lee hasn't given his tag yet.
> *3) Henning gave his tag and I dared to used it even against changed patch 1
> *4) The changes were posted in between of v4 and v5 of this series, but need
>     more work.
> 
> Taking into account the *2) the series is ready to be merged via PDx86 tree.

If that happens you need to do 2 things:

1. Change all s/Acked-for-MFD-by/Acked-by/
2. Submit a pull-request that we can all pull from

Alternatively, I can apply this via MFD and do the same.

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
> Jonathan Yong (1):
>   platform/x86/intel: Add Primary to Sideband (P2SB) bridge support
> 
> Tan Jui Nee (1):
>   mfd: lpc_ich: Add support for pinctrl in non-ACPI system
> 
>  drivers/edac/Kconfig                   |   1 +
>  drivers/edac/pnd2_edac.c               |  62 +++-------
>  drivers/i2c/busses/Kconfig             |   1 +
>  drivers/i2c/busses/i2c-i801.c          |  39 ++----
>  drivers/mfd/Kconfig                    |   1 +
>  drivers/mfd/lpc_ich.c                  | 161 +++++++++++++++++++------
>  drivers/pinctrl/intel/pinctrl-intel.c  |  14 +--
>  drivers/platform/x86/intel/Kconfig     |  12 ++
>  drivers/platform/x86/intel/Makefile    |   2 +
>  drivers/platform/x86/intel/p2sb.c      | 133 ++++++++++++++++++++
>  include/linux/platform_data/x86/p2sb.h |  28 +++++
>  11 files changed, 338 insertions(+), 116 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/p2sb.c
>  create mode 100644 include/linux/platform_data/x86/p2sb.h
> 
> 
> base-commit: 3bf222d317a20170ee17f082626c1e0f83537e13

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
