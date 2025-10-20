Return-Path: <linux-i2c+bounces-13665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1EBF02DD
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 11:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92E224F10BE
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4872F549F;
	Mon, 20 Oct 2025 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRhRdzVc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D618D2F5499;
	Mon, 20 Oct 2025 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952529; cv=none; b=nWsZhW0WjD/xDurRscb3CyQPx4J8e7prDcGuTaFMnZ+dzubJXagCVcmXXQiGtw6Q9bfTx5Pom4sMgSGm75u5SIF6MiPl++dlyB7sx2eGZaxX74ffoCYKbLad7UxlPLqSCETyKiFRkZo1qyOb6eQWjW0ZGKB/DnvOUGzj6r6pMIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952529; c=relaxed/simple;
	bh=zUL6wY6nUkFC7RGRQqooEtBqgzEkwxUZ3UEDi7LPXlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBjWV2bMapVRxwXKqy9IoTW1GLkiFd9/INGFBY14Qruno5FE8y4cBlbaGm+XmTPsChsQMzQOlpotmsgDVvNVhsLSV2rMgtPxRlVfNxRUMUJL0ukR/GnXarc7Y3A6pKUudf9e7e4SbUQsl+OJRdtyrJ+/RDntN6CdtTsEX3YD2t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRhRdzVc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F17C4CEF9;
	Mon, 20 Oct 2025 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760952528;
	bh=zUL6wY6nUkFC7RGRQqooEtBqgzEkwxUZ3UEDi7LPXlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRhRdzVcMB61IB7i+p7RSXbRZlUCKKayYcJwSONs+XbN4XoXG/ee4IREKqIoxdShg
	 eLEgFxXzkCoOcTA6DT+0ugxnjH45NcB+U8AP+ouCyjqJqZZD4jrTGEhnt5jyqi2OIy
	 lKmOwMNQwNSx5o9FmVIGJZ02lJfEMBln6Mk32N+Pu6LP3LgcmI2V1Ltcb6g4Pke+8Y
	 dd9v0HkBiblXFkoSJox3HGDrdP8I/r915gxMOmFg63dIIHmfNV0mRW0RPeQqgwEhtq
	 iJ2Cr3nwYFY/zxgFhPYfsFFxuR9o3kgDJyf26j0jPBPSJ/28pWyN33VqkctenYdaTB
	 +1NazHpe3VGKg==
Date: Mon, 20 Oct 2025 11:28:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
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

Hi Troy,

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

merged to i2c/i2c-host.

Thanks Yixun for your reviews here.

Andi

