Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7FC6EE3A7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 16:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjDYOJ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 10:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbjDYOJZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 10:09:25 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F14A10EB;
        Tue, 25 Apr 2023 07:09:24 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b73203e0aso35703074b3a.1;
        Tue, 25 Apr 2023 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682431763; x=1685023763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3xw+BHdORTGVKTA8blkRS/DTjnBNoDy+SuKaT8k7XdY=;
        b=msswW182Tyq0PSGUu7Weqp4+k0V9RWFRWUxa7nA81uhcXyAbGUDXqj+gRDf+diBp2c
         2uHeODOIamsabfhANrwTdGh2FYWnKB09fAeJn3Ek8Iqz5IQvtvTeidsHEwD3K8AizUOg
         iiWGx+NqTJRzCijWAqLwupWs1YGI13fC4ijCidxzLdBcZJ6aI6YQv0uEvLkfTHM6MoRT
         y44920VH1JLyjQpJdCIkYDn+FA61vhdswxqknrnHWpImlWWhCTKSr7lqXXIquTq48ns+
         5ek4j9a07czgUo8vkDIfW+Ednu0ouFzXjGCV1tolg5cwYh416zMVr3ejO4upV/opnbKp
         yQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431763; x=1685023763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xw+BHdORTGVKTA8blkRS/DTjnBNoDy+SuKaT8k7XdY=;
        b=gSdrpzd9xm72ahr+RcisRZ1UuxjMaELCo01dxkhnQpgIC1VlNnCJrGz8830KsWeE/8
         sIXGbcBEEVC4Qxz7sXXfaihCM5ZU0pW7pd8t37Rxp9dH6gDr0ugtbBhpBWvKKHEpyKoX
         nLs2lxUSX1NRB0C49fCGXAcZn3bJMAy0VqYkyUuQQreP7yqLxrG5AVrUqZ6APLhn3ROn
         U3efoV54MPzG6pONoB1icKSz7GyBDfDMjn257nLz4zmSYUdbvYbp17/ZWMXLHyhWEOc4
         ktzv/8MrHE40Xxl+BKjvcxMXC04KhqfOUmNXj+ZFUHnwnb0oXyy2Yex5WckvlFf5yg8l
         zXBQ==
X-Gm-Message-State: AAQBX9dC4O6AKjlPojsYJIFW3mBYAH2Qpls2vVU61NUzkuqExpm1RkuA
        u6ru+txO29gHnTdo4tdM+u8=
X-Google-Smtp-Source: AKy350a2npN+62JYHbVOqk1QSV0NuQTdqIKvT8rZHPSvkfX7ovD6A/q/cH1c5IC+6K5ecKeU8ha49w==
X-Received: by 2002:a17:903:1c1:b0:1a1:cb18:7f99 with SMTP id e1-20020a17090301c100b001a1cb187f99mr19550907plh.30.1682431763570;
        Tue, 25 Apr 2023 07:09:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902b20a00b001a6b02659c0sm6266958plr.159.2023.04.25.07.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 07:09:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ccbced2f-0258-cfd7-2f91-e246dadae8fb@roeck-us.net>
Date:   Tue, 25 Apr 2023 07:09:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
 <20230425134537.pzsplcpkrog2552r@intel.intel>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230425134537.pzsplcpkrog2552r@intel.intel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/25/23 06:45, Andi Shyti wrote:
> Hi Delphine,
> 
> On top of Guenter's comments,
> 
> [...]
> 
>> +config SENSORS_LTC4286
>> +	bool "Linear Technologies LTC4286"
>> +	help
>> +	  If you say yes here you get hardware monitoring support for Linear
>> +	  Technology LTC4286.
> 
> could you add a couple of words more here?
> 
> [...]
> 
>> +static int ltc4286_probe(struct i2c_client *client,
>> +			 const struct i2c_device_id *id)
>> +{
>> +	int ret;
>> +	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
>> +	struct device *dev = &client->dev;
>> +	struct pmbus_driver_info *info;
>> +	u32 rsense;
>> +
>> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "failed to read manufacturer id\n");
> 
> you can use dev_err_probe() here:
> 
> 	return dev_err_probe(&client->dev, err, "failed to read manufacturer id\n");
> 
>> +		return ret;
>> +	}
>> +
>> +	/* Refer to ltc4286 datasheet page 20
>> +	 * the default manufacturer id is LTC
>> +	 */
>> +	if (ret != LTC4286_MFR_ID_SIZE ||
>> +	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
>> +		dev_err(&client->dev, "unsupported manufacturer id\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "failed to read manufacturer model\n");
>> +		return ret;
>> +	}
> 
> Is this read really needed?
> 

It only makes sense if the returned string is actually validated.
Otherwise no.

Guenter

