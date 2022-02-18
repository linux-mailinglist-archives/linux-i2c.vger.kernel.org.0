Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231794BB7A1
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 12:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbiBRLGM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 06:06:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbiBRLGM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 06:06:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270452944C3;
        Fri, 18 Feb 2022 03:05:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D9005B825D4;
        Fri, 18 Feb 2022 11:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2737C340EB;
        Fri, 18 Feb 2022 11:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645182353;
        bh=J59lH66krrvcoll/JdbSTQBtYjQWh/7nSG+XW1P3Unw=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=Tw5n0BFffkeKDKXKhP01gh3KO8XEAHxA3XInRcYgJYasJvhxI6fqYoakKs/+gC7Mh
         6q1t5pjGBPIDeGxBl/W/Jr64oqrvxfdwZETsAqsVJh7oN2ayT1WzHzM7Ujhy6xvC3n
         6vGmPRIh75+kAeYOHicH9KpLWQ03d+n+1Zfbl6PXS4gCkErbTtiRs+FGdBMlHEUlp2
         65jyP8K4iSiGDNYQZPtgx65vlCzG6jV12yJIqvAnphMuThbjnwAO+18EeqoQmYsFqZ
         2OJLukE/SOmkZTRsvxyzQC7tuOtLpYS3EHssWSQSopmhglSvy8rrMz2SrQutEyDuGL
         9spWLWbuHzWXQ==
Date:   Fri, 18 Feb 2022 16:35:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>, jorcrous@amazon.com,
        linux-arm-msm@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Fix return value for master_xfer
Message-ID: <Yg99jVuvHLrYWXcH@matsya>
References: <20220209210356.2848-1-jorcrous@amazon.com>
 <Yg9qlwvh08tXDqTv@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg9qlwvh08tXDqTv@ninjato>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18-02-22, 10:44, Wolfram Sang wrote:
> On Wed, Feb 09, 2022 at 09:03:56PM +0000, jorcrous@amazon.com wrote:
> > From: Jordan Crouse <jorcrous@amazon.com>
> > 
> > The master_xfer function is supposed to return the number of messages that
> > were processed. Both  geni_i2c_gpi_xfer and geni_i2c_fifo_xfer are
> > returning 0 which is being interpeted as a error in the upper layers.
> > 
> > Fixes: 8133682618cb ("i2c: qcom-geni: Add support for GPI DMA")
> > Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> 
> For the record, this patch is not upstream yet and needs to be folded
> into the next version of the GPI DMA patch by Vinod.

I have folder this into into my patch and will be posting updated one
(this was also in Dmitry's review)

Thanks
-- 
~Vinod
