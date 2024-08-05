Return-Path: <linux-i2c+bounces-5150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C4694804F
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 19:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938711F237ED
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 17:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C736A15E5C1;
	Mon,  5 Aug 2024 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjN9P6Qm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1017C64;
	Mon,  5 Aug 2024 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879026; cv=none; b=CxEI7OnSTlZ30TI2q00juN6RBCLCMk3aX7TR/ggW0/Z80GkCMPn+OUhtEPwLYQGgi0TkDlwQSJ3c3D/72LXEZGkkehEZAnS4wOzbKTV58g2w2OaP5riSCknLYogUkqTvLyTiIUU3CiCcB9dITF+PJMjsBOaKfXLpGgah2Ui78bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879026; c=relaxed/simple;
	bh=HMmdU3ZbYWB/563oquMicHskGpOAbjwkdkx67Dh+ymc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e939AiB33YdVWT28SunhnGjSd99DTcL9Q4GX68DJQaClNiNvQZ6A8HE0/DKjMjtKmMqjihDXp2HHWEFQIdvxDCOaXP6tn/m2KP008csGWy8bjGJcs+L/L3hwHQWMA5mGczctr75GlaYbygvbM7fSZlymU122tx2s6zS4NRsIvy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjN9P6Qm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F420C32782;
	Mon,  5 Aug 2024 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722879026;
	bh=HMmdU3ZbYWB/563oquMicHskGpOAbjwkdkx67Dh+ymc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjN9P6Qmc1kvluuH/sYzLTgFD4e++TzSgq9mhGtEV3uvnSVBrX6n1mimRiy5/3bwl
	 Xq3R9wcz5TixZf4PvZJWGFjYy2iljuUNhXaAPkbnONXv/v0vOMtp7izSRyE8A+PTsG
	 pjJYqRIQ0GR0EsRngwCuFkFsZUl+74bM/X05oQTtWaASthLT96VKFOG1VRbQYXM72w
	 Wjlzk0I4Us19YR7MGRS+acG8jUCUwgYbpLmw7wp59PcFVzZ7ojKCEV+HXrx4qWVfJE
	 pdZkDFjcpzPJxKyOBdRNFCdgoebnFMgC2y/utWKA1P7yYsjOd7/L6JyvUJcxNB6+yK
	 +vDLcpWOWjilA==
Date: Mon, 5 Aug 2024 19:30:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: don't use ',' after delimiters
Message-ID: <gipvrndaja55f2fh3iwjvcenvdbizuzwrkcf6wow3c2y3pimgr@vorn7q2snn2o>
References: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Wed, Jul 31, 2024 at 12:01:59AM GMT, Wolfram Sang wrote:
> Delimiters are meant to be last, no need for a ',' there. Remove a
> superfluous newline in the ali1535 driver while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

pushed into i2c/i2c-host.

Thanks,
Andi

