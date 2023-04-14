Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51AD06E209E
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 12:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjDNKVn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 06:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjDNKVl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 06:21:41 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918E940C0;
        Fri, 14 Apr 2023 03:21:40 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1pnGYY-00Fpg2-20; Fri, 14 Apr 2023 18:21:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Apr 2023 18:21:26 +0800
Date:   Fri, 14 Apr 2023 18:21:26 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Wolfram Sang <wsa@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
Subject: Re: [PATCH v8 5/6] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <ZDkpJtsPWgNnC08J@gondor.apana.org.au>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
 <20230403183216.3493-6-mario.limonciello@amd.com>
 <ZC+1gJMc8/LtCv/M@sai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC+1gJMc8/LtCv/M@sai>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 07, 2023 at 08:17:36AM +0200, Wolfram Sang wrote:
> On Mon, Apr 03, 2023 at 01:32:14PM -0500, Mario Limonciello wrote:
> > Currently the PSP semaphore communication base address is discovered
> > by using an MSR that is not architecturally guaranteed for future
> > platforms.  Also the mailbox that is utilized for communication with
> > the PSP may have other consumers in the kernel, so it's better to
> > make all communication go through a single driver.
> > 
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
> > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Tested-by: Mark Hasemeyer <markhas@chromium.org>
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>

Thanks, but as the original patch wasn't posted to linux-crypto
so I can't pick this up.

Mario, could you repost just these two patches with the Acks added?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
