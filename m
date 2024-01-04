Return-Path: <linux-i2c+bounces-1105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C4823E75
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 10:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F215A1C238F3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 09:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DA22031E;
	Thu,  4 Jan 2024 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJU1/A+d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6DE20303;
	Thu,  4 Jan 2024 09:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B682BC433C7;
	Thu,  4 Jan 2024 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704359944;
	bh=TRHwajs8+C7HLWNDMoS9D2FjvoKe9s7pha9pe1gRf1k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sJU1/A+dXUT7eRNZ5GbqqTcstHEhhb7hiKxyTVRc7PesI4jdkvrA9X+E06yJWA/gq
	 HxC+cTLwX/L08azbq6crYpfxJ7M6Qr/9FTMRffNrdkjoYWuT3XhmWXmTmXA9ZY0eCB
	 LByHyNdKfbx3a8IG8K9yY6xaMiM21j1OKQSii/omQ6rT/2gdlU93rQhR9nSHM054r5
	 EIHgQo2nCORnzvYV95+XIjdKlMMHqavkMwStSEm8lNNGk5srxoWvg5U6KI1z4f0sHP
	 em2lkuhGNgBhJs7Ts2jBRgud22ElLLT8ivGL+DX91FU6KjrQ3YeTWRoOhFmOrwYoix
	 Qc1fyx8swmOiw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 04 Jan 2024 10:18:59 +0100
From: Michael Walle <mwalle@kernel.org>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, peterz@infradead.org, Tor Vic
 <torvic9@mailbox.org>, Erhard Furtner <erhard_f@mailbox.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Bara
 <benjamin.bara@skidata.com>, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix atomic xfer check for non-preempt config
In-Reply-To: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
References: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
Message-ID: <1650596292790607a5739fa295fd259e@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> Since commit aa49c90894d0 ("i2c: core: Run atomic i2c xfer when
> !preemptible"), the whole reboot/power off sequence on non-preempt 
> kernels
> is using atomic i2c xfer, as !preemptible() always results to 1.
> 
> During device_shutdown(), the i2c might be used a lot and not all 
> busses
> have implemented an atomic xfer handler. This results in a lot of
> avoidable noise, like:
> 
> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
> [   12.692313] WARNING: CPU: 6 PID: 275 at drivers/i2c/i2c-core.h:40 
> i2c_smbus_xfer+0x100/0x118
> ...
> 
> Fix this by allowing non-atomic xfer when the interrupts are enabled, 
> as
> it was before.
> 
> Fixes: aa49c90894d0 ("i2c: core: Run atomic i2c xfer when 
> !preemptible")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>

Tested-by: Michael Walle <mwalle@kernel.org>

Thanks for the fix, if there will be a -rc9 this should definitely go 
in.

-michael

