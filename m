Return-Path: <linux-i2c+bounces-2656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAA08921E8
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BD601F25098
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 16:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6195852F61;
	Fri, 29 Mar 2024 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jggTfNMT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5EC3613C;
	Fri, 29 Mar 2024 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711730729; cv=none; b=loWXEhcph9Zy+6KRCSMBV/yc2hehVMN13l3ZtzchzPjucILROhU/tUGezZMfy2Re/xImp2hLE0e9v/mwG8eTDFvWKIQLIZ2cbwlQzkoGuo7YAkhowMTKvXgIMqQAMVG2O6MDLa/UzAHGgZnOiyL46/jVPSsHnaIFSeKXFKStXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711730729; c=relaxed/simple;
	bh=/LGwy+a6PttgrCg1DdbffQ69croSPBQk2G5RjbG3jpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRHBr5oc2uC7q4VU48n0xgaKSHsDBcabW0F+gmPvQzFDS7Z8uri5ZVp/+RPZn3Vbih4wRvGQsyCIVf+JV8ppm6ObpbisBXV38a6c67tHqVDV8WKw+zyjP5Zsr4fIXSCCp4Ad6ADCeNlXDzX5fB4E7cLUXxkwpzHpADh4v6YHZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jggTfNMT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB439C433C7;
	Fri, 29 Mar 2024 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711730728;
	bh=/LGwy+a6PttgrCg1DdbffQ69croSPBQk2G5RjbG3jpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jggTfNMT17IKwvzb3Hqukd3XSp3edS6mZ+raouDn+O36b0jhgVSUFzsgu9c1PdJ4Q
	 iPyjGZicbXoLE8/zdEo+yOp06wKtPG5cj1vS8VbVAq0S0/OFoQMpdxkakoDiVuvAyZ
	 YgWSu2JNtnFjUzXYb/IVsclCYmEJtm+bZq+0tr9L/GCGu3eMZiBlJM0uUF9RzyO1SW
	 juAjP5h/rBaZ67pI73jVat0PxnIrY+ELEspwRdGg3Vxubh2VdE4pUugjigXszxZAFx
	 tiQZm5+3/DJx1em7EvKCBlah0QtM0JXDy3VsG5/hTj2r8NlZBiEqiqcG1sN9vEaf2u
	 B6CBLpvSu+OAw==
Date: Fri, 29 Mar 2024 22:15:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, wsa@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	quic_vdadhani@quicinc.com,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <ZgbwJAb7Ffktf554@matsya>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>

On 28-03-24, 08:36, Andi Shyti wrote:
> Hi
> 
> On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
> > I2C driver currently reports "DMA txn failed" error even though it's
> > NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> > on the bus instead of generic transfer failure which doesn't give any
> > specific clue.
> > 
> > Make Changes inside i2c driver callback handler function
> > i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> > stores the error status during error interrupt.
> > 
> > [...]
> 
> Applied to i2c/i2c-host-next on
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/local tree

You applied changes to dmaengine driver without my ack! I dont agree to
the approach here, we could do better

-- 
~Vinod

