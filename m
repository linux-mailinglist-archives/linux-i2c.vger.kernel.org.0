Return-Path: <linux-i2c+bounces-13385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95252BB7EC4
	for <lists+linux-i2c@lfdr.de>; Fri, 03 Oct 2025 20:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B2314EA7E6
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Oct 2025 18:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6CA2DF128;
	Fri,  3 Oct 2025 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlA2EZ7D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB52DECA3;
	Fri,  3 Oct 2025 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517408; cv=none; b=mK+BD/oSwSjklFoA+pJtjmb7rShho+TpisqVEN2Sbib0ykDFLnL1C4F565eDzQs6XODXrt7uyIFqRo4IqBa6edXdSyTKQ6yVOaWVr7JnmGf5ClorCIc6tPNbs21/zYo+2T39G7VDl0dr7WjUIUVWi+i75ho8Sn+ixFxaHqNMdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517408; c=relaxed/simple;
	bh=BzHCgdnh4u1K9vziVNYN9RLlQWl3aVaEvR81Dj9kN4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRiyCYZN2Zu6VY06voetOfkBUAkXu9E/ABEN3kkIKwG83BP+DB2ZoutP2vlfQwar2brjT/bdwesmd3rL+v2Zg+ykH2suZ/0U0ALrnb7lujvpc3lFyQoOQMCogIXSwGNuVgLsaVThq1adgpsyE5lkwFGyljmTGT5BotSS8N5Gcxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlA2EZ7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA096C4CEF5;
	Fri,  3 Oct 2025 18:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759517408;
	bh=BzHCgdnh4u1K9vziVNYN9RLlQWl3aVaEvR81Dj9kN4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlA2EZ7DMRWKJIi06Yk5nf6ddrH6QhjXENHv7U00iBTVK9rNH9rCHJ14O7wdDLXwy
	 fC0lR2l4nE2A0vLQEkcZpR23PHNRp8IYJ6PUev4Uvi0MPiRKnvuIIzFl9PxMjNHQRL
	 vgpfGA1ig0UBreHE5je0IOklxdtySK7NVjyEkoZpEl8kbz+6bZSSso4B/pbLxMVCFy
	 P/bRShd8eixVb+180h7ImOMmeNj8JbeP6OTpFjD1tlO+TEqPbU5YotHd+xVvqcbFdR
	 wZIk7OsELSV3/ARIz7bY3mbKQupa7M52vWCtipjySjVrthGqAfwZfPcB2hAQwMUT18
	 5wZhULFzanFRg==
Date: Fri, 3 Oct 2025 20:50:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <3lgris6k6ewqjdcfmmovygstqrqjx2jidtr3hb3v47gpgadkka@wlua7qpd7ahf>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 05:30:35PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

Because this series is touching multiple subsystems, I'm going to
ack it:

Acked-by: Andi Shyti <andi.shyti@kernel.org>

We are waiting for someone from DMA to ack it (Vinod or Sinan).

Thanks,
Andi

