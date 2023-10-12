Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B737C70F0
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 17:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379132AbjJLPGW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 11:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346441AbjJLPGV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 11:06:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A63F90;
        Thu, 12 Oct 2023 08:06:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A4C433C7;
        Thu, 12 Oct 2023 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697123180;
        bh=wY9MRkbEMq3vjjbxC2RGfewmVTqD295er3X/G+uewSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tcWh7mvVxsBYPlGQ76SDWlwQMMhmJvDdc2TceFhV4Lf34p9bJTEseEpPmyCTLUNyA
         F/+dX6WV6q0G/Yj6yh0cRbRVMtQxPhN2EopKYJ6ybEJaI3hHQTk3BXRdX1kwznT45v
         Bb8D/MCgslpVXvZHM0g0Fzjee9LcX1cXDLznCPHB6SUkCb5VKgkBvRHAAvfrSiBXy1
         HK6ef4eb0e7vVfWSANSNLmXVmSiRxyS3lmSzjSa1fQcihUX4KFb3R1WC8thXWuqZQB
         Ib7pHN69jP8BdVpa2AzuOPxqSXUjIv/Rx49iKq9UfO64XgPt5QHgq5Vzil8vzWlXJ0
         HtPgLQ6z9J0zQ==
Date:   Thu, 12 Oct 2023 17:06:16 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, stable@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: stm32f7: Fix PEC handling in case of SMBUS
 transfers
Message-ID: <20231012150616.n6gpovgb6qsg5d7e@zenone.zhora.eu>
References: <20231010084455.1718830-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010084455.1718830-1-alain.volmat@foss.st.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain,

On Tue, Oct 10, 2023 at 10:44:54AM +0200, Alain Volmat wrote:
> In case of SMBUS byte read with PEC enabled, the whole transfer
> is split into two commands.  A first write command, followed by
> a read command.  The write command does not have any PEC byte
> and a PEC byte is appended at the end of the read command.
> (cf Read byte protocol with PEC in SMBUS specification)
> 
> Within the STM32 I2C controller, handling (either sending
> or receiving) of the PEC byte is done via the PECBYTE bit in
> register CR2.
> 
> Currently, the PECBYTE is set at the beginning of a transfer,
> which lead to sending a PEC byte at the end of the write command
> (hence losing the real last byte), and also does not check the
> PEC byte received during the read command.
> 
> This patch corrects the function stm32f7_i2c_smbus_xfer_msg
> in order to only set the PECBYTE during the read command.

Thanks for improving the log.

> Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols support")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

As this is a fix you should have also included and Cc'ed:

Cc: <stable@vger.kernel.org> # v4.18+

No need to resend.

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
