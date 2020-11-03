Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74562A3CBA
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 07:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgKCGTB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 01:19:01 -0500
Received: from linux.microsoft.com ([13.77.154.182]:44332 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgKCGTB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 01:19:01 -0500
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id DB6A720B4905; Mon,  2 Nov 2020 22:19:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DB6A720B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1604384340;
        bh=X9lFGosu3QcpQzLmb7H585ZauROPTXXamq5Y69jOqOk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XfXTmyXyE6+3VQyaMk/Mgb3TYvr4GsYLY0xaDUbDjTx+iiU3WSCN2BSgP6X1PE5M1
         FoxtbFpnuT0Tn34V9NJbxGSY+10ELbIQ80GWLDhKXzLVo9RRNf9fwtxoHKdJfwJIiX
         Sz54WgIUlExFovaf7+coOQV+HEOIhZpVSfqcSLbI=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     rayagonda.kokatanur@broadcom.com
Cc:     andriy.shevchenko@linux.intel.com,
        bcm-kernel-feedback-list@broadcom.com, brendanhiggins@google.com,
        dphadke@linux.microsoft.com, f.fainelli@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, lori.hikichi@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org
Subject: [PATCH v3 5/6] i2c: iproc: handle master read request
Date:   Mon,  2 Nov 2020 22:19:00 -0800
Message-Id: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
References: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon,  2 Nov 2020 09:24:32 +0530, Rayagonda Kokatanur wrote:

> Handle single or multi byte master read request with or without
> repeated start.
> 
> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 215 +++++++++++++++++++++++------
>  1 file changed, 170 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 7a235f9f5884..22e04055b447 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -160,6 +160,11 @@
>  
>  #define IE_S_ALL_INTERRUPT_SHIFT     21
>  #define IE_S_ALL_INTERRUPT_MASK      0x3f
> +/*
> + * It takes ~18us to reading 10bytes of data, hence to keep tasklet
> + * running for less time, max slave read per tasklet is set to 10 bytes.
> + */
> +#define MAX_SLAVE_RX_PER_INT         10
>  

In patch [3/6], you've enabled IS_S_RX_THLD_SHIFT in slave ISR bitmask,
however it's not actually used in processing rx events.

Instead of hardcoding this threshold here, it's better to add a
device-tree knob for rx threshold, program it in controller and handle
that RX_THLD interrupt. This will give more flexibility to drain the rx
fifo earlier than -
(1) waiting for FIFO_FULL interrupt for transactions > 64B.
(2) waiting for start of read transaction in case of master write-read.

Regards,
Dhananjay

