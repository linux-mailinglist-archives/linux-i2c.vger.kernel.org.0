Return-Path: <linux-i2c+bounces-14981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF09CFEEE0
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 17:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45BA83338B9F
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 16:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1091C398719;
	Wed,  7 Jan 2026 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MraVa3KH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B168E393DE0
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803045; cv=none; b=lvdkdXh5mMpQWsRfCHXnDOG2SkbM2IH2/bg6RodviwOIBgWzSb37lDA16ToVbEBZrpOiWyLHvwIknHXqs5g6pHemqsnj6DN1ePyCZFHjdidER3rniU8oD+KYFTkDgVRw9VLDVaiWGfS5ndAd2tz0MFavzuuzJiDuBM7cxKFoqsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803045; c=relaxed/simple;
	bh=W4uk1VefUHGlDNc1aG8OtJCVw9QNApBQ62yJf8MGKyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELo/DwGlr6P2nW9qy9UzPNxj21PEu6PsS12TfzDvPzoWY/eOd9pV+LhVmDeS7vLDXuq4p8l4VyoMC4fNYsBJ5cAJguQ/IlnGQg2Wb2gyDDPJPQyeCxbhapHYwGtEXO1RP1wBHdKW164bieTYaeXh37RE1u9y3XHP/t10oaZpULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MraVa3KH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0a33d0585so16901415ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803028; x=1768407828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ+7Q/Ti00gCIw+7hhy5kDVy5X0XQseCMCNmnyae2YA=;
        b=MraVa3KHZA1XVqpvfQs83ZpF/EEaCi2wnHu3xqBFe3Q/YCKpE5duHBhKQEz6KmfrG2
         7OE7Txu3InrutxUFHDQQBMcvJ9ci5AgOpCiHURQ3FVHwFQsif9efSQWjBXvFRDOzvcV0
         Dm9wX0LjsmMzTPQpdPnGJ86zTMuJIggVXheSpR5H4GhtUISe3eKDisMM3qdliUIk+Qcw
         mucWxoaQrd4sI3InGwMfHWX0ElcsWbWMcvPn4qXHuHSRNUDCZixhA0Q+oYcLbXSGQx7I
         U783IkgLpbVcz9SzfUmTG//GqdBxB7nOHnlgBGCeyx8cu9g1QyuwaxZq7Migg2niwuVB
         ewiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803028; x=1768407828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQ+7Q/Ti00gCIw+7hhy5kDVy5X0XQseCMCNmnyae2YA=;
        b=hdVvTjcjGi7wHVLfNzkyrUrLPAqgTTr24ELZ74q5FbaFHdefURIHQLNyel+Ewun7HJ
         QWtsQlNANVxZoRn7LMnDkPdjtTvv/Pgo/VgvHAs4+ogIiOFE/P9g4A/a10dq8ruUYCwT
         ko+wkp4SyR5HN7ju+QCl4UQAcyOO4/KmYAlPEfAEYjTq8lp73RyFG3vOeNmfgyRD8DPu
         NBLUz2o6IDv5QUe/koib3yzXJR2FCzQqsU9sziEJc/kMsWyvsA9Q+pUR2mif2P2TQbD6
         MwQy+JurfJPyXg3DtJNMd8aUWzqFSEPVGvprPxUC0t4jLbQElOC+UivsSlj5hDlA/OlT
         +FNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpPlAcXre2psnR/DJS2sZR3S6UdwY0YBn3VVcC1AX5TP7rv8heNJxUmvxTA3vrp2XruFmBbdXu1sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfzHd2oTVEFFMswGsYkkBfwQD8wixmulTZ0G7FU4X+WiKZ7YhV
	BXVTXuOnnrVB4KK9+wxfrXiE6OKTB/xcDux4TH0BP9SkDwntsS5fNLfv
X-Gm-Gg: AY/fxX4MeRmDsHrNALLQdDohDDvLgbU6Q+hpBPiN5CTSLsEGkNLOY3PFbq5wbJnEEZn
	uVjl2J3dL9h4QIkkPCn2cSeoeBvW9c6WHVYj+FCQmqM5pR5706mkJ5JoynFV9sRR3ndVWFQl0Ka
	DUMYs/w9sbOGRDEYvnjTgZ88WIJgXwGeUqJm00tPqaSxZnZWSAoCpoIJ56gZaj/xSsEuVWgsUq+
	YzQ4K/i24xQXyp3hagCNQLMg7q6sVTd+qPDoY3XaZh2mI6CoA2zr0A/pIPVn0hWquznGkx0JW8f
	idzN542YIOTsXL5uKzUcxDabHcLKnIF2RKv2QgY1M0vaIiBcDsiEEhlj5Vywq/g+Dh2qFYyy33X
	i+qsSOj3TOexz6pVaMaDkBzBbh4q+PTmz1nbfMY5DVQJxRvTuCwkN9vlifjY/th2BvrAuurwHjb
	hkpfg=
X-Google-Smtp-Source: AGHT+IHaiHjB70xigUp/SSo/W4q9gkk85M7RPzHR2gkRrQPwVPEkFh3CLZSZ2WYZHlPy3Xh1Wb7TAA==
X-Received: by 2002:a17:903:1108:b0:29e:e925:1aa0 with SMTP id d9443c01a7336-2a3ee4a8758mr26237475ad.45.1767803027716;
        Wed, 07 Jan 2026 08:23:47 -0800 (PST)
Received: from localhost ([211.94.250.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a4fcsm55666365ad.12.2026.01.07.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:23:47 -0800 (PST)
Date: Thu, 8 Jan 2026 00:23:43 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <20260107162343.GA49546@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
 <20251230150653.42097-3-jyc0019@gmail.com>
 <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>

On Wed, Jan 07, 2026 at 03:22:42PM +0100, Andi Shyti wrote:
  Hi Andi,
> Hi Encrow,
> 
> On Tue, Dec 30, 2025 at 11:06:53PM +0800, Encrow Thorne wrote:
> > Add resets property to K1 I2C node.
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> how is this patch formatted?
> 
  Sorry, I forgot to add the version number when I resent it.

  The initial sending process was interrupted, so I
  manually regenerated the patches using git format-patch 
  and sent them again.I have verified locally that the 
  entire patch series applies cleanly.

  Please let me know if you find any other formatting issues.

  Encrow
> Andi

