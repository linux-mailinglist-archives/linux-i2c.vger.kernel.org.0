Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19DA55BBE91
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Sep 2022 17:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiIRPG1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Sep 2022 11:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiIRPGY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Sep 2022 11:06:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488EE20BC9;
        Sun, 18 Sep 2022 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=OP4My9HrBwrgFfmGL1p0+PbHONYIVGlnegSVTH0ck0c=; b=2I3/gSUjFS7cGzzQNtNFcknRvh
        KtuuhWFGr89MM+W1qami7qMcamegaCnxb/2JxA8TmjTH56SWiDtnfKcVB98EajPWYqsMbrcfDG/tN
        QYYvEEuDx/DBxJ+JpxQTAuDWW6n/8QLzHX9nEGb3JMrD84ONYUvNW7jcsPmW66AE+kT2c2xDO93NJ
        svR4BxGH0TfiAbqnmr7asm3b1egW35PP32DYDgvOTHjF/5fR0E1rQAeRs8EVmMoHFUiaiqflo+w4+
        ESJ68ZtcSq5+5ZliJe79yya3rQHckXhhF4Yh+osFadlN1CcBLGND0JPva6QOnx8b6nytdw00/hpY3
        j7qUHymw==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oZvsD-00HPIR-Cm; Sun, 18 Sep 2022 15:06:21 +0000
Message-ID: <d240fbc9-fcc7-2951-98b0-b8131174ffea@infradead.org>
Date:   Sun, 18 Sep 2022 08:06:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] i2c: viperboard: fix repeated words in comments
Content-Language: en-US
To:     Jilin Yuan <yuanjilin@cdjrlc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220918094735.18466-1-yuanjilin@cdjrlc.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220918094735.18466-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/18/22 02:47, Jilin Yuan wrote:
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
> +			/* send the addr, the data goes to board */

preferably:		                           goes to the board */

>  			ret = vprbrd_i2c_addr(vb->usb_dev, amsg);
>  			if (ret < 0)
>  				error = ret;

-- 
~Randy
