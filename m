Return-Path: <linux-i2c+bounces-14903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 627D2CF541C
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 19:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BF3D30B0F79
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D57D340A6A;
	Mon,  5 Jan 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMIOXGxw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0AE340283;
	Mon,  5 Jan 2026 18:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767638670; cv=none; b=CkMUs9P+hupHd0bS/Y1nE51c74rrSZdvO50Bnfh+dt+hbEbf86NAM9/vpROXEHQJWt4Sq3Rp8SskxI8vlSwxMvWFSwVum9vRi0ICUdhDieSE1R4VBAwxMsr9wv8+yQe4VC4lIctjTTaNRnvW/mNxNSemy7wwT0aXR2XzwfGsM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767638670; c=relaxed/simple;
	bh=5q0yLfH4dcbPw7DocaLNS+0Kq+WDRXRsT1mvD3Ph4Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kN4tWg2/BCIVoTgLG2MqLRyBkrRK5MxBM2cc6wiSfAsPx6aLgSxHstVwzCR2kuS6rwG54o70IX/MxIOKcoaHSYwjcGcHnvD+r/90HPFUfnG2L63Oqo/8J1iYojdzvpW8WiCdqKFBGipUAfbJy6uPOPTyrbGevcDlEUNRUKv8nPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMIOXGxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBC3C116D0;
	Mon,  5 Jan 2026 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767638670;
	bh=5q0yLfH4dcbPw7DocaLNS+0Kq+WDRXRsT1mvD3Ph4Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMIOXGxwX3AOhzzmSSRX9a3a+MWD252fOjDPaC9ic3Liew1wJxwk2OCiFnk13s9ft
	 PZkodJl5v6KADVat8AVc4aoE0fSUpTyAqztktWUIlHqDf7Qiu2tyS0Gki5CmiQLoZM
	 UEMc4Vj0hqp3X2ZQqVp1mWwAiSN6ooo+a/PPz5ChrAGOST7+ZqTy7FtmPIe0P3wWB9
	 SOTyduXV2du/2921kmIkEJ/PxHuvCJ9Ybc4vtG4IvQ3Eo0vnbayIU6G1lv894TbXbB
	 C/CCL7EiS5NuwbLBNAMRvEp03C9qA5LR7bnGWLgTtBfDoUh/JfwSfjIP1iPo55D7bt
	 HDMRNlXzswXGQ==
Date: Mon, 5 Jan 2026 12:44:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: guodong@riscstar.com, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, conor+dt@kernel.org,
	pjw@kernel.org, troy.mitchell@linux.spacemit.com,
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
	troymitchell988@gmail.com, dlan@gentoo.org,
	linux-kernel@vger.kernel.org, andi.shyti@kernel.org, alex@ghiti.fr
Subject: Re: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <176763866898.3087767.8456165135860930088.robh@kernel.org>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>


On Tue, 30 Dec 2025 23:06:51 +0800, Encrow Thorne wrote:
> The I2C controller requires a reset to ensure it starts from a clean state.
> 
> Add the 'resets' property to support this hardware requirement.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


