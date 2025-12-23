Return-Path: <linux-i2c+bounces-14734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BABCD98F5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 15:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A47B3041CEE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 14:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CA6313284;
	Tue, 23 Dec 2025 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ3qXTKf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79C266565;
	Tue, 23 Dec 2025 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498920; cv=none; b=ngczgSrjmovkhFVyVoQkb86uDFyoxliTZ653zuSsOrF4Cb4le/wz+ZGWxYWqzHC+dIeMInkxBV/kSYyhZX0+6CXK93QY7DnUuOaEEg4IqXyA6Ka/ww0pTAPBJfptO07SLiu+zpPc4Md/58rDlt2sVQ8uzsrzAJCTPGReA93COmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498920; c=relaxed/simple;
	bh=MdmWcNW1Zb6GLJFXqBycbEfFaJZYZafZJCbHnv8TMLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+OvYfGfeDhFEJs/90auYTVZjAgYo4LXTdM0WM2FNKD9dzR12jVm5mG8TXJMi9fYtuCMkmgU/fk4NLsCh3SFrmjMZRnOqABKDr9ngtl3qTy7f7O3aw4glvXCqEbfyHtawCp0sk1VORQtsRwDXvmhYtQ+Ndn3Lou6i9fvsN5AFg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ3qXTKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35536C116C6;
	Tue, 23 Dec 2025 14:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766498919;
	bh=MdmWcNW1Zb6GLJFXqBycbEfFaJZYZafZJCbHnv8TMLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZ3qXTKfL5NsvljqiD4YQMx11IsCJ/azyd94EbwtPLo5gJ4ebMwxEKETsqhz1RQoX
	 BgIE7C4jJecy0JFFch5tJlp2gUBVhLUcdO7gytSPcEIJrvSm0XkA/m4u5DwRBrownB
	 +k6UEgOxbFAZCQ2Wd4HrQZfsJjn7ZBsgFhDnz5JE+pqh4yA/m+rsxtfFN6xdB8ZbMA
	 0ixRaQ1WFk+UYeTaa+Mxws4V1ZkdcyR+ZKZ+cP2XAUnn1M+Q6VS8zFEZAdwxfVsE3F
	 qSTAzTDnjOVt8nay9XTMyLWudpNgYCmh6fdmdp5mmWESY2UIk5Rn4+gQj7LearY1Lw
	 Jn7LiA79jIWWg==
Date: Tue, 23 Dec 2025 19:38:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Vignesh R <vigneshr@ti.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/6] phy: can-transceiver: rename temporary helper
 function to avoid conflict
Message-ID: <aUqiZOco5brL71bx@vaman>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>

On 10-12-25, 18:38, Josua Mayer wrote:
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

