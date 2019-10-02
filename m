Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BEEC47BA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2019 08:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfJBGU6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Oct 2019 02:20:58 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:47709 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfJBGU6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Oct 2019 02:20:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 7152918487;
        Wed,  2 Oct 2019 08:20:55 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id vvTzjNMkKmrv; Wed,  2 Oct 2019 08:20:54 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
        by bastet.se.axis.com (Postfix) with ESMTPS id 8498718466;
        Wed,  2 Oct 2019 08:20:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 67C101E07C;
        Wed,  2 Oct 2019 08:20:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5BC4C1E07A;
        Wed,  2 Oct 2019 08:20:54 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
        by boulder03.se.axis.com (Postfix) with ESMTP;
        Wed,  2 Oct 2019 08:20:54 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
        by seth.se.axis.com (Postfix) with ESMTP id 4F5C5791;
        Wed,  2 Oct 2019 08:20:54 +0200 (CEST)
Received: from [10.88.24.4] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
 Microsoft SMTP Server (TLS) id 15.0.1365.1; Wed, 2 Oct 2019 08:20:54 +0200
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
To:     Patrick Williams <alpawi@amazon.com>
CC:     =?UTF-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191001164009.21610-1-alpawi@amazon.com>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
Date:   Wed, 2 Oct 2019 08:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001164009.21610-1-alpawi@amazon.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,


I sent in another patch earlier that added support for specifying a file 
in devicetree to initilize the eeprom from, corresponding to the case of 
pre-flashed eeprom. Maybe these two patches should be merged so this 
initialization is only done if no file is specified?


/BA

On 10/1/19 6:40 PM, Patrick Williams wrote:
> The i2c-slave-eeprom driver emulates at24 class eeprom devices,
> which come initialized with all 1s.  Do the same in the software
> emulation.
>
> Signed-off-by: Patrick Williams <alpawi@amazon.com>
> ---
>   drivers/i2c/i2c-slave-eeprom.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
> index db9763cb4dae..efee56106251 100644
> --- a/drivers/i2c/i2c-slave-eeprom.c
> +++ b/drivers/i2c/i2c-slave-eeprom.c
> @@ -131,6 +131,8 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_de
>   	if (!eeprom)
>   		return -ENOMEM;
>   
> +	memset(eeprom->buffer, 0xFF, size);
> +
>   	eeprom->idx_write_cnt = 0;
>   	eeprom->num_address_bytes = flag_addr16 ? 2 : 1;
>   	eeprom->address_mask = size - 1;
