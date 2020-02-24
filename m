Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9BA16AF0B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 19:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgBXS1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 13:27:33 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39382 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBXS1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 13:27:33 -0500
Received: by mail-pg1-f194.google.com with SMTP id j15so5573358pgm.6;
        Mon, 24 Feb 2020 10:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MrKUG0B7eYSk1M5khvLuZNq23j1QXcVre857FpjhTKQ=;
        b=FSrPnF7avWq6iRs7cohi5j4rz+s7j/Tj0f88zgou8HhnYzaSubzRiNGvLDDxomSnoz
         tOKCrVYoJ1uXY0Oi8+sGL1TTp8YiyhTpkTBAC0XUeJU32M4WBTWfDHU/8eJVkClk9AVa
         Lc2WB4xLIXNFlPSQ9kX1i/ZgubMsWMAsNb7llvf3jpDduZR0MfbeLevVxgCD76f6/Ow/
         qIat1DOsl9nIs0S8N1oyS4IBd7vqOt3NeLeT/UNiVrttL+0ChhvJ40p2mrBOw2DMrjvA
         DVI29E8VpSnZrIygiPSgzv9BOSjkw00RZhVr2TZe3c4/oYtdsLligV2PmhwkDDM6R8Tn
         aUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MrKUG0B7eYSk1M5khvLuZNq23j1QXcVre857FpjhTKQ=;
        b=tAsBZ7A/pOB4ET5CzudmTS6w3MS8z5UwTkzLhTjlhbxjJgKzzJXkrzP2iatNeQ85TM
         62YoTBN5CeElb29b4I5rUJEegH4MN/0bxeXa4yoYJ4k8utn+PtRktnzxLd5Hq392vArL
         zpAYt8paqYSZu/QDaYD+88CBcbUf+NnCjvFtE50hCy/or72sienDuPktm77f7/6iZHX+
         toP0gFX1aDHGVZbbF0WhgEgKbeRPKQKmTYxwUFEPA7fKG1lmbD0VC7PeRic/SlFKJlm9
         IxJExNk46wRHDHvG9e1LLLMXtJli5r8NlIE3b46cB2M8nnUqB+QhboDKO1Si2wExZnKU
         WfFA==
X-Gm-Message-State: APjAAAVs4qWDG/BBmq8sz/sWxPakKd++pKLykI+BIrYsuMm4RoGZuxBc
        JBmWuqNk7p7i8eRKqmP239A=
X-Google-Smtp-Source: APXvYqxiMX24zB+DtpsxWet1mWC8XeyWPZMsc08gR6Ns5FCq3fO5jmw6lLtSEWXSrn2ZlFO7OHzPxw==
X-Received: by 2002:a62:7541:: with SMTP id q62mr52672610pfc.248.1582568852748;
        Mon, 24 Feb 2020 10:27:32 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 70sm13434909pgd.28.2020.02.24.10.27.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 10:27:31 -0800 (PST)
Date:   Mon, 24 Feb 2020 10:27:30 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martin Volf <martin.volf.42@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
Message-ID: <20200224182730.GA29799@roeck-us.net>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
 <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
 <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
 <20200224101800.GJ2667@lahna.fi.intel.com>
 <20200224103731.GA10400@smile.fi.intel.com>
 <20200224105121.GK2667@lahna.fi.intel.com>
 <20200224112740.GL2667@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224112740.GL2667@lahna.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 01:27:40PM +0200, Mika Westerberg wrote:
> On Mon, Feb 24, 2020 at 12:51:25PM +0200, Mika Westerberg wrote:
> > > I'm wondering if
> > > 
> > > 		pci_dev_is_present(...);
> > > 
> > > returns false here.
> > 
> > Well that might also be the case since lspci shows this:
> > 
> > 00:1f.0 ISA bridge: Intel Corporation Z390 Chipset LPC/eSPI Controller (rev 10)
> > 00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
> > 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
> > 
> > PMC is 1f.2 and not present here. However, it may be that the PMC is
> > still there it just does not "enumerate" because its devid/vendorid are
> > set to 0xffff. Similar hiding was done for the P2SB bridge.
> 
> Actually I think this is the case here.
> 
> I don't know the iTCO_wdt well enough to say if it could live without
> the ICH_RES_IO_SMI. It looks like this register is used to disable SMI
> generation but not sure how well it works if it is left to BIOS to
> configure. I suppose these systems should use WDAT instead.
> 

In practice the region is only used if
	if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
where turn_SMI_watchdog_clear_off is 1 by default. It is also
passed to vendor specific code, but that is only relevant for
really old systems. In short, it isn't really needed for any
recent-generation systems, and could be made optional with
a few lines of code in iTCO_wdt.c.

Guenter
