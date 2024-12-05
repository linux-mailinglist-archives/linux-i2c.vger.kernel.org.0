Return-Path: <linux-i2c+bounces-8348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116479E55CD
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 13:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C00BA28877E
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 12:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C0E21885D;
	Thu,  5 Dec 2024 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCP674tn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC781C3318;
	Thu,  5 Dec 2024 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402952; cv=none; b=j31gp/bgo4Ek9Mr0Xz1CWsA+YwKSOSPn0r83hn4qdLODF6kG/phIF1xPtZoZmzr9WdmB56ajR+8eGKDgKbayCzHp5Nt9Vh3iAfnlbfmfgYgK9dIjBVHtNKpv2kSZB0pOmZIYfSzGTbkey283cPj5XvGRdJzdyAoVgdFw6Sm3JVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402952; c=relaxed/simple;
	bh=NX65WV8yGDARxy+vn58QtGbfHPztV3lEHWFUXOR1Bm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYxE1Qc93azPs1eyxhnoMOoWFCnOB1RkvTckplDAWZYuXAWSTQ8o41Ps9IThEHn6efh0akrzY+VFqJfBcoiLMdBVHFLXVipuPQTPQ2hLIs2vCLkrtWsGn/CAFb80sEfUJUUZHQHnjalNGOXv0IBDR1sGAdomN4tlbkYF8ZBYsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCP674tn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE20EC4CED1;
	Thu,  5 Dec 2024 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733402952;
	bh=NX65WV8yGDARxy+vn58QtGbfHPztV3lEHWFUXOR1Bm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCP674tnYTtG1/sShnPtXahYcZP9Pp/xcBbTpwDFSRa+H/wJ+U0npBKfuTgfj2sQn
	 SYx5bWtaOySE97f8VkeEmtLFjv2rRwP30KvJrcDLA6tJW5Zq+WTcJMBi3LY/bdOrc4
	 HreAAFtMOmfp14kAdkkceSlcnp8neyogzq/upGam8HTkVW17H0qEi0KDZ3ik0WNnzH
	 kVhb3wAhmz3W+hCfWpvFlATki+IZ5rqqBZyaOG0Tzt/uLFgAIaAN+hq2+Hto2Nl0Ha
	 pa5gMs2XLBC8USH5CcxQXXk1wIB4Z9BqP4z5XAzqinccNgMYipJGqrTCxrkMsVUVMs
	 6Y01IA5ZDt/Aw==
Date: Thu, 5 Dec 2024 13:49:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: fix divide by zero warning
Message-ID: <buy4r64ugalvyfqcctrq5l7ylnryjulf26yohgbzbnsy3asrbg@3ikvipa4keny>
References: <20241125141521.1612947-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125141521.1612947-1-carlos.song@nxp.com>

Hi Carlos,

On Mon, Nov 25, 2024 at 10:15:21PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add "i2c_clk_rate / 2" check to avoid "divide by zero warning".
> i2c_clk_rate may be zero if i2c clock is disabled.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

merged to i2c/i2c-host,

thanks,
Andi

