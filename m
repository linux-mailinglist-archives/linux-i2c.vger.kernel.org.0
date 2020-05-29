Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48A91E86EB
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 20:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgE2Spk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 14:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbgE2Spk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 14:45:40 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0104C03E969;
        Fri, 29 May 2020 11:45:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k5so440767lji.11;
        Fri, 29 May 2020 11:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=avOv20B+3A/0IcT9eZFmaxxfn3deEVvWGrzLxV1Q5+Q=;
        b=bukR1K44xZVpUYZXmq9MTKKIss4vW3hfqWwcnWy490xlVG71SKd0hKhDuaerq95xQP
         BZAsLaUJbyUTyPXd4VTZ/LCOpUu7Og+1dcSwvElgEGxUS3qMXFBaK41Qppx/52noVW/q
         TO85oV9Lec+V3NBQWHZGxBn3qRPr2jcnIY0jC7a8Myh71j/R0pBdqZ13S5KLSfeCOFzl
         JnxNUBcmr1B4bFkIHIZz4jOCFFhAfDJPQdr473Td01Dm/jPsTwcLF84/PEjYjJmVG4QL
         bBY3/phKJLLUhm5XbQHStdmiA952mMTLz1BnVLqLePulM2jmNGL88F/a57P2Zt9ULSC/
         a5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=avOv20B+3A/0IcT9eZFmaxxfn3deEVvWGrzLxV1Q5+Q=;
        b=b98cTUHqp9Wy1oG34Af+4wXAVWwfYZC7xM+JheGx7KfpPyVrUy4GG57VL4IQzN41qr
         LiuH4PpBBDr8zy19Te5CVPuGUZI6ar+PkQqupAAunVXyEQ0VIhuIdUYxpwV1ZB1z8akm
         KBtN1ZAukmGBid2oL4YSPpajz3WOhaUrssBaNXjZb2yzvL4Nbpu044d9W9QqYpHFR/su
         4gDYILbTXyB835X/3SCrplzJ/z8jzqr/DRXlK5/L0A4QpAjKyseHxVlJKzP2PfhyBmNk
         UwZoXMgw1mazZcnabE36EMSCscbpeKshbeNPhIU4uuw/SMURF8+RJYvE1cGkQ5zOsjOZ
         hXqQ==
X-Gm-Message-State: AOAM531zZk2Yguo+hsBfkRbr8zzKxK8ceqhhBhCwBGBrQuF6jdvtm7Q3
        x13HxhtA3ow6HcvzLUX092FeAdOlMPk=
X-Google-Smtp-Source: ABdhPJzEyxZHkWm2hTk+XBxZ3dh5oFv6mdTRWFlm+ME8QL9sKZQd9P9jm6dkuz9kGa9Ez+SDl65xwg==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr4750202ljj.43.1590777936982;
        Fri, 29 May 2020 11:45:36 -0700 (PDT)
Received: from mobilestation ([95.79.222.123])
        by smtp.gmail.com with ESMTPSA id w14sm2416069lfe.65.2020.05.29.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 11:45:36 -0700 (PDT)
Date:   Fri, 29 May 2020 21:45:34 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Rob Herring <robh@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200529184534.wyyv5i7hcto5y3d3@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru>
 <20200527153351.rmzguymz7lm6gvsx@mobilestation>
 <20200529181338.GA2676189@bogus>
 <20200529182256.3bp4uvvrvz3ddlrq@mobilestation>
 <20200529184201.GX1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529184201.GX1634618@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 29, 2020 at 09:42:01PM +0300, Andy Shevchenko wrote:
> On Fri, May 29, 2020 at 09:22:56PM +0300, Serge Semin wrote:
> > On Fri, May 29, 2020 at 12:13:38PM -0600, Rob Herring wrote:
> > > On Wed, May 27, 2020 at 06:33:51PM +0300, Serge Semin wrote:
> 
> > > you're sending 
> > > new versions too fast. Give people time to review.
> > 
> > Yeah, you did. Sorry for sending the new versions very fast. Normally I prefer
> > to keep up with comments so to past a particular maintainer review as fast as
> > possible without long delays. In my experience the longer you wait, the lesser
> > maintainers remember about your patchset, the harder for one to continue the
> > next versions review.
> 

> Documentation/process/submitting-patches.rst:
> 
> "Wait for a minimum of one week before resubmitting or pinging reviewers -
> possibly longer during busy times like merge windows."

Good to know what I already know.) How much do you personally wait before
resubmitting? In my experience reviewing your DW APB GPIO patches, no longer
than a few hours.

-Sergey

> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
