Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1A86075D4
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 13:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiJULM1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 07:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiJULLh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 07:11:37 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999C224E3A7;
        Fri, 21 Oct 2022 04:11:08 -0700 (PDT)
Received: from t60.musicnaut.iki.fi (85-76-8-144-nat.elisa-mobile.fi [85.76.8.144])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by meesny.iki.fi (Postfix) with ESMTPSA id 3BA3C200C0;
        Fri, 21 Oct 2022 14:11:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1666350665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ghn1cZ/W+8YyMq9JLN3UV4/RYNLtGkauMvjwUQd5lkA=;
        b=MYSnynaOPQWhKjzJY/F5CCK0xzBOsMmsqi15eCKlU00G5oPsmFdMjXbAc+lx5vndM5PZGE
        yBJBR2fyUx+QMntI7Q/hVo9k8oN5qyZTynzdnZ21OTL4hM5u+y+rhX6uHaOeVgBakSjDxE
        0Ckoc4AAJCjhttBWTJQLpjN4/S/Vy7w=
Date:   Fri, 21 Oct 2022 14:11:01 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/17] ARM: omap1: remove unused board files
Message-ID: <20221021111101.GC3019@t60.musicnaut.iki.fi>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
 <20221019171541.GA41568@darkstar.musicnaut.iki.fi>
 <1b632df1-7e3c-456d-8629-dc36efd9fe15@app.fastmail.com>
 <20221020193511.GB3019@t60.musicnaut.iki.fi>
 <de36ec6b-2e7c-48eb-9682-f60d8e4011da@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de36ec6b-2e7c-48eb-9682-f60d8e4011da@app.fastmail.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1666350665; a=rsa-sha256; cv=none;
        b=EayeTNyaBCouCd1edDnJMcjHiUDy1kE8wu+YcwQvU1RKOyJYaBzAFkpdSxu4PrR3ohslPK
        oLFr2XvYZRjeXccNS5tgY1a1JEGhSDSxitWRbcAHybFA6AzrhiLmiFy+Ouyn2IgB/ldXCb
        4i4uVnkjnOOd+yBWVo025wf1wSsKHMM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1666350665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ghn1cZ/W+8YyMq9JLN3UV4/RYNLtGkauMvjwUQd5lkA=;
        b=jIk2jXRQq0Tv0295JN0YBfyOFM6u/ngoRXnM13jyElPzXa7hOrvMHOL4npenvDGpUCgToE
        kIsenKqt40L/HsenR+T45MZBvc9zIfrKDf65w/w0oFi7VCRbWRt/+GVlQiXtdlcJQVimla
        udl/wd8rpqM7Q+BlFZlD/ViGt9VUFPM=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Oct 21, 2022 at 08:52:10AM +0200, Arnd Bergmann wrote:
> On Thu, Oct 20, 2022, at 21:35, Aaro Koskinen wrote:
> > On Thu, Oct 20, 2022 at 09:11:11AM +0200, Arnd Bergmann wrote:
> >> On Wed, Oct 19, 2022, at 19:15, Aaro Koskinen wrote:
> >> > On Wed, Oct 19, 2022 at 05:03:35PM +0200, Arnd Bergmann wrote:
> >> >> All board support that was marked as 'unused' earlier can
> >> >> now be removed, leaving the five machines that that still
> >> >> had someone using them in 2022, or that are supported in
> >> >> qemu.
> >> > [...]
> >> >>  config OMAP_OSK_MISTRAL
> >> >>  	bool "Mistral QVGA board Support"
> >> >>  	depends on MACH_OMAP_OSK
> >> >> -	depends on UNUSED_BOARD_FILES
> >> >>  	help
> >> >>  	  The OSK supports an optional add-on board with a Quarter-VGA
> >> >>  	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
> >> >>  	  and camera connector.  Say Y here if you have this board.
> >> >
> >> > Shouldn't this go away as well?
> >> 
> >> No, this one was incorrectly annotated, it's not actually
> >> a board but it's an option for the OSK board that is not
> >> getting removed. I considered making a separate patch
> >> for removing the dependency, but that didn't seem worth it.
> >
> > OK. For the record, I don't think anyone has this add-on board anymore,
> > and it has probably never been tested with the mainline kernel, so
> > it's likely in the "dead code" category... Maybe it could be changed to
> > "BROKEN", then the related OSK LCD panel stuff could be deleted later
> > on too.
> 
> Ok, good to know. I left it in place for now because Tony originally
> listed it as a likely used machine along with NOKIA770 and
> AMS_DELTA [1], but I don't have anyone listed specifically as a
> user for it.
> 
> It's not too late to revisit this list if you think it helps to
> get rid of it. I can see that drivers/mtd/tps65010.c and
> drivers/pcmcia/omap_cf.c become orphaned without it and can
> probably get removed as well then.

I was only referring to this Mistral add-on board and related display
drivers.

The main OSK board support is still needed and used.

A.
