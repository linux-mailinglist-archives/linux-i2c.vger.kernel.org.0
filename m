Return-Path: <linux-i2c+bounces-12674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B2B45095
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 10:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64591896FDE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 08:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBD82F7468;
	Fri,  5 Sep 2025 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkNamOjH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B453225B1FF;
	Fri,  5 Sep 2025 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059193; cv=none; b=jv+i+xL2/oh6cnwxGHtyFY+bzSAe+pSA/qn36MPtgWlSVdRbyshh5IrPmx0ax9kqoLVD1zAhgzMQ/nFC3SPaz1uJBCTMcUb6zefK9QTm6VkkQbY9HdxXuwyTNEGifepi/wAHQiuwQSOFUXBWJq4HfUqplh3OTNluvKb7WIYvMfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059193; c=relaxed/simple;
	bh=3guT0PGx8OwaagRVtwSvbFxyjK7ePs6aF6crQCEQCJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dytz723+vjCH6CIAjcd9hz+pTWmnvQRF6KBk7yp0ONFpCGyuNlACd9YZryDLZhR6BSOnWJeVQJADgnh/8bSlQyW6TikrdUgqWjyTCeseAjttaLIwsHVABvnjJeheNUHjPoKxdOGIqSUYyHP9DY4cE8TTxaHoSJgqN2nXp75DGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkNamOjH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB59C4CEF1;
	Fri,  5 Sep 2025 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757059193;
	bh=3guT0PGx8OwaagRVtwSvbFxyjK7ePs6aF6crQCEQCJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkNamOjHQ19F11qGuIPxi7fBwSIyTQ0jJtxhhRUCDzG0Sq+5iePgvw1z1ZlM8o+1Z
	 C4jooQHR8xHhXBA1GOgajOKyrlzN4Qqn/2ujY2Rw6gkdH7QYdK36HqU6EzjCQ20PzH
	 15vGY7oV64LHXGVaZgG9t5GQnBJ+RqK+XYfbl87rLSXN4x2rzFa/GK6Izq3Hive8uV
	 JR0JnXg6iXFJcI+EMEEYK+FDktK26ZRXw0ZDWmutAf1w3hFyagU8RXF47obELKzIfL
	 fJTF9RgMUXcbabgAcRpmsn4OJlr3iqlGJ82VRkyQfWXRzjDovI/bl8I5AjhQ1VK4xk
	 +xfYc1+v00QRQ==
Date: Fri, 5 Sep 2025 09:59:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Monish Chunara <quic_mchunara@quicinc.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: mmc: sdhci-msm: Document the
 Lemans compatible
Message-ID: <20250905-romantic-cuttlefish-of-radiance-1bcefd@kuoka>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-1-8bbaac1f25e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904-lemans-evk-bu-v3-1-8bbaac1f25e8@oss.qualcomm.com>

On Thu, Sep 04, 2025 at 10:08:57PM +0530, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Add the MSM SDHCI compatible name to support both eMMC and SD card for
> Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
> compatible string matches existing Lemans-compatible formats without
> introducing a new naming convention.
> 
> The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


