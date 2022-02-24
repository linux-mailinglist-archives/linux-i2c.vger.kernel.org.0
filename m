Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736244C2EC3
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 15:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235641AbiBXO6n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 09:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234474AbiBXO6m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 09:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7252313D542
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 06:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645714688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sLi8/HvPywrlQR06d5solHIr81MCizce1jnEJh+4CEI=;
        b=d5IS0ac5l+2XreWlKMvlxOX2tKKqvty+Rtsp/rZtFKZYFdjsvgIBhokMpplt8KMujH9XfH
        /nZbCfazPRSJYU3OCzGeeT3264/iBqLS4SUqTbWDmPfc92+Scx11bYwJqVaB79g3gGeDrC
        zEyIHWPACqreoUlclSxswWd3IhXxlk8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-paMgAugyNZG7bPnT3R2zBg-1; Thu, 24 Feb 2022 09:58:07 -0500
X-MC-Unique: paMgAugyNZG7bPnT3R2zBg-1
Received: by mail-ej1-f71.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso1317067eje.20
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 06:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sLi8/HvPywrlQR06d5solHIr81MCizce1jnEJh+4CEI=;
        b=jTw8e6xyQeab+wSJ4DxHoKXCSYdpiJuZeXQnr18TrmQBJTr9TV3awVDaFjP2pr835Y
         atiCkMC6Fj9gvTfr0SYaKOy/Bn7m8fLWg27Jgpo4zd4suzEWTnlHxfksBv4r1D2XsmhZ
         2j7Rh8V1S0wkrG0CKcD2JR9IW6cQByu0O4HBJaqBGXqwSU9cOVBRbdvO+jgehZIhHu1+
         dociz7fTolFpr9HICwaAkKjHL9jf/KPhl8LWXshy64BCTmZuFEjVNeEMS2twsNy3K79s
         oPJm497w3D5ZCkDscNZ/lwlemU6fHzeUweGh33XsLZAVQAXWkyN4YT34xbJOoPeoen7J
         xheQ==
X-Gm-Message-State: AOAM531Wg/V4dq+KoPWailWANTkRVU/GxG3PpwvY5MBVPY6jGPTDODka
        LJjavxM/nRua7/VeokMjRlAGHxfDZPv3wbkFiRZeaMZ02lAbV8/Ozt8vjLMTBAa4zaWWxvtDp2R
        Lh1+Y3/Bjaj5tvmvgFM11
X-Received: by 2002:a17:906:5e13:b0:6cf:42c:56b7 with SMTP id n19-20020a1709065e1300b006cf042c56b7mr2560146eju.725.1645714685922;
        Thu, 24 Feb 2022 06:58:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1Fdaq03ebBOuTkF573q/U+4yxiSEURppdkHQu9XOUVTFWcqiUT2dyz/fPEeDzFPgVjBWYIg==
X-Received: by 2002:a17:906:5e13:b0:6cf:42c:56b7 with SMTP id n19-20020a1709065e1300b006cf042c56b7mr2560114eju.725.1645714685629;
        Thu, 24 Feb 2022 06:58:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id s1sm1466186edd.100.2022.02.24.06.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 06:58:05 -0800 (PST)
Message-ID: <2d3278ef-0126-7b93-319b-543b17bccdc2@redhat.com>
Date:   Thu, 24 Feb 2022 15:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC 00/10] add support for fwnode in i2c mux system and sfp
Content-Language: en-US
To:     =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20220221162652.103834-1-clement.leger@bootlin.com>
 <20220224154040.2633a4e4@fixe.home>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220224154040.2633a4e4@fixe.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Clément,

On 2/24/22 15:40, Clément Léger wrote:
> Hi,
> 
> As stated at the beginning of the cover letter, the PCIe card I'm
> working on uses a lan9662 SoC. This card is meant to be used an
> ethernet switch with 2 x RJ45 ports and 2 x 10G SFPs. The lan966x SoCs
> can be used in two different ways:
> 
>  - It can run Linux by itself, on ARM64 cores included in the SoC. This
>    use-case of the lan966x is currently being upstreamed, using a
>    traditional Device Tree representation of the lan996x HW blocks [1]
>    A number of drivers for the different IPs of the SoC have already
>    been merged in upstream Linux.
> 
>  - It can be used as a PCIe endpoint, connected to a separate platform
>    that acts as the PCIe root complex. In this case, all the devices
>    that are embedded on this SoC are exposed through PCIe BARs and the
>    ARM64 cores of the SoC are not used. Since this is a PCIe card, it
>    can be plugged on any platform, of any architecture supporting PCIe.
> 
> The goal of this effort is to enable this second use-case, while
> allowing the re-use of the existing drivers for the different devices
> part of the SoC.
> 
> Following a first round of discussion, here are some clarifications on
> what problem this series is trying to solve and what are the possible
> choices to support this use-case.
> 
> Here is the list of devices that are exposed and needed to make this
> card work as an ethernet switch:
>  - lan966x-switch
>  - reset-microchip-sparx5
>  - lan966x_serdes
>  - reset-microchip-lan966x-phy
>  - mdio-mscc-miim
>  - pinctrl-lan966x
>  - atmel-flexcom
>  - i2c-at91
>  - i2c-mux
>  - i2c-mux-pinctrl
>  - sfp
>  - clk-lan966x
> 
> All the devices on this card are "self-contained" and do not require
> cross-links with devices that are on the host (except to demux IRQ but
> this is something easy to do). These drivers already exists and are
> using of_* API to register controllers, get properties and so on.
> 
> The challenge we're trying to solve is how can the PCI driver for this
> card re-use the existing drivers, and using which hardware
> representation to instantiate all those drivers.
> 
> Although this series only contained the modifications for the I2C
> subsystem all the subsystems that are used or needed by the previously
> listed driver have also been modified to have support for fwnode. This
> includes the following subsystems:
> - reset
> - clk
> - pinctrl
> - syscon
> - gpio
> - pinctrl
> - phy
> - mdio
> - i2c
> 
> The first feedback on this series does not seems to reach a consensus
> (to say the least) on how to do it cleanly so here is a recap of the
> possible solutions, either brought by this series or mentioned by
> contributors:
> 
> 1) Describe the card statically using swnode
> 
> This is the approach that was taken by this series. The devices are
> described using the MFD subsystem with mfd_cells. These cells are
> attached with a swnode which will be used as a primary node in place of
> ACPI or OF description. This means that the device description
> (properties and references) is conveyed entirely in the swnode. In order
> to make these swnode usable with existing OF based subsystems, the
> fwnode API can be used in needed subsystems.
> 
> Pros:
>  - Self-contained in the driver.
>  - Will work on all platforms no matter the firmware description.
>  - Makes the subsystems less OF-centric.
> 
> Cons:
>  - Modifications are required in subsystems to support fwnode
>    (mitigated by the fact it makes to subsystems less OF-centric).
>  - swnode are not meant to be used entirely as primary nodes.
>  - Specifications for both ACPI and OF must be handled if using fwnode
>    API.
> 
> 2) Use SSDT overlays
> 
> Andy mentioned that SSDT overlays could be used. This overlay should
> match the exact configuration that is used (ie correct PCIe bus/port
> etc). It requires the user to write/modify/compile a .asl file and load
> it using either EFI vars, custom initrd or via configfs. The existing
> drivers would also need more modifications to work with ACPI. Some of
> them might even be harder (if not possible) to use since there is no
> ACPI support for the subsystems they are using .
> 
> Pros:
>  - Can't really find any for this one
> 
> Cons:
>  - Not all needed subsystems have appropriate ACPI bindings/support
>    (reset, clk, pinctrl, syscon).
>  - Difficult to setup for the user (modify/compile/load .aml file).
>  - Not portable between machines, as the SSDT overlay need to be
>    different depending on how the PCI device is connected to the
>    platform.
> 
> 3) Use device-tree overlays
> 
> This solution was proposed by Andrew and could potentially allows to
> keep all the existing device-tree infrastructure and helpers. A
> device-tree overlay could be loaded by the driver and applied using
> of_overlay_fdt_apply(). There is some glue to make this work but it
> could potentially be possible. Mark have raised some warnings about
> using such device-tree overlays on an ACPI enabled platform.
> 
> Pros:
>  - Reuse all the existing OF infrastructure, no modifications at all on
>    drivers and subsystems.
>  - Could potentially lead to designing a generic driver for PCI devices
>    that uses a composition of other drivers.
> 
> Cons:
>  - Might not the best idea to mix it with ACPI.
>  - Needs CONFIG_OF, which typically isn't enabled today on most x86
>    platforms.
>  - Loading DT overlays on non-DT platforms is not currently working. It
>    can be addressed, but it's not necessarily immediate.
> 
> My preferred solutions would be swnode or device-tree overlays but
> since there to is no consensus on how to add this support, how
> can we go on with this series ?

FWIW I think that the convert subsystems + drivers to use the fwnode
abstraction layer + use swnode-s approach makes sense. For a bunch of
x86/ACPI stuff like Type-C muxing/controllers/routing but also MIPI
cameras we have already been moving in that direction since sometimes
a bunch of info seems to be hardcoded in Windows drivers rather then
"spelled out" in the ACPI tables so from the x86 side we are seeing
a need to have platform glue code which replaces the hardcoding on
the Windows side and we have been using the fwnode abstraction +
swnodes for this, so that we can keep using the standard Linux
abstractions/subsystems for this.

As Mark already mentioned the regulator subsystem has shown to
be a bit problematic here, but you don't seem to need that?

Your i2c subsys patches looked reasonable to me. IMHO an important
thing missing to give you some advice whether to try 1. or 3. first
is how well / clean the move to the fwnode abstractions would work
for the other subsystems.

Have you already converted other subsystems and if yes, can you
give us a pointer to a branch somewhere with the conversion for
other subsystems ?

Regards,

Hans


