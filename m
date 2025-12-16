Return-Path: <linux-i2c+bounces-14586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6FCCC4206
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99BA33007A92
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 16:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C612D34EF03;
	Tue, 16 Dec 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzvgoXSx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032D34E25C;
	Tue, 16 Dec 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765900717; cv=none; b=MATSwdlDe3jVeu3YScRJfn278oQOJ12kZGwMHZ6dZalHsSHnIXzwd7YsshAmVksxxQaGNLOYO2fQgvrgBModXvJmSXmD0IhjIvCzrFJn42zx4HIeSBqTrhBfEjVssKoWbgVncelAYYf02Pkp8P43nureW6bRPcgdjzUifttIIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765900717; c=relaxed/simple;
	bh=FoGkFvPI30UFCJ36SpXYyzKXdoONF4L7CQ41Dk+tn9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haQ/+1cH1tBZHqgxTcIYBvVoajasgCgdOtjFZbxcXW3IXtCkRxPFk+95ouzqq+eqeNy8byGGoZfY6Cy0+P/DfZuX+fEpXdfL0YDZRqKHzAt4b0MAO7hrOSRQu1jG1ZkZ74oOLfv5r/GI6OArTQAhkeHz+YUtvXsWTqu+wi6RGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzvgoXSx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5480C113D0;
	Tue, 16 Dec 2025 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765900717;
	bh=FoGkFvPI30UFCJ36SpXYyzKXdoONF4L7CQ41Dk+tn9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uzvgoXSx+bQiqW2zigAwzmKLzfTX85z5JXu5vVz4bZQbUQj4TTBICPj5+11WX7QCj
	 6RvGZXC9LX49G6wsI1gOHCNVOUBCF4dVzdrCFWDQo1U2OLw1/zEBoKVUwT7VxxlfEx
	 cTUzLYJGJQZRbZhBMFIbx6Hvu2YsxnTufoEdDTvd77JfuvsfDkPLZZOvAR9SRz+Fsg
	 iHhFnJlDgdWjRucKNaDF3cRI6FzuIyAmgrVw8wgNAelQwwWf0B6ZJn/rggR2JsCerd
	 /0swZqAarPBkyic7/CvbJCqJcvfWndmKYfGTbCEpQHJy2EbHFUlaqvdvPp2GWibM0A
	 JhBko8CxoacWw==
Message-ID: <fe15fcce-865a-4969-9b6f-95920fcaa5c7@kernel.org>
Date: Tue, 16 Dec 2025 16:58:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] dt-bindings: arm: microchip: move SparX-5 to
 generic Microchip binding
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net,
 andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, richardcochran@gmail.com,
 wsa+renesas@sang-engineering.com, romain.sioen@microchip.com,
 Ryan.Wanner@microchip.com, lars.povlsen@microchip.com,
 tudor.ambarus@linaro.org, charan.pedumuru@microchip.com,
 kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org
Cc: luka.perkov@sartura.hr
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-5-robert.marko@sartura.hr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251215163820.1584926-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/12/2025 17:35, Robert Marko wrote:
> Now that we have a generic Microchip binding, lets move SparX-5 as well as
> there is no reason to have specific binding file for each SoC series.
> 
> The check for AXI node was dropped.

Why?

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/arm/microchip,sparx5.yaml        | 67 -------------------
>  .../devicetree/bindings/arm/microchip.yaml    | 22 ++++++
>  2 files changed, 22 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> deleted file mode 100644
> index 9a0d54e9799c..000000000000
> --- a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Microchip Sparx5 Boards
> -
> -maintainers:
> -  - Lars Povlsen <lars.povlsen@microchip.com>
> -
> -description: |+
> -   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
> -   gigabit TSN-capable gigabit switches.
> -
> -   The SparX-5 Ethernet switch family provides a rich set of switching
> -   features such as advanced TCAM-based VLAN and QoS processing
> -   enabling delivery of differentiated services, and security through
> -   TCAM-based frame processing using versatile content aware processor
> -   (VCAP)
> -
> -properties:
> -  $nodename:
> -    const: '/'
> -  compatible:
> -    oneOf:
> -      - description: The Sparx5 pcb125 board is a modular board,
> -          which has both spi-nor and eMMC storage. The modular design
> -          allows for connection of different network ports.
> -        items:
> -          - const: microchip,sparx5-pcb125
> -          - const: microchip,sparx5
> -
> -      - description: The Sparx5 pcb134 is a pizzabox form factor
> -          gigabit switch with 20 SFP ports. It features spi-nor and
> -          either spi-nand or eMMC storage (mount option).
> -        items:
> -          - const: microchip,sparx5-pcb134
> -          - const: microchip,sparx5
> -
> -      - description: The Sparx5 pcb135 is a pizzabox form factor
> -          gigabit switch with 48+4 Cu ports. It features spi-nor and
> -          either spi-nand or eMMC storage (mount option).
> -        items:
> -          - const: microchip,sparx5-pcb135
> -          - const: microchip,sparx5
> -
> -  axi@600000000:
> -    type: object
> -    description: the root node in the Sparx5 platforms must contain
> -      an axi bus child node. They are always at physical address
> -      0x600000000 in all the Sparx5 variants.
> -    properties:
> -      compatible:
> -        items:
> -          - const: simple-bus
> -
> -    required:
> -      - compatible
> -
> -required:
> -  - compatible
> -  - axi@600000000

Nothing explains the rationale for doing this.

Best regards,
Krzysztof

