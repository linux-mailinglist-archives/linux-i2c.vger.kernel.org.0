Return-Path: <linux-i2c+bounces-6264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA0796DF80
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 18:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AABE6284712
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 16:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692671A01B6;
	Thu,  5 Sep 2024 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="m7eKKZU3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6972A101DE;
	Thu,  5 Sep 2024 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725553428; cv=none; b=mH3S5t2zFInFZg7+gOkLD+kbIdAUvvW855g+Y7TPAeyPUw4EVTlqQwzBwlXH12zzuQMJFMcdD/4jAnMNGAE7Oc8WAC+cJwInIbxZAth6wHt/LpT6hygCShEKYvEJcdLjjqM6RU1WIq6N4z7O7uWOnxN58gb4nw6jzoE9vpKrnlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725553428; c=relaxed/simple;
	bh=recn1lC2kohoaQMYAE2RoPCbyTRQZBnBUFWWA4Hcz4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsTyZbUzKKyxqupTOZVgPxXoIxKQblNBvB6W2fRoCP/PntkiC8xjxkgs4VmI7XT8/5hZGiVLhwD0fdcVSruNw91BaFnvY3MNEeHvaHwieD2AJw8RRF1Nx4ZIZ1v6A+w7vQujPUlbgdohwhqITF2gDzv+pG9MJk337ITg9apWQvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=m7eKKZU3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xvin4L+rFMFToiZrTayTdE7pqZB5x0weD2NGgyFYnvA=; b=m7eKKZU3taDnQq4yQOQM3t2np4
	c30ER1jBz1mxP6IWu2z86cZUU6UG4lO4CmoGrJjIpABsOP5DO5uplP8O38gbkZU+l8wxl8VFddtx3
	zqBRcGW7xg9COuN/NCMNrWXXrRnOZNCve4K8pHLm94AzbpSTSTvUY6I0rX5UDfeVP/f8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1smFGZ-006hSx-35; Thu, 05 Sep 2024 18:23:27 +0200
Date: Thu, 5 Sep 2024 18:23:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	wim@linux-watchdog.org, linux@roeck-us.net,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
Message-ID: <0ba03b8e-4dd5-4234-823e-db4c457fa292@lunn.ch>
References: <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
 <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
 <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
 <70c75241-b6f1-4e61-8451-26839ec71317@kernel.org>
 <75768451-4c85-41fa-82b0-8847a118ea0a@quicinc.com>
 <ce4d6ea9-0ba7-4587-b4a7-3dcb2d6bb1a6@kernel.org>
 <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>
 <b1ad1c7a-0995-48e0-8ebc-46a39a5ef4b3@kernel.org>
 <515a2837-69c3-47b2-978b-68ad3f6ad0fc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <515a2837-69c3-47b2-978b-68ad3f6ad0fc@quicinc.com>

> If the QUPs yaml changes are not included in the same series with
> i2c,serial yaml changes, you see these errors:
> 
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000:compatible:0: 'qcom,sa8255p-geni-uart' is not one of ['qcom,geni-uart', 'qcom,geni-debug-uart']
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000:compatible:0: 'qcom,sa8255p-geni-i2c' is not one of ['qcom,geni-i2c', 'qcom,geni-i2c-master-hub']

So you have a couple of options:

1) It sounds like you should get the QUP changes merged first. Then
   submit the i2c,serial changes. Is there a reason you cannot do
   this? Is there a mutual dependency between these two series, or
   just a one way dependency?

2) Explain in the commit message that following errors are expected
   because ... And explain in detail why the dependency cannot be
   broken to avoid the errors.

Andrew

