Return-Path: <linux-i2c+bounces-14285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA20C8ABA6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 16:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 849F13A6B1C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 15:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142AC33BBA0;
	Wed, 26 Nov 2025 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuiST38E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DE1FC7C5;
	Wed, 26 Nov 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172029; cv=none; b=hL2z8valUwwLZ4eCgcIEWpIx0WqycEpD2BaNKqLJPetLABAUHCUJ+1WnoobCFVU/luEKqL0MZH3DOagPGUF8blZJc+9b5bG2FXu+V/A/Rt6SWhGIHbPA/+fqwLQvS9iypn6/ZXpPXIjvcyMESi331Bbb0gIHBeNsviFFEA21+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172029; c=relaxed/simple;
	bh=DUZirXcwc71Z+jIStyr86QpnCJLfkISWi1F3mf2tlFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DT/P802NhjjFKIhqcyzmJe7AN1j97LJJyrB680LGn8FMf7PXthSnNK897qmvJc42I38akNP/RzhW4LI31yy0dUoEkbR2IS6BA2Z/gAxumr8uVs7PzlYhBQ+dMI8UJhUdhaJjLb7es9hhnsWKgAsuhIfD1I63sIFOBc1UgMUiY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuiST38E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A630C4CEF7;
	Wed, 26 Nov 2025 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172029;
	bh=DUZirXcwc71Z+jIStyr86QpnCJLfkISWi1F3mf2tlFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuiST38EgaBds+eRYUE5ppHAdvIvOu3T9UgkcRaCE0S5BtIkK2BJXA2coxyDl0qGk
	 ELowJCjvNi3ZXT7sa+ljCLGtXRrg6/DGy4bwujtqxSf+K1HSnj0tHF0l+eoKHZMJwC
	 NneMrqaT+ERLHBrrg6tpHCvud/3eNe99tpZeXZWZOgwUZlbD0DlacyxBvHZpm63rzx
	 U96ABKRB3gXcglDCjqtp4P3Y7BWA4aPwIfVY51UJou33mrqzIIMVFbJ1/7M4fUYzHn
	 /r2aI/XC/KSmG/yDmN1ngJgyJ6vq6K6loMq0NOZOH0TpNU3kWXeUC+Qn4ndDYY40R1
	 n6mLZa/XGloXg==
Date: Wed, 26 Nov 2025 09:52:38 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v1 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
Message-ID: <4kjkadmhf67ts4pryhvqdk57b2k27ggwkt2vqdijvhmwygpspb@rpdwcpxpq2up>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-13-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-13-praveen.talari@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 10:30:18AM +0530, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages I2C frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate..
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a0f68fdd4078..78154879f02d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -82,6 +82,9 @@ struct geni_i2c_desc {
>  	char *icc_ddr;
>  	bool no_dma_support;
>  	unsigned int tx_fifo_depth;
> +	int (*resources_init)(struct geni_se *se);
> +	int (*set_rate)(struct geni_se *se, unsigned long freq);
> +	int (*power_state)(struct geni_se *se, bool state);

You have isolated this quite nicely now, so I'd prefer 3 (four to keep
power on/off separate) if statements, over these function pointers, at
this point.

This saves the future reader from having to remember the combination of
function pointer targets in the various cases - and allow things like
"jump to definition" in your editor to still work.

>  };
>  
>  #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
> @@ -203,8 +206,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>  	return -EINVAL;
>  }
>  
> -static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
> +static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)

This sounds like a qcom_geni_i2c_set_rate() now that it takes a
frequency argument.

Regards,
Bjorn

>  {
> +	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>  	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>  	u32 val;
>  
> @@ -217,6 +221,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>  	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
>  	val |= itr->t_cycle_cnt;
>  	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
> +	return 0;
>  }
>  
>  static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
> @@ -908,7 +913,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  		return ret;
>  	}
>  
> -	qcom_geni_i2c_conf(gi2c);
> +	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
> +	if (ret)
> +		return ret;
>  
>  	if (gi2c->gpi_mode)
>  		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
> @@ -1041,8 +1048,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  	return ret;
>  }
>  
> -static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
> +static int geni_i2c_resources_init(struct geni_se *se)
>  {
> +	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>  	int ret;
>  
>  	ret = geni_se_resources_init(&gi2c->se);
> @@ -1095,7 +1103,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
>  
> -	ret = geni_i2c_resources_init(gi2c);
> +	ret = gi2c->dev_data->resources_init(&gi2c->se);
>  	if (ret)
>  		return ret;
>  
> @@ -1165,10 +1173,12 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  
>  	disable_irq(gi2c->irq);
>  
> -	ret = geni_se_resources_state(&gi2c->se, false);
> -	if (ret) {
> -		enable_irq(gi2c->irq);
> -		return ret;
> +	if (gi2c->dev_data->power_state) {
> +		ret = gi2c->dev_data->power_state(&gi2c->se, false);
> +		if (ret) {
> +			enable_irq(gi2c->irq);
> +			return ret;
> +		}
>  	}
>  
>  	gi2c->suspended = 1;
> @@ -1180,9 +1190,11 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> -	ret = geni_se_resources_state(&gi2c->se, true);
> -	if (ret)
> -		return ret;
> +	if (gi2c->dev_data->power_state) {
> +		ret = gi2c->dev_data->power_state(&gi2c->se, true);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	enable_irq(gi2c->irq);
>  	gi2c->suspended = 0;
> @@ -1221,6 +1233,9 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>  
>  static const struct geni_i2c_desc geni_i2c = {
>  	.icc_ddr = "qup-memory",
> +	.resources_init = geni_i2c_resources_init,
> +	.set_rate = qcom_geni_i2c_conf,
> +	.power_state = geni_se_resources_state,
>  };
>  
>  static const struct geni_i2c_desc i2c_master_hub = {
> @@ -1228,11 +1243,20 @@ static const struct geni_i2c_desc i2c_master_hub = {
>  	.icc_ddr = NULL,
>  	.no_dma_support = true,
>  	.tx_fifo_depth = 16,
> +	.resources_init = geni_i2c_resources_init,
> +	.set_rate = qcom_geni_i2c_conf,
> +	.power_state = geni_se_resources_state,
> +};
> +
> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
> +	.resources_init = geni_se_domain_attach,
> +	.set_rate = geni_se_set_perf_opp,
>  };
>  
>  static const struct of_device_id geni_i2c_dt_match[] = {
>  	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
>  	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
> +	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
> -- 
> 2.34.1
> 

