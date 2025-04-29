Return-Path: <linux-i2c+bounces-10674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E43AA0580
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 10:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C371E484831
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 08:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C1729E071;
	Tue, 29 Apr 2025 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbhOeGs5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4BA2949FB;
	Tue, 29 Apr 2025 08:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914838; cv=none; b=TeWKud0cxxf89c1cNgbOVZLrN63DALVPXjIi3ISUKKov1iJWoQPKhWIH5OUBvUrdJRJT7xQd6drCEZ0j9tjmJHulQ9v2/wTe9PMgtsJNnlHYaY9Uv7SWLZ1p/5KM2GRzkOgX/uB3K14bVh/2HW951vn0c4hJEKt1m65KE9YhDys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914838; c=relaxed/simple;
	bh=rAqlEeY2Ob/LlJLDaCVezRDiR75ozTPIeV2/nB52+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/CHQTSfETNZWQMMiWwGLNQrVjNIpqpvGzhtrzKcwEehUo7e04jvtU1lHSucU/PZUft4lPhepgrZKbaIDupabrWOBOLryXowKrlGetS7MjEQ5FjZks4uaLnpprT9aPGfPWsDyFA7KN/4JIFmJ1pi2d24iGArPbPu7xyuRNmRxw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbhOeGs5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B46C4CEEA;
	Tue, 29 Apr 2025 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745914837;
	bh=rAqlEeY2Ob/LlJLDaCVezRDiR75ozTPIeV2/nB52+C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbhOeGs5WP1RIpjW5cIh8caOS7QhJo38dcGo4ivryLS1ZS98PL8xrtq6W1RnF6kS2
	 KMifMwmttIRwvDljBoUemDtEsAfDx1rD8d2nIozOxbgeswHWZEECbtZ7+D0ivu7qPk
	 lsHK6OWzO06jW6tBHfPLyMxq7eylq3DEoIUqBWrz+aZgYdhSXlSIimHhMZaoZ06B2s
	 LulBcZcsKAmJfik2x9osewbJ/UWV3+fC3H81OXUnkTPC9oVKf8TFeqrfY3A6PAzowj
	 WmoPKwipbWVen6sH613vxqyrPlU5Nc2Agr5HjJUPn2yeNon1/4cgXbUweQ9Fi26F0K
	 7V4TmJ1D/LPwQ==
Date: Tue, 29 Apr 2025 10:20:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, frank.li@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <ujjbteer3ripubpgmv5qsvhcoki5ibcp4im7vpnna56mbckacl@xxx52nayhw7e>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421062341.2471922-1-carlos.song@nxp.com>

Hi Carlos,

On Mon, Apr 21, 2025 at 02:23:41PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Deferred probe with pm_runtime_put() may delay clock disable, causing
> incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
> clock is disabled immediately.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

merged to i2c/i2c-host-fixes with all the changes I suggested.

Thanks,
Andi

