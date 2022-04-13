Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8CDE4FED5F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Apr 2022 05:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbiDMDNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 23:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbiDMDNg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 23:13:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0D435AB2;
        Tue, 12 Apr 2022 20:11:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B6CCB81F2B;
        Wed, 13 Apr 2022 03:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706B6C385A5;
        Wed, 13 Apr 2022 03:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649819474;
        bh=5wbjog1eFuKCDoIWisV4RmXaSCT8O+j+FcTQSCSsAls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fxedCoL6SLHm/zFLDUO7AJlj5xLD6Pd3rqcNpzKTaRdtrR1cY9RrLDbbEPTvb1eob
         30I4jmaYd6Fg8KX7jEn0wKc7m1KH2vncPc/BkkOCC44niIBrtW6hM7EKTSGq+ooJup
         /2crW2JSf7w+y5YvGdlKDguGPVr/kSt6ePU3AEUq37U0hQlUGXZri/kWjnluu5XSzi
         OuDnd/YMS25ueIdQc/IKI9hQWQVUDoC3aq7e2uFtnmC4tmaKtUSwhXjoh6dswtXnoM
         DxONCMyZotmTRQVLFHxYo2sR4TlPo/pnH2IvWKck1LnQwd1sZEhSxEbwfB2fWLbvBV
         cVZekApyBHryw==
Date:   Wed, 13 Apr 2022 08:41:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Use dev_err_probe() for GPI DMA error
Message-ID: <YlY/TbqHk0N3KXhl@matsya>
References: <20220412212601.2384274-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412212601.2384274-1-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12-04-22, 14:26, Bjorn Andersson wrote:
> The GPI DMA engine driver can be compiled as a module, in which case the
> likely probe deferral "error" shows up in the kernel log. Switch to
> using dev_err_probe() to silence this warning and to ensure that
> "devices_deferred" in debugfs carries this information.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
