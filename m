Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE71B776860
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 21:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjHITPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 15:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbjHITPR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 15:15:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C65E423C;
        Wed,  9 Aug 2023 12:13:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 40B346456F;
        Wed,  9 Aug 2023 19:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B1DC433C8;
        Wed,  9 Aug 2023 19:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691608394;
        bh=LeVB41u38/bhZJrLFYAIuDBKlGLS2oWJkoZGthUq6Jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=foNa56/Lvq4BCC02Q0ZTTK/jrSpYteAeDNQMdVNsyuFpsa9NA9veVhr1OryMX+6Y1
         5eo69vm1HvoiTG/+RFjyCQUESdxy1N0V+PJuoo1I77HXUdV3RoOcJFCZST144usBxk
         UqEJUWXAf0J7zQ9DhyHWd2jZwqL+H5iiHiKzAPlCHjXM+t4Kc8ZU3QdqHoA9saStRU
         Pnz4Y7aXVJn7GLkEWc2VbOhGhLklgpJvPd9SppbWmrEeCxXm3cUUU3eFiZoNv7QEqV
         x4aWcmFpjm9Wc5o5cBSbEX5yduts81Vog3ta1qctnKYw0yuKy+UFvwlpdkybvwANvG
         8jGt+6GCg8oFw==
Date:   Wed, 9 Aug 2023 21:13:10 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c/busses: fix -Wmissing-variable-declarations
Message-ID: <20230809191310.atpqztlpgdbdvc5m@intel.intel>
References: <20230808-i2c-amd_static-v1-1-1902f608bba1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808-i2c-amd_static-v1-1-1902f608bba1@google.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Nick,

On Tue, Aug 08, 2023 at 09:56:16AM -0700, Nick Desaulniers wrote:
> I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> bot spotted the following instance:
> 
>   drivers/i2c/busses/i2c-amd756.c:286:20: warning: no previous extern
>   declaration for non-static variable 'amd756_smbus'
>   [-Wmissing-variable-declarations]
>   286 | struct i2c_adapter amd756_smbus = {
>       |                    ^
>   drivers/i2c/busses/i2c-amd756.c:286:1: note: declare 'static' if the
>   variable is not intended to be used outside of this translation unit
>   286 | struct i2c_adapter amd756_smbus = {
>       | ^
> 
> This symbol is referenced by more than one translation unit, so create
> then include the correct header for their declarations.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

You might want to have a Fixes tag here and

Cc: Jean Delvare <jdelvare@suse.com>

[...]

> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amd756.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Please, leave a space here.

And you might also want to have something like:

#ifndef __I2C_AMD_756_H__
#define __I2C_AMD_756_H__

> +#include <linux/i2c.h>

space here.

> +extern struct i2c_adapter amd756_smbus;

#endif /* __I2C_AMD_756_H__ */

Jean, any opinion on this patch, I don't really know this driver,
but is there a way to avoid this extern declaration.

Thanks,
Andi
