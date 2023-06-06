Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436FA724CF9
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 21:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238952AbjFFTZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 15:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239224AbjFFTY6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 15:24:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE4FE78;
        Tue,  6 Jun 2023 12:24:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C11763762;
        Tue,  6 Jun 2023 19:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4FFC433D2;
        Tue,  6 Jun 2023 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686079496;
        bh=7IVqUea4CeAvBJ0YJiBaoz5mK2aLV5XBqtStm4tszvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SebT49CAW+GApBH75WCqelppL8SJDA+b9FdjSRbsLAr1MGNCsf83PKrNzprrXB2ag
         ErGKWPOhc478ioO+28QAKv8MzYfq0OPmAzaVAByZzdA58E5zbO1Nu9XJRZ+vhk4Vbp
         byQamSnPhawNZczIhIFX6tF1+tfKWBFm8WBYI0sOfnaLQfzrkUBCsqafBm67zbf5G2
         K7caYi/olKBzb53/uRCBOmCoGCLf9AuLZbU1cFWLEZIYMJIFVdeKnoo9Rg99r9btjg
         HTPNlnkSaZWXXY/sGmTEWImLmEaIX0SSSsEo+ISrDnC5PIYKhMTHUcGt0ndkbV5hWT
         94oj4Z2y74JnA==
Date:   Tue, 6 Jun 2023 21:24:53 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>, Marek Vasut <marex@denx.de>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Message-ID: <20230606192453.zjzz4kt76kus5hr5@intel.intel>
References: <20230606182558.1301413-1-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606182558.1301413-1-robert.hancock@calian.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Robert,

On Tue, Jun 06, 2023 at 12:25:58PM -0600, Robert Hancock wrote:
> In xiic_process, it is possible that error events such as arbitration
> lost or TX error can be raised in conjunction with other interrupt flags
> such as TX FIFO empty or bus not busy. Error events result in the
> controller being reset and the error returned to the calling request,
> but the function could potentially try to keep handling the other
> events, such as by writing more messages into the TX FIFO. Since the
> transaction has already failed, this is not helpful and will just cause
> issues.

what kind of issues?

> This problem has been present ever since:
> 
> commit 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")
> 
> which allowed non-error events to be handled after errors, but became
> more obvious after:
> 
> commit 743e227a8959 ("i2c: xiic: Defer xiic_wakeup() and
> __xiic_start_xfer() in xiic_process()")
> 
> which reworked the code to add a WARN_ON which triggers if both the
> xfer_more and wakeup_req flags were set, since this combination is
> not supposed to happen, but was occurring in this scenario.
> 
> Skip further interrupt handling after error flags are detected to avoid
> this problem.
> 
> Fixes: 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>

please add:

Cc: <stable@vger.kernel.org> # v4.3+

> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 8a3d9817cb41..ee6edc963dea 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -721,6 +721,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>  			wakeup_req = 1;
>  			wakeup_code = STATE_ERROR;
>  		}
> +		/* don't try to handle other events */
> +		goto out;

why don't we have goto's after every irq evaluation but only
here? Do the issues you mentioned happen olny in this particular
error case?

Thanks,
Andi

>  	}
>  	if (pend & XIIC_INTR_RX_FULL_MASK) {
>  		/* Receive register/FIFO is full */
> -- 
> 2.40.1
> 
