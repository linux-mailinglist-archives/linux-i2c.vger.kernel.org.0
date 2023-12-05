Return-Path: <linux-i2c+bounces-608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C3804316
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 01:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58ABD1F2136F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 00:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D28F644;
	Tue,  5 Dec 2023 00:06:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14522101;
	Mon,  4 Dec 2023 16:06:11 -0800 (PST)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rAIwu-0001qb-BG; Tue, 05 Dec 2023 01:06:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Tim Lunn <tim@feathertop.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH v3 0/8] Add support for Sonoff iHost RV1126 Smart Home Gateway
Date: Tue,  5 Dec 2023 01:06:01 +0100
Message-Id: <170173468934.501889.1733383840975468730.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203124004.2676174-1-tim@feathertop.org>
References: <20231203124004.2676174-1-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 3 Dec 2023 23:39:56 +1100, Tim Lunn wrote:
> Sonoff iHost is gateway device designed to provide a Smart Home Hub,
> most notably it includes builtin radios for Wifi, BT and Zigbee, which
> make it suitable SBC for use with many of the open home automation
> platforms. It is availabe in two versions, first is based on
> Rockchip RV1126 and 4GB DDR4 RAM. There is a second version based off
> the RV1109 dual core SoC and 2GB RAM.
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: rockchip: rv1126: Add alternate UART pins
      commit: 86fd29b0329c95d4136a5dcef555287a0be8a038
[2/8] ARM: dts: rockchip: rv1126: Serial aliases
      commit: 30250a587bddb5265bceb9f8397c459f5cc04e0c
[4/8] ARM: dts: rockchip: rv1126: Add i2c2 nodes
      commit: 655ff5d45dc9de5e67c839af4baf47eaffed348f
[5/8] ARM: dts: rockchip: rv1126: Split up rgmii1 pinctrl
      commit: d3bab19c83c7ce24e89d9f08f09e596c39b14658
[6/8] ARM: dts: rockchip: Add rv1109 SoC
      commit: bd6f1b13b972caebf54be1fb3bc2eb9f47de9d63
[7/8] ARM: dts: Add Sonoff iHost Smart Home Hub
      commit: 0f385eea8157bcb36d30d9f96105251465bc6684
[8/8] dt-bindings: arm: rockchip: Add Sonoff iHost
      commit: 98feed126e7dcae617af3b0e76f50160806e3233

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

