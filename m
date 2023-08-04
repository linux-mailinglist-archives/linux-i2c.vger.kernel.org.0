Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2F2770AFD
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 23:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjHDVbc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 17:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjHDVbO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 17:31:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A29115;
        Fri,  4 Aug 2023 14:31:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 64356620E3;
        Fri,  4 Aug 2023 21:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B43C433C7;
        Fri,  4 Aug 2023 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691184667;
        bh=vlmb1ZjZSd8zw8ZbHxdcAEoIO5FvvTkVdffDkcMK2JU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eHQbNPfkutAvVNj+mEwT5sE7Ijp7fAjOnl8mCmexAUaGJDiwQMCe7KW6LtlaqI8rb
         CYBOfEfxMhmIZOwB1MEJaLDieL/QCTKGx7urZWnNHU2/4g8RzXms3yg6C48RWtRKzX
         rNTSZsV4ZKQZM3sDzY330Ks+PSPBWczYD+5pvwTIIoBZ63+TC6pQ0DUtqa3+9BBd6Z
         6BlMK6OSppW+y8NEzNh7Hcbc2gMHdsIRjzYkFgXLmYoxeIGYpWIbOx0PR326DwdUEU
         Y3sqDcP+hqLzvrFCmr3L/9uJteruRr2IYxqF6D1wi4BBrMFyl/fjV3B1r+dkaE1vi2
         CDeia0KZR+y6w==
Date:   Fri, 4 Aug 2023 23:31:05 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 7/9] i2c: desingware: Unify firmware type checks
Message-ID: <20230804213105.r5lmf2dsdxyecyfm@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725143023.86325-8-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jul 25, 2023 at 05:30:21PM +0300, Andy Shevchenko wrote:
> Instead of asymmetrical checks for the firmware use is_*_node()
> calls. With that, drop now local wrappers against
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 23 +++++++---------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 443426474cfc..e6df6a484955 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -241,15 +241,9 @@ static void i2c_dw_of_do_configure(struct dw_i2c_dev *dev, struct device *device
>  	}
>  }
>  
> -static void i2c_dw_of_configure(struct dw_i2c_dev *dev)
> -{
> -	if (dev_of_node(dev->dev))
> -		i2c_dw_of_do_configure(dev, dev->dev);
> -}
> -

I have to partially agree with Jarkko here, the patch splitting
of this series is a bit too exotic. Series need to be understood
by reading them forward, not backward.

Oversplitting sometimes might even reduce readability and
"reviewability" (can I say so?). And this function, in seven
patches, has been added, moved and removed, and I had to read the
series twice :)

Anyway, I won't ask you to refactor the whole series, I
understand your logic.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
