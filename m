Return-Path: <linux-i2c+bounces-14735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E155CD990D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 15:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A674309E15E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 14:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD92731328C;
	Tue, 23 Dec 2025 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiAvrOSX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C1298CC9;
	Tue, 23 Dec 2025 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498935; cv=none; b=Y6D/6+B7UXBlnzXD4ZjK8SxTfPQbBfHXAJqaGpl1hA9dJLEJMtFXWWqXgKAV+gUCPhrhFIeqxGPKhEE9yqvrkzt1AJgZQygxsPWFAZEozjpOKFvTs/XsB42Dhlcll7o3txIpyB1+SRZ58zK2BoS0M0MQ2u4ugCQrkZ+qfKhIXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498935; c=relaxed/simple;
	bh=5qmy0n6c+VcfOh3+PZggyom8IE8rgbXoja6CYarjlfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlpj7K52jRzy6gTWw75WiszDC+6Zcl/899H71RUVhr6VHCV1p2pavd5VyYVWHIpgauXpPwTh3vOdWAY6462pdjU9y4El53LBiexUIHYdg2UgPL0yeDrQb44qyWh3MfmOL6PRtve9GNZfBhh9h4EBZNVsJr08GmxJnXlJ+MKVBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiAvrOSX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A539C116D0;
	Tue, 23 Dec 2025 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766498935;
	bh=5qmy0n6c+VcfOh3+PZggyom8IE8rgbXoja6CYarjlfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiAvrOSXialvakW8plMcuE0l/1cFOMyvnBebndbziROuJmBlXlXTJhclBPDiWvQ6T
	 UzEVGnRxJPeD0+cW2i3/0bPJFVgabcVeuMvePN8KnWxQXLiazG40a8obuPUs+Ci3dK
	 O2PX4oQWDjog7IjcWRtVOC7vkwB5MUzSNZuWkaXyQmLA3971XmtvFf0I8UBCpHrSrn
	 U9giHSKsJQz3I/t5dDYiNbbIgzYkQV3kghU8BK018tYkhj5W8a2eDs3vNlKVNKoxPB
	 jCrKFtDLYCG0wlC3q4iDt6iMn8wmB3g3neNy9KibEbQhZOyllAieKjm28URTKKyINr
	 61PkaiBy1pIEA==
Date: Tue, 23 Dec 2025 19:38:51 +0530
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
Subject: Re: [PATCH v3 3/6] phy: can-transceiver: drop temporary helper
 getting optional mux-state
Message-ID: <aUqic6tjQVPiY1yO@vaman>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>

On 10-12-25, 18:38, Josua Mayer wrote:
> Multiplexer subsystem has now added helpers for getting managed optional
> mux-state.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

