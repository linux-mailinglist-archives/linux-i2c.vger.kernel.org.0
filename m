Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37BD1742A27
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jun 2023 18:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjF2QAM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jun 2023 12:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjF2QAE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jun 2023 12:00:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E9A3595;
        Thu, 29 Jun 2023 09:00:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5747661578;
        Thu, 29 Jun 2023 16:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA798C433C8;
        Thu, 29 Jun 2023 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688054402;
        bh=jpUacgkdFeRsJ/MSUKrNSTCllv1J69DsiV760Rp2JOM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fxEmgF3yewTMhBXqSvl0K9ukMQUxWlxLqXrlEdXWH4ryN6ghLB3V4HZB91yVVfGtw
         mXOZAyeLNVR9gHdg1Vgn9PB/+vcvus1gJ36HCr5+M+VYHn4So5v74YFaSl4+3M/UBo
         GOkg8kvtD1dUyDDuxyEADMgx9Aox31w7TZXGpmwet3b+fu0EmGD+LFJyPist2zk3PV
         JB29vhOcT5mFja2zx4YO2vgtZQ1IavsEn3odKGU2GTEuAXKeJCZLI18XFnuTEQfg+K
         lNbiLp4uW2ixIAH/oHByTxFpCqN+UX4OfUJh2rffpcYNQWbsS0+gHQSJO8Tc6wfMXz
         UQZYLS31xn6dg==
Date:   Thu, 29 Jun 2023 17:59:58 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 3/4] ACPI: platform: Ignore SMB0001 only when it has
 resources
Message-ID: <20230629155958.zeze2mirwbrb4ggy@intel.intel>
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
 <20230626110026.65825-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626110026.65825-4-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Jun 26, 2023 at 02:00:25PM +0300, Andy Shevchenko wrote:
> After switching i2c-scmi driver to be a platform one, it stopped
> being enumerated on number of Kontron platforms, because it's
> listed in the forbidden_id_list.
> 
> To resolve the situation, add a flag to driver data to allow devices
> with no resources in _CRS to be enumerated via platform bus.
> 
> Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
> Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
> Link: https://lore.kernel.org/r/20230621151652.79579-1-andriy.shevchenko@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
