Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C99577A77
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 07:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbiGRFgp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 01:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiGRFgp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 01:36:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B726E003;
        Sun, 17 Jul 2022 22:36:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 368E7611FB;
        Mon, 18 Jul 2022 05:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9C4C341C0;
        Mon, 18 Jul 2022 05:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658122603;
        bh=y8noT6CwOTcKojJQk+6fCk76Eb/AWagYN58luctz8lI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AHCU3z+WbO51OuUHDtbdXuIQ02adOzFh0dmB+M0OudATEYze1+zbE6Ec/l5U1bY8v
         pe5xxt6tKyn48tZn70v8zfluJQSCukS1jCI3sOLa+r+21S+2pFEGtxZ/sgevIYTS7e
         w5PditBPl43OyRk6SZNxW2vdTjYHrwAyE5QYlZgh1zzWlYIdA7vwjfWBmLnXPj0t33
         i+/UuFQ2KJbx+s2YQTjI4vX4M8W6cQPb61mzP2SLInXRImF1ZHg0A4+CyfGw6YA3lp
         AtB62TT6ikqQdSHidvtrSMt8bK21/WRX1Y7zyjIvxCl95YozGJbESMyRM/WJIDaQrm
         F5pPf8809B2ZQ==
Date:   Mon, 18 Jul 2022 11:06:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Propagate GENI_ABORT_DONE to
 geni_i2c_abort_xfer()
Message-ID: <YtTxZ3UcUmgxUbOu@matsya>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-3-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-07-22, 20:50, Bjorn Andersson wrote:
> Waiting for M_CMD_ABORT_EN in geni_i2c_abort_xfer() races with the
> interrupt handler which will read and clear the abort bit, the result is
> that every abort attempt takes 1 second and is followed by a message
> about the abort having times out.
> 
> Introduce a new state variable to carry the abort_done state from the
> interrupt handler back to geni_i2c_abort_xfer().

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
