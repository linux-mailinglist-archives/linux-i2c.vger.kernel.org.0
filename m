Return-Path: <linux-i2c+bounces-2265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CE875A7C
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 23:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593BE1F235BE
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 22:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117E53D0C2;
	Thu,  7 Mar 2024 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4HYD/c/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F02E648;
	Thu,  7 Mar 2024 22:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709852294; cv=none; b=dcN4b/1mNhhLCNeUjJ1j2YoxPb5vyskJ8bQckAAB3SV0XWQqafIiBMIdhmEiAFxLQvrqEU/pJytSKt+fhpR0h9HASq7ADdoy47ALoW0HfyEu4gDHiRXgeSy0wQhdhi7B2uxX9XenaTJfuulIFlwoNpijzLwxKk/3VVfJ0M912P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709852294; c=relaxed/simple;
	bh=ZWeH/MoPiO8obvi1BBRa2tCTsg0i4/M7P33Jb8aeLXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv6ZdBDdcI806K8HnlIA1vGoc9TnjO6drJN5hUkulY+lja8bYY7hWrcdyOTx0pxoZSnApaKaiTpX4FNWA2o2sqdPeb1QOFF2GInZolqM6pbo2Af4c+moX2bnWe7wsLBVi67IqkunM07Ty3nhmXO+DvcfknRsmH8CvdpbVJba+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4HYD/c/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74014C433F1;
	Thu,  7 Mar 2024 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709852294;
	bh=ZWeH/MoPiO8obvi1BBRa2tCTsg0i4/M7P33Jb8aeLXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4HYD/c/wJycrlePvu+p5HaG8/6rcihDqcdPd7E3tNvltxk7hSUI9IaUs+70DZl6S
	 r5a97MVhOZULFYMXRtzs+4IoltexYw44FfT7+B8WSeDaIxDPgQZAvIOKC8Z3/mS643
	 UbP1vocXPV5Vgx4iaumJrx4DQ3wuULt0bFGPGR+rClVC/2bU8+zdMZHRsvkTmyY+MT
	 fSMJZhxidC2R4j0VCQAHOXugUY3Hk9r2300Amcv9duOtG4jQkjVEyXuDizat53SWzA
	 ZCkrRMBd/T7OdyOml6SgULzRxQjf4CKmRdo6AL686rc1a4xVjMUX0hdjrOwsCLj/dt
	 LfFwwFNeyIhbQ==
Date: Thu, 7 Mar 2024 23:58:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <cmtru4nvoab6g5emp2yrxnvfpvtrcsuna6dqsyewpagg3qmkau@r2zoj6vgslet>
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

On Fri, Mar 08, 2024 at 02:25:39AM +0530, Mukesh Kumar Savaliya wrote:
> I2C driver currently reports "DMA txn failed" error even though it's
> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> on the bus instead of generic transfer failure which doesn't give any
> specific clue.
> 
> Make Changes inside i2c driver callback handler function
> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> stores the error status during error interrupt.

funny note: this is half "imperative mood" :-)

A real imperative would be "Pares the error inside
i2c_gpi_cb_result()... blah blah blah". No need to resend.

> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")

I still don't understand what's the fix here. You are making a
generic DMA error to be more specific... where is the bug? What
exactly is broken now?

Besides, keep in mind, that commits with fixes tags get
backported to older kernels (this one dates back to 5.18) and you
should also Cc the stable mailing list:

Cc: <stable@vger.kernel.org> # v5.18+

Thanks,
Andi

