Return-Path: <linux-i2c+bounces-10627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A47A9C79F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 13:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A454C4A2594
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 11:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C6C241CB0;
	Fri, 25 Apr 2025 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6T7d/VN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CED23D2A7;
	Fri, 25 Apr 2025 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580557; cv=none; b=eu7HG3s9Q6AvZYr7J/wjGvpwUUORghiQolFVJ/9ZMA02F56fS1wO4Nlyd/G5BsP9p4VNbGGyYsjTbJraBSixtUfVJJnHgI+gdILWX3yPiuRPxdfyes2fMN8rlDndaZ/7uRjgpL5OgAIp2bCgBRnojXWJkwz+sJihY5qXt0cjtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580557; c=relaxed/simple;
	bh=l4pbyFyJKgsL7EPZcn7j6uWIxIOaHPFWYyhX+MyM2yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHVJyQLb96KRZS5Iub95sIFjfW5c+we6rO/LIIcA4pFtShL/M+ksLKk3uop82ioYQYyvwLY8giPuqOwTuRGNh67kF6cnHs6P2KU9GCkUT81HHlTRIeFYudp614wBQFRr2DyKpSJDckp0BJqX1U8ccSeZO4qC90Lb3wg1Qgu96lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6T7d/VN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED620C4CEE4;
	Fri, 25 Apr 2025 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745580555;
	bh=l4pbyFyJKgsL7EPZcn7j6uWIxIOaHPFWYyhX+MyM2yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6T7d/VNOP5MFUv8fVjNrVzwKe108c7cd2yUnFIDkAERZT0OAORlxukO0Pa6ymvh6
	 9jXRs814OZa8LyweGU4Ovrv/1l7oq6pGKM6Ge6iYdwGFxKwr9b2V85mW/2cqNS5W4c
	 uzONH+E5U7Mh1qgsOBBsRL8WD3dCXImD4FxfxZGo0mk53kfM6cZtnH/u+NEuWWFtI1
	 FU9zjuAyn78/x7oLfwRxthWiXuB1dcH564nhHip5b/8e3QF8MAojqeXhx55xU9c4tu
	 tL7i2YTSnlp7JvCm8+rGB0mhVY6wz9Y58KeeDDG7iK6qAXHpbVYjRs0hL2EBMHClAq
	 x2t++k7A+Wx6A==
Date: Fri, 25 Apr 2025 13:29:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, frank.li@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
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

On Mon, Apr 21, 2025 at 02:23:41PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Deferred probe with pm_runtime_put() may delay clock disable, causing
> incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
> clock is disabled immediately.

What is the outcome of the incorrect clock usage count? Do you
have any logs?

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Carlo's SoB should be at the end of the chain. Should be nice to
know what these are, though, are they co-developed-by? tested-by?
Why so many SoB's?

(no need to resend for this)

Andi

