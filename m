Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB017DFD4B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Nov 2023 00:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjKBXfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Nov 2023 19:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjKBXfT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Nov 2023 19:35:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE93DB;
        Thu,  2 Nov 2023 16:35:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7BFC433C7;
        Thu,  2 Nov 2023 23:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698968116;
        bh=W+zG9/l+8zsisBZvEYckjM33bU/mvcLuhqWonNSpYec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rpr7hNCp5BVthHrSyMJEHnB3D85UGoHIi+ni8wHKowwcFRv0vO0e5+L4svYG+AHUc
         DI9NuSgk7+m5UukFiS6Q8/FgDAv8xy7dqiG2whoBpTsxZ/GRCe/o7AkhQPwJPbP7Bm
         tOm27ELb39MZjO4/hG9UggLw0C8x0NXOfKV6bWHVGDJVwE2UyIZspnx/wXpcwKkcUs
         UgykIRyxFw+vHwZvUf5/jajCW/ViuC+Xasfda4bURSdYZPaaJHaXFL8aSt35chL6J1
         tYbeJuMJm6LVoNnr5tMcIpZWUaR0aSsge+T9+O6VLfzJi3vZkQIblsUnWdJDjismWe
         UDi0ZAZWadFEQ==
Date:   Fri, 3 Nov 2023 00:35:12 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= 
        <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        'Wolfram Sang' <wsa@kernel.org>
Subject: Re: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
Message-ID: <20231102233512.ie3fgox3dmwk6bhk@zenone.zhora.eu>
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
 <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
 <20231025121725.46028-2-m.szyprowski@samsung.com>
 <07e001da0d2c$5f0360f0$1d0a22d0$@samsung.com>
 <ace37058-1bcb-4fb4-8ffe-628f5e9249c0@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ace37058-1bcb-4fb4-8ffe-628f5e9249c0@samsung.com>
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

> >>   	for (tries = 50; tries; --tries) {
> >> -		if (readl(i2c->regs + S3C2410_IICCON)
> >> -			& S3C2410_IICCON_IRQPEND) {
> >> +		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
> >> +
> >> +		if (!(tmp & S3C2410_IICCON_ACKEN)) {
> >> +			usleep_range(100, 200);
> > Trivial question, but is there any hardware specification related to sleeping for 100-200 microseconds? If any then it would be nice to use const variable instead and add some description about why sleeping here is needed.
> 
> 
> Well, this is a bit magic value I got from my experiments. There is some 
> delay needed there to let hardware to clear that bit and the values I 
> proposed worked. If You don't like that, I can reuse the delay value 
> that is already present in that loop: usleep_range(1000, 2000).

I also wanted to comment on this... please, then, add a comment
saying how you got to this range.

Andi
