Return-Path: <linux-i2c+bounces-13218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F78BA57E6
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 03:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8412617FA09
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 01:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9101E1C4A13;
	Sat, 27 Sep 2025 01:45:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08303824BD;
	Sat, 27 Sep 2025 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758937554; cv=none; b=BAQMNjcYHkCcV5oUADrODTYYnPpLXas+Xm5L6VXJJmKk0Ql2e3he13JTA4dZxiTy8faZtUZtIFTp5wXuTYlknfNnuvI9aQb/C3bmEfOTQ2HzKXP17tDGpGHpXAJW113KI+K5TnZ190oBZimOym8s7xZ17JJYXL99HaWRCxSKW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758937554; c=relaxed/simple;
	bh=35q1b3LpctrOR4UzbWrbyWSzYFsg753V3Qnmmg+rUPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGN3IZg2qG+ucwR33qLF6bCkh0qEDTmzzG9/HCcJMj7J+bHt8eF+NY16gpfsFH0J7Rr2wBmzxcQeGw+mjB1fxQChryNVg47KmlESYboaL2dKByKjRxaImmsA5W1KktF8YwL0GFRtTUPLG+vMD4LZK/CKYW1BF9+TMP2rc5AcSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1C029340D0A;
	Sat, 27 Sep 2025 01:45:51 +0000 (UTC)
Date: Sat, 27 Sep 2025 09:45:47 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927014547-GYA1336612@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>

Hi Troy,

On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C with interrupts disabled.
I feel it's more proper to say
s/with interrupts disabled/in atomic context/

I've noticed that K1 I2C controller support three different transmission mode:
 non-fifo, fifo mode, dma mode

while you are trying to implement pio support, I'd suggest to think one
further step in the long run - support more fifo/dma + normal/atomic features,

Personally, I'd like to see fifo mode implemented before adding pio
support, as it will bring quite significant code changes, require heavy
code review effort. And yes, this will put more demanding work on your side
and may slow things a bit..

-- 
Yixun Lan (dlan)

