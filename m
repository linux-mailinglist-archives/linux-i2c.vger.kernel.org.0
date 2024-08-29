Return-Path: <linux-i2c+bounces-5886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B39963CDB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C0B31C226EE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD77186E56;
	Thu, 29 Aug 2024 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTBFdq3d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE2172BDE;
	Thu, 29 Aug 2024 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916484; cv=none; b=EmzR75KytVW9AP5xWS+FiQfU1skcjJb1WmdkeMjNr/lix/9XIDLXSV4O0A2VT4mHTyCE2iRx4bEOOJNLmpIYDeZpmAkYDts7tc9lsJR7mw1FUJWTkCTLcj/5oj0vi3xOATye/krp0seat1FeoTHwT0nDyjk2Zc6VLCqfQaVMRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916484; c=relaxed/simple;
	bh=VlX/40BVPirkQzE7Xw4pp67cDePQMsaJTpqIw3RI3nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVgNBODfNG7q2c6HiD5TmQNws9PsIrOWV1COtDMU8A4icGksrMrdoNDbD+jbG9HEUDrFWv2ehYfxZqzk0H0HIiLuW6Mj70j0zOGts0FS3DALIeFqw/nMkW+pQjFF69chI98aVnamT6vSzxQC4WYYisVkub5zZAqv+r9r7VU7hz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTBFdq3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55785C4CEC1;
	Thu, 29 Aug 2024 07:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724916484;
	bh=VlX/40BVPirkQzE7Xw4pp67cDePQMsaJTpqIw3RI3nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTBFdq3dvyyy2Yh1s6k3dHxbX2dWT/SNpPhX7YhYSgcxw7GP0GqYukgep99ElAjkX
	 KlIVs/XoA0ixazXO0bAsCVHYIYDgEGgjAe++qhBvVIFNCzwY+wMC/KG4iinSDij/Hv
	 74iwg4qFJzf5d4ZVp9Lm55PrA9BnK7gLvNhCJIf54b8c53sA7qqOCtZ6fk/mpR4btJ
	 GZoOGdwAiDFp83fsHOx0sa57I4szO7c7WY9jDlQcBwq9hkDiZ3DGprEwW3Yv7xJdqc
	 vMj3yFY5edYn4/++So9WGx6y+0/lXRHx8+ad77rwpJ2AfGMQ1As8Fj6Wo/X5NDwXil
	 vZG1KFMQTfwPQ==
Date: Thu, 29 Aug 2024 09:28:00 +0200
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
Subject: Re: [PATCH 08/22] dt-bindings: interrupt-controller: qcom-pdc:
 document support for SA8255p
Message-ID: <xopc7gi4gvk5aagwp7i52d4fao5bd2yll4nhl3pfpaej5qrkx6@ifqbw57imuj4>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-9-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-9-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:07PM -0700, Nikunj Kela wrote:
> Add compatible for pdc interrupt controller representing support on
> SA8255p.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


