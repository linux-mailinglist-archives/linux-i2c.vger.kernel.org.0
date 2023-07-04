Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8456A746AC3
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jul 2023 09:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjGDHhS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jul 2023 03:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjGDHhQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jul 2023 03:37:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B071A7;
        Tue,  4 Jul 2023 00:37:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 391F56117D;
        Tue,  4 Jul 2023 07:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEEEC433C7;
        Tue,  4 Jul 2023 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688456234;
        bh=TjQKVS/MYAqAE08Ju3kcT2k6jvr4wFWPxTscLwLQRYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXmh01IaT1vSo+ZNtz4ALoaysw5naI4kBl13FlMYUut8yiJax6k2gpdpluabxDa4L
         oCsNHzZBW42w/ZxyFw1+FoCiYTvFNCGbYKbbK5tVyw4vPvikvR4yZpJT7lw1UMMAML
         vfU5aWDF1hQJrVCwagt6O0innmme9spkMuVi/BYjR4QvEf2opDJNiBmqGRacCrVmQJ
         JYNbS6ajLKdu1h02iLoyaQs+A8pCXVsq6PPFYp0xPMmS64dZ2jItZhpaR2U9czNdnE
         RrPHPmEXZG4aPWR6mtT891xxa+QVeil0OFs8e9uQM7gLurvcSuL02wrKKgnywU/f36
         SpzZJCcO/57aw==
Date:   Tue, 4 Jul 2023 09:37:09 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>, wsa@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: busses: i2c-nomadik: Remove a useless call in
 the remove function
Message-ID: <20230704073709.dzne7vcnsrksio2f@intel.intel>
References: <62ae6810d41e0429ebaadfac8a95409f4bc72456.1688160163.git.christophe.jaillet@wanadoo.fr>
 <885ee9fa-f56c-4e21-b648-866dd4e1dc0f@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <885ee9fa-f56c-4e21-b648-866dd4e1dc0f@kadam.mountain>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Jul 03, 2023 at 03:54:42PM +0300, Dan Carpenter wrote:
> On Fri, Jun 30, 2023 at 11:23:28PM +0200, Christophe JAILLET wrote:
> > Since commit a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of
> > git://git.pengutronix.de/git/wsa/linux"), there is no more
> > request_mem_region() call in this driver.
> > 
> > So remove the release_mem_region() call from the remove function which is
> > likely a left over.
> > 
> > There is no details in the above commit log, but at its end we can read:
> >    Conflicts:
> > 	   drivers/i2c/busses/i2c-nomadik.c
> > 
> > This may explain why this call has been left here.
> > 
> > Fixes: a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of git://git.pengutronix.de/git/wsa/linux
> 
> The reason why you're so confused about this Merge commit is because
> it's completely unrelated to the bug.  :P  It should be:
> 
> Fixes: 235602146ec9 (i2c-nomadik: turn the platform driver to an amba driver)
> 
> When you look at that commit, you'll see that your patch is correct.

Yes, indeed I noticed the same but did not investigate further.
Please, also add:

Cc: <stable@vger.kernel.org> # v3.6+

Andi
