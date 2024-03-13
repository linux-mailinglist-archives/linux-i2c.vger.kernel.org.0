Return-Path: <linux-i2c+bounces-2349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7587B238
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 20:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6658E282784
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 19:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B744AEFD;
	Wed, 13 Mar 2024 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bepm2M7I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6C1A38D7;
	Wed, 13 Mar 2024 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710359224; cv=none; b=VtMX0KLNl7lATve152gg6cuQ11NeLl3EAaNpvINuvKKm+ZpikKLZTuMWvNGYysHL9CluqFNZZIL5X3xKl/Ij3kPbdtFgR97u67ytD+mPSonBtgsKukYfrnQPWzhNgfpYGWmZlDorNM2ZKi7Uii5rScvgkUXe/95rzfs4C7YrjRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710359224; c=relaxed/simple;
	bh=8nx1MMxE37CMP/FBmCmmcRTdwd9+RGwykYBsdXB2gIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpfje1EiVaYcn1gw44aMVYO83EtHqXrQm2lXuE5yoyQUpOtGHrgcz97r4xTctpFb1EXBq+MAtAg+2E1A87Vzcj+t399xaj7KfA95stRrRDQOmY9YXl7bFxCBbUBggiGulkF6ehur1glV2Df4dmOk6ABsMoN1auHLOdGMnpTNokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bepm2M7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF186C433C7;
	Wed, 13 Mar 2024 19:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710359224;
	bh=8nx1MMxE37CMP/FBmCmmcRTdwd9+RGwykYBsdXB2gIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bepm2M7IEKVi2GgFwZHE4gWXbjwMXf8NGPcUV1rXvU8Hxh7tQSSf/wULrx/PXblx9
	 fiLlfRtLzszwgwAt93v6d7hbJRlLCZ+bBwnuiECxxQbfJUcG+kghIFVHA8z/8WmLf4
	 7CCZ1UAB0+0RGHbyKvpFVLlZuNczOYJ0YrfsbC+t2uTNpwibs1zUKgK7A7k9Hq5Lcj
	 QHEpJhZJOLVbomZ2lYQ7xdqahPjuf9gxsqfcC+0l9LTrDg+WTgWnLsnQEWZ57OK83O
	 so+cgsUq18Wktog7t2MX75UVkcRaQ3s/8iN9sZluzkJ8AcVQmTmH+ulTDiR9DG/B70
	 9mS01ZFShn4Dw==
Date: Wed, 13 Mar 2024 20:46:59 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <lnilroeg5c32fpqu2reg3s37qbymd37xnrrwcx4zw3bcc5lfe2@zd43lndyj657>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
 <a5oiihch2yqsosq337hogqzd3r4ldgfrzub4m6kofheh2k3qjv@wxageydv4q37>
 <0971ac51-f823-4338-ba95-3ceced9d2a1c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0971ac51-f823-4338-ba95-3ceced9d2a1c@quicinc.com>

Hi Mukesh,

> > > +	status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
> > 
> > This fails here:
> > 
> > drivers/i2c/busses/i2c-qcom-geni.c: In function 'i2c_gpi_cb_result':
> > drivers/i2c/busses/i2c-qcom-geni.c:493:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
> >    493 |         status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
> >        |                  ^~~~~~~~~
> > cc1: all warnings being treated as errors
> > 
> > I will remove this patch from the i2c/i2c-host and we will need
> > to wait for the next merge window to get this through.
> > 
> > Please submit v4 with the Cc list recommended by Wolfram.
> > Submitted V4 patch. Let me wait for the dmaengine maintainers to sig off
> too. Sorry for the trouble.

Please, don't be sorry... when something goes wrong it's a shared
responsibility.

But fortunately nothing went really wrong here because Stephen
cought it in time :-)

I missed this failure because in the testing config the qcom-geni
was missing.

Thanks for the prompt fix!

Andi

