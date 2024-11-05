Return-Path: <linux-i2c+bounces-7802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 160B19BD755
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 21:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4731C1C2261A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 20:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6999215C6A;
	Tue,  5 Nov 2024 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnDoBpq4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0343D81;
	Tue,  5 Nov 2024 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840354; cv=none; b=d4N2oNXGZdaAjb2NFJmyOk7qyDnOlxTU6+3o0zoH3OM2IZMcQeXSRkVoYijtWXsfcakdYJfufY6dGtDz74gPVsacnnABPfbBn/WAvEkymTNNCAzAeSqbG7nce2WUgaoeAYOi1YIpwc1MVnC0CGV6wJZdAeyFnlHSak8qv1bk0Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840354; c=relaxed/simple;
	bh=wKG3avL2XUqfTwMknTG9oga5XoqgsW5W8Lo93vVs5o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfSWOusLfLKdz9+YdY2nI43M7IjdSyqJ0BooadfYpeCy37NKO2PRZQLedczlsUA/qfWoym3EkI+fU8GaeCH5V205Uiq6iro8Dg7v2i677u8uHO96gVpQflIZIEM+oEq09ADIbmATRJzbDf/fwQCxWIhBPOzwO/BUXzuctCdpGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnDoBpq4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7710C4CECF;
	Tue,  5 Nov 2024 20:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730840353;
	bh=wKG3avL2XUqfTwMknTG9oga5XoqgsW5W8Lo93vVs5o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VnDoBpq4LMvPHS6At1a2p3Gej664XFyTfpBRkgEB1bo7jnuyYSdCXgS/0M1YinQTd
	 GpQFlXvGDRpF1aaCwFC9AODdBiX1YgTEULN/MlFy2ff4FvYuLq0yCpR4tp7ARzysYX
	 7U3vka+0DBdfQNTQLyn77iVFZ5L3ufvYQr0EoV1MSeYlHfnpHEvk/HZYIlNONlgfCZ
	 wDR8MvRMtOgoOijI8WT0PNfOwnImTRz1uI9H17DRj93mMUNirDRcLJyhfTrZX/QuDo
	 CBBZdu0WYbN0ciOqs0tup/7u3xS2J2Wxvk3mLP3mKJS+CSyPuAsGld/b3WtwxVhGC0
	 A6uQF4kyYRb2Q==
Date: Tue, 5 Nov 2024 21:59:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v8 3/7] dt-bindings: i2c: Add Realtek RTL I2C Controller
Message-ID: <sb3wucuqqyzuaebynxce7btsc2sn2j4i7tpx2ukxtx3bbf6frb@ta6oj35z3w3m>
References: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
 <20241031200350.274945-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031200350.274945-4-chris.packham@alliedtelesis.co.nz>

Hi Chris,

On Fri, Nov 01, 2024 at 09:03:46AM +1300, Chris Packham wrote:
> Add dt-schema for the I2C controller on the RTL9300 Ethernet switch
> with integrated SoC.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Agree with Krzysztof's comment in Patch 1. Please don't send
merged patches.

Now this 3/7 patch is also merged to i2c/i2c-host.

Andi

