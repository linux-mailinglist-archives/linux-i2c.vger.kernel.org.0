Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8AFA6BEA8A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 15:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjCQOAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 10:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjCQOAt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 10:00:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3A92A987;
        Fri, 17 Mar 2023 07:00:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33EFC622B9;
        Fri, 17 Mar 2023 14:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4756C433D2;
        Fri, 17 Mar 2023 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679061646;
        bh=teYKQCLEQB1BV7xTB+zUafR6l5vnPTcQ4NZAklBTbk0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZdQX6BHbnSflCBe5KdO94L2I2j0cCKC6ki459UNxtieLjsJtcsbOcfIAtAS4Zqfv5
         6E80DRSo2eCzK6d6fDkWrrOxQcZ/mDU89vKr82WqoopzhIL7uQ+MuPPt9SDd9yvRQY
         joOFMXOzVy7A9ANxK3zLf46WwtpC9wK/gkV8lKRAnzj6Ax01G/PbgtrR/95XFMswv8
         G++O7UBhsClpB/Z5yPE39SD2nPiEMlyUBGQWoPkW/JZTuGiuWiTewJHgQm+Aj3PT21
         MsAuO0fGDMNESG3vYWZnzNmM9rohqbnro25YxGofQMidInPzYMBqzXrtluJHkvWdGf
         SU2uJ0x6BqAnQ==
Date:   Fri, 17 Mar 2023 15:00:43 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v5 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c
 property
Message-ID: <20230317140043.jnlmghbnvol2kxrz@intel.intel>
References: <20230314215612.23741-4-andi.shyti@kernel.org>
 <20230314221614.24205-1-andi.shyti@kernel.org>
 <5a8fa13b-d9f7-aca8-3898-51d6e53fa78a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a8fa13b-d9f7-aca8-3898-51d6e53fa78a@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On Fri, Mar 17, 2023 at 10:26:21AM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2023 23:16, Andi Shyti wrote:
> > "fsl,timeout" is marked as deprecated and replaced by the
> > "i2c-scl-clk-low-timeout-us" i2c property.
> > 
> > Use this latter and, in case it is missing, for back
> > compatibility, check whether we still have "fsl,timeout" defined.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> > Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> > Hi,
> > 
> > this should be the only patch where I forgot an 'ms'.
> > It should be fixed now.
> > 
> > Thanks, Chris.
> > 
> > V4 -> v5
> >  - replace /ms/us/ in the commit subject and in the comment.
> > 
> 
> Please send entire new v5, because this messes with our
> threading/reviewing and our tools.

ah... tools!

Sure... will do!

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

Andi
