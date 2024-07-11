Return-Path: <linux-i2c+bounces-4931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEA92E8A9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 15:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42264B274B4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F9714387F;
	Thu, 11 Jul 2024 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBkA3xrV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C164D1E504;
	Thu, 11 Jul 2024 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720702826; cv=none; b=ZEitXQVEYkVWPndjm2xPYh9iz4AMHLsxJppE63BYZMpo0Mag2s1EtQXBYMjOpenWMHqR/eChEGYgtQysSIt0lv1jBgI/bFTEL/4GyRhpUofYZ1CVEjGCcbn2xVUQPxr+kFaNbZhTvgAGEd4kYtU3VpsdKNNCKCm1ZjmOtIOGZ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720702826; c=relaxed/simple;
	bh=Vpu8CZztmPG7J8yZu8ZmtUosFm+nm+vbCa69YtzgnHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jmx3ntz9+EdJQcRaXHuVS9Jta9B+aYieiIyFhPFZwiehP9xl488tXRLG4CYJIFXuVfeUGHYHIq6QHv6Cck6P5w0XbZRlGYo2RtFt+URIz6+l+dFjJd7kuNS5b1+Dxtk9/eFbPItYX3Rznga/61jMTeTtkmsdct8BEiW9kQV0ES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBkA3xrV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C1BC116B1;
	Thu, 11 Jul 2024 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720702825;
	bh=Vpu8CZztmPG7J8yZu8ZmtUosFm+nm+vbCa69YtzgnHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBkA3xrVVsRVzbwfe2ZJV7vhltYy9IUxmZoYcrWD7MTgvDZhFhwlngBOVkvgGrF6B
	 //P/4L2uHk9WiaeGCCV/DamWSrO85SO/Nk3a4+GO+M/85dM6bDCJzOPWr8Fc0J8rnp
	 eAShv3CRDfCUpB4f4RykXHj4XgwSd/qBL2D6yNw58i90+CkKZ23HY3PSQw2wfN3cSx
	 w4rOaLlIywVuXKnFKdQGetDk5ytETEin0wD8bnXe3VoubsiyzNc0EC454eLw0fo0VT
	 Y4hkoG+aEJYxcQ0aMw4IyGwai70Ag8plzddHNlBP9tUPE9BoQ/mb+SZEQWK+WY219v
	 ccGm+J/kbNkbw==
Date: Thu, 11 Jul 2024 15:00:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 54/60] i2c: uniphier: reword according to newest
 specification
Message-ID: <ge6ktf2v7oqtvj6hjyv3occtfsh342pbwc4l4i5mc7ghsl2ghk@4hch5wal4nbb>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-55-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-55-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:54PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

