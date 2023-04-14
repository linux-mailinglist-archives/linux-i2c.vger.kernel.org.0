Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EAB6E21AE
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 13:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjDNLGW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 07:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjDNLGO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 07:06:14 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4AE9754;
        Fri, 14 Apr 2023 04:06:07 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1pnHFc-00Fqhg-96; Fri, 14 Apr 2023 19:05:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Apr 2023 19:05:56 +0800
Date:   Fri, 14 Apr 2023 19:05:56 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
Subject: Re: [PATCH v8 0/6] Use CCP driver to handle PSP I2C arbitration
Message-ID: <ZDkzlM9fAh/TVcrg@gondor.apana.org.au>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403183216.3493-1-mario.limonciello@amd.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 03, 2023 at 01:32:09PM -0500, Mario Limonciello wrote:
> The CCP driver now has symbols that can be used by i2c-designware-amdpsp
> to handle the communication regarding i2c arbitration with the PSP for
> both Cezanne and Mendocino based designs.
> 
> Utilize those symbols.
> 
> v7->v8:
>  * Pick up tags
>  * Drop hunk for error message change
>  * Fix kernel robot build failures
> 
> Mario Limonciello (6):
>   crypto: ccp: Drop extra doorbell checks
>   crypto: ccp: Bump up doorbell debug message to error
>   crypto: ccp: Return doorbell status code as an argument
>   crypto: ccp: Use lower 8 bytes to communicate with doorbell command
>     register
>   i2c: designware: Use PCI PSP driver for communication
>   i2c: designware: Add doorbell support for Mendocino
> 
>  drivers/crypto/ccp/platform-access.c        |  31 +--
>  drivers/i2c/busses/Kconfig                  |   5 +-
>  drivers/i2c/busses/i2c-designware-amdpsp.c  | 197 +++++---------------
>  drivers/i2c/busses/i2c-designware-core.h    |   1 -
>  drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>  include/linux/psp-platform-access.h         |   5 +-
>  6 files changed, 62 insertions(+), 178 deletions(-)
> 
> 
> base-commit: d6cb9ab4bfeaaa69147948e42d7cff080db82d07
> -- 
> 2.34.1

Patches 1-4 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
