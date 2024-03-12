Return-Path: <linux-i2c+bounces-2335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F96A87926E
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 11:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2731F22BE1
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 10:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894B77828D;
	Tue, 12 Mar 2024 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3qa8QlU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A382572;
	Tue, 12 Mar 2024 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710240597; cv=none; b=Pv21HCC4W1f0EfiZE2/GExDrud3XQYE61N+5rs+gEBK+RXfJrw7B0aDz9cBfp1LmnPFxv3BfWEeyOhzxTA8kmS09QiPjej2JDlQMAvCnw1OE1cckWt62v/kAjJlsuCSTOwnn7Da4lMXSSJIqxrZbrcbmfkLWycey/xLMw96c8UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710240597; c=relaxed/simple;
	bh=k7eWGMgPqwqZjBIDKNIRhhMZiM7PCrUCJpk8T5Qn8Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNtE4KSPAlhm0P387rEKqSgXr5L4F+7dU3vmdGD5G3mU9NaasxqX0fa9WvxwN/8TTpl6DZZ3nCoCBOstMZ2XA49EP0JFrMyN4ToW1fGICmVAxavvx2mRu3hjNMLbi/jAOwEdb37Rw9a7Oo8DGphCYKmHO5r4NHgO/RMdMpc6pvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3qa8QlU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9F3C433C7;
	Tue, 12 Mar 2024 10:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710240597;
	bh=k7eWGMgPqwqZjBIDKNIRhhMZiM7PCrUCJpk8T5Qn8Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3qa8QlUAH4tSzpbj7vs7UgKS7Vrt+ayvuDAk+I6fndufc4F5eIzBqETKf6LVclhl
	 JtZUIEwRCRsmynCL3OHTmYnY0u1pcqGvjb4ylRb7jofw4XVIsgH37oFZS8cPjBdAwr
	 RTFVF/OOp9WPVsBzBFt3nNU51J4JyrGF50ioThCMolaNzhG3WuoHsQj3d5GLlqvLnH
	 yMW60K6sg3/nEO5U5FRtRaIJ2wF7XCdTwQocncw4Z0Uev7vty0AyhlI9u5hXByYMRB
	 0wUr5o9/WVMab+ZigTmrhQ1h2jG12gLJZ9Hz3WQ0Lw04jXy/FNOm0l50hTKBacQuV8
	 nJQMdLYv+n2Mg==
Date: Tue, 12 Mar 2024 11:49:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <a5oiihch2yqsosq337hogqzd3r4ldgfrzub4m6kofheh2k3qjv@wxageydv4q37>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307205539.217204-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

> +	status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);

This fails here:

drivers/i2c/busses/i2c-qcom-geni.c: In function 'i2c_gpi_cb_result':
drivers/i2c/busses/i2c-qcom-geni.c:493:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
  493 |         status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
      |                  ^~~~~~~~~
cc1: all warnings being treated as errors

I will remove this patch from the i2c/i2c-host and we will need
to wait for the next merge window to get this through.

Please submit v4 with the Cc list recommended by Wolfram.

Thanks,
Andi

