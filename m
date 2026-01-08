Return-Path: <linux-i2c+bounces-15004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC9D05D9D
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 20:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59FDA3061DFD
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 19:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9FC2F0C67;
	Thu,  8 Jan 2026 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="QiMM6fk7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A52EACEE;
	Thu,  8 Jan 2026 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900125; cv=none; b=SljGiQjzsXpfHZyOs8ww0CGjFZI7b1mtF0/MSIqiTX9smSFEPpBLD1x4BaGWBJOO/3Cx+EwI0qdbFZp0i3hRMy7vCF19Zoe57ZHOkju2kT0nbuwsTS2whVQNeizntt/Kyuv0ZYIeiqf19Oc4J5mNYKsCNrj0diXQQqLpiStmmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900125; c=relaxed/simple;
	bh=p8ObGoRxbImnY4q7GlPHNacLGCJyQrUgtdSG6WhlyiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CExsoNXhcPjfLViXZl5Fl/Vdhpn6iB/CHbaJ6blWURha3NXNwiNk2jwuXshTcnZkKrHJ0u8yFzq1icHwJ7G+/buPtrnrbEnnuD0SK5hqp4KGA5Gx8B2vYw/Rapa/kdkWynoOW+Ab/uOxwf5rjhSGRkQmnGuLusrNE4RuP3PPbMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=QiMM6fk7; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=YHcp+h2VUjdsQYxFOp8xnsLAusAj+PKGkVJ8VCEN8jQ=; b=QiMM6fk7P632nZXkeO0KqGp62r
	2QojtTrOINRsRtIbq6JbxxBIUE2rCrOPx7fxx012UZLZxZYJXeJgFldzON2JVBOMtvtFaYbttjlZN
	r0vYmusF+uUXaw5KAQWObMMc41MQul1ujrQa0H/azINTQDhM1n57eIg/b4vlrhOlcEVXegZEM7KuF
	vhJ+AZoegJ+ZmZwAkh042+l4gYW6kVCYS/flMRHq/bbQZHhNIYG5Fv3TROSj3L0qU9q+UgSNyU/kV
	cxKTU3yMvN45rA3v/2YrcijbWkfEWbHtsHyPs84RA3BBfxNDLTFnVqlYLoPs9N3CYAtH5cCF8pVWg
	rbOZ8VVA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vdvZq-0000000GW09-34rS;
	Thu, 08 Jan 2026 20:21:46 +0100
Date: Thu, 8 Jan 2026 20:21:46 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v6 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <aWADytTOgMd9Bp6m@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2026-01-08 15:52, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: move i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1
> 
>  drivers/i2c/busses/i2c-k1.c | 314 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 237 insertions(+), 77 deletions(-)
> ---
> base-commit: 003e84792ce811256114dee4f4ecc1cafdab2b0d
> change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Thanks for this new version. On my side I do not have further comments, 
so both patches are:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

