Return-Path: <linux-i2c+bounces-1595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA740845A21
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 15:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57F66B2AB93
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 14:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE87A62159;
	Thu,  1 Feb 2024 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqeXuBJb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AD762151;
	Thu,  1 Feb 2024 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797365; cv=none; b=e43Dpayau5qujjljYV2qKg8Vf3iVYYupYv2JMFKEGf2b5pk2cLO62Z83o+ULOGVFeZMRhI4IHDMio2lMAWSyFwMyneNEt+w7C31sxxDk5TLC+9nBNWMe7bZp7xAoiW7w82rdFFk+arbE73UxLmrl4xLeGYsbMWqYiTWrPljlt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797365; c=relaxed/simple;
	bh=MSTzW+hSPSJIFSo2SART8H4vNXAtz7vluaa2YvfXTrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKCUQBi05EbP/Ff9IAvhnVVV5/KqykvIo/XJdE0fgVpdMyAksG4qaoD13hVuHPzVkWnregt1DY5i0SqEMJfeCoETYmKCrXfEHOksJjLI7v00YYzrP273bv79XgYY+5GCRXHcV23oXSUEOfsvKqSNChzAuSKJbwgMlWjNePNUwZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqeXuBJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C53CC433F1;
	Thu,  1 Feb 2024 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706797364;
	bh=MSTzW+hSPSJIFSo2SART8H4vNXAtz7vluaa2YvfXTrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqeXuBJb13FjyDKxNkHzSrYx5UDHUajG05KdPPKWIwLpgcYfOHRIk4LE4VuisQr+f
	 SJQnIXHCPpZwf2ZZnOzsVArUblsRwcWB4kxGVr8IyXzfArn7RP2ZJ2rgF1YVPoENuR
	 eP9c48wb2JYz+xuzk2vBbT5Q2AsxU3b5PSdX2BsKlBNCoCupY/nMsOksezKsL6EMTo
	 FfbbJjhiFHwkk9KSpKA6LhW4sRZ8bhrYxktpPjuI8OeDZOvhOlgJFvXufG6HN+mkUp
	 7I8FJpPyBAxr/45s/4vXp/dxaSysuzI/jwgu5L9cfap2SdTBnF064QnY0TFiI+it66
	 eNuOpPqtC0TrA==
Date: Thu, 1 Feb 2024 15:22:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vkoul@kernel.org, quic_bjorande@quicinc.com, manivannan.sadhasivam@linaro.org, 
	bryan.odonoghue@linaro.org, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Message-ID: <dt2uwtff5yacr7ci7xbezbe7bpwxsvspimceat7cozhzgazszx@6cjp5r7abfqd>
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201101323.13676-1-quic_vdadhani@quicinc.com>

Hi Viken,

On Thu, Feb 01, 2024 at 03:43:23PM +0530, Viken Dadhaniya wrote:
> For i2c read operation in GSI mode, we are getting timeout
> due to malformed TRE basically incorrect TRE sequence
> in gpi(drivers/dma/qcom/gpi.c) driver.
> 
> TRE stands for Transfer Ring Element - which is basically an element with
> size of 4 words. It contains all information like slave address,
> clk divider, dma address value data size etc).
> 
> Mainly we have 3 TREs(Config, GO and DMA tre).
> - CONFIG TRE : consists of internal register configuration which is
>                required before start of the transfer.
> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>                of the transfer.
> 
> Driver calls GPI driver API to config each TRE depending on the protocol.
> If we see GPI driver, for RX operation we are configuring DMA tre and
> for TX operation we are configuring GO tre.
> 
> For read operation tre sequence will be as below which is not aligned
> to hardware programming guide.
> 
> - CONFIG tre
> - DMA tre
> - GO tre
> 
> As per Qualcomm's internal Hardware Programming Guide, we should configure
> TREs in below sequence for any RX only transfer.
> 
> - CONFIG tre
> - GO tre
> - DMA tre
> 
> In summary, for RX only transfers, we are reordering DMA and GO TREs.
> Tested covering i2c read/write transfer on QCM6490 RB3 board.
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>

as Dmitry has written, please, next time don't forget the tags:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5

You can also add mine:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Please make sure to Cc Dmitry who is raising his concerns and
check on his comments.

Andi

PS just as a reminder, if Dmitry's concerns remain related only
to the commit log, I gave you the option to agree with him in the
e-mail thread without necessarily sending a v4. I can then update
the commit log before pushing.

