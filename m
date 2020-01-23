Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56198146541
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 11:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgAWKAo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 05:00:44 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33827 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWKAo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 05:00:44 -0500
Received: by mail-ed1-f66.google.com with SMTP id r18so587247edl.1;
        Thu, 23 Jan 2020 02:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vf2LEPghHkSvKBrXWZPAO0VwLPzYKVKYFia5aNnUKic=;
        b=m7CBXOBtT0/JTJUfRyO9+W8uZureQ2zd3/SddGPwABQhmu/j/LH8yyZ5+apWU2i1NO
         O/srFD48Q5a6ONJtFdWTLdDv5l0srILlASGN1dgsCLTSDkjHyFaT/baZ5CIN22Zn1t/N
         4KqfEBtOvrf1Zac5liWrOm7GnfA1rWyagNfRlyJhdFVQwhtR6y3F+S0ms4fq3DkybNil
         AMOTYRCivASul9nsADHwUR/br9XgdZaT4YUhyKWr/FUGwH2y3xuRv5ehyDGSNiZEghzh
         HheTjQz0kAqw3GZ7ccfZ6g1dtsvUhaeLSQKHq+PtzA7ebTr/7xhNaUY17LEkO2NGGG6F
         AI9g==
X-Gm-Message-State: APjAAAWtPckzwBHzH/g/2AwlgZ8WUCzy1Z0RZKcJ2kRLoIVm4vgVc72a
        7FYnlaTPinVicGMo1fLDLPE=
X-Google-Smtp-Source: APXvYqwg6hvXvf9VIf9L/M232l4c4678SdLLT/iriy2Shu2alAX41WXTpnBjPFK2hZjvXrRcm3n3kQ==
X-Received: by 2002:a17:906:19d8:: with SMTP id h24mr6143965ejd.166.1579773642698;
        Thu, 23 Jan 2020 02:00:42 -0800 (PST)
Received: from pi3 ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id r24sm10440edp.15.2020.01.23.02.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 02:00:41 -0800 (PST)
Date:   Thu, 23 Jan 2020 11:00:39 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Message-ID: <20200123100039.GA2465@pi3>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
 <20200123091228.GB1105@ninjato>
 <20200123093120.GA2365@pi3>
 <20200123094107.GD1105@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200123094107.GD1105@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 23, 2020 at 10:41:07AM +0100, Wolfram Sang wrote:
> On Thu, Jan 23, 2020 at 10:31:20AM +0100, Krzysztof Kozlowski wrote:
> > On Thu, Jan 23, 2020 at 10:12:28AM +0100, Wolfram Sang wrote:
> > > 
> > > >  config I2C_ZX2967
> > > >  	tristate "ZTE ZX2967 I2C support"
> > > > -	depends on ARCH_ZX
> > > > -	default y
> > > > +	depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> > > > +	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
> > > 
> > > The list of archs neither looks pretty nor very maintainable. My
> > > suggestion is that we leave this out of COMPILE_TEST until we have
> > > something like ARCH_HAS_READS or something. What do you think?
> > 
> > Indeed it does not look good. However having compile testing allows
> > kbuild to run sparse and smatch which already started pointing minor
> > issues in existing drivers.
> > 
> > Yeah... pros and cons... I don't have a strong opinion to keep it. Since
> > patch is important, maybe let's just skip this part?
> 
> Yeah, let's skip it for now. If you or someone is keen on having it,
> something like ARCH_HAS_READS (<- needs better name) should be
> introduced so we can use it here. But that can/should be handled
> incrementally.

Shall I send v3 or mayybe can you apply without this hunk?

Best regards,
Krzysztof


