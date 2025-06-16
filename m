Return-Path: <linux-i2c+bounces-11487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26043ADAD35
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 12:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 316EB3A4BAE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 10:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BF027AC37;
	Mon, 16 Jun 2025 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="h19Cefhf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603FA1E8337;
	Mon, 16 Jun 2025 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069280; cv=none; b=cbqx4jqZPt1FMyIYlxHzSONmDjbnSWN9KhuRj/f4JPRur2TO1Tkkg8PSM4RFWLgnxK+WvaGYq4iEkGfbPz8v21Ebux3en8DjK/DT9uYy5XwpRj2D/IJvRBru4UPkzVQQsB996v9lB53eWZ/NmDWEcrkjrjnGtQBF87xDikOcK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069280; c=relaxed/simple;
	bh=NbJoM5LfG3qBcRohRdPVhQO3z/elUf1FtTUs4Rnoxr0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNODtTGtzjkixWqbukAUHSAs9BX8GKpvh5VoKY+zdFcBW0lVvDPEspfV0RguK2tK5gmlM1vw/nBh/zXHConza2MW+QiN5yww9NUChFHd+pLqEz6vSrT5r/dPyYDym4wwKtqkqTDHNGGjuc4KUQPXzhpQCoMDGj7lhqQBl578i/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=h19Cefhf; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750069278; x=1781605278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NbJoM5LfG3qBcRohRdPVhQO3z/elUf1FtTUs4Rnoxr0=;
  b=h19CefhfdfWVr2b052T4xa0BogZfmikdaZYYRFJfuiNy+CtTIJqsrDBD
   eRzFqO5H9rt7DMpS3bJ5daE8SUb0CteTl8nYRNa8UTCRdyPweZMMV2Woz
   /zwfJi5hTY0ApxbfXeBKuF3pludY16Q9ROTSkoPK9c/kSw6zcj3wkTOo0
   fo/KLHcWNj/cwdsaODJROeR12ukVZuWgeqcMYZ0aCWh/cJKu3eInremIC
   7hBPjcEnOi72U/fQn0dSFdHd3ZkP16op7T627PkFSUxFGosF69ya3kMHI
   e7/+MlMpayQJJpJEd9Ac4FeO157UmPKSCqD0RNzmY7CDp+u2AB52mQPEP
   w==;
X-CSE-ConnectionGUID: NkMxLeT9QaGXvpWNNipztw==
X-CSE-MsgGUID: 7tHYdufdSRiWVAqsQ/5L5Q==
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="42842138"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jun 2025 03:21:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Jun 2025 03:21:07 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 03:21:04 -0700
Date: Mon, 16 Jun 2025 10:21:03 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <vkoul@kernel.org>,
	<andi.shyti@kernel.org>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<kernel@pengutronix.de>, <ore@pengutronix.de>, <luka.perkov@sartura.hr>,
	<arnd@arndb.de>
Subject: Re: [PATCH v7 1/6] arm64: lan969x: Add support for Microchip LAN969x
 SoC
Message-ID: <20250616102103.faoc5tqp22we67zl@DEN-DL-M70577>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-2-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-2-robert.marko@sartura.hr>

> This adds support for the Microchip LAN969x ARMv8-based SoC switch family.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  arch/arm64/Kconfig.platforms | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a541bb029aa4..834910f11864 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -133,6 +133,20 @@ config ARCH_SPARX5
>           security through TCAM-based frame processing using versatile
>           content aware processor (VCAP).
> 
> +config ARCH_LAN969X
> +       bool "Microchip LAN969X SoC family"
> +       select PINCTRL
> +       select DW_APB_TIMER_OF

The lan969x SoC uses the clk-lan966x driver. Would it not make sense to select
it here?

  +       select COMMON_CLK_LAN966X

> +       help
> +         This enables support for the Microchip LAN969X ARMv8-based
> +         SoC family of TSN-capable gigabit switches.
> +
> +         The LAN969X Ethernet switch family provides a rich set of
> +         switching features such as advanced TCAM-based VLAN and QoS
> +         processing enabling delivery of differentiated services, and
> +         security through TCAM-based frame processing using versatile
> +         content aware processor (VCAP).
> +
>  config ARCH_K3
>         bool "Texas Instruments Inc. K3 multicore SoC architecture"
>         select PM_GENERIC_DOMAINS if PM
> --
> 2.49.0
> 

/Daniel

