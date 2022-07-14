Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED6C57492E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 11:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238278AbiGNJh1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 05:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbiGNJh0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 05:37:26 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEE83719E
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 02:37:23 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p4so686695wms.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SzhVHfRoTJrnpDanrMQh8Ww74DmMD2/mZU8JBmDOY6U=;
        b=w+SFia/W6qX5vP8nw0AjesFXx0zp6LOc8q909IC4Cp95MZ71BILXXzMnC/3WOsIdct
         CkYau2KI5/JEJ94jeRt3YB5ZPPzWtM5XHvFatRoNYbDQHm9H3PyTO3kZoJtZQZbeFVex
         wuXzGkhH5Omos/WJIs5Gmht6ZF8kawYZFanMIDuB+LmNS/xzLCiKfD6Qpd/G8xN3uwF5
         vSLbfC2nRkiow5AqDQ0LkAPV2AlMYzgAjJZlb1n8JFE/uvm3zQI3xjVNyqv3H24yUvmN
         F3+DR4PDRPQVSlxRXc5UIZrP4UcgIWHALHsSrTkHe+InkX1J5061qEIJSY3iZlzvjmfO
         oVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SzhVHfRoTJrnpDanrMQh8Ww74DmMD2/mZU8JBmDOY6U=;
        b=Evt+KFaYQZAGE2aGL64MLTAyQDkQM4ESS5IdJFWqCt+sDhCPELoChUQCywY1pJpn6u
         ZlXHLdrDMeaie97Q/PfPOujErezlsGiVIrqBC9PqBnd/zqA97k9UPsqtY18Mydis06Up
         1azi5w95S5+nSv8XwyPY2a3pFLWxEUWIhHhh2pv/SUaetBjiRBRmXHfwOaMaPqLWYqVs
         SSZKVB4B5YP+WzgV2ISWuSulg54e0N9mLLzvAvpgvmVfUqaIPvHcfWMsi//Fus36PhvQ
         8Eg1a6ucVEeipNY/MjA7eoB72EhE6yICHHUMPfNESCLoFAFotYc80qWqyauflQSzifQQ
         uHgg==
X-Gm-Message-State: AJIora8rWI0DYZ6VTQV6d1GFJ+XthyVk0t6/kabqQHqqt6i7I1UTd1AK
        onrA2Pk9k8TFC9ciKEnYQunEcg==
X-Google-Smtp-Source: AGRyM1sYAcheIlzffIBizpYIN7jFiJ0gX1659DuMbABmoyKT1xnuz89E+Mbrc/U/du9waWQjzl2Ikg==
X-Received: by 2002:a05:600c:1e18:b0:3a0:4865:3784 with SMTP id ay24-20020a05600c1e1800b003a048653784mr8096924wmb.139.1657791442299;
        Thu, 14 Jul 2022 02:37:22 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id z16-20020adff1d0000000b0021d65675583sm987947wro.52.2022.07.14.02.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:37:21 -0700 (PDT)
Date:   Thu, 14 Jul 2022 10:37:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Message-ID: <Ys/jz7HqhrxSCOnV@google.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <YqBS8I62YBPFC9iS@google.com>
 <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
 <YrGyWCaY+swYAYzH@smile.fi.intel.com>
 <YryAXlZqcr/liN7n@smile.fi.intel.com>
 <20220629191406.35965d5b@md1za8fc.ad001.siemens.net>
 <Ys71dyMdozGUAto0@smile.fi.intel.com>
 <20220713204827.0b290fd7@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220713204827.0b290fd7@md1za8fc.ad001.siemens.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 13 Jul 2022, Henning Schild wrote:

> Am Wed, 13 Jul 2022 19:40:23 +0300
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> 
> > On Wed, Jun 29, 2022 at 07:14:06PM +0200, Henning Schild wrote:
> > > Am Wed, 29 Jun 2022 19:39:58 +0300
> > > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > >   
> > > > +Cc: Rafael
> > > > 
> > > > On Tue, Jun 21, 2022 at 02:58:16PM +0300, Andy Shevchenko wrote:  
> > > > > On Wed, Jun 08, 2022 at 12:50:44PM +0200, Andy Shevchenko
> > > > > wrote:    
> > > > > > On Wed, Jun 8, 2022 at 9:42 AM Lee Jones
> > > > > > <lee.jones@linaro.org> wrote:    
> > > > > > > On Mon, 06 Jun 2022, Andy Shevchenko wrote:
> > > > > > >    
> > > > > > > > There are a few users that would like to utilize P2SB
> > > > > > > > mechanism of hiding and unhiding a device from the PCI
> > > > > > > > configuration space.
> > > > > > > >
> > > > > > > > Here is the series to consolidate p2sb handling code for
> > > > > > > > existing users and to provide a generic way for new
> > > > > > > > comer(s).
> > > > > > > >
> > > > > > > > It also includes a patch to enable GPIO controllers on
> > > > > > > > Apollo Lake when it's used with ABL bootloader w/o ACPI
> > > > > > > > support.
> > > > > > > >
> > > > > > > > The patch that brings the helper ("platform/x86/intel: Add
> > > > > > > > Primary to Sideband (P2SB) bridge support") has a commit
> > > > > > > > message that sheds a light on what the P2SB is and why
> > > > > > > > this is needed.
> > > > > > > >
> > > > > > > > I have tested this on Apollo Lake platform (I'm able to
> > > > > > > > see SPI NOR and since we have an ACPI device for GPIO I
> > > > > > > > do not see any attempts to recreate one).
> > > > > > > >
> > > > > > > > The series is ready to be merged via MFD tree, but see
> > > > > > > > below.
> > > > > > > >
> > > > > > > > The series also includes updates for Simatic IPC drivers
> > > > > > > > that partially tagged by respective maintainers (the main
> > > > > > > > question is if Pavel is okay with the last three patches,
> > > > > > > > since I believe Hans is okay with removing some code
> > > > > > > > under PDx86). Hence the first 8 patches can be merged
> > > > > > > > right away and the rest when Pavel does his review.    
> > > > > > >
> > > > > > > Can we just wait for Pavel's review, then merge them all at
> > > > > > > once?    
> > > > > > 
> > > > > > Sure, it would be the best course of action.    
> > > > > 
> > > > > Pavel, do you have a chance to review the patches (last three)
> > > > > that touch LED drivers? What would be your verdict?    
> > > > 
> > > > Lee, Rafael,
> > > > 
> > > > It seems quite hard to get Pavel's attention to this series [1].
> > > > It's already passed more than 3 weeks for any sign of review of
> > > > three top patches of the series that touched LED subsystem. The
> > > > entire series has all necessary tags, but for LED changes.
> > > > 
> > > > Note, that the top of this series is not done by me and was sent
> > > > for preliminary review much earlier [2], altogether it makes
> > > > months of no response from the maintainer.
> > > > 
> > > > The nature of patches is pretty simple and doesn't touch any of
> > > > other than Simatic LED drivers nor LED core. Moreover, it was
> > > > written by Siemens, who produces the H/W in question and very
> > > > well tested as a separate change and as part of the series.  
> > > 
> > > The code has been reviewed and is in fact pretty simple. The only
> > > questionable but pragmatic change that might catch the attention of
> > > a pedantic reviewer is that i did put the gpio implementation of the
> > > driver under the same/existing kernel config switch.
> > >   
> > > > I think to move forward we may ask Rafael to review it on behalf
> > > > of good maintainer and with his approval apply entire series.
> > > > 
> > > > Thoughts?  
> > > 
> > > Thanks for pushing this Andy. I was wondering how and when that
> > > story would continue. Technically these changes should really go in
> > > one badge or we need to find a way to separate them somehow. I
> > > would try to go that extra mile to get out of your way. But i am
> > > kind of afraid such an effort might also end up touching the same
> > > files and block us at the same maintainer.
> > > 
> > > Did anyone check whether Pavel was active at all in those last
> > > months and maybe other patches waiting for review? Hope he is fine
> > > and active and just somehow forgot/overlooked/ignored this one.  
> > 
> > I have send a private mail to Pavel and have got no response.
> > Can we move this forward, let's say, by applying first 8 patches?
> 
> I am sorry that situation is now coming. Both simatic-ipc and that
> appollo lake pinctrl driver compete for the same device memory. That
> conflict was known and we agreed on sorting it out together somehow.
> Not applying my patches could leave my LED drivers simply not working
> any longer, or worse ... them making the apollolake platform stuff act
> up somehow weird with unexpected EBUSY.
> 
> The series can not be split, or we have to write additional code to
> properly deal with the conflict. I could envision my LED drivers still
> accessing raw memory and ignoring EBUSY (very hacky! ... and touching
> "we need Pavel code")
> 
> Another way could maybe be. Do the whole P2SB but do not make
> apollolake pinctrl come up without ACPI. Somewhere in patches 1-8 there
> is code which makes the pinctrl stuff come up for certain CPUs without
> ACPI. It is really only some out of many CPUs which have pinctrl, and i
> am not sure i remember what that has to do with the P2SB helpers as
> such. The helpers are a refactoring, while the "bring up apollolake
> pinctrl at all times" is a functional change ... now causing conflict.
> 
> And maybe there is a way/process to escalate to another maintainer.
> Does anyone even know what is going on with Pavel? 

I'll take the hit.  He had his chance.

I'm happy to move forward with Andy's review.

(Side note: Seeing as Pavel hasn't been seen for 2 months, I'll also
 follow-up on  the LED ML to offer to become temporary maintainer for a
 bit)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
