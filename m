Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF36C56136D
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 09:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbiF3HmD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 03:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbiF3HmC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 03:42:02 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5401D3A1A3;
        Thu, 30 Jun 2022 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656574919; x=1688110919;
  h=message-id:date:mime-version:subject:to:references:from:
   cc:in-reply-to:content-transfer-encoding;
  bh=4eqUmbRso9FmjT5MC/6HibjGIPMyb/Fplo8R3d0pYOc=;
  b=Mmz/540rKNK52kiDJ+MrLntWivWMy9ddRQlTFRn3n7+00zWR3HcwAVM7
   y90ePXQD6meI0shrSuaGQAJxR3Kxx6ZhA36+MPHScQ9Vo34BCynnr8HSw
   CGBTkm8LOBKOSMVJmO4yyigNCqMaLQTvszbhLQIIM+RiE9Y9oAkfYIr+k
   bqU1dIJT4VXJtPcGeD7jkvlCG0Ve9p6ylRodz2HSdM5abLbyvbatOpEdi
   OGFRmHaLzfyCuA8ZPo7vHvQseLk2sRCGCw16nF0m+sjISSlsd9kaga8xf
   0MmVxqxWCUb2EFgk5mcbCGiby7QWKW7KslwLeuJpoKWfXjh6DdmwvihkL
   A==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="102422082"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 00:41:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 00:41:57 -0700
Received: from [10.159.205.135] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 00:41:55 -0700
Message-ID: <176099e2-cbff-1987-f59a-2ca618a9c92a@microchip.com>
Date:   Thu, 30 Jun 2022 09:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 0/3] i2c: at91: Fixes and updates
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <andrew@sanpeople.com>,
        <mhoffman@lightlink.com>, <khali@linux-fr.org>, <peda@axentia.se>,
        Claudiu Beznea <Claudiu.Beznea@microchip.com>
References: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
 <YrysFU0fP7X1wkBd@shikoro>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
CC:     Cristian Birsan <Cristian.Birsan@microchip.com>
In-Reply-To: <YrysFU0fP7X1wkBd@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 29/06/2022 at 21:46, Wolfram Sang wrote:
> On Tue, Jun 14, 2022 at 01:13:44PM +0300, Codrin Ciubotariu wrote:
>> Resend due to the fact that the i2c list no longer accepts replys on the
>> old patch-set. Comments not addressed yet.
>>
>> The first patch is mostly a prerequisite for the second one. It only
>> moves the i2c_recover_bus() out of the actual transfer function. This
>> helps the second patch disable the controller before using GPIO
>> recovery. The second patch will keep the controller enabled when a
>> transfer occurs. Before using GPIO recovery, the controller must be
>> disabled, to ignore potential glitches. However, the controller must be
>> enabled for HW recovery (bus CLEAR command). The third and last patch
>> adds advanced digital filtering support for SAMA5D4. The TWI IP found in
>> SAMA5D4 supports advanced digital filtering, even if, at the moment of
>> this patch, the SAMA5D4 datasheet does not mention it.
 >
> So, can you guys read this mail? It should be possible somehow that I
> can read your remarks to my remarks, no?

Codrin is not with Microchip anymore and we have to re-distribute the 
maintenance of this driver internally. His email address will probably 
"bounce" soon.

So, forgive us if there's a lack of response for some time ;-)

Best regards,
   Nicolas

-- 
Nicolas Ferre
