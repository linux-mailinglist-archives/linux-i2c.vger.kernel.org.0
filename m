Return-Path: <linux-i2c+bounces-13267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB02BA6FC9
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 13:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1AF617C85B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 11:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3332DA757;
	Sun, 28 Sep 2025 11:22:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F1225D6;
	Sun, 28 Sep 2025 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759058547; cv=none; b=aeTY+LeQ1rhSZjcr8fAlLfWLNtPoignt6CBziECV6WGJs0K8GzqAbvjP9dMF62oLFwy3O9B/paxcnnNGS3K+fahWztRLtL1HPCh6YrlWeblRI1kdmmjeJfYxErenwxWzjp0ZynVt/R4sscpfi8pSvk12efFOqM/LQ4kCRfaVNp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759058547; c=relaxed/simple;
	bh=Ga7JoScWWQ5hSyoU6g5frSzXdDVHXzOAdi/wiib2Y6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OO2hv9aI7qCtCwgdNmehF3W21s/H8vjXlJfjvbyrksx04L1m5Dtd7rEhC0NnLPa0R4EGaqS50qSd5moDFKyk4jSCVcY0SFtfmmNF42RM/E8jVw1TQJXFp54ZXmckOAt+dEBlv3f/S2o6S5mk6fB/zcuZUiI4NNUooS+N2oHlpDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0147D3408A2;
	Sun, 28 Sep 2025 11:22:24 +0000 (UTC)
Date: Sun, 28 Sep 2025 19:22:20 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250928112220-GYC1346428@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
 <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
 <20250928025400-GYB1330052@gentoo.org>
 <11BACC490411452F+aNjtSOiG31hX_hrl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11BACC490411452F+aNjtSOiG31hX_hrl@kernel.org>

Hi Troy,

On 16:09 Sun 28 Sep     , Troy Mitchell wrote:
> 
..[snip]
> Okay..maybe I misunderstood before.
> I'll remove disable/enable the controller IRQ around PIO transfers.
> 
> BTW, the K1 I2C patch [1] for ILCR as the SCL clock hasn't gotten
> any replies in ages. Could you take a look?
stop complain, you have to understand people are voluntary to review the code..
and maintainers are busy, unfortunately..

btw, you've ignored v2's review, no response, not addressed in v3
https://lore.kernel.org/all/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com/


> 
> Link:
> https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/ [1]
> > 

-- 
Yixun Lan (dlan)

