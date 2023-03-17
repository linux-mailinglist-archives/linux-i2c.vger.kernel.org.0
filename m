Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07DA66BDF92
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 04:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCQD0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 23:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCQD0X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 23:26:23 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8198C3A878;
        Thu, 16 Mar 2023 20:26:21 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1pd0jC-005aoj-JQ; Fri, 17 Mar 2023 11:26:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Mar 2023 11:26:02 +0800
Date:   Fri, 17 Mar 2023 11:26:02 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Felix.Held@amd.com,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: Re: [PATCH v4 0/8] Export platform features from ccp driver
Message-ID: <ZBPdypC1EBbQ1lDR@gondor.apana.org.au>
References: <20230310211954.2490-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310211954.2490-1-mario.limonciello@amd.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 10, 2023 at 03:19:43PM -0600, Mario Limonciello wrote:
> The i2c-designware-amdpsp driver communicates with a platform
> features mailbox provided by the PSP.  The address used for
> communication is discovered via a non-architecturally
> guaranteed mechanism.
> 
> To better scale, export a feature for communication with platform
> features directly from the ccp driver.
> 
> v3->v4
>  Drop the ACPI ID as result of confirmation with internal team.
>  Future platforms should use doorbell, so will treat Cezanne as quirk
>  and assume doorbell going forward.
> 
> Mario Limonciello (8):
>   crypto: ccp: Drop TEE support for IRQ handler
>   crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
>   crypto: ccp: Move some PSP mailbox bit definitions into common header
>   crypto: ccp: Add support for an interface for platform features
>   crypto: ccp: Enable platform access interface on client PSP parts
>   i2c: designware: Use PCI PSP driver for communication
>   crypto: ccp: Add support for ringing a platform doorbell
>   i2c: designware: Add doorbell support for Skyrim
> 
>  arch/x86/kvm/svm/sev.c                      |   1 +
>  drivers/crypto/ccp/Makefile                 |   3 +-
>  drivers/crypto/ccp/platform-access.c        | 232 ++++++++++++++++++++
>  drivers/crypto/ccp/platform-access.h        |  35 +++
>  drivers/crypto/ccp/psp-dev.c                |  32 +--
>  drivers/crypto/ccp/psp-dev.h                |  11 +-
>  drivers/crypto/ccp/sev-dev.c                |  16 +-
>  drivers/crypto/ccp/sev-dev.h                |   2 +-
>  drivers/crypto/ccp/sp-dev.h                 |  10 +
>  drivers/crypto/ccp/sp-pci.c                 |   9 +
>  drivers/crypto/ccp/tee-dev.c                |  17 +-
>  drivers/i2c/busses/Kconfig                  |   2 +-
>  drivers/i2c/busses/i2c-designware-amdpsp.c  | 188 ++++------------
>  drivers/i2c/busses/i2c-designware-core.h    |   1 -
>  drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>  drivers/tee/amdtee/call.c                   |   2 +-
>  drivers/tee/amdtee/shm_pool.c               |   2 +-
>  include/linux/psp-platform-access.h         |  65 ++++++
>  include/linux/psp-sev.h                     |   8 -
>  include/linux/psp.h                         |  29 +++
>  20 files changed, 461 insertions(+), 205 deletions(-)
>  create mode 100644 drivers/crypto/ccp/platform-access.c
>  create mode 100644 drivers/crypto/ccp/platform-access.h
>  create mode 100644 include/linux/psp-platform-access.h
>  create mode 100644 include/linux/psp.h
> 
> -- 
> 2.34.1

Patches 1-5 and 7 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
