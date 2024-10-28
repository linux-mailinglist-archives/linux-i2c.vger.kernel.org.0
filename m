Return-Path: <linux-i2c+bounces-7623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA59B2979
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83A891F25D07
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADE61DA63F;
	Mon, 28 Oct 2024 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f10JEsuc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCEB190497;
	Mon, 28 Oct 2024 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101135; cv=none; b=O7K3FABHvIqX9OXfAxGJJGXy8vh2GkIklEhNpZuKx8YMDfj1L/xW77joDTw+GyB7TsxU7yFPnacwSVNTYX05HidJ5O3f1P9FGZlF7fGoUCdNUy/MRjew1hldY3ZONIl/ygt67Wc/UvsjCmrzfaNOxKkDlJD9DAs4aO0VWikfWkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101135; c=relaxed/simple;
	bh=JuicChqAxrZATICnsbGhsPkuOFQw8eOyMB5wZTaLbds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUcaAB0tNckQnhpTuVeYHCm3L6e4Tk65miTeI8SH/IBZseVX+nFfNHpoetbn2i1ts+FafSklETaYG8NNcKCg9z5UqQzfJ4ztnZibMKAYDwl/TOnB8Ovmx/W+8QAtUaR4evdQajgMXOYIf+gMCSfcMu5h5BPVf7FsnlWLw/rR35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f10JEsuc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DCFC4CEC3;
	Mon, 28 Oct 2024 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730101134;
	bh=JuicChqAxrZATICnsbGhsPkuOFQw8eOyMB5wZTaLbds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f10JEsucxU7RFGwNbz89W7LzTXTOmDvvby2TiNbe0GJMt8T/lMlrtP9Fm3RMJx+un
	 MndPr8oIb4/tpYIOELIzySjZMq3s0VBT/cPRX3UcgzvL4/QlVrGMlFDYVaCVY2FMwC
	 gb6l7yfMJEkJ4FFLDrHd2dkyzzBLwLoWkDV0DUPdUWgoAzHFuj67gzt+Qhd6xFBThx
	 MPuT7YNxnQGhz+E18N5OufyOAU1T7YhY+Vf4d3ZLG6/i6aym1Fv23QRPPOI3qMhvst
	 gs5ICkgKRecsyp2NbyrgU2/0kyIiLWaZOzNiYjkhgXTelDFfo41bYJSoQV3giIT9iq
	 jCjV5WLLHN4uQ==
Date: Mon, 28 Oct 2024 08:38:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-2-TroyMitchell988@gmail.com>

On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---

Where is the changelog? Nothing here, nothing in cover letter.

I asked for several changes, so now I don't know if you implemented
them.

Best regards,
Krzysztof


