Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6D27248C9
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 18:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238459AbjFFQRR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 12:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238324AbjFFQRH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 12:17:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB8E11F
        for <linux-i2c@vger.kernel.org>; Tue,  6 Jun 2023 09:16:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 712CA62DE6
        for <linux-i2c@vger.kernel.org>; Tue,  6 Jun 2023 16:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320E8C4339B;
        Tue,  6 Jun 2023 16:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686068210;
        bh=7qkJZ/FGsNAwfhuwk4WDRrJfrYJYdRJxl71PR8a0hCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h5QjxGy8vxAYpXtu45k7l+a6OFP+Cj0rKlFGX9qN0E3IJU6T57PjJLuH5VK7ecFk2
         ESRv/uhxPuQhM/kvTRz11y5DYdfbyhDcUi/S6djhr2HTQzNJbUMBCm+j3214ePQ2Q8
         rUa94CA1YLMleXxr4VqJLiHmYzy0HNi+mpDR+hETyC++/2XboR1TB3lXS6Xm0FwtDT
         YxZdmpuGVL6+r48m2tIWj84xqMSHH8667F0XbV3Alpdao2EP54mUXVvAj19lIhihVe
         z39KLIwSIB7LAZhAJqwSEgATWfQ+t1L3OySW2u3oz4fKVg88fjM7cuVuyak+5UGkJX
         rDz4hymiQri2g==
Date:   Tue, 6 Jun 2023 18:16:47 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH] i2c: sprd: Delete i2c adapter in .remove's error path
Message-ID: <20230606161647.vgspajognrc3voth@intel.intel>
References: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
 <CAHp75VeMO+0VisrQXTGj9yuGz23jMaX8G0PDPUhhD1bMJ4ji2w@mail.gmail.com>
 <20230309120418.rbzfefxxrqqsawd4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309120418.rbzfefxxrqqsawd4@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Thu, Mar 09, 2023 at 01:04:18PM +0100, Uwe Kleine-König wrote:
> On Thu, Mar 09, 2023 at 01:17:22PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 9, 2023 at 11:58 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > If pm runtime resume fails the .remove callback used to exit early. This
> > > resulted in an error message by the driver core but the device gets
> > > removed anyhow. This lets the registered i2c adapter stay around with an
> > > unbound parent device.
> > >
> > > So only skip clk disabling if resume failed, but do delete the adapter.
> > 
> > Still worrisome. I would disable clock independently, but the questions are:
> 
> Note that pm-runtime stuff disables the clk, so if resume failed, you
> have to assume the clk already being off.

this is because resume fails only of the clock fails to be
enabled and in that case we shouldn't worry about it...

> > 1) why the heck we need this dance with PM runtime for disabling clocks;
> > 2) why can't we use devm_clk_get_enabled() or so in the probe;
> 
> These questions are orthogonal to my patch, right?

... but (orthoginally to this patch) I guess Andy is asking what
happens to the clock when the remove is called through another
path. Maybe a next patch can use the devm_clk...() wrapper.

As for this one, I'm good with it:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

> Runtime PM might delay suspend, so if you submit two transfers shortly
> after another, this might be more effective as the device isn't
> suspended in between. (Attention: half-baked knowledge)
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


