Return-Path: <linux-i2c+bounces-4908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE5E92E498
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3699B1F20FF8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D35315B10A;
	Thu, 11 Jul 2024 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbB6Cqsc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB69148847;
	Thu, 11 Jul 2024 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693507; cv=none; b=clq02C/oA83GLRzGCWljCfxZWUWUSGzWHkRdTC3LGd7sWoCTNmaF+TDVjYshcy993VEpSRjYhk/dXuQEV8RLt0JerAEnzAxvL5k5OU+BCB2XedVC2VLroB88ksRdqMV8zlwIedZLHiQHAyI5o/UzSbs/pbgBBWbrYYWKsjHfwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693507; c=relaxed/simple;
	bh=WeM6iM4EOqzayaRe8zACfmn7mvFfp1bB85uOOgsN2jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwOeuTF3UfCmk3s8bnc4ulss52+99dQ1y/lPOFNPx1N6rvmWtUQ1Uys6mctLwGTNxjIeIoN3RDWw7s9SGx+NDMeWYin3iW0+0/FkktrHUM1Amv1321zqaVyNbQp8LOIlH9CchsN+nUttSnzfYDPKtfXPizBG2WpzKzeDKqYnlPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbB6Cqsc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE48C116B1;
	Thu, 11 Jul 2024 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693506;
	bh=WeM6iM4EOqzayaRe8zACfmn7mvFfp1bB85uOOgsN2jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbB6CqscgQCXb07W811QzmD/CvyPQd89VVRHMhuipiyh9Be907lPpmJJkRdyweXog
	 TPJfas4WcqZxxcA/Fow9vVwz44kov3786Ly6jvOfoXL7GQhHSf4lAduUNZviJYI7gT
	 qnIr08FDF5fCY6hUhzZUJ6wt41CQS1wBz/vRKuEPDndT+ztuCRw6JgCx1NC5CkRVxs
	 K3WNb7VK+EWh0juK1tTKg1XqNHT0W9LqNWBGlqQrPufVPhiLZl0s5vKVvLXRHz89w7
	 MLjed+M3sWtC7Am4Sm5PzZ9acha0KHXAoXX9hOGJ7/Q6yWAMme33uHDhkWTmkDdUD9
	 7WpEBiUETDoTg==
Date: Thu, 11 Jul 2024 12:25:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 46/60] i2c: sprd: reword according to newest
 specification
Message-ID: <2ymi22dwmbiycfircya4l7zkl53y6aexfteo64blmrrbb755lr@7misurceaoct>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-47-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-47-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:46PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

