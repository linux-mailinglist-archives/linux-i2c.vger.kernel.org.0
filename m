Return-Path: <linux-i2c+bounces-13903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04992C1FFF0
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 13:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0F23AD86E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 12:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F0A3126A3;
	Thu, 30 Oct 2025 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yc7WFNsb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D52E1C64;
	Thu, 30 Oct 2025 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827180; cv=none; b=G2+Qqf1DqAiaJo95KEV222o3rCgn7Yx30D0R2Bkou7vuaw+2HH//O2D5LzGFCwAZTT05UqV/rWAusARFelQthVDV6ExpP/T9Mku76aUhR4MnrCzEUr0aU4+BEmN4Pf5/JeKSPxJjXht0KgkBYk2Do70enJd0acHel8c8CT1eZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827180; c=relaxed/simple;
	bh=9QDJJ3cX2qcqHJOVK2TGtJH4qxtivXGC6VMYBbmXA8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgdWdJgSHALPP4fhJrHOHkGqVKIRz44b7W1PIfSFMkp298rz7DnydnCw28whOU6TFuJDrzI7IElveNbpC3VLOID32QPvZ3969kPjkNYcAdBu8fOWybiM4StIDR57fH6+jsQ2u60vahyWjls+YFccHoQ/UK1T56KbZ8Q3RBoXnao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yc7WFNsb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2135C4CEF1;
	Thu, 30 Oct 2025 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761827179;
	bh=9QDJJ3cX2qcqHJOVK2TGtJH4qxtivXGC6VMYBbmXA8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yc7WFNsbc1RPBtv5ksYUHYP5HDD6C5MsAcEHLPpx9aFtpVo1uoBepa3SmNIWa5CB3
	 I3enJZC+MXYupAyuyU370NT4rc60FOvZ2k4nz8z1DQhnMXqjp6pWKOiNJV9fpS5NHA
	 UxfyJduHkKgykuWbwOt0QBDKTpDnX9zpQYceLSTi0assh06u0Kqm1hdwMHtELaiVec
	 5cpwzp4QjT8szSAwNTuiWNGRv/uIFhfdYOgBUS7DcvEI/AMMzw19Ht3GruMHvZbS7s
	 VmT35haMUBfSErlWVRUBDvmlRZKhXTvnj/gW8PAVaRucq58shwCYrNTb/HftbPdOmo
	 GkYRiaxFgHdSw==
Date: Thu, 30 Oct 2025 13:26:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Message-ID: <7iawwrpupm2hyo3ncsvwycbpifk2ouesf44eounstxxrgfv7d7@fhnv5tfa4p22>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>

Hi Luca,

On Tue, Oct 28, 2025 at 05:40:46PM +0100, Luca Weiss wrote:
> Add the msm8953 CCI device string compatible.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

merged to i2c/i2c-host.

Thanks,
Andi

