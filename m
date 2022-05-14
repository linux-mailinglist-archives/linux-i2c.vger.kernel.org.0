Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF1752741D
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 23:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiENVFY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 17:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiENVFW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 17:05:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEEAF63;
        Sat, 14 May 2022 14:05:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2254860B34;
        Sat, 14 May 2022 21:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7481C340EE;
        Sat, 14 May 2022 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652562320;
        bh=H4zV3SBaznHA7Gdb4PBmPjf9JcyfMUIYCazARaIDVOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ebIcyrPZt/TJ8NSlY+gTJpB/aNg2HmLj0D7DlaDZDF0UCrUPAN1429AIfiVA7TS0z
         y2AjGz+ruz2LFa4AbuOvca6cEzCCJlwMVJ9K+ugwdAQV+KgoQHGkrk1Bm56cYqTte9
         AJNVPW9RHdgiVKayWFwWGZoerc6FpLLaaqWLdW1iZhj2v0ZUe7lYGxiNvyqE45gJVM
         2C+WyV+52h0Hj6YFCvKe+NoSF5xtA0MT5wzD8+ElZOOkNXxNvnN8BX6C41ZSLSL5n7
         F11lwFclnd0GpqwrHxHwLybo5NhxGl7Wx69ePMpX2GO+bdJWKz++75Uyh18Fn/Le9s
         /uRKh0N6NkqTA==
Date:   Sat, 14 May 2022 14:05:18 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Walle <michael@walle.cc>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: at91: Initialize dma_buf in at91_twi_xfer()
Message-ID: <YoAZjpzAEugCiv/Q@dev-arch.thelio-3990X>
References: <20220505152738.1440249-1-nathan@kernel.org>
 <Yn+xsNqFyRMTu+5X@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yn+xsNqFyRMTu+5X@shikoro>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 14, 2022 at 03:42:08PM +0200, Wolfram Sang wrote:
> On Thu, May 05, 2022 at 08:27:38AM -0700, Nathan Chancellor wrote:
> > Clang warns:
> > 
> >   drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma_buf' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >           if (dev->use_dma) {
> >               ^~~~~~~~~~~~
> >   drivers/i2c/busses/i2c-at91-master.c:717:27: note: uninitialized use occurs here
> >           i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
> >                                    ^~~~~~~
> > 
> > Initialize dma_buf to NULL, as i2c_put_dma_safe_msg_buf() is a no-op
> > when the first argument is NULL, which will work for the !dev->use_dma
> > case.
> > 
> > Fixes: 03fbb903c8bf ("i2c: at91: use dma safe buffers")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1629
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Applied to for-next, thanks!
> 

Thank you!

Cheers,
Nathan
