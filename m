Return-Path: <linux-i2c+bounces-7167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7D698CF69
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F63287DAB
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9489D198841;
	Wed,  2 Oct 2024 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9qFAabO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454861974F4;
	Wed,  2 Oct 2024 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859700; cv=none; b=h2my5XH/jS4vRVCZY7L9A6iv5rCsU5P3MQQ4A2EUg1mPzaxzhO+4EDrMQ6WIyKl0tS+QpC34HSn7NnZHf787aBGI8dcONTOALt2oNNupihE3uXlYb4SY85HmqpHWvsQtNjb15+Gf44Vv2JCA3b8htsxEqozhLdbVhLhtH17Nheg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859700; c=relaxed/simple;
	bh=mR5J9T5uoBBmVi3EDAObOyv9gRAIIYVNiN9Sy4dHNrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iehtDCzOMRztvPY9HRkpkBQm3NiEFhgv8u8/hOvMcRO/sjN2L5iOyAljmw7fH3y9N2DN1W/ZdaAe7jKuhmMDOUEpQpRm8za/uQZggVrieggKA9AlBoIo/KbICuK+zkVwPzs3LxOtL0P8HBXi+HzO/N4NDcWFfuwRPx3LZgkJ+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9qFAabO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B66C4CECE;
	Wed,  2 Oct 2024 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727859700;
	bh=mR5J9T5uoBBmVi3EDAObOyv9gRAIIYVNiN9Sy4dHNrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9qFAabO4cO/uh0xZgskd8qYjLDy2btR8qn+GJI6gPYuTz0Ol9p5WU34OCCssuRHq
	 9efPvqpGrd88BHiL5p7g2CGCwMyhIYBZRG6klJLOxkhhGIKkPkNo/UGh5wVFCMGVXj
	 aL5q9l6HU7+N4gjYnzI341RBsV0+aYZprH13Aj1WkVZ7aQK/KjEx3famFJAlfYwx1v
	 7ldxun44tCKac/XiyHDMeRgaBrB7hiTLFuBHI6F84qY/ebxbDnQ2+lp8KIU4uHYMD2
	 SCNZ2EKV5FE+isBdZ1ojPX3wLl1qyC3cvlwmC8IjWiqkPR5b3BncT/b5rTqMok+AiL
	 MPHTscxWr4svw==
Date: Wed, 2 Oct 2024 11:01:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v3 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
Message-ID: <gntoyxafts5vwaqn4oqhsqr5gze3x6aj2dccm7thssetubmj62@hrmkxvxfe537>
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

Hi Manikanta,

On Mon, Sep 30, 2024 at 08:17:09PM GMT, Manikanta Mylavarapu wrote:
> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
> 
> The existing map table is based on 19.2MHz. This patch incorporates
> the clock map table to derive the SCL clock from the 32MHz source
> clock frequency.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

merged to i2c/i2c-host.

...

> -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>  	{KHZ(100), 7, 10, 11, 26},
>  	{KHZ(400), 2,  5, 12, 24},
>  	{KHZ(1000), 1, 3,  9, 18},
> +	{},
> +};
> +
> +/* source_clock = 32 MHz */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> +	{KHZ(100), 8, 14, 18, 40},
> +	{KHZ(400), 4,  3, 11, 20},
> +	{KHZ(1000), 2, 3,  6, 15},
> +	{},

I took the freedom to remove the ',' as Bjorn suggested.

Thanks,
Andi

