Return-Path: <linux-i2c+bounces-10261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB51A85C34
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 13:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566043AF3E8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 11:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE66293B7C;
	Fri, 11 Apr 2025 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="MT7mrBDC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01080238C34;
	Fri, 11 Apr 2025 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372067; cv=none; b=j6nqc862pA0s4Rb+R3YRVeHRQ6L2PYaJhXLKp7OBV7zgBl/3kmiICe7GewoHHV0R930KYUQ95Gsji/CkvLa9RIfA2tOOVSOE16uV4i3ZcnYxdLyOGBPIdUKh/rD5+QizQsnriln+D5jxN227W5m/v8MS+R6YaRwI2dPkuXgvZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372067; c=relaxed/simple;
	bh=NeMab9c/Kvu9uChLk+sPesR91tAqeTJtm6StHvoL9Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmuTMjAPDHmcRpWL3Y49norZ68Mcu6DljhEWaB3RoI2/mmJCSyFeD4zj/SVnuJN87eg1sPFxXyIkjwjdtVr3FT5Xh+XqkjinUGR086SZO0EyfWUDskZqAKa8/+B6Twig9hKa5spnpgverQoEkEaUV9+Zs/6Rtv08WzzNDEeG4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=MT7mrBDC; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3A0D21F998;
	Fri, 11 Apr 2025 13:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744372062;
	bh=6BdoDX02yA4l0YqlCA+cgnYBFlW3ntWEuYftz+GCH1k=; h=From:To:Subject;
	b=MT7mrBDC3FJk6ZgLxtNGgMDefBqrNq+r2oEhmmlaC5HeztAvBCqVglQe4wI5+L6b4
	 TmLSHVnTBp3gy/uVjNtRPZDmbCE00wiW5KSP0Baajr8RvHuNOv4rI0YPd4boGL0tCU
	 qkd9xXq4xR+TTG/fYGOzMnqDH8f6LGpa6f1vr17ixYNVbUsIKFcG3yLyNhhkpuGpB6
	 X1RmdDLdrLKBbq32GM1uLnbk/BAaiJDBrNHnldi/gm+je8YprzK0eUDsrYezXQIGFh
	 kueZ5Pv6+/uCqkx7Q5YEQqkLYj+NaZ7vwVURk2FQN0dUlizf2sAKnIMYIuisuEUH2D
	 mcdkk5X5XIitQ==
Date: Fri, 11 Apr 2025 13:47:38 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <20250411114738.GA43965@francesco-nb>
References: <20250319145114.50771-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145114.50771-1-francesco@dolcini.it>

Hello,

On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> jiffies do not advance in atomic contexts, so timeouts based on them
> are substituted with delays.
> 
> Implement atomic, sleep-free, and IRQ-less operation. This increases
> complexity but is necessary for atomic I2C transfers required by some
> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Any comment on this?

Francesco

