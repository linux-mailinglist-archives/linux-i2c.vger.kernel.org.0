Return-Path: <linux-i2c+bounces-2900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF318A14BC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 14:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9FEB28A3D1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 12:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FF48C09;
	Thu, 11 Apr 2024 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bhd4psLl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB84683;
	Thu, 11 Apr 2024 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712838996; cv=none; b=ZXBbDHkqhLyp4vHOn3D/J6I/CPj9uxDBCtQndZ2L+/PG1uXYT9R+hnCeL1KK4lD5iI6LHsX4pP5Zo4wWPvjjxsAj8Sj7j8ayHSPwoamMR6Sxd3+dknOiVwNWcFtEfLyVrbaCyCV58odPeGAGjhAnQ+X5iiMHrNjXYmqHUzsa2lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712838996; c=relaxed/simple;
	bh=9WbGxfE5PYlgXvD8VxYHuYDy1niiS/0v9CNOAh/N7n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh6ogXuHrNydLUckrT6SGGSvUyNAI9mMKMqxTudx61NyYP5k01cPRKTda3CEdsvKJEWh2/KbNzZJThrQ7tmrA3hfyoDU87WHNKIOeAaYdZL8MJ5d0/cqwBUYWAdmz6mDbDmzDaGhDitM+MP6LiCOSLYIByE4AXp9hMuNwMZYBH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bhd4psLl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51931C433F1;
	Thu, 11 Apr 2024 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712838995;
	bh=9WbGxfE5PYlgXvD8VxYHuYDy1niiS/0v9CNOAh/N7n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bhd4psLlx7juY3ukr1UqAMsDW98j1XaRyooFcVisAsLK6l2txAX9KtxumX4INPDyM
	 0MLRj5p3n6sNDHN18Id+SPKuAiJp0GRtEKSBzYim7if5NpfebXBFg5K+vDeghHbHXc
	 FEWgrHI5wqZmtCiw5QxbyOxi1TAaWivQMAWmgh0IDtDPY1AiNaPllbudW19d8gA+ys
	 gtkUofepnz09qfnCgny1dhRIRmyrL9kAYNLKGpTWuY8sDqLRtkwgTMsgNw2IR08XxN
	 cgYeSKS4x+pfOonAjfvro5O5K5BY/roy7uEGtNyULVakpVr86dgrBdrSJUjdyZPbph
	 6fXOJQk/40dEg==
Date: Thu, 11 Apr 2024 14:36:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, 
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
Message-ID: <whpjtk2nmbft4dqndhealztzxh5du4uemqmmizguwvhmfa2htm@qcklwqf7j4d4>
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411050257.42943-1-lukas.bulwahn@redhat.com>

Hi Lukas,

> -F:	Documentation/devicetree/bindings/i2c/i2c-pnx.txt
> +F:	Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

I guess this should go through the arm folks?

Thanks,
Andi

