Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03CB66D12D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 22:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbjAPV7d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 16:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234743AbjAPV7c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 16:59:32 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C141241FB;
        Mon, 16 Jan 2023 13:59:31 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d2so8627897wrp.8;
        Mon, 16 Jan 2023 13:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WY8eqApsm+Isgqx4VhVn6+4e+QgNiP5Qcayvzgrtp4s=;
        b=WLClSBUFEfOa4X+H2Y3lNGHdpQipiD0EqofVZpW4v0MpaWZUWLfzLv83nDto5yEXTK
         FPwte6NKRV0JkZp+cAHdJBKMz7xjNqHVyGnkhHyAquGAGpXXFn/OjXs3DMW3nPxXxUIh
         n8EINgbU7qs5UYr0nfqEPtP9D0mPoeNrHEXdDRsMH93hFM/1EB3GhdK9JTmuWk4+nwcA
         HL1xH1ZNQBb4Um9rKWVi8OxnhOHVs4ksUSJIlgc4SggOGZd3nibTFLX14x23O6SGiuSZ
         T7IAXXN1aV74lmvPJcRkT0JRj1kwfmiUn9w3PC8qjttM640FLeIdHqUCBUDHF39+RjZc
         V2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY8eqApsm+Isgqx4VhVn6+4e+QgNiP5Qcayvzgrtp4s=;
        b=IUpE7cDzZs5l2+S0ie8CB99B36pogQKkK8LHrNTpcJ7/sJYxuB4LZlehZI2LRu5a/b
         jTiRTGdO8Ro2OqWrFwpkyJwyUEPjoCShg3oJbxSyOjxW8bDj4YtTMXE8eqonBp5lf0cD
         7tHgpkc/77hbEIiQOFj5yHv0RgQeDpp0cvcuPY6EgqSGxtgJpKO59m9xylLB0wvmHS9L
         CJqqSo7v45LxqKoohL5Y4f/50ylzajHqqGooJoeDJpC2vWQVlyen/zf11NH07FwFWWI4
         TIykQ91SycBFeT+eD+GF/t48cpEFbxqshCfQKE6PQ7t35aPzC3Mid38BFdME40tYGJUO
         Nk4w==
X-Gm-Message-State: AFqh2kq7zAeiahGySJI730tdUuXNOT1byJGvQZWApljlEkVQsi7yJUTT
        yEmkf2iXxxPH750mAi2w/Wg=
X-Google-Smtp-Source: AMrXdXve86wTMWyLsghW4V63YiWxWnkls+G6EGQAM7LhlCwrP50GGdjM/WpVH86aFzxnNgC4QE4kbA==
X-Received: by 2002:a5d:4ccc:0:b0:2bd:e710:d817 with SMTP id c12-20020a5d4ccc000000b002bde710d817mr910784wrt.0.1673906369556;
        Mon, 16 Jan 2023 13:59:29 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4bc:ff00:1041:a2b8:3c58:ba6d? (dynamic-2a01-0c23-c4bc-ff00-1041-a2b8-3c58-ba6d.c23.pool.telefonica.de. [2a01:c23:c4bc:ff00:1041:a2b8:3c58:ba6d])
        by smtp.googlemail.com with ESMTPSA id v14-20020adff68e000000b002365730eae8sm27354723wrp.55.2023.01.16.13.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 13:59:29 -0800 (PST)
Message-ID: <22af23f5-f037-2b3b-a31b-a978e6957ed3@gmail.com>
Date:   Mon, 16 Jan 2023 22:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/3] i2c: algo: bit: allow getsda to be NULL
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
 <b70a9deb-5dc2-fbde-20f1-06b2a80c2697@gmail.com>
 <7ebc1687-d962-d087-aaba-33f62fa65f8a@axentia.se>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <7ebc1687-d962-d087-aaba-33f62fa65f8a@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16.01.2023 08:17, Peter Rosin wrote:
> Hi!
> 
> 2023-01-15 at 11:15, Heiner Kallweit wrote:
>> This is in preparation of supporting write-only SDA in i2c-gpio.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v3:
>> - check for adap->getsda in readbytes()
>> - align warning message level for info on missing getscl/getsda
>> ---
>>  drivers/i2c/algos/i2c-algo-bit.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
>> index fc90293af..a1b822723 100644
>> --- a/drivers/i2c/algos/i2c-algo-bit.c
>> +++ b/drivers/i2c/algos/i2c-algo-bit.c
>> @@ -184,8 +184,9 @@ static int i2c_outb(struct i2c_adapter *i2c_adap, unsigned char c)
>>  
>>  	/* read ack: SDA should be pulled down by slave, or it may
>>  	 * NAK (usually to report problems with the data we wrote).
>> +	 * Always report ACK if SDA is write-only.
>>  	 */
>> -	ack = !getsda(adap);    /* ack: sda is pulled low -> success */
>> +	ack = !adap->getsda || !getsda(adap);    /* ack: sda is pulled low -> success */
>>  	bit_dbg(2, &i2c_adap->dev, "i2c_outb: 0x%02x %s\n", (int)c,
>>  		ack ? "A" : "NA");
>>  
>> @@ -232,6 +233,10 @@ static int test_bus(struct i2c_adapter *i2c_adap)
>>  	const char *name = i2c_adap->name;
>>  	int scl, sda, ret;
>>  
>> +	/* Testing not possible if both pins are write-only. */
>> +	if (adap->getscl == NULL && adap->getsda == NULL)
>> +		return 0;
> 
> Would it not be nice to keep output-only SCL and SDA independent? With
> your proposed check before doing the tests, all tests will crash when
> adap->getsda is NULL, unless adap->getscl also happens to be NULL.
> 
> So, I would like to remove the above check and instead see some changes
> along the lines of
> 
> -	sda = getsda(adap);
> +	sda = (adap->getsda == NULL) ? 1 : getsda(adap);
> 
> (BTW, I dislike this way of writing that, and would have written
> 	sda = adap->getsda ? getsda(adap) : 1;
>  had it not been for the preexisting code for the SCL case. Oh well.)
> 
Right, I'll change it accordingly in v2.

>> +
>>  	if (adap->pre_xfer) {
>>  		ret = adap->pre_xfer(i2c_adap);
>>  		if (ret < 0)
>> @@ -420,6 +425,10 @@ static int readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
>>  	unsigned char *temp = msg->buf;
>>  	int count = msg->len;
>>  	const unsigned flags = msg->flags;
>> +	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
>> +
>> +	if (!adap->getsda)
>> +		return -EOPNOTSUPP;
>>  
>>  	while (count > 0) {
>>  		inval = i2c_inb(i2c_adap);
>> @@ -670,8 +679,11 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	/* Complain if SCL can't be read */
>> +	if (bit_adap->getsda == NULL)
>> +		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");
>> +
>>  	if (bit_adap->getscl == NULL) {
>> +		/* Complain if SCL can't be read */
>>  		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
>>  		dev_warn(&adap->dev, "Bus may be unreliable\n");
>>  	}
> 
> And here you'd need something like this to make them independently select-able:
> 
> 	if (bit_adap->getsda == NULL)
> 		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");
> 
> 	if (bit_adap->getscl == NULL)
> 		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
> 
> 	if (bit_adap->getscl == NULL || bit_adap->getsda == NULL)
> 		dev_warn(&adap->dev, "Bus may be unreliable\n");
> 
Will be changed accordingly in v2.

> Anyway, as is, this patch is broken if getsda is NULL while getscl is not.
> There is no documentation describing that limitation. It looks easier to
> fix the limitation than to muddy the waters by having ifs and buts.
> 
> Cheers,
> Peter

