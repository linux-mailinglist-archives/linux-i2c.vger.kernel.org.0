Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF1D6FF3E6
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 16:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237754AbjEKOUZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 10:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237639AbjEKOUY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 10:20:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64793A97
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 07:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5600660B55
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 14:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59739C433EF;
        Thu, 11 May 2023 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683814820;
        bh=29n/WbUV/CBlXBENjt8Dcr/hpVsTv1R4VybM0pyh9FY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9Y0ch0dqrhg+5501UrmKl0wxgP+J8SDeXfMZL/h7TAbPxrIILqPUNRn+/tvmuQAC
         L1oOS7NYMezUej7Q6ja/j2lh5ZCYQz+WvYG5PgOkmTx3Doj3E4ufvilKQX9I0WIgd7
         uCcK+bfLnfrRmRkeuZoVJiKP2DXmKNja8w7UNC6RW9DZGJ7ItV265OEXJ3q9iLW2q/
         +Bpuq/U34TsLuxAOaXp0+m9ytwQyLLBzoHuMQazXwMTtMoKAZi1gwtuieh6UJYNk+3
         1zBanv93+h7gaYdaugtxVqYblKopk7mA/AVArSB0O6T79ikC1DlRp8nQHboF7bXFrq
         o5tWHJJ+Eyg4A==
Date:   Thu, 11 May 2023 16:20:17 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Simon Horman <horms@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
Message-ID: <20230511142017.hpk2nhvqwhunbvbm@intel.intel>
References: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Simon,

On Wed, May 10, 2023 at 02:32:17PM +0200, Simon Horman wrote:
> Rather than casting pci1xxxx_i2c_shutdown to an incompatible function type,
> update the type to match that expected by __devm_add_action.
> 
> Reported by clang-16 with W-1:
> 
>  .../i2c-mchp-pci1xxxx.c:1159:29: error: cast from 'void (*)(struct pci1xxxx_i2c *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>          ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  ./include/linux/device.h:251:29: note: expanded from macro 'devm_add_action'
>          __devm_add_action(release, action, data, #action)
>                                    ^~~~~~
> 
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
