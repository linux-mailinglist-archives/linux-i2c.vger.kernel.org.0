Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862FE7DFD4E
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Nov 2023 00:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjKBXjq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Nov 2023 19:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjKBXjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Nov 2023 19:39:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6ED6136;
        Thu,  2 Nov 2023 16:39:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364D1C433C7;
        Thu,  2 Nov 2023 23:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698968383;
        bh=yXkbrGh3Tz1i0fB2b3mR/sr9jUHtXzFxXXR/D78uxu8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Acw/fq6JrJ/U4cSLZXKoaVctoBuKxh+xcGtz47onuMAaz9761I4V2+PfT9bWbmHXX
         6TuvgSXnGFQlei4pKGOpL8QRKfJLp/1emS/evBGjacoQVDeaHIhNZvfqxcZRmo1RdP
         Nu+/F92Lvcy7+4MlgUEZBgZdFZCjlThEpD8M7WqJXEec5GP+si/eQa8A5fKSv9JYSb
         EME0vjhl94Px3iuIPjR87vd0cKu1iOuk4GPxQMgYnT2qPA84dHRKwXBBy8eN4dsZBk
         6G6JHvjYtVb+0TPUKfxG4qdQeQyjM7nRdw72RsVMcCXt6ce+tQJJxr6LC6Zc6mr+Gi
         mK8ExVxNoWfyw==
Date:   Fri, 3 Nov 2023 00:39:38 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v3 2/3] i2c: s3c24xx: fix transferring more than one
 message in polling mode
Message-ID: <20231102233938.yxgezwhnf3fb6bs3@zenone.zhora.eu>
References: <20231031144252.2112593-1-m.szyprowski@samsung.com>
 <CGME20231031144300eucas1p1106849fbdedf6eb929647b96c24a7891@eucas1p1.samsung.com>
 <20231031144252.2112593-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031144252.2112593-3-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,
On Tue, Oct 31, 2023 at 03:42:51PM +0100, Marek Szyprowski wrote:
> To properly handle ACK on the bus when transferring more than one
> message in polling mode, move the polling handling loop from
> s3c24xx_i2c_message_start() to s3c24xx_i2c_doxfer(). This way
> i2c_s3c_irq_nextbyte() is always executed till the end, properly
> acknowledging the IRQ bits and no recursive calls to
> i2c_s3c_irq_nextbyte() are made.
> 
> While touching this, also fix finishing transfers in polling mode by
> using common code path and always waiting for the bus to become idle
> and disabled.
> 
> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
