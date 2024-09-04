Return-Path: <linux-i2c+bounces-6104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5896B0C4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 07:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90EEB1F21877
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 05:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E641012C460;
	Wed,  4 Sep 2024 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="og1oklMK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675DC84FA0;
	Wed,  4 Sep 2024 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725429292; cv=none; b=KD9YkzKJcFrz4q69DBB/sj3uOa7LP/kItNtgtyy+NXWRiEYXhZvaeRoJbuxramEYQUm+JOqMQrNFoNBRtKlbRVuVyXXUQK2eWluPVgEHC41QZqJ/RdbL09jRErMfA4Egjr8ZAdWhVgOWgvWXeKVTLjkiFT2C8So8k3UocKYcRZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725429292; c=relaxed/simple;
	bh=pDZcotIHkEE1L9COrUn/fnSB2fVdzH08tCumXOdDPKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KS6kErx2EgAWB01ysKteKx7RhCNLtFcRHdNJXGsqZ/V3StVjUjF9lqVCIL4bvWA8HcaFPnrLuYEZQFveuHVbQWm6ukw+SeZGb6UImDoSETZ1xeLhNwGDRW0hPG4hChG02tRI36zZ2MOqrq+LaoqSU0nR+e4C5ioTJwpjMaLXP9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=og1oklMK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45A6C4CEC2;
	Wed,  4 Sep 2024 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725429291;
	bh=pDZcotIHkEE1L9COrUn/fnSB2fVdzH08tCumXOdDPKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=og1oklMK64rQw2DhxZjdNOpmuXJN+eI32oSS1J/ZqbWHobqxlgwp4Q4TSYVXbtqS3
	 0oyMBQSUdSRxnCPYUrK6AW4+Tr4yLLwSXpB1IHpZEjB1s/Y8rt3aXi3WcY9O1/Uqiy
	 9RRJoIkdJ/ak0v4gCP4UwGunORkmGWSPaF5eqm6kqyCBDUY9rZgMNy0qvCndpJZG56
	 ZYxjnS/5QqViNZym19UtdOpE1pvVP+eniYBfFUBjTIQnf77OVJZ84BYWSErJ2Kz7Qc
	 gR6DXf7NvMoiKYFAeBb2oZo4Tx8mYQSouLkqUrepK2B2uYn6t4CT6WU36m9FX24Lks
	 4R5qIWL7OFXXA==
Date: Wed, 4 Sep 2024 07:54:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, cristian.marussi@arm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com
Subject: Re: [PATCH v2 00/21] arm64: qcom: Introduce SA8255p Ride platform
Message-ID: <glo34r35r2jqypeureu5dzoe6udkniqbma627jnv55ihfoatfu@ujvsxcsrhhdc>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903220240.2594102-1-quic_nkela@quicinc.com>

On Tue, Sep 03, 2024 at 03:02:19PM -0700, Nikunj Kela wrote:
> This series enables the support for SA8255p Qualcomm SoC and Ride
> platform. This platform uses SCMI power, reset, performance, sensor
> protocols for resources(e.g. clocks, regulator, interconnect, phy etc.)
> management. SA8255p is a virtual platforms that uses Qualcomm smc/hvc
> transport driver.
> 
> Multiple virtual SCMI instances are being used to achieve the parallelism.
> SCMI platform stack runs in SMP enabled VM hence allows platform to service
> multiple resource requests in parallel. Each device is assigned its own
> dedicated SCMI channel and Tx/Rx doorbells.
> 

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

It does not look like you tested the bindings, at least after quick
look. Please run  (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof


