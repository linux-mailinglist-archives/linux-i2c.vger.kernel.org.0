Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A322051C38B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 May 2022 17:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351572AbiEEPPO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 May 2022 11:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiEEPPO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 May 2022 11:15:14 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3172BC0F;
        Thu,  5 May 2022 08:11:33 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 1A2F422205;
        Thu,  5 May 2022 17:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1651763491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X4UP6069upSAVdzEbZTvI/GU1SyPtbLZbn/Xr0OjFbY=;
        b=BeZQlslXr2cadlkcDPbqpc6/U+6AVHRWEs/66Sc2QarlHx6v24hKjpcbOKRtHoFY1C+L7z
        rn3PVUDns8G0M8nCA6J7+EIoshXhE2vskY8iNUI0wPFsz4ORWSRU++1XituRXaZK3SaUeW
        5ubR0UeMuiZqw18zEnmvGT5RDe/w0Zs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 05 May 2022 17:11:30 +0200
From:   Michael Walle <michael@walle.cc>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2] i2c: at91: use dma safe buffers
In-Reply-To: <YnPkfrI4Udl9lMR8@dev-arch.thelio-3990X>
References: <20220407150828.202513-1-michael@walle.cc>
 <YnPkfrI4Udl9lMR8@dev-arch.thelio-3990X>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <54f02090e6621460b66dc9d233d53283@walle.cc>
X-Sender: michael@walle.cc
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+ Wolfram]

Am 2022-05-05 16:51, schrieb Nathan Chancellor:
> On Thu, Apr 07, 2022 at 05:08:28PM +0200, Michael Walle wrote:
>> The supplied buffer might be on the stack and we get the following 
>> error
>> message:
>> [    3.312058] at91_i2c e0070600.i2c: rejecting DMA map of vmalloc 
>> memory
>> 
>> Use i2c_{get,put}_dma_safe_msg_buf() to get a DMA-able memory region 
>> if
>> necessary.
>> 
>> Fixes: 60937b2cdbf9 ("i2c: at91: add dma support")
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>> ---
>> changes since v1:
>>  - remove extra empty line
>>  - add fixes tag as suggested by Codrin
>> 
>>  drivers/i2c/busses/i2c-at91-master.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-at91-master.c 
>> b/drivers/i2c/busses/i2c-at91-master.c
>> index b0eae94909f4..5eca3b3bb609 100644
>> --- a/drivers/i2c/busses/i2c-at91-master.c
>> +++ b/drivers/i2c/busses/i2c-at91-master.c
>> @@ -656,6 +656,7 @@ static int at91_twi_xfer(struct i2c_adapter *adap, 
>> struct i2c_msg *msg, int num)
>>  	unsigned int_addr_flag = 0;
>>  	struct i2c_msg *m_start = msg;
>>  	bool is_read;
>> +	u8 *dma_buf;
>> 
>>  	dev_dbg(&adap->dev, "at91_xfer: processing %d messages:\n", num);
>> 
>> @@ -703,7 +704,17 @@ static int at91_twi_xfer(struct i2c_adapter 
>> *adap, struct i2c_msg *msg, int num)
>>  	dev->msg = m_start;
>>  	dev->recv_len_abort = false;
>> 
>> +	if (dev->use_dma) {
>> +		dma_buf = i2c_get_dma_safe_msg_buf(m_start, 1);
>> +		if (!dma_buf) {
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
>> +		dev->buf = dma_buf;
>> +	}
>> +
>>  	ret = at91_do_twi_transfer(dev);
>> +	i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
>> 
>>  	ret = (ret < 0) ? ret : num;
>>  out:
>> --
>> 2.30.2
>> 
>> 
> 
> This change as commit 03fbb903c8bf ("i2c: at91: use dma safe buffers")
> causes the following clang warning:

Ugh..

> drivers/i2c/busses/i2c-at91-master.c:707:6: error: variable 'dma_buf'
> is used uninitialized whenever 'if' condition is false
> [-Werror,-Wsometimes-uninitialized]
>         if (dev->use_dma) {
>             ^~~~~~~~~~~~
> drivers/i2c/busses/i2c-at91-master.c:717:27: note: uninitialized use 
> occurs here
>         i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
>                                  ^~~~~~~
> drivers/i2c/busses/i2c-at91-master.c:707:2: note: remove the 'if' if
> its condition is always true
>         if (dev->use_dma) {
>         ^~~~~~~~~~~~~~~~~~
> drivers/i2c/busses/i2c-at91-master.c:659:13: note: initialize the
> variable 'dma_buf' to silence this warning
>         u8 *dma_buf;
>                    ^
>                     = NULL
> 1 error generated.
> 
> Should this variable be initialized or should the call to
> i2c_put_dma_safe_msg_buf() be moved into the if statement?

Initializing dma_buf with NULL should to the trick because
i2c_put_dma_safe_msg_buf() is handling NULL gracefully. No
need for an extra "if (dma_buf)".

Will you take care or should I send a patch?

-michael
