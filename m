Return-Path: <linux-i2c+bounces-14885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A3ACEA66B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 19:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D0C3301D0DE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 18:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A58332D0CB;
	Tue, 30 Dec 2025 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdP5RAlZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820C2253A0;
	Tue, 30 Dec 2025 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117970; cv=none; b=jB7OEtz+A8sqZ4MdsmDZpYbGyx54s1BcMS6mJ0SGrGk2b7zwp9EUr77bQfNi9FobqcV/TFNYZqthSj2q1hsyZu4rqEfLkLmCHp3pHInrxzZUxVRqOG3iVOeu76xowWORMs4n5+EJGNO31/PgfzlvSv02uDKGTeDmczG07kCP1Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117970; c=relaxed/simple;
	bh=d56dgI6Y5PdhNqTXDppdPpaYunnHYAw+cp/8Lv9TnIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzS50p/CJTHjHLbrIoYTQqU07WMWcqvtaOHN5xZep2sAs1JYCdJp2VEDMiJiQCCYkNcTP703UWBYhnw3fyrkK0d0vsvO+6lbkyAVwkzK+K+bBgr1wf+OCE3A9Q1618YYHAuKW3Rv22tbHd9Z5ikUwTa+9ohf9SDSK+C/nYiQlgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdP5RAlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DA0C4CEFB;
	Tue, 30 Dec 2025 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117970;
	bh=d56dgI6Y5PdhNqTXDppdPpaYunnHYAw+cp/8Lv9TnIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdP5RAlZVwfui6ATS7o6Q1TU6zwgdzyBneXEku3UUjhcew8CcIMDuW91se2EYAB2w
	 KoTu1wvAY6xPblQ7lL70pVSG+HZcqZTkmVO7BTONVuss2b7R15Dtv/REXIQmOSKvwi
	 HzIPNGELsRJ3r1NmPshi4izd7YUCNWKWuUHDd6Om6HnyXyO01tyS0b2SlMfxy6oCHW
	 TK8/VCAagei4yvhmcJAsMlkZa/yJqmHcAw9vhbq939v4GFmOd3wASmZmD6ArSDzIAh
	 WVHQyMQUdKYzLY12Z13eIvwfw76BEb7sx9hcRQuAbn/CJI49FTMJT32dVc6o3uLw9P
	 Ws5JJMFAPTSGA==
Date: Tue, 30 Dec 2025 12:06:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: herbert@gondor.apana.org.au, Steen.Hegelund@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, kuba@kernel.org,
	linux-i2c@vger.kernel.org, lee@kernel.org,
	linux-crypto@vger.kernel.org, jirislaby@kernel.org,
	andrew+netdev@lunn.ch, dmaengine@vger.kernel.org,
	andi.shyti@kernel.org, linux-gpio@vger.kernel.org,
	pabeni@redhat.com, gregkh@linuxfoundation.org, davem@davemloft.net,
	luka.perkov@sartura.hr, vkoul@kernel.org,
	UNGLinuxDriver@microchip.com, radu_nicolae.pirea@upb.ro,
	daniel.machon@microchip.com, richard.genoud@bootlin.com,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	lars.povlsen@microchip.com, linux-kernel@vger.kernel.org,
	broonie@kernel.org, linusw@kernel.org, edumazet@google.com,
	olivia@selenic.com
Subject: Re: [PATCH v4 01/15] dt-bindings: usb: Add Microchip LAN969x support
Message-ID: <176711796888.884073.12938472533739359591.robh@kernel.org>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-2-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-2-robert.marko@sartura.hr>


On Mon, 29 Dec 2025 19:37:42 +0100, Robert Marko wrote:
> Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
> speed, so document it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Fix example indentation
> 
>  .../bindings/usb/microchip,lan9691-dwc3.yaml  | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


