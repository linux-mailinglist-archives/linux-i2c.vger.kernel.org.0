Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD49B70F68F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 14:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbjEXMfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 08:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEXMfl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 08:35:41 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2F71B4;
        Wed, 24 May 2023 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684931719; x=1716467719;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cDUi7dMP4jWcg8AZDD0CYW+YYB1jCuGrGLccF6biMqg=;
  b=NEqU+MDXdhryxuP4Eqep7iTDiDRKbsQsjJ/PGH8arl50IPOG0Qh2wbqk
   D9mw61hnJ68oZGdy5ze5BtpKa0mh+crDLsnTPpi6bOnV/6wNUxjEQYTyn
   s44P0uVF989WF5W8eAkzj2vmpNYHyA+m7eu7DJs7kRuks0RmiyYZDeP6g
   AYDnfDTM6k0pSp+8IKYxFjDFDC0flYxXc/W2EAiX9cJ0pTwW4femCGXmP
   3Wwwro8n9RHHtNkic/tfBUYXgyqKi4XtPndENou8DHWOaiE0A95aaqxFl
   BWQPK14OUavveUrrjg5B/EK0z6BRkC4xzN5P+M9urz6Na6yZ1Hza8tDNE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="353572618"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="353572618"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 05:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034516581"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="1034516581"
Received: from mylly.fi.intel.com (HELO [10.237.72.160]) ([10.237.72.160])
  by fmsmga005.fm.intel.com with ESMTP; 24 May 2023 05:33:32 -0700
Message-ID: <bf392104-96b0-a85b-f68e-088bd3884d9a@linux.intel.com>
Date:   Wed, 24 May 2023 15:33:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v1] i2c: designware: Handle invalid SMBus block data
 response length
Content-Language: en-US
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20230523082118.10935-1-tamnguyenchi@os.amperecomputing.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230523082118.10935-1-tamnguyenchi@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/23/23 11:21, Tam Nguyen wrote:
> In I2C_FUNC_SMBUS_BLOCK_DATA case, the I2C Designware driver does not
> handle correctly when it receives the length of SMBus block data
> response from SMBus slave device, which is outside the range 1-32 bytes.
> Consequently, the I2C Designware bus is stuck and cannot recover.
> Because if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be detected
> from the registers, the controller can be disabled if the STOP bit is set.
> But it is only set after receiving block data response length.
> 
> Hence, to prevent the bus from stuck condition, after receiving the
> invalid block data response length, the driver will read another byte
> with STOP bit set.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 55ea91a63382..94dadd785ed0 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -527,8 +527,19 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>   
>   			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>   			/* Ensure length byte is a valid value */
> -			if (flags & I2C_M_RECV_LEN &&
> -			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
> +			if (flags & I2C_M_RECV_LEN) {
> +				/*
> +				 * if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be
> +				 * detected from the registers, the controller can be
> +				 * disabled if the STOP bit is set. But it is only set
> +				 * after receiving block data response length in
> +				 * I2C_FUNC_SMBUS_BLOCK_DATA case. That needs to read
> +				 * another byte with STOP bit set when the block data
> +				 * response length is invalid to complete the transaction.
> +				 */
> +				if ((tmp & DW_IC_DATA_CMD_DAT) > I2C_SMBUS_BLOCK_MAX || tmp == 0)
> +					tmp = 1;
> +
>   				len = i2c_dw_recv_len(dev, tmp);
>   			}
>   			*buf++ = tmp;

Looks otherwise good to me but I'm wondering the "tmp == 0" test can it 
have the bit 11 set (on a HW where it's supported) and should it be 
covered with DW_IC_DATA_CMD_DAT mask too? Please see commit f53f15ba5a85 
("i2c: designware: Get right data length").
