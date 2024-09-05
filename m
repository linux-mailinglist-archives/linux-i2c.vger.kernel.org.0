Return-Path: <linux-i2c+bounces-6274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398796E37B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6150E1C24572
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 19:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FD81953A9;
	Thu,  5 Sep 2024 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMNGR/Wv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4E1A2566;
	Thu,  5 Sep 2024 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725565785; cv=none; b=EPG5Q5GM2Us0wZoRNHqT6XXaYNzfuLQdwIogZSBx44C49yHPxq/Ya4Mv3WSCeJ7O5IKrte6c7CkwqqUkUEzwS7UNXId6wdxbD/SE6PvzV/duJkit0NYre8Gg+pVbFFOjU4pfekmOplxlsVDcm9eZq4w/Y4ZiroIiCoDxsqKxfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725565785; c=relaxed/simple;
	bh=g++tlSmFgkUcGXn5wSV2RC0cbFRDfnVvSQTJtE59uHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9xtWb+MBCPLVY59xRad+qNsS6OjuYe4Z+8oXCIUfSSq5/Go5ytg42IV7TCj/eCiuR41qgiFTnRLSEVSXUqq95skCTtwTypuWtdGdI4KIx09m4epfzRIJAR1AS3aMqkmgFYlUYuw0RXZpx++Bd9Jk9ayd8VBCXyUdVtzrKMWwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMNGR/Wv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B1FC4CEC3;
	Thu,  5 Sep 2024 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725565785;
	bh=g++tlSmFgkUcGXn5wSV2RC0cbFRDfnVvSQTJtE59uHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMNGR/Wveojllz63Q9LpvBEiR2sC5FqSAVMQtKrvZenAbpZe/7blxQ1NacbgW4y/n
	 bS880vKyuqmDQQmQP8fhMUQU8uXvJFQi+GJOeOFyT5PsVOFRBf/XaQnx5uvnLd8kBn
	 aVybT00ru55mwTs5JbkXiGHqt9i59jHHUvPGQnR0g5BTbi9z42T3Pju+cNUP4QelY8
	 foW6442Nnz9LedUu7koNSp7E+wKRgj27S7Vts/4PxEcO9F8lk48maDMOLDDAlm/sbM
	 R6TuFfXZ2C+eGEG2nxxCffMpF05o+H21cdgOkMSrVJKntV6Y4j9jGnl96ISsbIN8wt
	 xmnO17SjdSfiQ==
Date: Thu, 5 Sep 2024 21:49:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: kimriver liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabledg
Message-ID: <yc43jizchnn4johokgc2xyr2g4yyxf4strt6vvtzye6zzor46r@dvgqo4k6q437>
References: <20240905074211.2278-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905074211.2278-1-kimriver.liu@siengine.com>

Hi Kimriver,

On Thu, Sep 05, 2024 at 03:42:11PM GMT, kimriver liu wrote:
> From: "kimriver.liu" <kimriver.liu@siengine.com>

Is there any reason to have "kimriver.liu" instead of "Kimriver
Liu"?

> Failure in normal Stop operational path
> 
> This failure happens rarely and is hard to reproduce. Debug trace
> showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> immediately disable ENABLE bit that can result in
> IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.
> 
> Failure in ENABLE bit is disabled path
> 
> It was observed that master is holding SCL low and the IC_ENABLE is
> already disabled, Enable ABORT bit and ENABLE bit simultaneously
> cannot take effect.
> 
> Check if the master is holding SCL low after ENABLE bit is already
> disabled. If SCL is held low, The software can set this ABORT bit only
> when ENABLE is already set，otherwise,
> the controller ignores any write to ABORT bit. When the abort is done,
> then proceed with disabling the controller.
> 
> These kernel logs show up whenever an I2C transaction is attempted
> after this failure.
> i2c_designware e95e0000.i2c: timeout in disabling adapter
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> 
> The patch can be fix the controller cannot be disabled while SCL is
> held low in ENABLE bit is already disabled.

I'm sorry, but this commit log is difficult to understand. Could
you please polish it, fix the grammar and the punctuation and
make it more understandable?

> Signed-off-by: kimriver.liu <kimriver.liu@siengine.com>

As I said above, would be nicer to have "Kimriver Liu" rather
than "kimriver.liu".

I'm wondering if we need the Fixes: tag here. If this is not a
frequent issue then we can probably omit it.

> ---

Andy already pointed out that you are missing versioning (is this
v2? v3?) and changelog.

>  drivers/i2c/busses/i2c-designware-common.c | 12 +++++++++++
>  drivers/i2c/busses/i2c-designware-master.c | 23 +++++++++++++++++++++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e8a688d04aee..54acf8554582 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -453,6 +453,18 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  
>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>  	if (abort_needed) {
> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> +			enable |= DW_IC_ENABLE_ENABLE;
> +
> +			/*
> +			 * Wait two ic_clk delay when enabling the i2c to ensure ENABLE bit
> +			 * is already set by the driver (for 400KHz this is 25us)
> +			 * as described in the DesignWare I2C databook.
> +			 */
> +			fsleep(25);
> +		}
> +
>  		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
>  		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
>  					       !(enable & DW_IC_ENABLE_ABORT), 10,
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7e56002809a..aba0b8fdfe9a 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -253,6 +253,26 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>  	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
>  }
>  
> +static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
> +{
> +	u32 status;
> +	int ret;
> +
> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> +		return true;
> +
> +	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +			1100, 20000);
> +	if (ret) {
> +		dev_err(dev->dev, "i2c master controller not idle %d\n", ret);

Please be a bit more descriptive. It's not an error for the i2c
master not to be idle, it is if you try to disable the adapter.

Besides, it makes sense to me that this print is done in the
i2c_dw_xfer function rather than here. The task of this function
is only to check whether the controller is idling or active.

> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
>  {
>  	u32 val;
> @@ -796,7 +816,8 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	 * additional interrupts are a hardware bug or this driver doesn't
>  	 * handle them correctly yet.
>  	 */

Please update the comment according to your change.

> -	__i2c_dw_disable_nowait(dev);
> +	if (i2c_dw_is_master_idling(dev))

Please print the error message here.

Thanks for your patch,
Andi

> +		__i2c_dw_disable_nowait(dev);
>  
>  	if (dev->msg_err) {
>  		ret = dev->msg_err;
> -- 
> 2.17.1
> 

