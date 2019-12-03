Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4330810F83F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2019 08:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfLCHCC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Dec 2019 02:02:02 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:5237 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbfLCHCC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Dec 2019 02:02:02 -0500
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: sXlx3woo87bn8n13DyiB7JOkMCWIdXI0/a627Q8iPGDmP7TpoDXyjK5UJ3Bdemcn+hiMVlAbpY
 K2wzg3hVsxsEvjxq9awRD1DGtL7cSG3L2hGG1OrITol5wFnUTuIqd6p6rFeUS+baggxvr+mBAu
 0KDwGhFtF5WQeLNVPE8PeGcmLiZUUjx1FtD5NrADRKcLcXJCXBnvitS6ivfc1CwBxqVlUhtsd5
 CPS84MPsBzg7M3jaRWW/hHRfpLGfO46qboHvYWEgBOmKqRAyExZOBIeZL43eq0ct1XlimcT/1M
 LeQ=
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; 
   d="scan'208";a="57262689"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Dec 2019 00:02:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Dec 2019 00:01:30 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 00:01:30 -0700
Date:   Tue, 3 Dec 2019 08:01:21 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Eugen Hristev - M18282 <Eugen.Hristev@microchip.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        "Codrin Ciubotariu - M19940" <Codrin.Ciubotariu@microchip.com>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 2/3] i2c: at91: fix clk_offset for sam9x60
Message-ID: <20191203070121.ebba7qc7mvo6jcgy@M43218.corp.atmel.com>
Mail-Followup-To: Eugen Hristev - M18282 <Eugen.Hristev@microchip.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>
References: <1575276957-5615-2-git-send-email-eugen.hristev@microchip.com>
 <1575277244-6507-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1575277244-6507-1-git-send-email-eugen.hristev@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 02, 2019 at 10:01:17AM +0100, Eugen Hristev - M18282 wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> In SAM9X60 datasheet, FLEX_TWI_CWGR register rescription mentions clock

typo here: description

> offset of 3 cycles (compared to 4 in eg. SAMA5D3).
> This is the same offset as in SAMA5D2.
> 
> Fixes: b00277923743 ("i2c: at91: add new platform support for sam9x60")
> Suggested-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks

> ---
> 
> Sorry, wrong subject line. Modified to SAM9X60 .
> 
> 
>  drivers/i2c/busses/i2c-at91-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index e13af48..5137e62 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -174,7 +174,7 @@ static struct at91_twi_pdata sama5d2_config = {
>  
>  static struct at91_twi_pdata sam9x60_config = {
>  	.clk_max_div = 7,
> -	.clk_offset = 4,
> +	.clk_offset = 3,
>  	.has_unre_flag = true,
>  	.has_alt_cmd = true,
>  	.has_hold_field = true,
> -- 
> 2.7.4
> 
