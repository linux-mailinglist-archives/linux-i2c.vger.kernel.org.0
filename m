Return-Path: <linux-i2c+bounces-13384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468BABB7EA3
	for <lists+linux-i2c@lfdr.de>; Fri, 03 Oct 2025 20:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F4B3AD618
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Oct 2025 18:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C87F2DA773;
	Fri,  3 Oct 2025 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pno51kk8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAD11804A;
	Fri,  3 Oct 2025 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517308; cv=none; b=VvqmfIqLWBrtDNp7+A3i8LZaehyeD9fEGMKIVue5yb7faOUdwERLMcojoVQaLGwDxyAyAyLPSeBoPYeHCz8PF4/HPtTTXZLdC0HnRyHGih/BeLEkabaiXSHCDTm/ifwiXW7U0k1Jzpx+qtRQORwMKlt6icS2RVdP74JWn3CQQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517308; c=relaxed/simple;
	bh=jInko8l8heS3BR6J/aDG/ZGZlSLkprpWPuxR+WF5bzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r51LQTDugwyqVJpPuAptsHtjhwz1dqk1qGnM5YBdcAdeRhsEEkgB5xWkcjvFxqp4/lOfupJ+bmQMZzePrtj7DoPOG034JJ7SxjXAocFCIwZjaORo3A5zG+Zo5gbrYDUL6ncmL8xai8hQ3j6sAZd6jY3iM920UgzmFR+NL1mPnmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pno51kk8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8EBC4CEF5;
	Fri,  3 Oct 2025 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759517308;
	bh=jInko8l8heS3BR6J/aDG/ZGZlSLkprpWPuxR+WF5bzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pno51kk8glq8zyAh5k9hPOU7oWWtje3N5wypKqM8LvRT86eolFzQUr/3wG3ERRRKc
	 2TVuVg2s0OjO/oo3qNuvEEC10cfhTzYNOqNVuZwU46t0t7BS4gqINMwha7Atm6ezCe
	 rCYG9UOrOhPkNcJt/sp0e7smz3LmWjotDlYaCetcdabXYKmYmUfvPygkWLEtt1PFKF
	 kMF/bG2S5zpUg80UdEVAB++KKimi8/1GSay9/ftxntJ1Rq4Jn1RJYLk/5rXpJOxCBb
	 iGL0z3OgzHCuj42ZG0TokkyjYPn+a1EwbKSVxbCnUKFyfhMUpSNArrtDo/udQVJrR7
	 rVE2XxjjFMOvA==
Date: Fri, 3 Oct 2025 20:48:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <44msykd4jtbhqjycvsrvfrhimqixntgmtv6ihvyivfhpabwexm@4fdiursyx6yb>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>

Hi Vinod,

On Thu, Sep 25, 2025 at 05:30:34PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

Ping on this patch. I'm sorry, but going to take it in the next
few days if I don't hear from you, this patch has been waiting
for a very long time.

Thanks,
Andi

