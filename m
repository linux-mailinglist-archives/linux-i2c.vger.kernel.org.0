Return-Path: <linux-i2c+bounces-7113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D698B2A1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 05:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C22541F21C84
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 03:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B963399B;
	Tue,  1 Oct 2024 03:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAM3nBIZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B4BA37;
	Tue,  1 Oct 2024 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727752061; cv=none; b=fF4deUxSyw2Knlxf68kt6QAeVEml+Xxk/vqfUd6/cEs8DRhH9dS5An1hYvtMY4Wz6qodP5M4iIvnA6V36fT8WcwqRIyrdO6dxbLfPjboETCqTPvYG0EIYWUvtWN/CBfnhnIC9r0xY2a90dn2rLbxOMqi2Z44tSRLRRLGQxVlo+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727752061; c=relaxed/simple;
	bh=mNHPdRqg/4mwSqNhflir0XPmZIRI5Ne46CWR9Gy6bK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPAvxzVKonWPHmkNERRrXXXPMsy0EmA6rHtjM3nhXTO/IajhJzCP97h7ycpgkEkyaddJ11rBfRFO5j6M9HjStI8M8BMHwdIf25OKXH0n1VuuaQYyQsp4Aarshd7PRbcYYPfTB0O23djmom+Nby4t6B112eLNaBbWjUKGcS3/6xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAM3nBIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE0AC4CEC7;
	Tue,  1 Oct 2024 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727752059;
	bh=mNHPdRqg/4mwSqNhflir0XPmZIRI5Ne46CWR9Gy6bK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VAM3nBIZ9hGwJAXAmUUv4/S47GAqFsZsW0xyCphyuGxL+23PnCByGOIiTauj/Umgv
	 e+d36fLlgWRRTO4kDwdeG4L76UJ04SDRyBFh2IUkwiQrxFmW0RLwYgTkTWFK3Fbspl
	 2w5DVifxqn+B/x0uo27vfMZ5EypALKfcyo9z5aqca4YEuOnbvSMPUKp6njgPrOMmFX
	 W/Pt6Igvoe6eZV62cSLKX20QZpcY6ZjhRQ7UEWtIavMDCtG6J9AHAJmPBrdHr3H+9y
	 3f3Z0JV7DtCKMi57595EKFn0vEYsEDN9E2AqRg8LmVFu9laF/nYuzSeOoKYIybpYtH
	 AYOM0Fbm4RLNA==
Date: Mon, 30 Sep 2024 22:07:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH v3 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
Message-ID: <72we2tesj5whmfgo3yc4mdta6lasu4v4ll74pmvysaxnwaf4tv@zqanlhy3jgsv>
References: <20240930144709.1222766-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930144709.1222766-1-quic_mmanikan@quicinc.com>

On Mon, Sep 30, 2024 at 08:17:09PM GMT, Manikanta Mylavarapu wrote:
> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
> 
> The existing map table is based on 19.2MHz. This patch incorporates
> the clock map table to derive the SCL clock from the 32MHz source
> clock frequency.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
> Changes in v3:
> 	- Updated geni_i2c_clk_map_32mhz array values
> 	- Added sentinel value to both 19.2MHz, 32MHz clk map arrays
> 	- Updated loop termination condition based on sentinel value
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 212336f724a6..579c01686823 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -16,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/qcom/geni-se.h>
>  #include <linux/spinlock.h>
> +#include <linux/units.h>
>  
>  #define SE_I2C_TX_TRANS_LEN		0x26c
>  #define SE_I2C_RX_TRANS_LEN		0x270
> @@ -146,22 +147,36 @@ struct geni_i2c_clk_fld {
>   * clk_freq_out = t / t_cycle
>   * source_clock = 19.2 MHz
>   */
> -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>  	{KHZ(100), 7, 10, 11, 26},
>  	{KHZ(400), 2,  5, 12, 24},
>  	{KHZ(1000), 1, 3,  9, 18},
> +	{},

For future reference, the reason to leave a trailing ',' is so that one
can add another line in the array without touching the previous last
entry. This will of course never happen when that is a sentinel.

Unless Andi insist, I don't think it's worth resubmitting the patch for
this, but now you know.

Regards,
Bjorn

> +};
> +
> +/* source_clock = 32 MHz */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> +	{KHZ(100), 8, 14, 18, 40},
> +	{KHZ(400), 4,  3, 11, 20},
> +	{KHZ(1000), 2, 3,  6, 15},
> +	{},
>  };
>  
>  static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>  {
> -	int i;
> -	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
> +	const struct geni_i2c_clk_fld *itr;
> +
> +	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
> +		itr = geni_i2c_clk_map_32mhz;
> +	else
> +		itr = geni_i2c_clk_map_19p2mhz;
>  
> -	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
> +	while (itr->clk_freq_out != 0) {
>  		if (itr->clk_freq_out == gi2c->clk_freq_out) {
>  			gi2c->clk_fld = itr;
>  			return 0;
>  		}
> +		itr++;
>  	}
>  	return -EINVAL;
>  }
> -- 
> 2.34.1
> 
> 

