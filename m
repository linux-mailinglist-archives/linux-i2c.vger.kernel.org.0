Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90044FEDFD
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Apr 2022 05:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiDMD7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 23:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiDMD7k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 23:59:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA9321B8;
        Tue, 12 Apr 2022 20:57:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B503FB820FD;
        Wed, 13 Apr 2022 03:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA454C385A4;
        Wed, 13 Apr 2022 03:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649822237;
        bh=X9N2DNZQIT442LjGmFLdknKH1IcmNNgTXyXuk5QHlKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gkyd13u2QO4HEsMEqlFWlK4WV8A/nAW+g8kYKTwhFRk52QOIgZlR7h0SFsUbUtcSX
         0uoPcBVvNwAqRXClcqp1d+dD29AKJuzpBIsfsNRVBPzXvYFf+m4s5rxKdjcoLR3Mn6
         00Q0URYpWB0FxABi6PJpWjjNKviHBEnt1+R88wgT/HMmnMuv3mLJA4IX5cnwrpxcGA
         zWb5wydx8Svs3nAUw7xmdVEzeTOg0JomaifcjFfHzIavn2r2G2xmZQg6r4E3beWQmE
         iGOvaY8E6t1K1uEItw/d++F4mzHO4oWqC7+BQT7UDmSknPUUrEW51Jg3yzUGi/MwbG
         s43JIAthv0CjA==
Date:   Wed, 13 Apr 2022 09:27:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Use dev_err_probe() for GPI DMA error
Message-ID: <YlZKGOa2SycmqqYZ@matsya>
References: <20220412212601.2384274-1-bjorn.andersson@linaro.org>
 <YlY/TbqHk0N3KXhl@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlY/TbqHk0N3KXhl@matsya>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+ Wolfram

On 13-04-22, 08:41, Vinod Koul wrote:
> On 12-04-22, 14:26, Bjorn Andersson wrote:
> > The GPI DMA engine driver can be compiled as a module, in which case the
> > likely probe deferral "error" shows up in the kernel log. Switch to
> > using dev_err_probe() to silence this warning and to ensure that
> > "devices_deferred" in debugfs carries this information.

Somehow maintainers doesnt list Wolfram... maybe thats how you skipped
it..

> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
> -- 
> ~Vinod

-- 
~Vinod
