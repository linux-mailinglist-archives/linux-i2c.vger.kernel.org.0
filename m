Return-Path: <linux-i2c+bounces-9927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DDBA69D3A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 01:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65F95900496
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 00:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E322D35979;
	Thu, 20 Mar 2025 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqqwMNDO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900432F28;
	Thu, 20 Mar 2025 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742430420; cv=none; b=je0ZAS/+Hprj0CyQ/m4lZjdRtAHZXLoB4SGic3+84K856nQnsAm0BEcU7AZMSR24ZucKOGSmOhx9HuXfLW2SFCZSxXvOKHMDu7O+XV2bt7asTc6c5x9hXjvGZ+hdI4l2MUbodTFCch0VxgKKy3ttKoBBTG2bf1gE6fd2Nsd6Qis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742430420; c=relaxed/simple;
	bh=IzJC/y24HF2nc/AgwvbD+AJQstykALpjbfnse7+w71M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLM+wpC+r1vmgoUkX3KYHIrmkSfzTp71q9OIiJlXHrpUNLxI0J0FW00tr/RpphbBmjbifnStEtlabeHhphpR8dcMDS5Xg3jcbUV+yYXbgISaenUn1IEz1yYKpCFHjUrBJRDiph4trJM9arpMvb+w2S72VV2huRf6LBf0uL5/UWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqqwMNDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756E0C4CEE4;
	Thu, 20 Mar 2025 00:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742430420;
	bh=IzJC/y24HF2nc/AgwvbD+AJQstykALpjbfnse7+w71M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqqwMNDOmTR/QbEME0HxaXTn4E2RWoLaUNqJ0W+IjXF1YNNBV1+eHKbROgOH9Emew
	 pIEwi2ZKKUad8pDyBYIp0/KWrLK9Wc8GwxAU3BI4SF6BdvkfbxUU9EDVuHxAl1jEAR
	 bcRgDbXQo2kS3Vr0YdybuovvHeKZqo320MjI2fAuXl1TmlLj2QZwKVSir+2J2btmEb
	 j4ZgaETZILgdPowAIWff/KhFJ3fImx7sRFnECxFvu4hmpobVhSwLTubUz7GC0upOUx
	 0eT2TP1ieLlk1kx6k2sKWubH/yJRXB84tlyEAoy/TBdSEcTLH++yF4aL+/X0mBs36Q
	 WnCLNqrr9Oe/g==
Date: Thu, 20 Mar 2025 01:26:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v5 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <sni4bawucwkeyy7lh45p364ngv6bjomv7wxq3qjek2mjd7ucal@tfoeom2qohj2>
References: <20250212120536.28879-1-quic_jseerapu@quicinc.com>
 <20250212120536.28879-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212120536.28879-2-quic_jseerapu@quicinc.com>

Hi,

On Wed, Feb 12, 2025 at 05:35:35PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 messages internally and so interrupts are not expected for
> the first 7 message completions, only the last message triggers
> an interrupt, indicating the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Vinod any chance you can check this patch, please?

Andi

