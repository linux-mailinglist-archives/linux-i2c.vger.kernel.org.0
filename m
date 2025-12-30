Return-Path: <linux-i2c+bounces-14886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D868ECEA67A
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 19:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A12D30164E3
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 18:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094AF32D0F3;
	Tue, 30 Dec 2025 18:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnAphv0B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99121242935;
	Tue, 30 Dec 2025 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117993; cv=none; b=HGXGAbN+X5mymUQ8gHVg7ramgs5Wv0DPzM6S1Iki2YPzHna+Y9v98McsvgETfJNrAirSglxbCbFdsFlwjI8sv0W8j+T2KydaXVeH5p4k4eVPNjxqK89z7fnrrfjhxI5A2eaCCPXg1LhQ7ZWXlcd7LhhMj6cPDO0PNNbeg/tmzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117993; c=relaxed/simple;
	bh=+mZ2BSG8Mo/7t6pCnAocYIY+9a/YSRxQPsfDZwP6lI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBBfiieqd4XasHq6tVzFyW9LzK0B/NeVunw5iUYBmybYuUt197vdnp5vrmfTnE6vGpODGz3ztDFv3hmdZwq3dIxPlCzWIxxIrxJpW6Z7JITR86FnABxZa2suuPgFg+bWQDAiUL84X4pk3QIowH+9bmCrEJBhz/9oPNnJwvz29Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnAphv0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D38C4CEFB;
	Tue, 30 Dec 2025 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117993;
	bh=+mZ2BSG8Mo/7t6pCnAocYIY+9a/YSRxQPsfDZwP6lI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnAphv0B8FtOm3V3/J/xA4md6HvcO0RI7LhtjTixEFWoixXCzDO0IAujqQVLnllOv
	 0jGx9RP58yCr81eA/hxp+CWpMUCxj/5XWjj2Agm37F3dM12xuM4s/7vJwqhl3CQ+Jp
	 KFqk1dqNiAQtDEUdAzvsb6zm/W0i8Tp8xi7pb1O6dUEn/hUhyKmLm4jTcX1KrJkoSi
	 RiqOUTv5h7UervvaA1pcwasBEwBWD1bICWOom/h4D4SM5ezakBx9beiiK979Kzyc41
	 6uulURq3HYMtSiPsHPaX4lREJ0IdVGgpFmpq5ROLATAnKBs4IHllkMkLHZFLbtQPJH
	 qLplRteSg0EbA==
Date: Tue, 30 Dec 2025 12:06:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: daniel.machon@microchip.com, radu_nicolae.pirea@upb.ro,
	linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
	jirislaby@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, andi.shyti@kernel.org,
	olivia@selenic.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	dmaengine@vger.kernel.org, andrew+netdev@lunn.ch,
	krzk+dt@kernel.org, nicolas.ferre@microchip.com, linusw@kernel.org,
	lars.povlsen@microchip.com, pabeni@redhat.com,
	richard.genoud@bootlin.com, davem@davemloft.net,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev, linux-gpio@vger.kernel.org,
	Steen.Hegelund@microchip.com, broonie@kernel.org,
	luka.perkov@sartura.hr, edumazet@google.com,
	herbert@gondor.apana.org.au, lee@kernel.org, kuba@kernel.org,
	vkoul@kernel.org, UNGLinuxDriver@microchip.com,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 09/15] dt-bindings: dma: atmel: add
 microchip,lan9691-dma
Message-ID: <176711799188.884536.16157476210751555846.robh@kernel.org>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-10-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-10-robert.marko@sartura.hr>


On Mon, 29 Dec 2025 19:37:50 +0100, Robert Marko wrote:
> Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> * Merged with microchip,sama7d65-dma since that also falls back to
> microchip,sama7g5-dma
> 
>  Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


