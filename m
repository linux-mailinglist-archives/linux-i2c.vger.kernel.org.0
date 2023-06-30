Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E33774430E
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 22:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjF3UGb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Jun 2023 16:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjF3UG2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jun 2023 16:06:28 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Jun 2023 13:06:26 PDT
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC06C13E
        for <linux-i2c@vger.kernel.org>; Fri, 30 Jun 2023 13:06:26 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id FKGYqEHA1L1SxFKGYqWJB6; Fri, 30 Jun 2023 21:58:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688155134;
        bh=o5ckSAdQhDQt1G2xCQ7TAMOKGpjs8f/t5pbLIrXW61w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=coif+5OJouCPXahY3jBN1vHFtlk7H1YYxyB0Wcxop2vfbsw2XfxnPLSc/fXl7tK42
         Fab/mbDCUQylqSYpzZ9XnzVKzu8CVUjDWPORlpfnIz1X3uis9V77TmEm9jU/2HBqfy
         aT2LfBL9QtW47P4d8VBmeIvJt/3y/+SOefM/b2LfX2fzt39Ynw1jwb1bExlj2VBrk0
         sKlzr1dGNG0/QSi/uqZNFAcLDrvINU/N8K43kS/tim7dZsaIRWguPJFZ/97+cdF8dg
         elyCzTpYmcp8SLImDj/d2ant5WjCuTtunZjipW3O8yKMf+eIUKD6yLf9LvzGdjO4GF
         iRRcrDT5y+rNw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Jun 2023 21:58:54 +0200
X-ME-IP: 86.243.2.178
Message-ID: <85f98e39-1f66-8049-91a4-d11c3003877d@wanadoo.fr>
Date:   Fri, 30 Jun 2023 21:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Content-Language: fr
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
 <20230627115920.c4ms65vgrbiyekc6@intel.intel>
 <7c6db53c-427d-4ba5-80b7-a069ab9322a0@kadam.mountain>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <7c6db53c-427d-4ba5-80b7-a069ab9322a0@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 27/06/2023 à 14:08, Dan Carpenter a écrit :
> On Tue, Jun 27, 2023 at 01:59:20PM +0200, Andi Shyti wrote:
>> Hi Dan,
>>
>> On Tue, Jun 27, 2023 at 10:12:36AM +0300, Dan Carpenter wrote:
>>> The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
>>> that was intended.  We can also use the %pe string format to print the
>>> error code name instead of just the number.
>>>
>>> Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>   drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
>>> index ad8270cdbd3e..fa6020dced59 100644
>>> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
>>> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
>>> @@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
>>>   
>>>   	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
>>>   	if (IS_ERR(p2wi->rstc)) {
>>> -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
>>> +		dev_err(dev, "failed to retrieve reset controller: %pe\n",
>>> +			p2wi->rstc);
>>
>> Yes, good catch! Thanks! But I think we want to print the error
>> value here, so I think it should be:
>>
>> -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
>> +		dev_err(dev, "failed to retrieve reset controller: %d\n",
>> +			PTR_ERR(p2wi->rstc));
>>
> 
> The %pe which I changed it to is a cool new thing that prints:
> 
> 	failed to retrieve reset controller: -EINVAL\n
> 
> We should create a similar %e printk format that works for ints instead
> of error pointers.  But instead of that you have people who cast error
> codes to pointers just to get the %pe functionality.  And other people
> who make suggestions (this is the catagory that I'm in) but are too lazy
> to do the actual work.

Hi Dan,

why not switch to dev_err_probe()?

CJ

> 
> regards,
> dan carpenter
> 
> 

