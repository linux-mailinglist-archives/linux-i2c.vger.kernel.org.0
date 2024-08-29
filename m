Return-Path: <linux-i2c+bounces-5889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F84963D02
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC711C211A9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1EB188CCF;
	Thu, 29 Aug 2024 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tI9k2or4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F8B1F61C;
	Thu, 29 Aug 2024 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916622; cv=none; b=G4aGS3LA46R//VMD3R+MoAYuHCNfBf5n/YiBt4iIxqAABRxLLu7UXIDU3QvuQ+ylQXjA240zdJw/XAuveTAo1Pwk88zWKxLcoPMp/dX/WpiLFfuCyoYaWc8g/Mz2JvI6trZDOjxZzFrnU4z/o9Ro1IXoDaT0ptJUbKkM9EITMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916622; c=relaxed/simple;
	bh=vd54NGSTZ8s6qjk4QCD3xlt9tn4hIWGJF9fjaEYB8ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5Kb5NU6cgFWft3f/HxHK+oELRmQYTH3xL/+vI3F+SCFdjPIocN6M0xwlK6UmdRARmMDPPPdbubu9Gf6QOpbrkTa5KE2d74et9WdlqOI/wR0YbfgPZEwdUcwiULOYGMsGopUSSNT70Ofv0uo9PZxkaoKdBMdCf2TuqfQ+Vs4RW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tI9k2or4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C42C4CEC1;
	Thu, 29 Aug 2024 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724916622;
	bh=vd54NGSTZ8s6qjk4QCD3xlt9tn4hIWGJF9fjaEYB8ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tI9k2or4Ev4ecIxXqMChBXaN1jDLAqzB3+UnmcDDCnb3AL2yM+1O2CboyfLboAkGp
	 scStB/cgURzRL1zzu/oKK5UtVbq0U4zJJe96T1XLOiBBXFHdpmo4dseZtxM8vl+lD+
	 nFNpN9v5vW4++l1RjEGDqV/PbUVlGpv+i5ZgXbQz1LBBzMdVYMmiwm90JmKlLDD5aK
	 ObQWc8h4MPjFp8Bdz4kqFjmDRJpNHWSnCHSTe7ygT52A9TFY92T/GUrgi2jphjiyd+
	 QxXgoncP8cqHsaA3vpsEs6pudafBhwhJNJCxi0ziQzovgfa0hCVybK3Fm4x1uPqMLz
	 s6lum6pEE7/tg==
Date: Thu, 29 Aug 2024 09:30:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, joro@8bytes.org, jassisinghbrar@gmail.com, 
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, 
	robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com, 
	lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com, agross@kernel.org, 
	bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com, robimarko@gmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH 10/22] dt-bindings: pinctrl: document support for SA8255p
Message-ID: <mn67vjsfa7jjjw6jblwbpdhpzccmmao5qwsydsnnlu3hi6tos3@jmhlrxsvufhf>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-11-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-11-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:09PM -0700, Nikunj Kela wrote:
> Add compatible for pincontrol representing support on SA8255p.
> 
> SA8255p uses the same TLMM block as SA8775p however the ownership
> of pins are split between Firmware VM and Linux VM on SA8255p. For
> example, pins used by UART are owned and configured by Firmware VM
> while pins used by ethernet are owned and configured by Linux VM.
> Therefore, adding a sa8255p specific compatible to mark the difference.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---

Explanation does not match driver (discussion in the driver).

Best regards,
Krzysztof


