Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644ABA3275
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 10:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfH3IbG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 04:31:06 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:33869 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfH3IbG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Aug 2019 04:31:06 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id A3C71100013;
        Fri, 30 Aug 2019 08:31:03 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Denis Efremov <efremov@linux.com>
Cc:     linux-kernel@vger.kernel.org, joe@perches.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: i2c mv64xxx: Update documentation path
In-Reply-To: <20190829200055.GJ3740@ninjato>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com> <20190813060913.14722-1-efremov@linux.com> <20190829200055.GJ3740@ninjato>
Date:   Fri, 30 Aug 2019 10:31:03 +0200
Message-ID: <87a7brxdfc.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@the-dreams.de> writes:

> On Tue, Aug 13, 2019 at 09:09:13AM +0300, Denis Efremov wrote:
>> Update MAINTAINERS record to reflect the file move
>> from i2c-mv64xxx.txt to marvell,mv64xxx-i2c.yaml.
>> 
>> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
>> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
>> Cc: linux-i2c@vger.kernel.org
>> Fixes: f8bbde72ef44 ("dt-bindings: i2c: mv64xxx: Add YAML schemas")
>> Signed-off-by: Denis Efremov <efremov@linux.com>
>
> Looks OK to me, Gregory or Maxime?

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 87ac0378186c..590dcebe627f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7505,7 +7505,7 @@ I2C MV64XXX MARVELL AND ALLWINNER DRIVER
>>  M:	Gregory CLEMENT <gregory.clement@bootlin.com>
>>  L:	linux-i2c@vger.kernel.org
>>  S:	Maintained
>> -F:	Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
>> +F:	Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
>>  F:	drivers/i2c/busses/i2c-mv64xxx.c
>>  
>>  I2C OVER PARALLEL PORT
>> -- 
>> 2.21.0
>> 

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
