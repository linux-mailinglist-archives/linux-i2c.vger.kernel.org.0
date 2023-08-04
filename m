Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A4A770B2A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 23:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjHDVmT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 17:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjHDVmH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 17:42:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226AD1BF9;
        Fri,  4 Aug 2023 14:42:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C3086211A;
        Fri,  4 Aug 2023 21:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEB4C433C8;
        Fri,  4 Aug 2023 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691185320;
        bh=cYQTal4oVcZ0f8JJ8ho75fJImPc4P7TVWlOAH6bcuGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kF27MS04F3kAG5fVWvjxHTC6rKdE8Su7QZ3H5m6faQZiqM8NpIR8Gyg+zlp2dOqHs
         9307F81JVZYsi2tPNFfH1Tk7cT3DMYS3I0IvsRBdeaOFQooIosMskwxid6/WZbs6tX
         uRkO+eFzvOBz76cCGnzDTXMoDnmmYhftzgfFIdVLv7Llsu+gNpIPnY22em4CxiGDIr
         T6SrLQ/CiuIPFt4+j0/3Rc4u2GsVMf6UJdhXJKaBO32qTn+phkT4Vxv4kxs8Bk6iwa
         y0gbt9Rg84tWiDqQD1+5tH+R55/2saDd6QZaXhlBALRsyijX9/oHqBJEetFf0SFFpX
         OZ3bfb4SVWoQw==
Date:   Fri, 4 Aug 2023 23:41:57 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 9/9] i2c: designware: Fix spelling and other issues in
 the comments
Message-ID: <20230804214157.iaylzqcmpflx6x7j@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725143023.86325-10-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

[...]

> @@ -210,12 +210,12 @@ static void psp_release_i2c_bus(void)
>  {
>  	mutex_lock(&psp_i2c_access_mutex);
>  
> -	/* Return early if mailbox was malfunctional */
> +	/* Return early if mailbox was malfunctioned */

I think "was malfunctioned" is not really correct... maybe "has
malfunctioned"? "is malfunctioning"?

>  	if (psp_i2c_mbox_fail)
>  		goto cleanup;

[...]

> @@ -508,7 +510,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  
>  		/*
>  		 * Wait 10 times the signaling period of the highest I2C
> -		 * transfer supported by the driver (for 400KHz this is
> +		 * transfer supported by the driver (for 400kHz this is

what did you change here? :)

The rest looks good.

Thanks,
Andi

>  		 * 25us) as described in the DesignWare I2C databook.
>  		 */
>  		usleep_range(25, 250);
