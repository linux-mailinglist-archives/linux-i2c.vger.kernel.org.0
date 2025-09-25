Return-Path: <linux-i2c+bounces-13139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07330B9CD17
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8FCE163314
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 00:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688E73FC7;
	Thu, 25 Sep 2025 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgltNu3V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF515A8;
	Thu, 25 Sep 2025 00:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758874; cv=none; b=MkVzUTWzde2iYKt1e84YVqqcccLUI+9i/zUCU8oEHLxfocZ2Y1lbqk8m0RLCL8eOQ+HYVdIjbZ+8yqovH/YIcYsSotCdloc42dh3Ysqm329P/WRvqSO13wdgJ7YcMhMcQfLj3q95QJDzt108cAEtTaZZJ8gs+qZ18ozG4PPBNtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758874; c=relaxed/simple;
	bh=m6ioeAahwYn62n7FAjt3QVV1qWaVhFS/3tj0n6LSVy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ap2lTvj8iMQXe1Q0NPwFrQ+jnjg9ENiz3WDVRnptlNAK/cym6J/GfjHnKJEWf3aew2r/cll0GhM4+kWsgs7N2kfD2CidjN7YT7frLogVafyZWfT1vhXcpoOUt5DWE9nAvBPGQJnYcGxy9oNjWOER2WD6vZ2OOM0joiA0WjO8Q20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgltNu3V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0AEC4CEE7;
	Thu, 25 Sep 2025 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758758873;
	bh=m6ioeAahwYn62n7FAjt3QVV1qWaVhFS/3tj0n6LSVy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgltNu3VeW9hAzcEQsPyG8v6HItnlzF7d7HiS3FHq2+DBakU2vk520GbnYKCo3xpK
	 5CDA/pwMb8K/pevecaT4kP1i89Ok/gWBDUWwknX8OZ6jf7yol+43UakIyHOPOP9SFx
	 wWpDtql4UgcYxVquM3yPKcPrnIxiR2q/lA8xi8+Rfwbk2JpduI28lno00FFQYWknyn
	 BU0aVdM/c21imPEVGqjHXKlK9k0s12HjeGbG7FwQ60PP1Hq7U0RefFy/xxpTce67k1
	 g56Xgo7eNhTZzkFCaUYQdK5MacZ/x/hGCK7qFoOtkRrX4lo1ABSzYeNLx5ztw1xnCZ
	 OJJwMNDUWO8YA==
Date: Thu, 25 Sep 2025 02:07:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek
 MT6878 I2C
Message-ID: <4izbn5l6v3qiddvflzckw4xac2ckaymiun57dqbzcp7etz4v6o@icgh7egzdgqi>
References: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>

Hi Igor,

On Sat, Sep 20, 2025 at 07:22:52PM +0200, Igor Belwon wrote:
> Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
> a new compatible string for the controllers. Their design is compatible
> with the design from the MediaTek MT8188 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

merged to i2c/i2c-host.

Thanks,
Andi

