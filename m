Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA267321E4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 23:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjFOVsd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 17:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjFOVsc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 17:48:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199E62967
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 14:48:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7605C62024
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 21:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AC5C433C8;
        Thu, 15 Jun 2023 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686865710;
        bh=ZLsxqu40sFdgx2lc7EINwwz6HDG7NWxcVCBg1AkhAZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nxd6MxoDmqF5oS4SVOLGQWq9A6x1cmCmbcsWCBTDVZ4JaBrsSRPsbZ/0J4RX+iK5D
         8i5JihjzSv0sZTcR9tttVBWThBsfeqN8h4XpbQbjWxRdlKDMklC7G5hkD0C/uIc+sp
         Ic0kblVi7zMKA9clNynDZPcMFcfn8fj1YonFgxAFwIca5hEfYJ8u2R/RsqNFvmKVQM
         tjT/jyoSw34Dbyq+Yii5q/3TrRp2NQo6H6CSQpwAKZOQrx6kTKo+222oYLsKbE/mvE
         yLo/CfmabGA/eUwEYau7FHj9gJt9AyOWe3kpQaORYb1GFq54O5KNxjeFXiVMCk6ayA
         puQEOG74aKWCw==
Date:   Thu, 15 Jun 2023 23:48:27 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
Message-ID: <20230615214827.otn6swsjqsexo4fn@intel.intel>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sat, Mar 04, 2023 at 10:36:34PM +0100, Heiner Kallweit wrote:
> Here we don't have to write SMBHSTCNT in each iteration of the loop.
> Bit SMBHSTCNT_START is internally cleared immediately, therefore
> we don't have to touch the value of SMBHSTCNT until the last byte.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
