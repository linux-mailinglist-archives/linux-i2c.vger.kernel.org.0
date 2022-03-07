Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6F24D0529
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 18:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240148AbiCGRYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 12:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233824AbiCGRYy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 12:24:54 -0500
X-Greylist: delayed 5190 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Mar 2022 09:23:59 PST
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C027E3982F
        for <linux-i2c@vger.kernel.org>; Mon,  7 Mar 2022 09:23:59 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id E4B7F2223A;
        Mon,  7 Mar 2022 18:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1646673837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FdsdiUiJOkW0PiGfOrMO/ZttiKWYHwhJyRnmz4iEZ/s=;
        b=tsd8z4k11Y41mtJqTPtWarzBj9yb+sSEWApbH8E6XK0iQ6jQUUXphh3HHQ8sy4P/NEvPlj
        MuW5tmkilSBgSyy65JG8j6D32b99KB90nUQLiLrj7G92n4tZf9urCzSu91S6WsxHTSWvBM
        QvgXGbHhZlbeSmwhDUCJFu9cLQjeNBQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Mar 2022 18:23:57 +0100
From:   Michael Walle <michael@walle.cc>
To:     Codrin.Ciubotariu@microchip.com
Cc:     Tudor.Ambarus@microchip.com, linux-i2c@vger.kernel.org
Subject: Re: wrong assumption in i2c-at91-master.c ?
In-Reply-To: <988d9fb8-eaab-13f1-db5e-189825a16097@microchip.com>
References: <591de05fde401e8899726e015b837cd1@walle.cc>
 <988d9fb8-eaab-13f1-db5e-189825a16097@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <554fbcb82bd9803a8ba13cf732771c7b@walle.cc>
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

Hi Codrin,

Am 2022-03-07 18:09, schrieb Codrin.Ciubotariu@microchip.com:
> On 07.03.2022 17:57, Michael Walle wrote:
>> I saw that the at91 i2c driver has some kind of heuristic in
>> at91_twi_xfer(). It assumes that if there are exactly two
>> messages to transfer, the first is the address write of a
>> common i2c write address, read data transaction. I don't
>> think that assumption is correct.
>> 
>> Also there is no check if msg->len is actually smaller
>> than the width of the address which can be written to
>> AT91_TWI_IADR.
>> 
>> I think, what is at least missing is that, the first
>> one is actually a write and have at max 3 bytes (IIRC
>> thats the max width of AT91_TWI_IADR).
>> 
>> Actually, I don't find any code at all which would
>> handle multiple messages. Looks like it just supports
>> num == 2 (and assumes the first message fits into the
>> AT91_TWI_IADR) and num == 1.
> 
> The constraints are set using the quirks feature [1] of the i2c 
> subsystem.

Ahhh! Now it makes sense. Thanks.

-michael
