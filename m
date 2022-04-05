Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA75A4F31E6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 14:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiDEKcF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 06:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346544AbiDEJpK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 05:45:10 -0400
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295FFDA6F7;
        Tue,  5 Apr 2022 02:30:55 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 77B6D3C0582;
        Tue,  5 Apr 2022 11:30:53 +0200 (CEST)
Received: from lxhi-065 (10.72.94.37) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 5 Apr
 2022 11:30:53 +0200
Date:   Tue, 5 Apr 2022 11:30:48 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <20220405093048.GA7151@lxhi-065>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
 <YkQ31VMqj1MXqBd3@shikoro>
 <YkQ6XRITOFZ7hLXV@shikoro>
 <20220331160207.GA27757@lxhi-065>
 <YkcqoIMF2uw4FSZh@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YkcqoIMF2uw4FSZh@ninjato>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.37]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, Apr 01, 2022 at 06:38:56PM +0200, Wolfram Sang wrote:
> > BTW, thanks to Bhuvanesh, we've got another patch [*] which tries
> > to combine the best of both worlds:
> > 
> > * DMA support in the v1/v2 patches from Andrew/Bhuvanesh
> > * Simplicity of your proposal in https://lore.kernel.org/lkml/Yg6ls0zyTDe7LQbK@kunai/
> 
> This was nice to see. But where does it come from? I don't see it on
> this list and I also couldn't find it in the regular BSP?

The patch was worked on and tested collaboratively w/o submission.
The idea was to push it to LKML, once/after you are happy with it.

> > Unfortunately, this patch has a dependency to the rcar_i2c_is_pio()
> > in https://github.com/renesas-rcar/linux-bsp/commit/55d2d2fb8b0 
> > (which should be resolvable by extracting the function).
> 
> This patch is obsolete since March 2019. It has been properly fixed with
> 94e290b0e9a6 ("i2c: rcar: wait for data empty before starting DMA"). I
> am still trying to feed this information back.

Thanks for the precious feedback. We've requested Renesas to revert the
obsolete BSP commit, based on your recommendation.

In general, the Renesas kernel always carries a set of patches with
non-mainlined changes, Fortunately, for i2c specifically (as opposed
to other subsystems), it is narrow enough to not raise major concerns:

$ git log --oneline v5.10.41..rcar-5.1.2 -- drivers/i2c/busses/i2c-rcar.c
6745303b2bfa i2c: rcar: Add support for r8a77961 (R-Car M3-W+)
3422d3131700 i2c: rcar: Support the suspend/resume
5680e77f2427 i2c: rcar: Tidy up the register order for hardware specification ver1.00.
41394ab7420f i2c: rcar: Fix I2C DMA transmission by setting sequence

> 
> > Do you think we are on the right track with this new approach or do
> > you feel the implementation is still overly complicated?
> 
> The approach is much better but there are still things I don't like. The
> use of 'goto next_txn' is bad. I hope it could be done better with
> refactoring the code, so DMA will be tried at one place (with two
> conditions then). Not sure yet, I am still working on refactoring the
> one-byte transfer which is broken with my patch. What we surely can use
> from this patch is the -EPROTO handling because I have given up on
> converting the max read block size first. We can still remove it from
> this driver if that gets implemented somewhen.

Thank you for the review comments. We are still working on a cleaner
solution. In case it comes from you first, we are very much keen to
give it a try on the target and report the results.

Best regards,
Eugeniu
