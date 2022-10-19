Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7D3604A0C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 16:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbiJSO4k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 10:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiJSO43 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 10:56:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B64127BCC;
        Wed, 19 Oct 2022 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=UHlxL8HHiOHdihTzkN1ZvvCQ17iIj6cVDcrPzFKGe/A=; b=QazlWvneHO89nNjasRju2jcVLs
        BonL+xBq/wU5tAjGy3rg0jwkgcWTBGAEkelDM58Gt8XN3NWNgsL8zGBbdKbvTS9/lLjEWrlMlNaAK
        v0C4ELa1/aoDD5oKLBHTsRv9qWjdyGlxejQiWB7aSW1MKVoh/hwnw5R3yVzmJVHNWpLhebKF395dS
        HLBK4e1a2VvNmn1CTsrIyAkow6mxhkb06gV/W9CoqzxeCDPqNyP6pVeU/ZqhZy4us3iGGDNKoycbx
        BFjV5+5ddBbAgLLhwqszVP2rNEp7Xj0KsdBiwoPLdDL0aUCgMMjB8JHxH4iA6BLuRoTNUgGaCIabI
        HjIavHCA==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1olAMy-002st6-Ez; Wed, 19 Oct 2022 14:48:32 +0000
Message-ID: <a4430474-d8a2-deda-b0eb-de1a743d4e72@infradead.org>
Date:   Wed, 19 Oct 2022 07:48:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] i2c: fix repeated words in comments
Content-Language: en-US
To:     Jilin Yuan <yuanjilin@cdjrlc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019130055.58905-1-yuanjilin@cdjrlc.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221019130055.58905-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/19/22 06:00, Jilin Yuan wrote:
> Delete the redundant word 'to'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>  drivers/i2c/busses/i2c-viperboard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
> index 8b5322c3bce0..8f87394abbcf 100644
> --- a/drivers/i2c/busses/i2c-viperboard.c
> +++ b/drivers/i2c/busses/i2c-viperboard.c
> @@ -318,7 +318,7 @@ static int vprbrd_i2c_xfer(struct i2c_adapter *i2c, struct i2c_msg *msgs,
>  			amsg->addr = pmsg->addr;
>  			amsg->unknown1 = 0x00;
>  			amsg->len = cpu_to_le16(pmsg->len);
> -			/* send the addr, the data goes to to board */

			                                to the board */

would be better.

> +			/* send the addr, the data goes to board */
>  			ret = vprbrd_i2c_addr(vb->usb_dev, amsg);
>  			if (ret < 0)
>  				error = ret;

-- 
~Randy
