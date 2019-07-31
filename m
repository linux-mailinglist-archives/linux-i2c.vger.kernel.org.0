Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFDB7C0FE
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2019 14:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfGaMRZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Jul 2019 08:17:25 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:55467 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfGaMRY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Jul 2019 08:17:24 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: DquYbKvmvh5apYp69bl9l1YXFhiNDPyjEMrbgKUyGQYHRL1dIzx35Fq/3r+9i8Oq4ZKzAcsa4q
 g81Dwvbc/7X+jpoWK/ALRU829soj0xhj/nOxzzGskgzbMAFHbLIM+9q6GUerJMxKOZ4tx4hS8Y
 lptDYboQoTErjHE8uWbIzHCVBkfSTPxI6yRdE4NS0NL23sz518MJKtu7Kw8xJH0Z/TUCCDa/FS
 PqYLpEuG8AKexUY6CndXmx0acXgY/o43o8bfCVxHDvQ4xDdN3Y2yrkyAcq/tYSEjaSgOVC9/kb
 dr8=
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; 
   d="scan'208";a="43406548"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jul 2019 05:17:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 31 Jul 2019 05:17:17 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 31 Jul 2019 05:17:17 -0700
Date:   Wed, 31 Jul 2019 14:16:22 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
CC:     <linux-i2c@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] i2c: at91: fix clk_offset for sama5d2
Message-ID: <20190731121622.khjhl4usnsvweci3@M43218.corp.atmel.com>
Mail-Followup-To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <90b284b92b1ce27a682526db8a8c5e6dc5eeb5f6.1563822220.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90b284b92b1ce27a682526db8a8c5e6dc5eeb5f6.1563822220.git.mirq-linux@rere.qmqm.pl>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 22, 2019 at 09:05:56PM +0200, Michał Mirosław wrote:
> 
> In SAMA5D2 datasheet, TWIHS_CWGR register rescription mentions clock
> offset of 3 cycles (compared to 4 in eg. SAMA5D3).
> 
> Cc: stable@vger.kernel.org # 5.2.x
> [needs applying to i2c-at91.c instead for earlier kernels]
> Fixes: 0ef6f3213dac ("i2c: at91: add support for new alternative command mode")
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks

> ---
>  drivers/i2c/busses/i2c-at91-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index 8d55cdd69ff4..435c7d7377a3 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -142,7 +142,7 @@ static struct at91_twi_pdata sama5d4_config = {
>  
>  static struct at91_twi_pdata sama5d2_config = {
>  	.clk_max_div = 7,
> -	.clk_offset = 4,
> +	.clk_offset = 3,
>  	.has_unre_flag = true,
>  	.has_alt_cmd = true,
>  	.has_hold_field = true,
> -- 
> 2.20.1
> 
