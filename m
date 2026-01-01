Return-Path: <linux-i2c+bounces-14888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829DCED3DC
	for <lists+linux-i2c@lfdr.de>; Thu, 01 Jan 2026 18:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D31FC3011774
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jan 2026 17:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649AE2F12CF;
	Thu,  1 Jan 2026 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ER9t7cAl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F0A224AF1;
	Thu,  1 Jan 2026 17:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767289316; cv=none; b=NrTyiQWRpofLmJkcT0La0zOE28btIyA8GiYS41FfWN2bUbicL5plMTG4zofHuO57L7lxfkfV2P2JcEHzg4b1abYwHYSCacd+mNCdPRNCBHrn1mAK34pKKVDIN4eR5SX3/kIf5m5Jws3f4UcU9Lt8JbJYQ1Ncz+9kxAoR8DwuRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767289316; c=relaxed/simple;
	bh=Zv64SapDen5kzKJuMbMGdMPYfIhGVyuPqNwGNzVunrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m8XXNr8BZpXXMzhYmKYONw+6diQPTE2tmAiOrPA10aUOjHf0VqhKjWujHUTpVEZDL7AS7gOnMaqcOLUnTu8S+7psaPd5C0YHYkcT88CDc4+ID2tQ+cUeiPXt3ViuUM91MgxHYjGmtZECWjHMJ7rl/2QSSljpS8uFuhKKqLRs9FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ER9t7cAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455F6C4CEF7;
	Thu,  1 Jan 2026 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767289315;
	bh=Zv64SapDen5kzKJuMbMGdMPYfIhGVyuPqNwGNzVunrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ER9t7cAlj7MqNGXcP5YMCKuLDsKR9w84FCNrArooQFtHOjmbI/DfZrwYQE1VvulF8
	 DZFaUNowxcdH965RH9OZgKQAcXSyG2w5/MG46R88qAOCABM+8kP/0TVLa6bD4kqL4E
	 GriArNDwSzEGl3tltbYRZxoiNQGRjqyqUKNmhJI/GVdl1unkW+vYqi+lKLebLH9/PR
	 Dtcrikk7oRT/GK4vdCGlBPTHnucq204vQ6dfb87P8u4v7kGhQl1vvcSbNh3KTThJRG
	 FNP98/I/YiWCMXFsPA0TvmzkGoFOTDL9lb8djzInRuDqu1+qcPkf+hK4tlCEL93Sf5
	 VUXlu59t8g4hA==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
 andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
 UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
 richard.genoud@bootlin.com, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, broonie@kernel.org, lars.povlsen@microchip.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v4 00/15] Add support for Microchip LAN969x
Message-Id: <176728930591.239406.10977505367349763113.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 23:11:45 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 29 Dec 2025 19:37:41 +0100, Robert Marko wrote:
> This series adds support for the Microchip LAN969x switch SoC family.
> 
> Series is a bit long since after discussions in previous versions, it was
> recommended[1][2] to add SoC specific compatibles for device nodes so it
> includes the required bindings updates.
> 
> [1] https://lore.kernel.org/all/20251203-splendor-cubbyhole-eda2d6982b46@spud/
> [2] https://lore.kernel.org/all/173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com/
> [3] https://lore.kernel.org/all/20251203-duly-leotard-86b83bd840c6@spud/
> [4] https://lore.kernel.org/all/756ead5d-8c9b-480d-8ae5-71667575ab7c@kernel.org/
> 
> [...]

Applied, thanks!

[09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
        commit: c47422f4d0a26b25ff59709921eaaf8f916eec7d

Best regards,
-- 
~Vinod



