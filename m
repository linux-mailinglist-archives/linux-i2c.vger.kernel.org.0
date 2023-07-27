Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8F576582B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 18:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbjG0QAl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 12:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjG0QAk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 12:00:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FB6271D;
        Thu, 27 Jul 2023 09:00:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9317A61EC0;
        Thu, 27 Jul 2023 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75071C433D9;
        Thu, 27 Jul 2023 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690473638;
        bh=CCG/EudxPmQupRkrrbKiOIs7b3atiTcMUzNXVCWRRkc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QFzTUWmYIe4SvP8C2i725DWCsmNm7iBKykHjb5JgkebvkxbnK/vvzQRnXfMTCp7ZD
         qOGTpbKUVZflAi1+L3Hc80kEyMTD8eUb/ddXq00J6Px5Z00pYgN619kHP7EZ09bu8k
         L/0QVM1225wkRt+8baYALGHxa+HmigGwybUkpPoKRQLP8koq8LRR496fcsbAPo5+p5
         8oO8Mc8zD54Oy77Ke4MmGBh6Yuf4dem1sTOqvinhA7rLrG/bYShM98zRqM7/oQoyG9
         8ZnzpPW+/I9jTBDzE5SFgvuzojaMfe0h1xELZc8UYzAi9sO0R3wlbA+G02g6WG5wET
         mCHMHo41bwe/A==
Date:   Thu, 27 Jul 2023 18:00:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Harry Geyer <harry.geyer@devtank.co.uk>
Cc:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tiny-usb: check usb base class before assuming the
 interface on device is for this driver
Message-ID: <20230727160035.d4rmprog4amqy2mg@intel.intel>
References: <20230727083354.4903-1-harry.geyer@devtank.co.uk>
 <20230727113029.ckrxe4qmy2nznh4e@intel.intel>
 <ac708760-ed6a-a36b-ac8f-25654276a57c@devtank.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac708760-ed6a-a36b-ac8f-25654276a57c@devtank.co.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 27, 2023 at 02:54:42PM +0100, Harry Geyer wrote:
> Hi Andi,
> 
> On 27/07/2023 12:30, Andi Shyti wrote:
> > On the other hand, checkpatch is OK with lines up to 100
> > characters and this one looks like it's withing that length. So,
> > up to your personal preference.
> I am happy to resend the patch.

Thanks!

> > If you resend it, you can add my r-b.
> Not sure what you mean, I am sorry. Please, can you explain what you want me
> to do.

I was meaning that you could add my Reviewed-by:... you can
also ignore it, I can r-b it later.

Thanks,
Andi

PS r-b = Reviewed-by, if this was the reason of confusion :)
