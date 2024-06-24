Return-Path: <linux-i2c+bounces-4317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5E915763
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 21:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C43DD1F23F80
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 19:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE4F1A01C7;
	Mon, 24 Jun 2024 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJodd4Bj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8BE1EB56;
	Mon, 24 Jun 2024 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719258555; cv=none; b=gOJ/+3leijZoCMWb1Dn5a8MOmgxasH+MXPPsFOvGiLjj4gkRmr0ngI7938LX+oWtHCW9lCWFVwqLR+lCrgzMi+9dMePxV2G4xdihAXLstwaa+SxXsD9+Z4/8DS6p6lQ3k/LKqGGY1lmDCNR21cUSdsfKjqcdm3DYPIgk3ucB3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719258555; c=relaxed/simple;
	bh=bitaMLMQKsPB3ypqXTwY23B+hxKKZ4D/Ve0iLG51d5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBNo9zCRX5eGL5ufxeQpuEr8RhhIXWgjyTjM0GtQ82pse4xd3Dbw05O5Rv/mBI1wpSnzEx4ULNqcLJ7g0CWPaYIO4Amo7JI6cSkIN1KczKkTuJLNLRnuB+AZ5VKKg+dQ288Y1tdu0oabMqe05vAS2efH/HigsysPwwci7SEZZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJodd4Bj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FF3C2BBFC;
	Mon, 24 Jun 2024 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719258554;
	bh=bitaMLMQKsPB3ypqXTwY23B+hxKKZ4D/Ve0iLG51d5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJodd4Bj7XmE4r73Uerxpla8Ds2P5QYdoxcVeQeWSe7jZIfQy6lKO56KXk08RRW/F
	 VArZXItIkBweO64cxcM3TqbNU2Mj4mVsi0DZobeptHoLngqaYf00REqt07n07uOjVq
	 PVRn0cnv6Ne1Zm/+V+v9n9Cvd1m+AlIB4VxKusZ8KEJiVZn/Kg2gFxtqp68df+IyeA
	 auhYCDfsVgnBwwQwh2YGi38vtHPod06QnYV4PNcR5KYRqdsiugy5HMJZm5nfK5bEcE
	 79B/Z35swG/Wz12mtoxv9X0S9mRB+AqRgfWoUR5XOer5KZPyKRetXrRp7pjTxPHbP3
	 RKPnooTR3wc1A==
Date: Mon, 24 Jun 2024 13:49:13 -0600
From: Rob Herring <robh@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: brgl@bgdev.pl, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Message-ID: <20240624194913.GA267989-robh@kernel.org>
References: <20240621121340.114486-1-andrei.simion@microchip.com>
 <20240621121340.114486-4-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621121340.114486-4-andrei.simion@microchip.com>

On Fri, Jun 21, 2024 at 03:13:40PM +0300, Andrei Simion wrote:
> Update regex check and add pattern to match both EEPROMs.

The subject is wrong as 'at24' is not the vendor.

> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> v1 -> v2:
> - change patter into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep simpler
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 3c36cd0510de..f914ca37ceea 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -18,7 +18,7 @@ select:
>    properties:
>      compatible:
>        contains:
> -        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> +        pattern: "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"
>    required:
>      - compatible
>  
> @@ -37,8 +37,8 @@ properties:
>        - allOf:
>            - minItems: 1
>              items:
> -              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$"
> -              - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> +              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[a-z0-9]+|spd)$"
> +              - pattern: "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"

Are these devices available from multiple vendors? If not, I think I'd 
add specific compatible strings with the right vendor rather than adding 
to this pattern. It's rather loosely defined because that's what was in 
use already.

Rob

