Return-Path: <linux-i2c+bounces-837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B7E814DD9
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 18:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83201F25495
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5923EA9F;
	Fri, 15 Dec 2023 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hfZM+JVn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F53EA7C;
	Fri, 15 Dec 2023 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BFFI0le006684;
	Fri, 15 Dec 2023 18:05:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=selector1; bh=o8wmc8jZJ9HQbVCAGipp3
	GioSJW5gynekkGKhCepGLs=; b=hfZM+JVnZHy055EPOr4149vy4dcFCg9P64LKy
	w7wMCp0KsPFEajGZgct+AUvmr8csun7aLoSnMR1bot9pi/kfl8VNb/QnpWNRTfsq
	bbbS5G7s5e0mJmAdA5P6wzj428bf2LxOb4D0C5rqxweIyY2m9XXuOxMTERnjCfzx
	IgIjv2RhGmQhJ/zDy7UadhGaSAm7mIpfFuWVFapfrJBjfXHTCACWq1F9YCEqeJ7+
	IP8N3ZH62f7fFQxDCDDqU3iOM35V8WCjmOqmsWs0ujV55HVWeJGxnBNS5mPZzP8o
	vBZf23v2vonN7ao1Yumk6/91YGq6jfq5Y4YliW/crfQBaDWjA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0hag8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:05:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09BE8100052;
	Fri, 15 Dec 2023 18:05:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1E8923BDE0;
	Fri, 15 Dec 2023 18:05:15 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 18:05:15 +0100
Date: Fri, 15 Dec 2023 18:05:10 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] i2c: stm32f7: enhancements and support for
 stm32mp25
Message-ID: <20231215170510.GA95783@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170223.95549-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231215170223.95549-1-alain.volmat@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02

Sorry, please ignore this cover-letter, will send a new one following a
typo in the numbering of this one: 0/7 should have been 0/9

On Fri, Dec 15, 2023 at 06:02:10PM +0100, Alain Volmat wrote:
> This series first perform enhancements in the way interrupt are handled
> and cleanup in messages.
> Then it adds support for the stm32mp25 which differs in that
> it only has a single irq line for both event/error and has a
> different handling of the FastModePlus.
> Support is then enabled within the stm32mp25 related device-trees.
> 
> Changelog:
> v3: - addition of 2 commits dealing with readl_relaxed(I2C_ISR) in
>       isr handler and a second one to use dev_err_probe during probe
>     - correction of SOB in commit
> 
> v2: - correct st,stm32-i2c.yaml.  Use if then else scheme to indicate
>       number of interrupts / interrupt-names depending on the
>       compatible while keeping the description within the common part
> 
>     - correct 2 maybe-uninitialized warnings
>           * ret in stm32f7_i2c_write_fm_plus_bits
>           * irq_error in stm32f7_i2c_probe, move the platform_get_irq
>             within the same if block as devm_request_threaded_irq
> 
> Alain Volmat (9):
>   i2c: stm32f7: use dev_err_probe upon calls of devm_request_irq
>   i2c: stm32f7: perform most of irq job in threaded handler
>   i2c: stm32f7: simplify status messages in case of errors
>   dt-bindings: i2c: document st,stm32mp25-i2c compatible
>   i2c: stm32f7: perform I2C_ISR read once at beginning of event isr
>   i2c: stm32f7: add support for stm32mp25 soc
>   arm64: dts: st: add all 8 i2c nodes on stm32mp251
>   arm64: dts: st: add i2c2/i2c8 pins for stm32mp25
>   arm64: dts: st: add i2c2 / i2c8 properties on stm32mp257f-ev1
> 
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  28 ++
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  36 ++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        |  96 +++++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  20 +
>  drivers/i2c/busses/i2c-stm32f7.c              | 342 +++++++++---------
>  5 files changed, 358 insertions(+), 164 deletions(-)
> 
> -- 
> 2.25.1
> 

