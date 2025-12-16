Return-Path: <linux-i2c+bounces-14572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02478CC33AE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 14:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3092630491C3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248983559C8;
	Tue, 16 Dec 2025 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFwjwqyl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89538354AF1;
	Tue, 16 Dec 2025 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890711; cv=none; b=JJqjVcrzVs6ePmYLduXmlxXfnRcZNuN0e89qpUznwgkDPFJjFeqn3DZV3e2pdY4I/B+RgMHli6ReqCEZZkb0za/mqCIUgP38fP/PQzSYY7TkWxFRn3XytXs9fllG6I7M+3pEXFGU6q457V8W8/fOATc9Mp1YGcxGL4ropPps7rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890711; c=relaxed/simple;
	bh=uK7rtQd0fuH8HIq2iyTTKTpcKJsEkMoXU53XE1O8rzg=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WjqNvnPVSnnLYiNDt9GKiqMAKsWDOG/gLl3KPDJ8QB7RZCSLCzVw1Z6uGsIVJrJKVreTbmuj7Kx7qRtlcKRDF6le3uEkRXGbxKKR7iHhCIHBTZ7EQqDQ9Jn1go3aD7Zm0KsRDqI/fv5sK2ufufz8docbp0UhoOQH0To2SvwJUOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFwjwqyl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB05BC19423;
	Tue, 16 Dec 2025 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765890711;
	bh=uK7rtQd0fuH8HIq2iyTTKTpcKJsEkMoXU53XE1O8rzg=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=fFwjwqyl4XciRQVPx8XogJowdRcsdYKb/ioKdv1BlYgi1o+jrg3aT4TAjJOxcokcI
	 QsSoL7E/aTwp0Xx89fUuxiHPnEWOL+3YP75h9bjRELSdSMWlSEQ92eq4Dd4ceSznxM
	 FA0++iF6bDiu+t9pjncqus1HTUPK3svYbIJYzU9lKuMSr/WEguQljrDJAZRNzhNg42
	 v7hCHoWhSvks4wsNhavYOp/zj1CynIbu8P4b+tzQRYE66RX9T0NwB8sBSiXWwnDEBo
	 MIlWjd8LzSrypRzNesJoMN6k5blOrxuig+/T5bgwizw08Jd3RqQ5mQlMx9Ug7dba8M
	 js45kMZa3qkiw==
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Dec 2025 07:11:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linusw@kernel.org, vkoul@kernel.org, 
 pabeni@redhat.com, jirislaby@kernel.org, lars.povlsen@microchip.com, 
 linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, 
 kuba@kernel.org, mturquette@baylibre.com, Steen.Hegelund@microchip.com, 
 mwalle@kernel.org, tudor.ambarus@linaro.org, devicetree@vger.kernel.org, 
 UNGLinuxDriver@microchip.com, edumazet@google.com, 
 linux-clk@vger.kernel.org, andi.shyti@kernel.org, olivia@selenic.com, 
 conor+dt@kernel.org, luka.perkov@sartura.hr, richard.genoud@bootlin.com, 
 linux-hwmon@vger.kernel.org, krzk+dt@kernel.org, 
 wsa+renesas@sang-engineering.com, Ryan.Wanner@microchip.com, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 alexandre.belloni@bootlin.com, lee@kernel.org, linux@roeck-us.net, 
 davem@davemloft.net, gregkh@linuxfoundation.org, 
 kavyasree.kotagiri@microchip.com, nicolas.ferre@microchip.com, 
 andrew+netdev@lunn.ch, romain.sioen@microchip.com, sboyd@kernel.org, 
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, daniel.machon@microchip.com, 
 dmaengine@vger.kernel.org, richardcochran@gmail.com, 
 herbert@gondor.apana.org.au, charan.pedumuru@microchip.com, 
 linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org, 
 radu_nicolae.pirea@upb.ro
To: Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Message-Id: <176589052274.1815136.7513475493879599819.robh@kernel.org>
Subject: Re: [PATCH v2 01/19] include: dt-bindings: add LAN969x clock
 bindings


On Mon, 15 Dec 2025 17:35:18 +0100, Robert Marko wrote:
> Add the required LAN969x clock bindings.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Rename file to microchip,lan9691.h
> 
>  include/dt-bindings/clock/microchip,lan9691.h | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/clock/microchip,lan9691.h
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20251215 (best guess, 14/15 blobs matched)
 Base: tags/next-20251215 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/microchip/' for 20251215163820.1584926-1-robert.marko@sartura.hr:

arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: / (microchip,sparx5-pcb135): compatible: ['microchip,sparx5-pcb135', 'microchip,sparx5'] is valid under each of {'items': [{'const': 'microchip,sparx5-pcb135'}, {'const': 'microchip,sparx5'}], 'maxItems': 2, 'minItems': 2, 'type': 'array'}, {}
	from schema $id: http://devicetree.org/schemas/arm/microchip.yaml
arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: / (microchip,sparx5-pcb135): compatible: ['microchip,sparx5-pcb135', 'microchip,sparx5'] is valid under each of {'items': [{'const': 'microchip,sparx5-pcb135'}, {'const': 'microchip,sparx5'}], 'maxItems': 2, 'minItems': 2, 'type': 'array'}, {}
	from schema $id: http://devicetree.org/schemas/arm/microchip.yaml
arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: / (microchip,sparx5-pcb134): compatible: ['microchip,sparx5-pcb134', 'microchip,sparx5'] is valid under each of {'items': [{'const': 'microchip,sparx5-pcb134'}, {'const': 'microchip,sparx5'}], 'maxItems': 2, 'minItems': 2, 'type': 'array'}, {}
	from schema $id: http://devicetree.org/schemas/arm/microchip.yaml
arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: / (microchip,sparx5-pcb134): compatible: ['microchip,sparx5-pcb134', 'microchip,sparx5'] is valid under each of {'items': [{'const': 'microchip,sparx5-pcb134'}, {'const': 'microchip,sparx5'}], 'maxItems': 2, 'minItems': 2, 'type': 'array'}, {}
	from schema $id: http://devicetree.org/schemas/arm/microchip.yaml
arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: / (microchip,sparx5-pcb125): compatible: ['microchip,sparx5-pcb125', 'microchip,sparx5'] is valid under each of {'items': [{'const': 'microchip,sparx5-pcb125'}, {'const': 'microchip,sparx5'}], 'maxItems': 2, 'minItems': 2, 'type': 'array'}, {}
	from schema $id: http://devicetree.org/schemas/arm/microchip.yaml






