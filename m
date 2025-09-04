Return-Path: <linux-i2c+bounces-12669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3CB4499F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 00:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ED887BF6D5
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 22:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F05B2E9EC3;
	Thu,  4 Sep 2025 22:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZoXqXe0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689A28C5B8;
	Thu,  4 Sep 2025 22:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757024832; cv=none; b=RZO1jRx2wI5k9Sxr5xc4cB6jZnHTGe9oeHYI+mbUYfUVXdoTn4QIINVx9JJTxEV2KLHcO50g2HrJl/X0vvk8bLsrZxWs3mPrj3jNN6jHH9EF/4PdssTxLkxYDDf/qukcZGnZF1+Gs2mDnLgkZIyiVOA5y5kBULs/cauJ+VfhGKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757024832; c=relaxed/simple;
	bh=oVFCCDu4/NUS5PwO6Yv5Remnl9FIBctC4HHH9WIR9Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qe+vdEGczI52WtFLhwfrZ2x1ebSGhLj5sCjbXdqtr16RPRH5iCKCvo9ugD8pbPz9BP79GtrYTVhcWsAbEpQ5L/Y46T8ONLHmJQM0nwyFa6hcBXAJzoc/VKZa+NkicTc51Lx47Jj5ZCAuDcO+Q68qllu+2QVqs8H0ak9jQbeQM2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZoXqXe0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D02C4CEF4;
	Thu,  4 Sep 2025 22:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757024831;
	bh=oVFCCDu4/NUS5PwO6Yv5Remnl9FIBctC4HHH9WIR9Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZoXqXe0xIniwXdRz9wiuHBicZCIKr+RWLQdWbZpXS68zFxYfW+vBOodNVcFZbRVn
	 FA5vfykKCfywZnIn5pH+NCgeTHkXY54wcKGYZ6THBsn7rxFksx2tr1WQ3XIsPc7ba9
	 vs9M1WqJewelusYcDEwgL5L2jVB8t3SO6H/XjtcBGt/WLob/OXaU96KXwtjquCl3sX
	 2qP8fU9b+6J1SDf5iu2/N1JJeHoJFmuHCEy/bt/RHTltMvwPOBO7VD5dXFSVILWg4o
	 +2IC9d54qenOJjvlQXlEGgzCm9EbAySEoMjGvwc2zRpyYnllQUG/vMk9znXflqVIQ0
	 teg/A8K9gMq9Q==
Date: Fri, 5 Sep 2025 00:27:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_msavaliy@quicinc.com, 
	quic_vdadhani@quicinc.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com, kathiravan.thirumoorthy@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] i2c: qcom-geni: add OPP table support
Message-ID: <iixfu6y43vh4ymgqbpo72oooowyxmbpz7wprfkkei67jutkj4d@dbinauujzapx>
References: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
 <20250903080948.3898671-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903080948.3898671-2-quic_mmanikan@quicinc.com>

Hi Manikanta,

...

> @@ -814,6 +817,24 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  
> +	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");

/&pdev->dev/dev/

> +	if (ret)
> +		return ret;
> +
> +	/* OPP table is optional */
> +	ret = devm_pm_opp_of_add_table(dev);
> +	if (!ret) {
> +		opp = dev_pm_opp_find_freq_floor(dev, &freq);
> +		if (IS_ERR(opp))
> +			return dev_err_probe(dev, PTR_ERR(opp), "failed to find the frequency\n");
> +		dev_pm_opp_put(opp);
> +		ret = dev_pm_opp_set_rate(dev, freq);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to set the rate=%ld\n", freq);

%lu

Thanks,
Andi

> +	} else if (ret && ret != -ENODEV) {

