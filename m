Return-Path: <linux-i2c+bounces-4796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C992C190
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 19:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B116280FA6
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 17:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1F81AE85A;
	Tue,  9 Jul 2024 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLG5/nrX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8251AE0B0;
	Tue,  9 Jul 2024 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542666; cv=none; b=tPTUOUNyMU+BfnhnuOHF/c8MZHCU0N9Lw/hxFwgxdYFEVtx9AAJEXqd7rkxOBbTPH2KdvgnHJCJliUQUarntP6kr9+Kz7RH66niAfeEGvNTbsfAROMuyL9nvyc+ztQDHaG64CqUx2ludigCp6+lOzGbO2DfaSTvG/1gWrrYRq+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542666; c=relaxed/simple;
	bh=tdS8Vn22uaabOoy8CB56E4+Y+7br+AOHsAEojPseWvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmAv6fGbBEhM3hDMvatKD4uL2LwiHwgy2FlwIpVAxsGhbEMxhiDVfcA+aS/OQ5/jdXuDsaNrVqS+nChq00rfe7pFMFLImPjdjORMxfZVUuOuSc24XEjP57+5ZA9otBK75CwfDy04xGWy6xN23PGdZGZpI6dESmtIguTQbjJxxzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLG5/nrX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8020BC3277B;
	Tue,  9 Jul 2024 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542665;
	bh=tdS8Vn22uaabOoy8CB56E4+Y+7br+AOHsAEojPseWvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLG5/nrXISOG0feH6AuiKbQRZqSJD8t7EJ3x333nX83kmR6Gs1ROGr/yeJdmeCt2e
	 qeW94m8B8yQd5SxJGSwWMQLze6HO4ROMdO3SUrfkfLbYNBvceV+Rk+vj7T5+OmZGW1
	 SJhp3cbUF3iqAmBHkg+248dNLBeapquzxA83PvJ85bFaAf78ItlElM63hafTxz8uIr
	 7n4DI/Kld6tVeo8qKObMatPc/Ek3qxzi/7EGQXNqafpgLLtR8fH6Vm2kZZgi8OCirI
	 DrqNgcVDwu64ObWBd9fOghN2tXwKjHMSUj0OzFjh9/SWOErQU80ZGTlBPFYHE75NZj
	 qqS+BnkMWXGWQ==
Date: Tue, 9 Jul 2024 10:31:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: daniel.lezcano@linaro.org, linux-amlogic@lists.infradead.org,
	kernel@salutedevices.com, khilman@baylibre.com, krzk+dt@kernel.org,
	lukasz.luba@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com,
	mmkurbanov@sberdevices.ru, neil.armstrong@linaro.org,
	martin.blumenstingl@googlemail.com, hkallweit1@gmail.com,
	conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-pm@vger.kernel.org, b.galvani@gmail.com, broonie@kernel.org,
	glaroque@baylibre.com, rui.zhang@intel.com, rafael@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: i2c: amlogic,meson6-i2c: add optional
 power-domains
Message-ID: <172054266337.3753781.16130996955129406536.robh@kernel.org>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-3-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708194808.1819185-3-gnstark@salutedevices.com>


On Mon, 08 Jul 2024 22:48:06 +0300, George Stark wrote:
> On newer SoCs, the I2C hardware can require a power domain to operate.
> Since the same compatible is used for older and newer SoCs make
> power-domains property optional.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


