Return-Path: <linux-i2c+bounces-8280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7889DFADF
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 07:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93337281A69
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 06:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2A31F9412;
	Mon,  2 Dec 2024 06:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNwt8sVu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92631D63F9;
	Mon,  2 Dec 2024 06:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733122056; cv=none; b=pjgv2ObZktBF99tWHvTgINMFm5eIx2DMUkL5c1PftxDAIu70At64SGv5bqn7gexAJbEumYeXQSfmAS9YQAPHZKOJFR+nhOM92Ay2GpfMRBuxC3b0guDlI6PGSdW5VOfVOTg6YGsesALO9TGMjHu25HjxR5SlHKA+iHQ6bol15vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733122056; c=relaxed/simple;
	bh=z/cz3c3hFkz0Gio6sYD3YWpb3ggl8bL0o8oBCRF0WyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejlu6G2uTMqzPfOxThGGlkiWZUgYE7i7lDWKg+9mX6MD3KlYUDklKGELAMK6BmCebBk+qHRXmpfqFh8FrRV/40fa3g6R/JitE5h3LKhXn7u9hVQPtqcDMQmOcy8ZK+pZ31aeltHExcEMY7kSl9h1V5PwohCJ9YF+GL2xrZQ1cs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNwt8sVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3D0C4CED2;
	Mon,  2 Dec 2024 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733122056;
	bh=z/cz3c3hFkz0Gio6sYD3YWpb3ggl8bL0o8oBCRF0WyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNwt8sVuBb4Ch1NFUlkSsq7493tZMEqhNdM9CbkxwHbdxRbGM32XGRLSFWc64Pr+2
	 HGQfFVEZkEuk+r2BtDM+vEs5eOS7Awlc6orEdPEkiytiejeu/Y+BtIVy9LT3jSvpwm
	 +Guk1dbjVI+1ogloSRR1NezuVrSANj2uB575BEOtzJsiUQGSeuwpMojEvLYyl1HShC
	 3G15fCcaWZ26Ia4kV3seizrUX/ILug7yqX90nYHjYa8GeohputC/RZ4NOPilJsrqag
	 1PVVMTSuyOxcIFzyv3a2Y2MNXvOpuBv0Apwte+jldoqpG6TN+AX09c6BcAaQEO27zg
	 DPlWdI30IgxEQ==
Date: Mon, 2 Dec 2024 12:17:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
	linux@treblig.org, dan.carpenter@linaro.org, Frank.Li@nxp.com,
	konradybcio@kernel.org, bryan.odonoghue@linaro.org,
	krzk+dt@kernel.org, robh@kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v5 2/4] dmaengine: gpi: Add Lock and Unlock TRE support
 to access I2C exclusively
Message-ID: <Z01YBLcxDXI2UwXR@vaman>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-3-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129144357.2008465-3-quic_msavaliy@quicinc.com>

On 29-11-24, 20:13, Mukesh Kumar Savaliya wrote:
> GSI DMA provides specific TREs(Transfer ring element) namely Lock and
> Unlock TRE. It provides mutually exclusive access to I2C controller from
> any of the processor(Apps,ADSP). Lock prevents other subsystems from
> concurrently performing DMA transfers and avoids disturbance to data path.
> Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
> the processor, complete the transfer, unlock the SE.
> 
> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
> TRE for the last transfer.
> 
> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
> 

...

> @@ -65,6 +65,9 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @shared_se: bus is shared between subsystems
> + * @bool first_msg: use it for tracking multimessage xfer
> + * @bool last_msg: use it for tracking multimessage xfer
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	bool shared_se;

Looking at this why do you need this field? It can be internal to your
i2c driver... Why not just set an enum for lock and use the values as
lock/unlock/dont care and make the interface simpler. I see no reason to
use three variables to communicate the info which can be handled in
simpler way..?

> +	bool first_msg;
> +	bool last_msg;

-- 
~Vinod

