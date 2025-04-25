Return-Path: <linux-i2c+bounces-10629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A9A9CF10
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 19:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90BD63BE8F8
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 17:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DFF1D5CDD;
	Fri, 25 Apr 2025 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbiXFYKO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A031A316C;
	Fri, 25 Apr 2025 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600495; cv=none; b=qTLm23Cq+O03Mrb4mVECJZxCJRpJC9TiEdPHmjXjBI0ttgPhcB5e5TrCMYqtONWW2tyahGEUNVSxQrFlcc5ErMkxjbN/TQGN9c5m8jt/abTU6taJLSFxAWU38bxKonRZ/cQbkZzdnVxyaEY5WAVNrOmWoqMkQa238FiGsHsAz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600495; c=relaxed/simple;
	bh=o3dYBhxjf0WGilAR1KMtBP5RFjQHYJBqcJpRGhG0CVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jS/2UsSk+113jllm1IpBAA2fY5cCqwrOJsZ4X2a3B6md1+mX7yNPb+VdQchNrE/WeVW5W3Z6MTX/M6HiRdtdLq0Y+qPjeHGceGDvQWWpX/0MRiw7eFG2uJi3MN51AcaSDnq665Au96LEYnfMIbsGdQx0JpdNkdwGXLb6enK6Jq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbiXFYKO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC89C4CEE4;
	Fri, 25 Apr 2025 17:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745600494;
	bh=o3dYBhxjf0WGilAR1KMtBP5RFjQHYJBqcJpRGhG0CVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbiXFYKOzN7mlN1gSyn9qXy4MBmsQ4sDFnhN7qsW/VyeDOv1ctdB1KAs9HbqkZ7qC
	 EXUGatJ7OnDSik+/ddiNxxBmhty5rsHzhb5Fs7pVivhUbbZLut31x32qYWaFQNkrOP
	 HAnY+J8jEnNzCaiMY1PjvHJ6qrw+F7wQP56eVz/Y6pU/N+CWxWUarvt5hLU49rfO6a
	 SfJJpuYMRJk2JPb87TlxDPuRkqkCSPacMQCKZ9+h7NLOHkr10sH3kgl275/SPGRhfg
	 MnT2hpv3+kNw9SUCsiUCbKsbEdN6cInN8lVQLVfov4sAJPV7U3/44Hl1rxPoNUNi7l
	 fLvru7aB61soQ==
Date: Fri, 25 Apr 2025 19:01:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity
 1200 MT6893
Message-ID: <xbskx5w4f7nxtsugmnp26hpm5bneo7cheurvf6wfpfdrt6rxqw@4524hwf5w4gy>
References: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>

Hi Angelo,

On Wed, Apr 16, 2025 at 02:03:03PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek Dimensity 1200 (MT6893) SoC; this
> chip's multiple I2C controller instances are fully compatible
> with the ones found in the MT8192 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

merged to i2c/i2c-host.

Thanks,
Andi

