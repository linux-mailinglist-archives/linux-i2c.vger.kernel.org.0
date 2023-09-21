Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26AFB7AA44C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 00:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbjIUWFn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 18:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbjIUWFc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 18:05:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1077E903F
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 14:30:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145B7C433D9;
        Thu, 21 Sep 2023 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695331827;
        bh=YNtw9qhfCKdGFOl6kL3pCZPq01EWD8SWX+L1FXdAfoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l5/Lck1iRRmGW7irPJwELciWGT8ge8SLOASQzSN5F19kHjJNWZ+Rak33NGVXrFYXz
         /tVzR9zkhZnm265Sx1csdg1a8qoIpCiy4GOmXS30k4HSJkLWYzBM+0NC9c3kFr8H8I
         vNUV/k9ijsDIz0BlsZ6W5CtDNxGPvz/GQNAeJWKFBecVrA7hkLxGt46H6qV2K5dYB+
         Yfx0RqMzK04byFei/+Xo5t/x10U3bNNp65+JaN+cg6tIlbwOE0bYvKEpvuTMf8MG2K
         KvginXEFUbU8gpOmDcmmBUxySyLVLzfm6jaz/cQN2rkK+btlf1UQOU0O9vSawezFBB
         zJyQ7BDSxQAlg==
Date:   Thu, 21 Sep 2023 23:30:21 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Michal Simek <michal.simek@amd.com>, Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH] i2c: xiic: Correct return value check for xiic_reinit()
Message-ID: <20230921213021.iaiehrotxkkptvln@zenone.zhora.eu>
References: <20230920134109.2232769-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920134109.2232769-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

[...]

> @@ -710,7 +710,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>  		 * reset the IP instead of just flush fifos
>  		 */
>  		ret = xiic_reinit(i2c);
> -		if (!ret)
> +		if (ret < 0)
>  			dev_dbg(i2c->adap.dev.parent, "reinit failed\n");

this should be a dev_warn(), but it's anyway out of the scope of
this patch.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
