Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05BCD10F87E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2019 08:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfLCHNp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Dec 2019 02:13:45 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:62540 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfLCHNp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Dec 2019 02:13:45 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: NBb0poChIeNC2g1/pnmYb12a4nso2OzZoC3QHgHdbzwTLpzTj+1VhA6MtmStdfI/rvmfXnmcCb
 pZxIRfYXKCmE5CAtiiwL+wr1n5Rm4yfD5+zk2Zq/X9bOfalkcii/IAcI2wCAOVSt9+7rpPDzjY
 n+IKIyWIFFshpYdihDcwsXNpAqC42yMINrjN1vxVJKHfKLLp45wYy1THgozqsn67MNGHqhXPPI
 8qRD/jvBGp5IjXQaY9SkyLit0tKzQOt0DHiH8Xeq0AhLqwEE7s5OLUCShtTzd8CnzHOdopg0bk
 8Bo=
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; 
   d="scan'208";a="60401245"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Dec 2019 00:13:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Dec 2019 00:13:42 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 00:13:41 -0700
Date:   Tue, 3 Dec 2019 08:13:32 +0100
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
Subject: Re: [PATCH 3/3] i2c: at91: remote default value initialization
Message-ID: <20191203071332.zwpmeb65g7e7ckmj@M43218.corp.atmel.com>
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
References: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
 <1575276957-5615-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1575276957-5615-3-git-send-email-eugen.hristev@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 02, 2019 at 09:56:41AM +0100, Eugen Hristev - M18282 wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Platform data structs are initialized by default with zero values.
> Thus it becomes redundant to initialize them manually to zero (false).
> Remove extra false initialization for field members in structs.
> 
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Honestly, I prefer an explicit description than saving lines of code, in
a glance you have all the details, don't need to go back to the
structure definition.

As it's a personal belief, I won't argue about it.
Reviewed-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
>  drivers/i2c/busses/i2c-at91-core.c | 39 --------------------------------------
>  1 file changed, 39 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index 5137e62..3da1a8a 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -66,55 +66,26 @@ static struct at91_twi_pdata at91rm9200_config = {
>  	.clk_max_div = 5,
>  	.clk_offset = 3,
>  	.has_unre_flag = true,
> -	.has_alt_cmd = false,
> -	.has_hold_field = false,
> -	.has_dig_filtr = false,
> -	.has_adv_dig_filtr = false,
> -	.has_ana_filtr = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9261_config = {
>  	.clk_max_div = 5,
>  	.clk_offset = 4,
> -	.has_unre_flag = false,
> -	.has_alt_cmd = false,
> -	.has_hold_field = false,
> -	.has_dig_filtr = false,
> -	.has_adv_dig_filtr = false,
> -	.has_ana_filtr = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9260_config = {
>  	.clk_max_div = 7,
>  	.clk_offset = 4,
> -	.has_unre_flag = false,
> -	.has_alt_cmd = false,
> -	.has_hold_field = false,
> -	.has_dig_filtr = false,
> -	.has_adv_dig_filtr = false,
> -	.has_ana_filtr = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9g20_config = {
>  	.clk_max_div = 7,
>  	.clk_offset = 4,
> -	.has_unre_flag = false,
> -	.has_alt_cmd = false,
> -	.has_hold_field = false,
> -	.has_dig_filtr = false,
> -	.has_adv_dig_filtr = false,
> -	.has_ana_filtr = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9g10_config = {
>  	.clk_max_div = 7,
>  	.clk_offset = 4,
> -	.has_unre_flag = false,
> -	.has_alt_cmd = false,
> -	.has_hold_field = false,
> -	.has_dig_filtr = false,
> -	.has_adv_dig_filtr = false,
> -	.has_ana_filtr = false,
>  };
>  
>  static const struct platform_device_id at91_twi_devtypes[] = {
> @@ -142,23 +113,13 @@ static const struct platform_device_id at91_twi_devtypes[] = {
>  static struct at91_twi_pdata at91sam9x5_config = {
>  	.clk_max_div = 7,
>  	.clk_offset = 4,
> -	.has_unre_flag = false,
> -	.has_alt_cmd = false,
> -	.has_hold_field = false,
> -	.has_dig_filtr = false,
> -	.has_adv_dig_filtr = false,
> -	.has_ana_filtr = false,
>  };
>  
>  static struct at91_twi_pdata sama5d4_config = {
>  	.clk_max_div = 7,
>  	.clk_offset = 4,
> -	.has_unre_flag = false,
> -	.has_alt_cmd = false,
>  	.has_hold_field = true,
>  	.has_dig_filtr = true,
> -	.has_adv_dig_filtr = false,
> -	.has_ana_filtr = false,
>  };
>  
>  static struct at91_twi_pdata sama5d2_config = {
> -- 
> 2.7.4
> 
