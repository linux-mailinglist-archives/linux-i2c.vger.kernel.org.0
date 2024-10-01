Return-Path: <linux-i2c+bounces-7151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAA98BD6D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 15:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7934B1F23099
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CF31C330D;
	Tue,  1 Oct 2024 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QImwC3rm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E012C2E3;
	Tue,  1 Oct 2024 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789109; cv=none; b=MHd3OyZaQl68hJo567wSNfytASJlmnDI8z3ujVPPUJKPWmCc4ggPSuDHJmJYfnYFqPsylf8G5mquBJzF58sTPesQ/3EJ0UymnD0cbCzzUM66sdgDwaBPQKoRfoDFQVeJbgydmpJk9QBk/TlY5cPGEvtNM0Xj2UgFmOP/jSF+YJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789109; c=relaxed/simple;
	bh=jtKDRpjdK9jUbeCpp0LYmIoJsrHhJpELlWFxaJgj/Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nhjs413q8LUv26BdSOSZy0bNNKLRZ16PwquLuMwbbinAOfsQbozK/P8iM8BjvCQ4aiYnCA0M8ak5jkgfrLlxZpi7ndhD7c3HCVuEI7vSdLwD2BiI7t702IydAHB233xJDPiaYc++9iT9oij+55A7lmoY6LxavxamUw5qzU1LjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QImwC3rm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01030C4CEC6;
	Tue,  1 Oct 2024 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727789108;
	bh=jtKDRpjdK9jUbeCpp0LYmIoJsrHhJpELlWFxaJgj/Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QImwC3rm9spBvW4cijK7NY0oE5/B+BbG6ec6C3gJhTx0rXP11nlsNpykv8rUt2OfR
	 JlrY96M9RMsoFQOJ4zZEcQPKxtPmjhtoMvoZhi3SwnmH0XBcUnigReqR71RG7IDRkh
	 vDTgQKxCMY8w8880D+f8qy8rqkNcEVH11FwEoy5FoPwncx36LHbR2hwXOSoH2h8dq0
	 OZzJaxOrOl/8hLRVgkBcq5r2sSluGZ7pfzJRRL2+s30VJu9qHerFoeMgqpAR+4WyZ5
	 hxPR4Zk2kvOZ2TunZlGgRWP/3y2Nr0YErODHXYpojpOZ2YZQAdcq8m4oTGCxB+CK4O
	 hNh0edvagmm0g==
Date: Tue, 1 Oct 2024 15:25:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, shyam-sundar.s-k@amd.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: amd-asf: Fix uninitialized variables issue in
 amd_asf_process_target
Message-ID: <7v2bow4onf4y4dcegtloqxc5np7ces4i65ghcrlw6mp4f4othj@vksupiyyhc63>
References: <20240926151348.71206-1-qianqiang.liu@163.com>
 <cc527d62-7d0b-42f8-b14c-6448d3665989@stanley.mountain>
 <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>

Hi Qianqiang,

On Fri, Sep 27, 2024 at 09:34:44PM GMT, Qianqiang Liu wrote:
> The len variable is not initialized, which may cause the for loop to
> behave unexpectedly.
> 
> Fixes: 20c3cc299218 ("i2c: amd-asf: Add routine to handle the ASF slave process")
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>

This patch is fixing a commit still in i2c/i2c-host.

Applied to i2c/i2c-host.

Thanks,
Andi

