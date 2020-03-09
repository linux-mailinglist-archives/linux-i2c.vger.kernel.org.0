Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDB3117EB11
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Mar 2020 22:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgCIVUl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Mar 2020 17:20:41 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40291 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgCIVUl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Mar 2020 17:20:41 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4ED35E0006;
        Mon,  9 Mar 2020 21:20:38 +0000 (UTC)
Date:   Mon, 9 Mar 2020 22:20:38 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        robh+dt@kernel.org, peda@axentia.se, linux@armlinux.org.uk,
        wsa@the-dreams.de, Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v4 4/4] ARM: at91/dt: sama5d2: add i2c gpio pinctrl
Message-ID: <20200309212038.GK3563@piout.net>
References: <20200225155012.22764-1-codrin.ciubotariu@microchip.com>
 <20200225155012.22764-4-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225155012.22764-4-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25/02/2020 17:50:12+0200, Codrin Ciubotariu wrote:
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> Add the i2c gpio pinctrls to support the i2c bus recovery
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> [codrin.ciubotariu@microchip.com: removed gpio pull-ups]
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
> 
> Changes in v4:
>  - added Acked-by tag from Ludovic;
> 
> Changes in v3:
>  - removed gpio pull-ups;
> 
> Changes in v2:
>  - new patch;
> 
>  arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts   | 33 +++++++++++++++++++--
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 33 +++++++++++++++++++--
>  2 files changed, 60 insertions(+), 6 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
