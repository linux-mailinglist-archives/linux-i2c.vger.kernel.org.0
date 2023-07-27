Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E29765D8A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 22:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjG0Unr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 16:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjG0Unp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 16:43:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25E22D5B;
        Thu, 27 Jul 2023 13:43:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F54F61F44;
        Thu, 27 Jul 2023 20:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C880AC433C8;
        Thu, 27 Jul 2023 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690490623;
        bh=QlIHP8dhX5OJKYng0fljwWznF8dNsUY8Bn/VfqY1drk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dZyI1Xl51voxYvqt1b7E85tntZQ5XlSa5Ls6CckQJLCdMgznvnKbraiKe8MCHhYVf
         DrFwWDUwwoZ9KNsfdjh4jNrM/UkjjT4chmd64CdvouO15NN6LgcuRJ+cEgjG/UWkA3
         0dKQm1OYI3mxScCV8kGX0g4SvK5S4t0FEUTqhArHzrugieUdAx36AXcoboDy6v364m
         T2mQ/Ei6DCnpT3TC+a0WyOKPRg+4BTbKs+ejkeSCI0qWD1OP2BSmT1+g3VuIgZJc0g
         PKNEKGfAxViz2VIsXv60rn6c0AEPlnT7t2Ii7UMCy4PP/SWbPFI+0T4mBTn+Cw77LJ
         0WRtMZ0GcA+bw==
Date:   Thu, 27 Jul 2023 22:43:40 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chengfeng Ye <dg573847474@gmail.com>
Cc:     rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Message-ID: <20230727204340.454cmkli5gotipmb@intel.intel>
References: <20230707084941.28964-1-dg573847474@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707084941.28964-1-dg573847474@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chengfeng,

On Fri, Jul 07, 2023 at 08:49:41AM +0000, Chengfeng Ye wrote:
> iproc_i2c_rd_reg() and iproc_i2c_wr_reg() are called from both
> interrupt context (e.g. bcm_iproc_i2c_isr) and process context
> (e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be
> disabled to avoid potential deadlock. To prevent this scenario,
> use spin_lock_irqsave().
> 
> Fixes: 9a1038728037 ("i2c: iproc: add NIC I2C support")
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
