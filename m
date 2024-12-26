Return-Path: <linux-i2c+bounces-8721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A839FC9F1
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 10:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D3021882F48
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 09:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85681CF5DF;
	Thu, 26 Dec 2024 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+7UbjyT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910BF154BEA;
	Thu, 26 Dec 2024 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735205390; cv=none; b=D7IbSZVyyFcbsxGzXPh0jSjo/xE4+k5K/aNzZp8fflYfEIFxB/c/itafXdkYB4t2RiBIiCHK7TuX2zQKSDRVT9Pk2sNdl1xNnfsSUTKOFJ1yTMF43Qc6PEPPC6ERvbecRDwR1Xv1r20S+aRtPcg8dzq4zGSxA0yXBek6Hj3N2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735205390; c=relaxed/simple;
	bh=96BkSEbj7UyusrdK9u7rlbacr75HohY6DDk6raWfaHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6i/V5cXQuiWZSW3agl6/X3WCCAX4pIyObf5v6J9FFd31/94/YFL3D2PZQYhqjTg26DvBW7GKcFUOsAPM+DG4kvfTmITdcOqY4iAmN34iqtKSPchTXRcvY09ndmLVaVfSIMGHek13+R8iJhu1pqjBpXLyK4XfdiQQsMEvt/emx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+7UbjyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966E1C4CED1;
	Thu, 26 Dec 2024 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735205390;
	bh=96BkSEbj7UyusrdK9u7rlbacr75HohY6DDk6raWfaHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+7UbjyTDXNltC4fEft0Qn+cK/1ZNWGUtNdTXe07qv3dyTSL9+wIsblvr+aFksbqC
	 P/Kt3QTS7b2ir6X+Eq0x7e1AgFvL1qfZdnGoafXuJecIIXxoi15jU51Y17iG+RlniI
	 Im33Kcu+LxsJp7OAlrgsp1h3qV9O7O9ixRM+imNw2Nygb+2SzpIEKROT/EK1ucS8D5
	 xkvlrCSOcqzuYlCTt/RYTyJJYtu2vKtMwZefsZ6e2G4d8HPnfpcCv8O2aNFGOeGgMm
	 PM9WyL+Z33jtAu+niH00CzRrb1IiC3M2YvW9/k3oGKPFsVEr9UFXzduYV7gpAuKQx1
	 VxysPHvJk8lTg==
Date: Thu, 26 Dec 2024 10:29:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v7] i2c: imx: support DMA defer probing
Message-ID: <zxsnqol4qmy7p5vxs525zf3xp7dwx4pqh4lbp2mz25kyaqr44q@n4s6mps6o4ub>
References: <20241226062521.1004809-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226062521.1004809-1-carlos.song@nxp.com>

Hi Carlos,

On Thu, Dec 26, 2024 at 02:25:21PM +0800, Carlos Song wrote:
> Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
> have not ready yet.
> 
> Move i2c_imx_dma_request() before registering I2C adapter to avoid
> infinite loop of .probe() calls to the same driver, see "e8c220fac415
> Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> and "Documentation/driver-api/driver-model/driver.rst".
> 
> Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> are unavailable.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

thanks for following up on all your comments! Merged to
i2c/i2c-host.

Thanks,
Andi

