Return-Path: <linux-i2c+bounces-14774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE235CDE155
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 21:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31C9F300C5D1
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 20:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7B4276038;
	Thu, 25 Dec 2025 20:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6VDcYXt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E02199EAD;
	Thu, 25 Dec 2025 20:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766694755; cv=none; b=Mf0kOTQmJPcrnNWLyGq51zyoRZ3gBF6k1aZv8+4Sihogbobtsbng1+WEF6+zGkN/m5D+1RQamRluNsLxYsqRI9EP5dJpQTj8KcM5et2pqEV5Rz72YvQM/V0boqLL+m2DSRL3ybldM2bwCOwYKhGrGlv0F+8MhcTHVDPLc4bpz2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766694755; c=relaxed/simple;
	bh=OlMwKRemqpxu1qixxaUujZZmxWqSk+fU5T6TjQIfHes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dldVZvODbPjl2lPSJGOkeRC9SNyn2aEMQWmeQuQ/Olb26j6ti0rROgbWqmQ05JC8sAE+anPUnkycR7YOKQ4emaS2cDInD3CpFmTqRqL5d7LOeweRC80wBXTvdO7WKA5cg0KXk86iAMX2rEZuM6gHqC8cRc/cJaGslNrBr7hmJ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6VDcYXt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E902FC4CEF1;
	Thu, 25 Dec 2025 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766694754;
	bh=OlMwKRemqpxu1qixxaUujZZmxWqSk+fU5T6TjQIfHes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6VDcYXtHs6fSm0cvzASNAmckB9F9WPZrJj6GFS1DWeG5AyUtnRS+HTxeEn3lfE0j
	 X0mk5OLc648E+zRf8EuPlbe4TQjE9uTUaOHE2z+vIO9ZWoFEXzjBUIHF9CG4dzPQve
	 v83KQkZpwBtEZofvB9fY2BqXuG53ojlepTiUErcgXxbaMiU8EDiz5Q7rpj3SvwxMIA
	 wcqT0kw6j7feBvZO7hZ35tl45EOx8RVFm5K59tqICB2GXAgBdzsEOQf6hJnpK1sT9v
	 SP56DGjvycoPe2bHyASKmklE74IU5IZSqnnfhTjhhOa8oWJicVV2cLVw9to6ctdIHr
	 qTvx4sCsAld6A==
Date: Thu, 25 Dec 2025 21:32:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linusw@kernel.org, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	lars.povlsen@microchip.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: i2c: atmel,at91sam: add
 microchip,lan9691-i2c
Message-ID: <plir5hx4hpgrj4emspyu3wyvpnax6zz6tlattwq4l2ye3hohkr@ysbjwf2p53lh>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-7-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223201921.1332786-7-robert.marko@sartura.hr>

Hi Robert,

On Tue, Dec 23, 2025 at 09:16:17PM +0100, Robert Marko wrote:
> Document Microchip LAN969x I2C compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

