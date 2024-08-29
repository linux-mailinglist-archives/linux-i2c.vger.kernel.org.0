Return-Path: <linux-i2c+bounces-5934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBBC964C8C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 19:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A5C1C23976
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 17:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A18D1B654C;
	Thu, 29 Aug 2024 17:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSyj7Njj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8601B151C;
	Thu, 29 Aug 2024 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950920; cv=none; b=M3aDYJc+eZWfRJJlBIm45m1uxeoTaMoFd5HrJD4K+tYyJzlfAmj4Vi02lqn2fRZkPyjcOfHFR5Amtvak8oUJh885Mtxmqneq6Udx867EjtHRAQHP0UXwj6laBORW5WxsEQZWFqQS/NNT+1Yt9879kR76dBQGrhPx0LtExWbE8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950920; c=relaxed/simple;
	bh=RJBfIbkiW7TN/v+WigG9LTCZysSAl3Gpt7zlyd7Izms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQHmuhPkrBlYhaK2GxYt047Ci9jPylFLM6xtQLxnoidlhX60LvG5DLd9ifas6SowTHLxDhiJ4WTGy0Gi6L6iPLUOSpwlIgnUFnxc6EDszh1HffXP465T38NBsFhz/KBJV8OUdZEfe8BvBC9D6lp3Lnxy45LW1Lh2RQwtV70zbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSyj7Njj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D31DC4CEC1;
	Thu, 29 Aug 2024 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724950920;
	bh=RJBfIbkiW7TN/v+WigG9LTCZysSAl3Gpt7zlyd7Izms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSyj7NjjcVbLlXlQ2Sdc0Im7sEu5rfFbFbMCx6LDBgU09J5wkKh8ur2t1D6mlumFj
	 Gt/nYmGVY71Io1lWD6hs7T1A/ZuK7rdasdnOs8OlV0cXmgbgEUAv+7pWtMPGiKYrVM
	 gZSE04vBYyr1aQ6YkzVocL06apGlZVnID9VGMWwbkLppHXRJ7qMFy0dX0DzLjnqoWP
	 6rhB+A0EsxqqDuJA9oE9OptA7AcuRy+cTrFfCv/63/Zl8a1wgBu6dciVPXDOnxOZU9
	 lsd40uOxv6vIAUhp5r82VWMfGfcJoQsLmPO4e0lFCQ1O742t0MSnVoLTNFN/Q5D1rZ
	 +Fd7WXENuYj3A==
Date: Thu, 29 Aug 2024 22:31:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	quic_vdadhani@quicinc.com
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
Message-ID: <ZtCphFX+4hXMNFPG@vaman>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>

On 29-08-24, 14:54, Mukesh Kumar Savaliya wrote:
> This Series adds support to share QUP based I2C SE between subsystems.
> Each subsystem should have its own GPII which interacts between SE and
> GSI DMA HW engine.
> 
> Subsystem must acquire Lock over the SE on GPII channel so that it
> gets uninterrupted control till it unlocks the SE. It also makes sure
> the commonly shared TLMM GPIOs are not touched which can impact other
> subsystem or cause any interruption. Generally, GPIOs are being
> unconfigured during suspend time. 

Most of the use case it is either I2C using it or some other peripheral
using it, so who are you protecting the channel with this locking
mechanism?

> GSI DMA engine is capable to perform requested transfer operations
> from any of the SE in a seamless way and its transparent to the
> subsystems. Make sure to enable “qcom,shared-se” flag only while
> enabling this feature. I2C client should add in its respective parent
> node.

Why should this be expose to peripheral drivers and not handled
internally inside dma driver, you lock, submit the txn to engine and
then unlock when txn is processed, why should this be exposed to
clients?

> 
> ---
> Mukesh Kumar Savaliya (4):
>   dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
>   dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
>   soc: qcom: geni-se: Export function geni_se_clks_off()
>   i2c: i2c-qcom-geni: Enable i2c controller sharing between two
>     subsystems
> 
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
>  drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
>  drivers/soc/qcom/qcom-geni-se.c               |  4 +-
>  include/linux/dma/qcom-gpi-dma.h              |  6 +++
>  include/linux/soc/qcom/geni-se.h              |  3 ++
>  6 files changed, 74 insertions(+), 9 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
~Vinod

