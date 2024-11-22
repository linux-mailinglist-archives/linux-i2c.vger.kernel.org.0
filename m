Return-Path: <linux-i2c+bounces-8159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FC9D6562
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 22:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D39616160A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 21:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BFF17DFFC;
	Fri, 22 Nov 2024 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="RRDbqHL5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415DA54F95;
	Fri, 22 Nov 2024 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732310983; cv=none; b=D9oRZnbMF5kqjwOOxvSxoSPPyOXpPV3YnTMELto5V3HVnmWyNMz8pE5gAB1Jx3VCgRpLTQBQe0WrDWoLJH/FGgqN0ygu45ZfRE9foXIYK1+zGpG9tM+ix5bwxZbDHMnxyNweHioDoHApI+KwuWV6EaFV0dUdsb+mncv0uSMwelw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732310983; c=relaxed/simple;
	bh=6Dq/7a3W6K2nC9cc/WeXeaR3aIX83oR+/Zyz5Nsg+h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3WGPqV5lsD3G0R2jvZwCoGWj5rrdUP0/eIzsFusJO4sxNG32QtJ8SsEOcR6oYHho8+Qcas4tvg7dtYr3pb+pAZk7/OnsDC5RVM7BRPrapLa+prza7qYL80t/JRRtzF3qikRPS7iTAlgIi4nQ3amZD+93QFhIhLmFkCGdNMYOTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=RRDbqHL5; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1732310971; bh=6Dq/7a3W6K2nC9cc/WeXeaR3aIX83oR+/Zyz5Nsg+h0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RRDbqHL5Tu0vgOBzHI44XtGJkGz23xeJB82btI7ryKROpsyor4DFZYBINq+G6GP5a
	 6kJdv/59eO0bH/a8+V4On/Scvh/0hTihoWTwXJ6m8gc4/IU/QtB2/2TYN3FRSliNa3
	 4qp+4JBj6Zqrokf6ou2ZJaLcH8ZzrE5/7ta3Cxr9lSYnj9NIrtoljDGdD9rocgpi0p
	 agLLlyQfR69uP5Jc9AMnA5Cy/fZ0wu9d2tAVrPSXMyz/zKFeBys/tSIT4IN+ipiRrE
	 7D7mNBpn9m+DP9P6J2EoOWL1WgrBcU/34qroIa2VmAIlzOwFag9aIxSNWHG0ppNLEG
	 j9EVW6/qrKgroxUbmQqqGgqOwY5KTTsjPtYEPdLnps/10dIAf7jo7VNgNSslFSmEMY
	 2g6zfCLaahK6ZSSTeZy8Tvl29s+uTkmIQyVjvYogndHGLEYzAAuhG/gPoBzgA4Qe80
	 VagJNHkP1Rpv1hkUFopa2jqIaF+BIdPk/2jqVokyaZ3X2gCRHcw7lIvxHRKUzv0CeH
	 Jfc51Xpb1aSK+6ZMCWmgh3wYNjIivurxyzPNlyswk3xoo8ZXYRduj8+RG9Z+pIOloT
	 ZHoiSwisic5dAT5BnJTvHdVo20UhtNlmXQug5B59+4b9iRM6gri1KwbS1Am8cqkeTj
	 bR/XOFZ0xkOkzL7PLan6010c=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id BE4CE18E0CC;
	Fri, 22 Nov 2024 22:29:30 +0100 (CET)
Message-ID: <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
Date: Fri, 22 Nov 2024 22:29:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: xiic: Add atomic transfer support
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
 michal.simek@amd.com, andi.shyti@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manion05gk@gmail.com
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
 <20241011104131.733736-3-manikanta.guntupalli@amd.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241011104131.733736-3-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 11-10-2024 om 12:41 schreef Manikanta Guntupalli:
> Rework the read and write code paths in the driver to support operation
> in atomic contexts.
>
> Similar changes have been implemented in other drivers, including:
> commit 3a5ee18d2a32 ("i2c: imx: implement master_xfer_atomic callback")
> commit 445094c8a9fb ("i2c: exynos5: add support for atomic transfers")
> commit ede2299f7101 ("i2c: tegra: Support atomic transfers")
> commit fe402bd09049 ("i2c: meson: implement the master_xfer_atomic
> callback")
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 245 +++++++++++++++++++++++++++++-----
>   1 file changed, 212 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 052bae4fc664..e5e9a4993bd4 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> [...]
> +static void xiic_recv_atomic(struct xiic_i2c *i2c)
> +{
> +	while (xiic_rx_space(i2c)) {
Let's remind what xiic_rx_space is
#define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)

> +		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
> +			if (!i2c->rx_msg) {
This check is suspicious. If i2c->rx_msg is NULL then the while
above already dereferenced a NULL pointer.
What is going on?
> [...]
> +}
> [...]
> +static void xiic_send_rem_atomic(struct xiic_i2c *i2c)
> +{
> +	if (!i2c->tx_msg)
> +		goto send_atomic_out;
> +	while (xiic_tx_space(i2c)) {
> [...]
> +	}
> +send_atomic_out:
> +	if (i2c->nmsgs > 1) {
> +		i2c->nmsgs--;
> +		i2c->tx_msg++;
We can get here with i2c->tx_msg being NULL. See the first if
in the function.
> +		__xiic_start_xfer(i2c);
> +	} else {
> +		xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
> +	}
>   }
> [...]

