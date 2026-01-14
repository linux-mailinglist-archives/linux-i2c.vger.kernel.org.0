Return-Path: <linux-i2c+bounces-15157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D8D1E9DA
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 13:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD72A304A101
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 11:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4229339526E;
	Wed, 14 Jan 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JDhrYuve"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288F396B99
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391976; cv=none; b=U5A9OW6Cm3tOs7Aib0bvS0fYHXoOcib6M6MerLO6kmooJoqXCaMcuk/q7vuZDbTiwNxqxuhcsL5F6EakcGeyQXTrTcaMB3pHYgyCKrCJrnwF89KktNBiR1rgZIdDIUbrwkvgnAO1rvihWKy8RIvPbZ1+B1FwJKbd06UJlpd6lUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391976; c=relaxed/simple;
	bh=2XvwYtXYU+Rubef0aBCZQFBdAsXFBc9YG5RxqQnD6vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmXf2s/kCvdVljoSjDcCOnFWDHr9gew7cnlWa35avzJGVMgEpCmOTYYkde7lIN2NbLeY2IB6riQHgTL+4s1OGxjMKgjrgGI4Cq74uRBafMAAuCt2VqReRlo8Vi6If/rL5YyNFT573vWHYbbdCD56UDRPJtHCAHeVN9PFDr6In1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JDhrYuve; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DiiV
	rnvzlQr5Cq67SbrH7P4Pzbq4h86xOafA0L9a+yk=; b=JDhrYuve2lN91zc07CLA
	Y4qtiPhz8jRDv/LHeSwZlAtmMRAPR/WCafJDEsFBOEm5UTxH3otG7ksevUj1j+Xe
	1rGdLnsbbX8xLeVRzR1B3YAjIEZAtGrP0i5lblpvxsPCgo5P6osaEmDMcMBxCBN2
	6Wo2+b/pIRRYIxOm/XEVPFIfthGnnav8+pLWepNqMx8tKKvaPhGsvccIVO1G8O99
	JU1Oe5e9CBc2k6ya3ffn+Bxaky0SmmxOqf2GQkcHVi52fm6rn+v90tRGSwFSyfTX
	4EzFFr6eJPuursUVdbLW4ckOq2d9LjNRem0fXkL+aAawmTdkWE+z8rZwaxPOss6H
	7A==
Received: (qmail 2115980 invoked from network); 14 Jan 2026 12:59:29 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 12:59:29 +0100
X-UD-Smtp-Session: l3s3148p1@HeXl1ldIIL8ujnsM
Date: Wed, 14 Jan 2026 12:59:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Message-ID: <aWeFHNiNuHLdhZrO@ninjato>
References: <20251121030030.1844530-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121030030.1844530-1-carlos.song@nxp.com>

On Fri, Nov 21, 2025 at 11:00:30AM +0800, Carlos Song wrote:
> EDMA resumes early and suspends late in the system power transition
> sequence, while LPI2C enters the NOIRQ stage for both suspend and resume.
> This means LPI2C resources become available before EDMA is fully resumed.
> Once IRQs are enabled, a slave device may immediately trigger an LPI2C
> transfer. If the transfer length meets DMA requirements, the driver will
> attempt to use EDMA even though EDMA may still be unavailable.
> 
> This timing gap can lead to transfer failures. To prevent this, force
> LPI2C to use PIO mode during system-wide suspend and resume transitions.
> This reduces dependency on EDMA and avoids using an unready DMA resource.
> 
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied to for-current, thanks!


