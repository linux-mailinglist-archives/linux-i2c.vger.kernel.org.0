Return-Path: <linux-i2c+bounces-5891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF90963D21
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1F3282495
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2AF188CC7;
	Thu, 29 Aug 2024 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSWLRWEQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975C39AD6;
	Thu, 29 Aug 2024 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916843; cv=none; b=l1HUWIu28j/uDFKoJUm+ijuqGQ1IchMee6JSPRl1AHVY8UMU2fXxK8teH2xvSRlb+03qQEYHwgxVyLN9of7lg0QKrVIo98OCR771w6gQBlZu2SCuXYAlVHezHxOzPVIhbBcNMon9IObVNV86wb9ADGWvuvuWsiuIVdqJtWQvwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916843; c=relaxed/simple;
	bh=945OlGGbW9iNMQGOHatryeKgtzAnhWCkHNiqH0pF82E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLxw5uVOWCDww8uiG0fQbZcKBkNYf0qOQuAvvHbRXnwM2QOcAUD4efBLNmd2bK++ch7vVg73H7UO37fUmLZjTOh8gritweCD/L7P8yd0J7oR6hhqFZ+85F7LwtSqVbdI1jyN/4Deb0EIsR9ls0gd/4xftW6obIKIl8+vqZ8F3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSWLRWEQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27063C4CEC1;
	Thu, 29 Aug 2024 07:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724916843;
	bh=945OlGGbW9iNMQGOHatryeKgtzAnhWCkHNiqH0pF82E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSWLRWEQxKCPFitoVBIBKt/rWPWqVuJcUnEr2YlFIthsAr9WwyxArjaTn/NNA2COK
	 1DZtShJTDf1CjQiGvrHuKgABrTbWazHZzs8Tfg4SjBrswVaUrJ5oOP7kJvCF5xHtOi
	 d4tmCNejHrXGwsicuvbnDjIlq3+PiSxtDMayOf3MjL0YYFGXFkemZjUUbKCsUc8Ay6
	 IHESSzI07f7MkygLD6Z3nzJ2AXoFa+k6AG2CvvqY0xcvUVfrBaIb5Y9I3JfINAjJD0
	 40kSh6wp9K+A/FWPO+WEITUeUYq3ROPwHs79drwdPGzct161jrqmMM242yLeMjaPXd
	 +OyjYi/FDdbGA==
Date: Thu, 29 Aug 2024 09:33:59 +0200
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
Subject: Re: [PATCH 13/22] dt-bindings: thermal: tsens: document support on
 SA8255p
Message-ID: <xeknor2eisi4iy6qp6gcgsyinjfijub6ecmtrl4nbuvenywenz@7z2tcgz6liyr>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-14-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-14-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:12PM -0700, Nikunj Kela wrote:
> Add compatible for sensors representing support on SA8255p.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


