Return-Path: <linux-i2c+bounces-14305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2649C8D40C
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D33B34EA7F7
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 07:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BCD325485;
	Thu, 27 Nov 2025 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnpgmxYE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C430EF69;
	Thu, 27 Nov 2025 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229826; cv=none; b=t7mSaY05DNFpbbht5Sz/MAUmZ6TOq1/tjphhPcJcZPgsqTrREPCHsSYH5N9LVMKfj5dIeyRhgdVA/X6/VfAebCpNYzoc/QyFdtUOGesl37FkOx47iheqrvw11k6MWHdXuKyR3L4nXHzf2lC5bii4Hv1Iwtaw9QgVcrlN2mQSGnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229826; c=relaxed/simple;
	bh=I0c0lFPDgvGQY8PKRQiKOwUlcX1D5LAJUrx1QAepxhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAJ62o8R2SVele9oIWbwEU5Bxp7C7fWBdm9QbuucI9Nqo/yaAOu4F0RH8FCXd5vwOfGOlWHecJbW4S2+HLxBryiGacxWmTwPrSCNO9yLoF3lVALerCY6CYJx+N+ziNpCvm6lQaxVAmjleecp5IXTZIbw4sthV8qi2dgLI6VFwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnpgmxYE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE269C4CEF8;
	Thu, 27 Nov 2025 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764229826;
	bh=I0c0lFPDgvGQY8PKRQiKOwUlcX1D5LAJUrx1QAepxhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnpgmxYEPtHEuPIBs5FwWpEYHRPskCUXeAR0PBuTVU6DvTRujSWJtMdK7+c3ISYvj
	 fl43DVYQpbdlrP/UpWiRUu63ZhQz7uS7RR/OLxJ7Gy3Fs0HLsMAgj6MBTC+Q5z9iPo
	 r5Pb7GSFX2ymSO4SiCeA2OCYM46/Lu5ba6od+zwzB8qQ0+D3i5KSGIl/+MB/yVbFqy
	 eVIoLy2SY3V45xiV2qgtExTChYw7BTNrbiNJiy4LWdrNPWfJ1DuWcekwmSlQvHCpfz
	 0t7UtsH8qs7zAU3l0WUeDc6MAknBKHmAAlmuNYxM5bGdppP2jcFZ/PiEIuwJtEDThm
	 5v7r6sVXEsLoA==
Date: Thu, 27 Nov 2025 08:50:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document SM8750
 compatible
Message-ID: <20251127-shiny-outgoing-starfish-cc8fab@kuoka>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>

On Wed, Nov 26, 2025 at 01:38:34AM -0800, Hangxiang Ma wrote:
> Add SM8750 compatible consistent with CAMSS CCI interfaces.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


