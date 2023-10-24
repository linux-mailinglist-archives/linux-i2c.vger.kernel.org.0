Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980387D58C4
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 18:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343998AbjJXQkE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 12:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343912AbjJXQkD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 12:40:03 -0400
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACFBD7D;
        Tue, 24 Oct 2023 09:40:00 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5845213c583so1594680eaf.0;
        Tue, 24 Oct 2023 09:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698165599; x=1698770399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dgLAi1M/nR9fJIQpQVSn3gxY5AOxSN1+8PQWp2ZK3E=;
        b=dJEL+fgbBkqa2Hxr8owONWDH6pO4QAKL8M6N0LblYDn0D+mvusaM9LI019LIX+Wr3i
         SBvjWPRMymU3blibDCev3SK/2zggSLh7i4IpkcLL7+56UwaN+3Q+SvbKam8pCpGxanbT
         He27KYjc4yS6cs4vdNENuanBRdI3kaR7tLAO5bj36M1FDWyM3CJw3cp0SmL52BmqFpit
         BdEzxk39cE/f7g8NzIovM7D42nhpblBaxWAThWlKCuq1CXkrmypanbfJwfKuwEnp/Q8S
         InLGUYhaL1tKdHvTD1oRCIWiQ8RKhoO9Sv7r+HPRugFqxsbmNwjwBGYgYl7NZvibTWWM
         mHUQ==
X-Gm-Message-State: AOJu0YxSrNVMn+fgX2LQrUQlYDXBSzDJcV9rjwPhKfF+AMIxCWFlyWiP
        Fy1vX2SNzu3oZN9A3IdBaw==
X-Google-Smtp-Source: AGHT+IH7r1RypTRYYRKdrh1wNi7leTTNBWI9FBY2oTxpLiREvX3LYW7p4YgROHwYcoRP/a6v+9+WQw==
X-Received: by 2002:a4a:df11:0:b0:582:28e:93a8 with SMTP id i17-20020a4adf11000000b00582028e93a8mr12468463oou.3.1698165599325;
        Tue, 24 Oct 2023 09:39:59 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f22-20020a4ad816000000b0057aef3cab33sm2002659oov.21.2023.10.24.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 09:39:58 -0700 (PDT)
Received: (nullmailer pid 4062523 invoked by uid 1000);
        Tue, 24 Oct 2023 16:39:56 -0000
Date:   Tue, 24 Oct 2023 11:39:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc:     Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
        olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
        mchehab@kernel.org, fabrice.gasnier@foss.st.com,
        andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
        lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
        arnd@kernel.org, richardcochran@gmail.com,
        Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-p.hy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a system bus for
 STM32MP15x boards
Message-ID: <20231024163956.GA4049342-robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
 <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
 <20231012153012.GA698406-robh@kernel.org>
 <b16ed06f-66fd-457b-9610-a67ad07deb60@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b16ed06f-66fd-457b-9610-a67ad07deb60@foss.st.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 16, 2023 at 02:02:39PM +0200, Gatien CHEVALLIER wrote:
> Hi Rob,
> 
> On 10/12/23 17:30, Rob Herring wrote:
> > On Wed, Oct 11, 2023 at 10:49:58AM +0200, Gatien CHEVALLIER wrote:
> > > Hi Rob,
> > > 
> > > On 10/10/23 20:42, Rob Herring wrote:
> > > > On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
> > > > > ETZPC is a firewall controller. Put all peripherals filtered by the
> > > > > ETZPC as ETZPC subnodes and reference ETZPC as an
> > > > > access-control-provider.
> > > > > 
> > > > > For more information on which peripheral is securable or supports MCU
> > > > > isolation, please read the STM32MP15 reference manual.
> > > > > 
> > > > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > > > ---
> > > > > 
> > > > > Changes in V6:
> > > > >       	- Renamed access-controller to access-controllers
> > > > >       	- Removal of access-control-provider property
> > > > > 
> > > > > Changes in V5:
> > > > >       	- Renamed feature-domain* to access-control*
> > > > > 
> > > > >    arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
> > > > >    arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
> > > > >    arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
> > > > >    3 files changed, 1450 insertions(+), 1377 deletions(-)
> > > > 
> > > > This is not reviewable. Change the indentation and any non-functional
> > > > change in one patch and then actual changes in another.
> > > 
> > > Ok, I'll make it easier to read.
> > > 
> > > > 
> > > > This is also an ABI break. Though I'm not sure it's avoidable. All the
> > > > devices below the ETZPC node won't probe on existing kernel. A
> > > > simple-bus fallback for ETZPC node should solve that.
> > > > 
> > > 
> > > I had one issue when trying with a simple-bus fallback that was the
> > > drivers were probing even though the access rights aren't correct.
> > > Hence the removal of the simple-bus compatible in the STM32MP25 patch.
> > 
> > But it worked before, right? So the difference is you have either added
> > new devices which need setup or your firmware changed how devices are
> > setup (or not setup). Certainly can't fix the latter case. You just need
> > to be explicit about what you are doing to users.
> > 
> 
> I should've specified it was during a test where I deliberately set
> incorrect rights on a peripheral and enabled its node to see if the
> firewall would allow the creation of the device.
> 
> > 
> > > Even though a node is tagged with the OF_POPULATED flag when checking
> > > the access rights with the firewall controller, it seems that when
> > > simple-bus is probing, there's no check of this flag.
> > 
> > It shouldn't. Those flags are for creating the devices (or not) and
> > removing only devices of_platform_populate() created.
> > 
> 
> About the "simple-bus" being a fallback, I think I understood why I saw
> that the devices were created.
> 
> All devices under a node whose compatible is "simple-bus" are created
> in of_platform_device_create_pdata(), called by
> of_platform_default_populate_init() at arch_initcall level. This
> before the firewall-controller has a chance to populate it's bus.
> 
> Therefore, when I flag nodes when populating the firewall-bus, the
> devices are already created. The "simple-bus" mechanism is not a
> fallback here as it precedes the driver probe.
> 
> Is there a safe way to safely remove/disable a device created this way?

There's 2 ways to handle this. Either controlling creating the device or 
controlling probing the device. The latter should just work with 
fw_devlink dependency. The former probably needs some adjustment to 
simple-pm-bus driver if you have 'simple-bus' compatible. You want it to 
probe on old kernels and not probe on new kernels with your firewall 
driver. Look at the commit history for simple-pm-bus. There was some 
discussion on it as well.

> Devices that are under the firewall controller (simple-bus) node
> should not be probed before it as they're child of it.

fw_devlink should take care of parent/child dependencies without any 
explicit handling of the access ctrl binding.

Rob
