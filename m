Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA53810F82D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2019 07:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfLCG6L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Dec 2019 01:58:11 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:48225 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfLCG6L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Dec 2019 01:58:11 -0500
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: EsL320TzSSXEuYAKN7rUavHCfzrytzh3c5AYr8n6uN8LVXRI7hcIGmjw3K5+EpGcXy7UoKZJnB
 V8s7tIonVXD5nLaJfif12KarPV0dwET3ZpVpAepVMpuVYIEbrC3yxk5/aAK1GKuKYpTxcWs2f5
 +bxIQscJv3l+dMduJY02hWkW3HXt6oauezXfFkcMiZj2YjAdJjuda4iUffxmbc/ZqOch/z21LB
 1NCTWgzdCYxA20vEHeDKPmlBsH0DnShF1bhau5qTmq4YbGKhnBCnkYWmg+qod3grC/in15bmVt
 X5k=
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; 
   d="scan'208";a="57585459"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Dec 2019 23:58:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Dec 2019 23:58:00 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Dec 2019 23:58:01 -0700
Date:   Tue, 3 Dec 2019 07:57:51 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: i2c: at91: cosmetic formatting of
 compatible list
Message-ID: <20191203065751.fgwwko3e63antodb@M43218.corp.atmel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 02, 2019 at 09:56:35AM +0100, Eugen Hristev - M18282 wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Format the list of compatibles with one compatible per line.
> 
> Suggested-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> 

Thanks

> ---
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
> index 2210f43..d35cd63 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
> @@ -1,10 +1,16 @@
>  I2C for Atmel platforms
>  
>  Required properties :
> -- compatible : Must be "atmel,at91rm9200-i2c", "atmel,at91sam9261-i2c",
> -     "atmel,at91sam9260-i2c", "atmel,at91sam9g20-i2c", "atmel,at91sam9g10-i2c",
> -     "atmel,at91sam9x5-i2c", "atmel,sama5d4-i2c", "atmel,sama5d2-i2c" or
> -     "microchip,sam9x60-i2c"
> +- compatible : Must be one of:
> +	"atmel,at91rm9200-i2c",
> +	"atmel,at91sam9261-i2c",
> +	"atmel,at91sam9260-i2c",
> +	"atmel,at91sam9g20-i2c",
> +	"atmel,at91sam9g10-i2c",
> +	"atmel,at91sam9x5-i2c",
> +	"atmel,sama5d4-i2c",
> +	"atmel,sama5d2-i2c",
> +	"microchip,sam9x60-i2c".
>  - reg: physical base address of the controller and length of memory mapped
>       region.
>  - interrupts: interrupt number to the cpu.
> -- 
> 2.7.4
> 
