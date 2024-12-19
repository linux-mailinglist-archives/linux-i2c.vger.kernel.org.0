Return-Path: <linux-i2c+bounces-8634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A79F79D1
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 11:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA7616D9FE
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B929222576;
	Thu, 19 Dec 2024 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgKWfre8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE251208A7;
	Thu, 19 Dec 2024 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605454; cv=none; b=OmfNGmknK5GuWgHnn/uwpVMjCm9Q54r8yP9DA0LEP9oesa+3hQLaEZQdwuXR/lFHuGNjg7djCdYobacDye0PFSs07V1yKy13gIYGI6HolXfeE9zSOWzt2wFXA/1i4t7hPzUgo7UkYvtH353H0WNIKca19TQT8RXHbPSHRxW/riI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605454; c=relaxed/simple;
	bh=+jKPb1DiLgdqyf0yAd9cWxMvSxidTaZJTgk8dWiYFWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMgdbtEax8VIDkdKxTh7iAwX0sLvW5QijjGacKJAF1upZQeJORs2WW6A5Qac/Y+B410SDmbQga0gLE8vyA55COgmnyw/kQUP/+w1GHF2gzTLaSkLrxdO5oPCsIAQG6pEUdT2A781ezKjNUm4D+5GpP+wGmrMeOMMqliooGC2xz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgKWfre8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EC8C4CECE;
	Thu, 19 Dec 2024 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734605454;
	bh=+jKPb1DiLgdqyf0yAd9cWxMvSxidTaZJTgk8dWiYFWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgKWfre8ohxoaSA8FjHZFHHyo488aiCRBfOalWy9qXW/zBWa7o3iAi0HuXaHSQZY2
	 Kc5HAloqnZbcC71lMV40hSBGilOZLxwmMPpi5dla7bv4VaHvDpREYrFzlLAyz7bxXQ
	 3bTyYOLMgcR2mZW+T4QZURFeCyPnE652xr4P/XkJ8o2blSKKiYpF/+om0gwaraI/OG
	 PsYd+YAPD2zyUHKFZXynzvHJAvMPhNLotj+fGnmsmDkcGHDfVNKQqfmBOuVQYbNQy2
	 D6Om+/FVZ6EHmpIl+cx4qUzAQgKHRxvPDJlTCpwUhI9lVn/6NrbIIdKcC02gZg3Bqi
	 T7XW7XgxQrcog==
Date: Thu, 19 Dec 2024 11:50:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Message-ID: <zhl7dmzfvoizotjb567psnvyu34vee3hlrbsgb6uchshrj7bti@touezue3vqwe>
References: <20241218044238.143414-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218044238.143414-1-carlos.song@nxp.com>

Hi Carlos,

On Wed, Dec 18, 2024 at 12:42:38PM +0800, Carlos Song wrote:
> Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
> compatible string table, at the result, "fsl,imx21-i2c" will be
> matched, but it will cause errata ERR007805 not be applied in fact.
> 
> So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
> the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
> IMX7DS_2N09P).
> 
> "fsl,imx7d-i2c" already is documented in binding doc. This errata
> fix has been included in imx6_i2c_hwdata and it is the same in all
> I.MX6/7/8, so just reuse it.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

with the commit log changes, merged to i2c/i2c-host-fixes.

Thanks,
Andi

