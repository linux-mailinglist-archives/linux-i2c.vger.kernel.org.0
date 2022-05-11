Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FBE523821
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 18:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344344AbiEKQIv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 May 2022 12:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiEKQIu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 May 2022 12:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D54820D252
        for <linux-i2c@vger.kernel.org>; Wed, 11 May 2022 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652285327;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0TAjuarkhLQxoAHeLGfylbueNIUv/uakgBC3ZhGbIR8=;
        b=DJgqCw0CieDzc9XywtWhZC+5EuXp1NEWgY4kkMub06MK/wwRf2/q1RWPfUS7UdwrkJPGPE
        FRoGcqLFVbwhn7dzlAVorQnmumRS3JFt6Y9gBabMeAX6miAV5/R97EFH5K2f3smxcbhX7i
        RdInRZLFVTbMvc0Sf1hmBZ/B5ABVI0s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-OvjHitHPPaWLCHB52_qUBQ-1; Wed, 11 May 2022 12:08:46 -0400
X-MC-Unique: OvjHitHPPaWLCHB52_qUBQ-1
Received: by mail-ed1-f72.google.com with SMTP id s24-20020a05640217d800b00425e19e7deaso1605606edy.3
        for <linux-i2c@vger.kernel.org>; Wed, 11 May 2022 09:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0TAjuarkhLQxoAHeLGfylbueNIUv/uakgBC3ZhGbIR8=;
        b=Kp60eWQkYF1Bvyn/+5zOPpEjS5NWCCQ7xgE38kkHPvSEHaj1P3STKOZdbkxJVgwS1n
         qcWjF4DWltMl08szrpSzwA7/jlSowL3RswQ86F23Y6+EEgfMLLdLmFFzURLOlcMztt8y
         KsPkdjaSpGjlfFrH6v7oR8QSVWhj0R5IhHGYVrJpUcrv1IPaDrAej7cQPjyTgogB/qMp
         KuOgC9mbYnssdbesJvJZE3Vzh7z05w8yrMc1VkodsF2B5G7nehjLXMOornpBuPuipJyg
         cK1uHg/fj1jB3LjTLiyprm14nz9Pw7UNzf0PNIHypaE/nwy5vFwpg9lOzxLMXb/PQmm/
         qH4w==
X-Gm-Message-State: AOAM53171B+Qku1qqkoTG4jaPXGjNHlcVmpdNQfYuM2kZ5UiVpIp7MBm
        K7JD3Nqgk1OMkAY7SjZYBcUtkDN9B6iZkCAXQfFK5wHwg0qX306t0dKkf+jacvs52905z0CSqc5
        4D3+fbg/zHyDQVFBjNbwC
X-Received: by 2002:a17:907:70c4:b0:6f3:d23f:d711 with SMTP id yk4-20020a17090770c400b006f3d23fd711mr24653700ejb.205.1652285325209;
        Wed, 11 May 2022 09:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmTsJIO4z+aRs4UiV4aYVuseJVmDaOGsHevOquQ3R7A40zTHs5eGgHEtcyWYgi3gqrT2wi6A==
X-Received: by 2002:a17:907:70c4:b0:6f3:d23f:d711 with SMTP id yk4-20020a17090770c400b006f3d23fd711mr24653656ejb.205.1652285324948;
        Wed, 11 May 2022 09:08:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cn16-20020a0564020cb000b0042617ba63bfsm1339395edb.73.2022.05.11.09.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:08:44 -0700 (PDT)
Message-ID: <eff9907f-e92b-9115-bea7-b1093d1dc28e@redhat.com>
Date:   Wed, 11 May 2022 18:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 0/8] platform/x86: introduce p2sb_bar() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

On 5/10/22 17:14, Andy Shevchenko wrote:
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

I must admit I have lost track of all the Ack-s / Reviewed-by-s a bit.

So from the above I take it that the Ack-s resp. Reviewed-by-s on the
other non drivers/platform/x86 bits also signal an Ack to merge the entire
series through the pdx86 tree?

Lee, any chance you can take a look at patches 3-5 and give your Ack
for merging these through the pdx86 tree together with the rest?

Regards,

Hans


p.s.

Since this is mostly a cleanup series and since we are getting close
to the next merge-window I believe that it likely is best to merge
this after 5.19-rc1 has been released. I can then also provide
an immutable branch for other maintainers early on in the 5.19
cycle which should help to avoid merge conflicts.




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

