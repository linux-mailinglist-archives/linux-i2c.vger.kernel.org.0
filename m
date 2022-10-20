Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F9E6068FA
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Oct 2022 21:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJTTfV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 15:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJTTfU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 15:35:20 -0400
X-Greylist: delayed 94770 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Oct 2022 12:35:16 PDT
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE25612976B
        for <linux-i2c@vger.kernel.org>; Thu, 20 Oct 2022 12:35:16 -0700 (PDT)
Received: from t60.musicnaut.iki.fi (85-76-8-144-nat.elisa-mobile.fi [85.76.8.144])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id CE44D1B001A3;
        Thu, 20 Oct 2022 22:35:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666294513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iDvU3Oc2f/QHiT2VDqeJIzu0pLTa7SFrJfK0tw4pkR4=;
        b=CtXAPho/8wXRfk+qDJKIoC6KYH+1stwwfLzjVRMs0F+xM+grEwFCOEnyHRY+ycw0phLrqA
        dmxyo/lUkHIoc+6F7XZdm8QtRdpHYiq7POVNvy1hDDl8kZiaVzMRDVzCEvk5FKlLNJxM5Z
        mIuzt6KGgMCHzIT9QAism4yT1QbepNWk+y8d8m1PE8h++XvCco1QZhPAh8kq+Eo6ZTq5+d
        cxUaNZ5CDcDg2Jy6l0M31unoiNvCZ5XNaWr90DnEvhNeNZt53FaJvXJjRNgRz6OkolDyPR
        gBA5Yui/EzWoDAsho3j99NrX8ZZvV0QVIX9keqeXgnlPd9S1ycI/FSQDcseG6A==
Date:   Thu, 20 Oct 2022 22:35:11 +0300
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
Message-ID: <20221020193511.GB3019@t60.musicnaut.iki.fi>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
 <20221019171541.GA41568@darkstar.musicnaut.iki.fi>
 <1b632df1-7e3c-456d-8629-dc36efd9fe15@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b632df1-7e3c-456d-8629-dc36efd9fe15@app.fastmail.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666294513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iDvU3Oc2f/QHiT2VDqeJIzu0pLTa7SFrJfK0tw4pkR4=;
        b=rrXIBB6/cLwcvSTbEB1/WW+rnYGa9ozsO5IdoYj3F2Tc0TW94d0WCRxZw+oVInIGIuGmi/
        Fn4crbmRrkd4rYxH/6t7yq6momM+CRZGi2uizH4Ur7IhP2jvLxH9tzSSU/1YRI21RewhwQ
        aHMqhLrunMNefiRfte6YeX06eLw0mN7NJzgJQG/q7JdfNeSWW1EdkdYVm+QNayDOuaibS5
        v7WxJeHeg7FweWu51kNUvacMvxxr3ieXXGjBqJSqhy0ebzHA4EaI8qVdJxzFimETZn2/7E
        sm3qW1quOEJkBeo0d6IoFMMDJddWkChnaFOjuljaoPOeWchojPLOM/uZrLpgAA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666294513; a=rsa-sha256;
        cv=none;
        b=WUmMZDsubTKiseV7lrBxLDtKPP7bk5IK0PgUldYgmWXY9HIxdL6tqW3Z9paPz9wsGxxw/7
        qiZq7tRSmcBLf1iSebg5+iozzfUSRLJJyBKYAC99IzxzRlCx007xRt2Gh+o2HxKEAuuK+0
        c5vr7CRlti+oE9AvJOYIWhHO914VDrnfwuQZ3KsinukOg5gKGADyJD8nzLi3lwK+qqXCD/
        wEi5VAbEF3fP8wtz7LdjIY8ps9E81YQ2gfzJUgwLWjpJsLuSqeRJRYYR8IAJcKtSSON30O
        R7UGOfwvglPEdSBo1w8IgrWN3B20dElKAOe5hN5vH1XDL9eAOTRF/kJnZijzTw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Oct 20, 2022 at 09:11:11AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 19, 2022, at 19:15, Aaro Koskinen wrote:
> > On Wed, Oct 19, 2022 at 05:03:35PM +0200, Arnd Bergmann wrote:
> >> All board support that was marked as 'unused' earlier can
> >> now be removed, leaving the five machines that that still
> >> had someone using them in 2022, or that are supported in
> >> qemu.
> > [...]
> >>  config OMAP_OSK_MISTRAL
> >>  	bool "Mistral QVGA board Support"
> >>  	depends on MACH_OMAP_OSK
> >> -	depends on UNUSED_BOARD_FILES
> >>  	help
> >>  	  The OSK supports an optional add-on board with a Quarter-VGA
> >>  	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
> >>  	  and camera connector.  Say Y here if you have this board.
> >
> > Shouldn't this go away as well?
> 
> No, this one was incorrectly annotated, it's not actually
> a board but it's an option for the OSK board that is not
> getting removed. I considered making a separate patch
> for removing the dependency, but that didn't seem worth it.

OK. For the record, I don't think anyone has this add-on board anymore,
and it has probably never been tested with the mainline kernel, so
it's likely in the "dead code" category... Maybe it could be changed to
"BROKEN", then the related OSK LCD panel stuff could be deleted later
on too.

A.
