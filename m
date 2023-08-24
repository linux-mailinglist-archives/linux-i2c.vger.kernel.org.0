Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB83787525
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 18:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbjHXQV0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 12:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242493AbjHXQVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 12:21:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05EA19AA;
        Thu, 24 Aug 2023 09:21:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61C7A63F6A;
        Thu, 24 Aug 2023 16:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275B1C433C8;
        Thu, 24 Aug 2023 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692894068;
        bh=7TF2DR/B3noQ8Aweb8xlthPlBU6vOMkohLWBu5tgtFI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jiGV99Jmgtvz7RB9vmLU5EpIZgrjCjJ8S6pbpL/GALyBcqKWyx7iHZoqYeuZKEKTF
         fJaW323yVHmlwExQKTpQSP/06om7/mI0VCqtRceF27fp8Lt+9rzRrqnFI7VWJepBXK
         hFcG5FNbTXb/VZF8RmYdM/m19tGoGLyGICNa5V5F75x9MPPZKpzduyqgfpK3jeBigX
         yxjmi1ORc1bmex4AN47yp6aEZqDKBfohRtC/St4b0+BFiux7QtZmiwNUC6hfv1m6Fd
         YK29LpFgHDnCD0HT/vtYAXjbkEddUtCK98WC6vLdAUzxNJIQ0hXMhxZg+JeygUQ+kN
         GNVAWH72m0HGg==
Date:   Thu, 24 Aug 2023 18:21:04 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] i2c: designware: Add support for recovery when GPIO
 need pinctrl.
Message-ID: <20230824162104.kwz5x5ljjy6i6rjb@intel.intel>
References: <20230822143437.9395-1-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822143437.9395-1-ysionneau@kalray.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yann,

[...]

> +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> +	if (IS_ERR(rinfo->pinctrl)) {
> +		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> +			return PTR_ERR(rinfo->pinctrl);
> +
> +		rinfo->pinctrl = NULL;
> +		dev_err(dev->dev, "getting pinctrl info failed: bus recovery might not work\n");

I'd still have preferred a dev_warn() here... but it's OK.

> +	} else if (!rinfo->pinctrl) {
> +		dev_dbg(dev->dev, "pinctrl is disabled, bus recovery might not work\n");
> +	}

thanks for following up,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
