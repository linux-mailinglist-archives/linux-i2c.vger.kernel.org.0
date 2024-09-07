Return-Path: <linux-i2c+bounces-6344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3D9700F3
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 10:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25361F223FC
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 08:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5002414B962;
	Sat,  7 Sep 2024 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RngW58No"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CF134BD;
	Sat,  7 Sep 2024 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698070; cv=none; b=V6BMVDa1Q/CqapNe78PZe4HHwwmrL3+41ojacbKoagnDW02MitJMk+WhSyNsv6Saa7mAdYyCncXQYAS3nOb4PPJ2gFYZDz/P19BlsFUDzyPXgBfS9DgFUuJaeRDBYE/bG6ZWgyAkuGCcTOitKhaODAuh+Axti719Uzv3miOaIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698070; c=relaxed/simple;
	bh=2TyElHw+gfI3FzJ+ptP6petKvakRl/T5VCaUqGUHAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvlh9bJod0qeJtjT+qny1BU+TIZdxjQTS+TcMX1b3cYvrrozWK4fugLx06BA6t4/7mhPlI9ledMXutb76BSSzvxfJsOYTlRpF78vUW8LWbgtc3zohjfn1sCYlLtjreVswGFBzqN/YRniiBBSKz6urmt4iQ7YU5z8xDMCFEK3MjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RngW58No; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36410C4CEC2;
	Sat,  7 Sep 2024 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725698069;
	bh=2TyElHw+gfI3FzJ+ptP6petKvakRl/T5VCaUqGUHAZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RngW58Noc0cZRSeCi3kqssELiyewIzaE+oPFGP6raoN/XnHRrU23cPBqNZfe+7fSH
	 b/Is5O/N1K10PPcYurANlsScr2RZAy1PEfbY2dj/qqzra+G/XdPGfu98Mubeo02yCK
	 Vs+qXVFOGQ0n4AgNkfKfVNVDLRpu8JLD+6MwTvx/RlXBH5mk1CZ17YMNkQO81oKRc0
	 d9bGAJU7G+Ku6RqnXQYJIX3RxQrrzksOO3rs3l1oKuvWFHbDwzW6a+T89NKDuBHcPf
	 sSKl/iVoITtJWmr2VaOFzTH4JKtm/6w6XOpixo9TuuGCe+Q9Vo8q/9EJ9MO5iinLvE
	 1yI5K1CTh2fmA==
Date: Sat, 7 Sep 2024 10:34:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v8 0/8] Add tsd,mule-i2c-mux support
Message-ID: <2iuhzmnarxin74i7okuzppdpxs6jrsocahrbc3isie5b34f6pi@p7pqs7czx7ul>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>

Hi Farouk,

> Farouk Bouabid (8):
>       dt-bindings: i2c: add support for tsd,mule-i2c-mux
>       i2c: muxes: add support for tsd,mule-i2c multiplexer

Patch 1 and 2 merged to i2c/i2c-host.

Thanks for following up on the reviews.
Andi

