Return-Path: <linux-i2c+bounces-5952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB95965A53
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 10:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D71228D640
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 08:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37F716D4DE;
	Fri, 30 Aug 2024 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n87VcqIl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2514F13A;
	Fri, 30 Aug 2024 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006617; cv=none; b=SlNdlHqH7U2FKGQhEk2Q0UPfNWrGaHH/eEX2S3fvUkXv/BakBkYSxE/KGe7+BTVmYHn7C8bgzKVcnKboiiLxbePSyHGTd8TVrbQMiHCnvmnWGuY6S+WAXlU3n5k3fHuDVtdtxOed7TY56gxmvXzJ/vSODTCg7XfLEXCBefXavog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006617; c=relaxed/simple;
	bh=+qWkkkxG743ImM/aahK9UM7XRQPRK07QH/l7Lrn/2g4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QLA2jMZC7TtrZ845uPtYsmT1I9L9tEthhxCaC/M2X7no9RcVqSgonYO4n3KxvhjPwhx/sdYH8VlD2TYje42vTPbZz1qh/b82M8yxivM2NfpzmnrqktOiSS/ptzlnTEsO8GstPxoetU2GAHHa94IgHNJQuezCu/I8FoWY2MKaWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n87VcqIl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1355C4CEC2;
	Fri, 30 Aug 2024 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725006617;
	bh=+qWkkkxG743ImM/aahK9UM7XRQPRK07QH/l7Lrn/2g4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n87VcqIld4h3oj7jmm7RfOPl4zckDOEs8srTmVTODlJPFoBWJTdLkpxKb/TTrDPNI
	 RpHdWXpgebIFMc/qPmm4qzLIU/IUXikZBg9fEljw5P/AOGdNBkoPI9gH5NVY29Dhxj
	 0X1uhyjUZT+Aui4Sd6KyzejiYNza+LZ5CXen9SIXDTegOWyX/nTpdat55CRq0o5GTY
	 kwc8M8dElgz1oXzLOA1CYsDOeadPufbX+4woWWT7nRP10Yqzc9IYsRuD24HA4Io+QG
	 F5nYBaRSeP36LV/Z3WWPzyZZZEr6rtTbrq62Rxt/JKgxUcvItsy5MM3zN18fyGINmP
	 7xquAQuP5GK1g==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
 Chukun Pan <amadeus@jmu.edu.cn>, Muhammed Efe Cetin <efectn@protonmail.com>, 
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>, 
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <01020191998a2fd4-4d7b091c-9c4c-4067-b8d9-fe7482074d6d-000000@eu-west-1.amazonses.com>
References: <20240828151028.41255-1-detlev.casanova@collabora.com>
 <01020191998a2fd4-4d7b091c-9c4c-4067-b8d9-fe7482074d6d-000000@eu-west-1.amazonses.com>
Subject: Re: (subset) [PATCH v3 04/11] dt-bindings: mfd: syscon: Add rk3576
 QoS register compatible
Message-Id: <172500660860.97285.13837050366813522297.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 09:30:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 28 Aug 2024 15:10:55 +0000, Detlev Casanova wrote:
> Document rk3576 compatible for QoS registers.
> 
> 

Applied, thanks!

[04/11] dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
        commit: 2f9709b8541dc742235743d19b8a6e2baa2e81d4

--
Lee Jones [李琼斯]


