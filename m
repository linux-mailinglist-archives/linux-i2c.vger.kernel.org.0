Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F73C7624B6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 23:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGYVp0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 17:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjGYVpZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 17:45:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447111FDD;
        Tue, 25 Jul 2023 14:45:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D4F4A6189B;
        Tue, 25 Jul 2023 21:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD47C433C8;
        Tue, 25 Jul 2023 21:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690321524;
        bh=xluFFv59K9dXe1AoCsemmJrCVNF3cZf3wPusQ6wvpUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zzla6kPzevIQjIy1BptwYsNbpQ+xebfL78uN51vrIbr0lFJOt+FEwDzxQsPSjsgVu
         uscDoR71IsNHeUcX2AmEp9CWQBlec5WlK3uLZk3nnpTh48I+2k5J1WcPjkn3hZlZi6
         4/Q/9DYRQ2S78CduVKd/XhXNw2NtHJFK2LQoWcjNx5jYbQZcGcAU8GddBxAblIZBaj
         ktYwYGYD/012C3YL/CMNvxWcFRDaZwtx9s2cwiEjHSBKlCtH9FkBh8t4eYEfbM7/th
         paPrCO1WdV00iPpJqxFpxrUHmRkGS8XqRq44kUlNtxz1nfVZahzl4qUfkhFJQlOAba
         tguyHtGcI2Irw==
Date:   Tue, 25 Jul 2023 23:45:21 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to
 common code
Message-ID: <20230725214521.zxjqinryvva2zanx@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
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

On Tue, Jul 25, 2023 at 05:30:15PM +0300, Andy Shevchenko wrote:
> Instead of checking in callers, move the call to the callee.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-common.c  | 11 +++++++++--
>  drivers/i2c/busses/i2c-designware-pcidrv.c  |  3 +--
>  drivers/i2c/busses/i2c-designware-platdrv.c |  3 +--
>  3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index cdd8c67d9129..683f7a9beb46 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -255,9 +255,8 @@ static void i2c_dw_acpi_params(struct device *device, char method[],
>  	kfree(buf.pointer);
>  }
>  
> -int i2c_dw_acpi_configure(struct device *device)
> +static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *device)
>  {
> -	struct dw_i2c_dev *dev = dev_get_drvdata(device);
>  	struct i2c_timings *t = &dev->timings;
>  	u32 ss_ht = 0, fp_ht = 0, hs_ht = 0, fs_ht = 0;
>  
> @@ -285,6 +284,14 @@ int i2c_dw_acpi_configure(struct device *device)
>  		dev->sda_hold_time = fs_ht;
>  		break;
>  	}
> +}
> +
> +int i2c_dw_acpi_configure(struct device *device)

I was about to ask you why are we keeping this int, but then I
saw that you are making it void in the next patch :)

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
