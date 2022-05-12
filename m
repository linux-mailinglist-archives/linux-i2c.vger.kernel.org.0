Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B66E5249D7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 May 2022 12:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352421AbiELKB5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 May 2022 06:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352493AbiELKAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 May 2022 06:00:52 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3E33894
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 03:00:43 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id w4so6458370wrg.12
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 03:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=V3TfJkXWTRH+gtF3lJ5Kz+EdosirYTs2KXZe5HGagKs=;
        b=Bxu2T3x2MCQWNxLfWKJ5BgpNVx/FHPQDNwxXyE4Wn6iZYjk+tjL5x58Grld7+wHSm8
         bbUtn05skKCHb2/SyGikrAvxyhpQLHVvj+m8s7fiNCSMkMBhdf+j68pUiwtz7eMSJ2/3
         UqqPdLP2UJkSU8AnhFMJsRjWmEO9Prj+xpZoRQP+Qv41bVu9BudHpnyoQltLgYtnu53D
         +4XeZ0eXl2aBNltBHRnJto/HNkoPCl+ChUfNFKqTYjl8u72di94C0aSJLwn6DxBtKBid
         i6ect2SGZpWgnmMryQRfrdZNrhvQ7YSLaPg/K74tpjFTbahScV0WH8PfsUrGV3hNERwE
         hN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=V3TfJkXWTRH+gtF3lJ5Kz+EdosirYTs2KXZe5HGagKs=;
        b=Fp0V05PkH52m2bwuz93HmyWVgTHpDothPbRSenvjkw9oSfUguihJTJxQrYMFa2kGiX
         VXWyygFAjdKpiQZiGDru9b2MWM8Kd3XDDo1+S7Fbd65UXfBC9GBzaHZullY/LJqvSHJd
         J96Y4O8mx33FKyPhstTWvfCT5SMCrxBpErBWWXWjdiTW+yBBgo+aLN5Z0SBDkFUgWuz0
         1i4lYnIGDJZQ+FuwKqBAOJlA3Q3X2ffosCjbBl5ASTdsed08kGDaov76pPjOrLtPq9e+
         lS0pCDxRw46tJHzC390+AFSAamnfO82x9ZNT2529oe/3qIHU+LZaQ90BKiboMHLuffgi
         OEtg==
X-Gm-Message-State: AOAM531JdRbHHj8siT/TdIJp1AjsfR0/NEj/Q+k+JJt2Ey0eFbzH04Zr
        aulMCI2GXIBsf/yolz9VjzYnhQ==
X-Google-Smtp-Source: ABdhPJyRofIIKPpwVKZvncsUBvl7NBebV7Urul500SOT0rsWCwud4dbPq/neHFp3AZtzxEsgAU+KGA==
X-Received: by 2002:a05:6000:1a85:b0:20c:7ba1:737b with SMTP id f5-20020a0560001a8500b0020c7ba1737bmr26893152wry.209.1652349641767;
        Thu, 12 May 2022 03:00:41 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id m126-20020a1ca384000000b003945cdd0d55sm2179637wme.26.2022.05.12.03.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:41 -0700 (PDT)
Date:   Thu, 12 May 2022 11:00:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
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
Message-ID: <YnzaxiNBU1awfLoG@google.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
 <eff9907f-e92b-9115-bea7-b1093d1dc28e@redhat.com>
 <CAHp75Vcnq=Ou6QNyPjwC+HR9wJ2BheonTqmkGvQU0qFtHO2BDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vcnq=Ou6QNyPjwC+HR9wJ2BheonTqmkGvQU0qFtHO2BDw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 11 May 2022, Andy Shevchenko wrote:

> On Wed, May 11, 2022 at 6:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 5/10/22 17:14, Andy Shevchenko wrote:
> 
> ...
> 
> > I must admit I have lost track of all the Ack-s / Reviewed-by-s a bit.
> >
> > So from the above I take it that the Ack-s resp. Reviewed-by-s on the
> > other non drivers/platform/x86 bits also signal an Ack to merge the entire
> > series through the pdx86 tree?
> >
> > Lee, any chance you can take a look at patches 3-5 and give your Ack
> > for merging these through the pdx86 tree together with the rest?
> 
> Actually I misinterpreted Lee's different tags again. Acked-by is
> normal for routing MFD code via other subsystems, while
> Acked-for-MFD-by is for Lee (scripts?) to route the code via MFD tree.
> Lee, is it the correct interpretation now?

Yes, that is correct.

I just replied to your 0th patch (before I saw this, sorry).

> ...
> 
> > p.s.
> >
> > Since this is mostly a cleanup series and since we are getting close
> > to the next merge-window I believe that it likely is best to merge
> > this after 5.19-rc1 has been released.
> 
> OK.
> 
> > I can then also provide
> > an immutable branch for other maintainers early on in the 5.19
> > cycle which should help to avoid merge conflicts.
> 
> I guess I will send a v6 anyway in order to attach Henning's series to mine.
> 

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
