Return-Path: <linux-i2c+bounces-13641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E5BEEE3A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 00:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2DEC3AD821
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Oct 2025 22:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF3A256C6F;
	Sun, 19 Oct 2025 22:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeTfX/QV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D955D255F2D;
	Sun, 19 Oct 2025 22:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760913166; cv=none; b=SgMT1f3ldZlrAkA9Kpa7byllpsZ9P0Xsyt0BmVCcwsFpCy2Iulnhl4KTCPiUTpAnHgESQdVbAj8qhOYIJ7NDNuX9q/cTefIi57aIbaV1APrnpb+KlEkfP6CjlcEC/z8GP4xtx3QZ2djV2U9Kta9KpwbpJUUhZvM8J2tPP7xhGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760913166; c=relaxed/simple;
	bh=BQvePnqZSh98d/7LmjdaVdS2t1hzyGD0Ie/pACHXIZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grTVqIsJb5buHobLkq2r1iddHfk+4CxFF+wBLkCtzjYlqFXXMwMtp4319zjAP8e2tYJgp1+/+NOhQ+BWHnvGWnYUn35y9fgyXOnCkysGM7LQhvmZ58DSnkDEw6Kh8drsu6PsGOy2+mYUtid2LDdQo3bYsL2YWLBNDrCjukvWCVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeTfX/QV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA576C4CEE7;
	Sun, 19 Oct 2025 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760913165;
	bh=BQvePnqZSh98d/7LmjdaVdS2t1hzyGD0Ie/pACHXIZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeTfX/QVp4813TURkaORgH0w0Mt/jxYnmKmat7JPgTP9D/p5gL//oBlTOLx2SN1tS
	 88kkgMd+2IEBeTxOlv7vqurFge7z7XFp58eu6DWXsUZ4HZrzPkeEgy7zEe4XooWsJL
	 GGiHxKDLnE/a3n12ITkcR7slrQiM7wvKk8C4xAbmwaclm0lgsdyaLx1dTfMSVfdIc6
	 ITIarAniHwSEKlxBq3wAQnbN10L6loHSP4nLDk7x4B9riGMhLq07JTR/JBM7R7TGBk
	 Bf3GGWuhQecxTFqeOixOHB97mAOwZfb3kAcqijc2njhwgyfksERI9vGVSFGj2+ovTn
	 2kMKrWhYhJe9A==
Date: Mon, 20 Oct 2025 00:32:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <b6lafouoz6f6al5ki4oh7jj6gfpejwyh62sdrh7lia37sadd4u@rle3aw6grsiw>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>

Hi,

On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register).
> Previously, the driver relied on the hardware's reset default
> values for this register.
> 
> The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
> 
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
> 
> This patch also cleans up unnecessary whitespace
> in the included header files.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

looks OK to me. Yixun, any comment here? Do you mind giving it an
ack?

Andi

