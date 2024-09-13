Return-Path: <linux-i2c+bounces-6685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97574977CB5
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 11:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198C91F280C5
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 09:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408521D7E22;
	Fri, 13 Sep 2024 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fh4U1j72"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B21D7996;
	Fri, 13 Sep 2024 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726221490; cv=none; b=az8TOZlTxLEPS/AAOjeKgblwSY9jIOsvBa/7QCB9USzX/kI3uPe5or3OaiH6W29475Fv7pFGCdr8/MzgICPWPePgoQ9zj5KX06G7PLzX1ONE7UY4YsEW1zqSnLhv/Rhs3ao0NzqYisqj+J4ip0/oYeD+ITHukG3NtsRSbYkFycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726221490; c=relaxed/simple;
	bh=HanVdQ3GXu4NQw/7dHBHiUdg2xgexKKr51jP7VU/oZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFU6xqj4genjjtrROtuVTygrj3fTT6kdz/pmt5DugZEtafuDrMg/MS1uWbR+DH2g3bi+iNQ1KAi/6Qiro0wgtenPhG7xqkg+bg2DYnMBNYzy6uUoUzdH5pkurskHAtJYQJMi+ACUY2JkARldoswA4IVgSoQ0ARdhu+3s0diQzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fh4U1j72; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B56F99FF;
	Fri, 13 Sep 2024 11:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726221406;
	bh=HanVdQ3GXu4NQw/7dHBHiUdg2xgexKKr51jP7VU/oZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fh4U1j72RfNBfhTB8bNqGQEHKFu+9XlBk/Lag3lKMRQZ7f2V6CYeha1KO2tpMWAy7
	 nvtZGX58P9Syuqmae23h+UgaoSf/NEIaVmd0UHySd6ZofpS0seSkdXVV906NzAs4U6
	 6Ksrn8QAifLg0+OqD1YxhLfSFoWWaZAhX+tCFZIE=
Date: Fri, 13 Sep 2024 12:57:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v3 2/2] pca954x: Reset if channel select fails
Message-ID: <20240913095730.GD21327@pendragon.ideasonboard.com>
References: <DB6PR07MB35097CC094E6995B2F66A17A9D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB6PR07MB35097CC094E6995B2F66A17A9D652@DB6PR07MB3509.eurprd07.prod.outlook.com>

Hi Wojciech,

Thank you for the patch.

On Fri, Sep 13, 2024 at 06:51:16AM +0000, Wojciech Siudy (Nokia) wrote:
> From: Wojciech Siudy <wojciech.siudy@nokia.com>
> 
> If the channel selection or deselection times out, it indicates
> a failure in the mux's I2C subsystem. Without sending a reset pulse,
> a power-on-reset of the entire device would be required to restore
> communication.
> 
> The datasheet specifies a minimum hold time of 4 ns for the reset
> pulse, but due to the path's capacitance and the mux having its own
> clock, it is recommended to extend this to approximately 1 us.
> 
> This option can be enabled using the i2c-mux-timeout-reset property
> in the device tree and should only be used if the reset line is not
> shared with other devices.
> 
> Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
> ---
> Changelog:
> v2:
>   * Removed mail header from the commit log
>   * Decreased reset pulse hold time from 10 to 1 ms
> v3:
>   * Make this functionality enabled by appropriate property in
>     devicetree
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 48 ++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 6f84018258c4..c9ac0f9c9408 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -110,6 +110,7 @@ struct pca954x {
>  	u8 last_chan;		/* last register value */
>  	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
>  	s32 idle_state;
> +	u8 timeout_reset;
>  
>  	struct i2c_client *client;
>  
> @@ -316,6 +317,30 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan)
>  		return 1 << chan;
>  }
>  
> +static void pca954x_reset_deassert(struct pca954x *data)
> +{
> +	if (data->reset_cont)
> +		reset_control_deassert(data->reset_cont);
> +	else
> +		gpiod_set_value_cansleep(data->reset_gpio, 0);
> +}
> +
> +static void pca954x_reset_assert(struct pca954x *data)
> +{
> +	if (data->reset_cont)
> +		reset_control_assert(data->reset_cont);
> +	else
> +		gpiod_set_value_cansleep(data->reset_gpio, 1);
> +}
> +
> +static void pca954x_reset_mux(struct pca954x *data)
> +{
> +	dev_warn(&data->client->dev, "resetting the device\n");
> +	pca954x_reset_assert(data);
> +	udelay(1);
> +	pca954x_reset_deassert(data);
> +}
> +
>  static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  {
>  	struct pca954x *data = i2c_mux_priv(muxc);
> @@ -329,6 +354,8 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  		ret = pca954x_reg_write(muxc->parent, client, regval);
>  		data->last_chan = ret < 0 ? 0 : regval;
>  	}
> +	if (ret == -ETIMEDOUT && (data->reset_cont || data->reset_gpio))
> +		pca954x_reset_mux(data);
>  
>  	return ret;
>  }
> @@ -338,6 +365,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
>  	struct pca954x *data = i2c_mux_priv(muxc);
>  	struct i2c_client *client = data->client;
>  	s32 idle_state;
> +	int ret = 0;
>  
>  	idle_state = READ_ONCE(data->idle_state);
>  	if (idle_state >= 0)
> @@ -347,13 +375,14 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
>  	if (idle_state == MUX_IDLE_DISCONNECT) {
>  		/* Deselect active channel */
>  		data->last_chan = 0;
> -		return pca954x_reg_write(muxc->parent, client,
> -					 data->last_chan);
> +		ret = pca954x_reg_write(muxc->parent, client, data->last_chan);
> +		if (ret == -ETIMEDOUT && (data->reset_cont || data->reset_gpio))
> +			pca954x_reset_mux(data);
>  	}
>  
>  	/* otherwise leave as-is */
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static ssize_t idle_state_show(struct device *dev,
> @@ -543,14 +572,6 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
>  	return 0;
>  }
>  
> -static void pca954x_reset_deassert(struct pca954x *data)
> -{
> -	if (data->reset_cont)
> -		reset_control_deassert(data->reset_cont);
> -	else
> -		gpiod_set_value_cansleep(data->reset_gpio, 0);
> -}
> -
>  /*
>   * I2C init/probing/exit functions
>   */
> @@ -625,6 +646,11 @@ static int pca954x_probe(struct i2c_client *client)
>  			data->idle_state = MUX_IDLE_DISCONNECT;
>  	}
>  
> +	if (device_property_read_bool(dev, "i2c-mux-timeout-reset"))
> +		data->timeout_reset = 1;
> +	else
> +		data->timeout_reset = 0;

timeout_reset is set but never used. Am I missing something ?

> +
>  	/*
>  	 * Write the mux register at addr to verify
>  	 * that the mux is in fact present. This also
-- 
Regards,

Laurent Pinchart

