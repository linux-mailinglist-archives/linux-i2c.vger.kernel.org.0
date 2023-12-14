Return-Path: <linux-i2c+bounces-813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95090813BF4
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 21:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56D61C20F4C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 20:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFC4273F9;
	Thu, 14 Dec 2023 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/HuxuFm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B282112;
	Thu, 14 Dec 2023 20:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDBCC433C8;
	Thu, 14 Dec 2023 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702586842;
	bh=XBTCrm9Z6noOhx8k4QP8cDAa4mMuvdKLjnFpE1hRFMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/HuxuFm0l1bqR4C04ys22yXD5H7eQAcwfXtdYpZxEm47IbFOjsZrSAlu7k5G8Pvk
	 CbuF5gxXNF4wfaScHrnIk6cFJpP2izcU63ByS33kQ4XstzOtxgT9mRAcVEEFVK7nFA
	 O6F0CssyE+ZOeoXOVPI3tmjPI5cl9fa1vZoWWxZE2+FwrUVE/NBSVPiUmpjs/ZaqAV
	 /sYL05yKGvyX0VXTR+d1intwu+3jWShrK/iLOJ2caDLS6X2FvYiFLAIKl6K/Lb0Lk7
	 sNH/sm8YIV9mGSVay50BOt+FGTTC2Ah8mv3XrENT/V2x+NNXHvDWa53n/gomvNDxAb
	 X7QoIsXEYHLxg==
Date: Thu, 14 Dec 2023 21:47:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: rcar: introduce Gen4 devices
Message-ID: <20231214204720.xfdz3lwdjgzvo7bk@zenone.zhora.eu>
References: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>
 <20231214074358.8711-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214074358.8711-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Thu, Dec 14, 2023 at 08:43:57AM +0100, Wolfram Sang wrote:
> So far, we treated Gen4 as Gen3. But we are soon adding FM+ as a Gen4
> specific feature, so prepare the code for the new devtype.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

