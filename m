Return-Path: <linux-i2c+bounces-14984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB6CFF7F4
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 19:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9B50338340A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 18:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA56A346770;
	Wed,  7 Jan 2026 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfK1G1cT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8B318B86;
	Wed,  7 Jan 2026 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809471; cv=none; b=Z+uvfrrfL8OeUZ/eCphl17TipAOrutMWaMkkqaSVnaj2W2xjCdsH4AhDPZPVIo1rbQ4Jm9G5tWQKMBGHRCRqkll3Mtx7olsdFdNMS0p1bj1u1FUZuVOaKwiYBsg1YNZ+LzSF5zG8JY0NRHP7fj4XXb6eIOyQonQGmLKGQft0efU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809471; c=relaxed/simple;
	bh=yTNbHm4Elx5+p4958R6MqgcPSCwr1JI4nhgkqFvSTQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ullz0+xaSQQl8kfqBKBhxXehs3uf6htcOZz8vFBsxxa5WxjmyPmJS85AdNOUVbZ7kZqRFhDHxwPJZcghJAEncH9exxoMLQib4QPLARiIhCQumQ0YOQhkVueYobO+7rJLlol9xFmeYelBspkXTVElYp4U3IjtnVxsid4VOuwLOZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfK1G1cT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8804DC4CEF1;
	Wed,  7 Jan 2026 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767809471;
	bh=yTNbHm4Elx5+p4958R6MqgcPSCwr1JI4nhgkqFvSTQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfK1G1cTgD2fle+eiVWG8uWGL3DLjptNzOtIstqyjt6/KrCcdkcRIYkLMAFg5sqfU
	 23DJAQ6Ihpdb0VBgZEj5n4w3P/+Tfctp8rOxcqAdwIfRgsibuGYiVVhEMNkpf5BavK
	 hAE9zfUD/PvELOxL1BnKLd1mySP9UBmDoUgW70rAsQSmNsdrNvRd3AB9QCLwRqAK+j
	 oxVc3cTy7pQnwCk8nZBquR6VX65USIoYM8/BhK/axE/pa5A6txZuUFQ/C+KsYl/Wdl
	 MWyiwSl+/46epZ2ay12CbjJus5BTD4FfLSnKm9atA3rN+Tu5UGRZsB7JumYPu4T/PH
	 iTN8bHn/qzmQA==
Date: Wed, 7 Jan 2026 19:11:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linusw@kernel.org, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 05/15] dt-bindings: i2c: atmel,at91sam: add
 microchip,lan9691-i2c
Message-ID: <aV6hp9_AbKm9IAP9@zenone.zhora.eu>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-6-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-6-robert.marko@sartura.hr>

Hi Robert,

On Mon, Dec 29, 2025 at 07:37:46PM +0100, Robert Marko wrote:
> Document Microchip LAN969x I2C compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>

Just this patch merged to i2c/i2c-host.

Thanks,
Andi

> ---
> Changes in v4:
> * Pick Acked-by from Andi
> 
> Changes in v3:
> * Pick Acked-by from Conor
> 
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index e61cdb5b16ef..c83674c3183b 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -26,6 +26,7 @@ properties:
>                - microchip,sam9x60-i2c
>        - items:
>            - enum:
> +              - microchip,lan9691-i2c
>                - microchip,sama7d65-i2c
>                - microchip,sama7g5-i2c
>                - microchip,sam9x7-i2c
> -- 
> 2.52.0
> 

