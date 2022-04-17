Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE68504753
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Apr 2022 11:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbiDQJM3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Apr 2022 05:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233750AbiDQJM1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Apr 2022 05:12:27 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8FD140C8
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 02:09:52 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t25so14560176edt.9
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=GiPK6NF7dA83/ZSlJ194lqXCRBkv0Amy9M4fkRNGgTQ=;
        b=KK9reSaYWMJkb2LTAcRu4vnFrWuMGSD5uZkIQOaEn8Dgr/cikkKCse0sxICtqJJo3v
         3fREWJM+QjRtZjoCw9OHRhcMDoUYIEhZO3M4Pudcq3FDzPhUEVNdUy2RM/M/LWjXitKc
         upd+hwELrFPG9BfJnWvch5KEi6BWi2bheu3Qkb4x9Eq3efeLND1Ix3gt1GuY0zjyMz1x
         /EZcKY2zulqHCUccb/SHM5mViwBudOep0EiC4woamZTK9o0hoLrfPhCQtYjD5/FPu/kv
         MbipPhRpsuMxIz+KUqSqQxqEtyErCBJ53bGUBVl3sh36++NBmtYUggR+rPf6+L7tHQqG
         soLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GiPK6NF7dA83/ZSlJ194lqXCRBkv0Amy9M4fkRNGgTQ=;
        b=ND9jUDZB69kjSN0N3I470pk1vuLo2iEa8RxnNfNSeog8xT27yKNgn8h8Q6OiBl49An
         erPzqG/4G04RV84QmB8C7Tpz4w6qLjK3elfkwdW54mVXPFNUU1zFUXHbebPCvoo7djQn
         zaZtoYrXhPu4QNWPUmBKm1P4FV3Rq+1cVD+igwlwAazpOExw7YTa8U5tKV5baTbRk7Lg
         UnkFwaCjiUHcLkG/QjRmpO5YrBCumsEWM28U2jMHAk6Btt6v6lkt5ZquRNjWUTj243j3
         T7xcebjwYYYNyYCTuuhCfpk5AIdV5iSGie9E6x6ypYsVCR5oN+kwLUfPx0F4A6sx7Z3l
         jKPQ==
X-Gm-Message-State: AOAM531zNFyh8Km7Ev+IP299SWsoJXTBoq44x5VSWewZ0niWUiBxz+Bn
        gqHbES30xE58w0TRyZEfYJk=
X-Google-Smtp-Source: ABdhPJz+4gwwvieJlAKdiyeJO2Ifconzfizf5JA++SGAb7FCwB87ruChvTjQpSFRhRm8iOAWBfA+9A==
X-Received: by 2002:a05:6402:4499:b0:41d:7e83:8565 with SMTP id er25-20020a056402449900b0041d7e838565mr7158005edb.332.1650186591066;
        Sun, 17 Apr 2022 02:09:51 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4c8:500:7d1f:a75a:cedd:d1a2? (dynamic-2a01-0c23-c4c8-0500-7d1f-a75a-cedd-d1a2.c23.pool.telefonica.de. [2a01:c23:c4c8:500:7d1f:a75a:cedd:d1a2])
        by smtp.googlemail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3354417ejc.150.2022.04.17.02.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Apr 2022 02:09:50 -0700 (PDT)
Message-ID: <16a7db3c-6caa-6738-e5d8-aab665912542@gmail.com>
Date:   Sun, 17 Apr 2022 11:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: i801: I2C block read should be usable also on
 ICH/ICH0/ICH2/ICH3/ICH4
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <b4cb50db-7226-282f-e04a-02fbe0b605a0@gmail.com>
 <Ylt7FU/3TTvvcNx7@shikoro>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <Ylt7FU/3TTvvcNx7@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17.04.2022 04:27, Wolfram Sang wrote:
> On Mon, Dec 06, 2021 at 10:18:49PM +0100, Heiner Kallweit wrote:
>> Currently we use the following feature definitions. However, according to
>> the respective datasheets, also ICH/ICH0/ICH2/ICH3/ICH4 support I2C block
>> read. The implementation we have should work also on these chip versions.
>>
>> The commit message of 6342064cad7a ("i2c-i801: Implement I2C block read
>> support") states that i2c block read is supported from ICH5 only.
>> This doesn't seem to be true. Or is this feature broken on older chip
>> versions? 
>>
>> To me it seems we could remove FEATURE_I2C_BLOCK_READ because all chip
>> versions support this feature. Below is an experimental patch, for the
>> ones with test hw. A test case could be to use decode-dimms that
>> uses i2c block read to read the EEPROM content.
>>
>> * Supports the following Intel I/O Controller Hubs (ICH):
>>  *
>>  *					I/O			Block	I2C
>>  *					region	SMBus	Block	proc.	block
>>  * Chip name			PCI ID	size	PEC	buffer	call	read
>>  * ---------------------------------------------------------------------------
>>  * 82801AA (ICH)		0x2413	16	no	no	no	no
>>  * 82801AB (ICH0)		0x2423	16	no	no	no	no
>>  * 82801BA (ICH2)		0x2443	16	no	no	no	no
>>  * 82801CA (ICH3)		0x2483	32	soft	no	no	no
>>  * 82801DB (ICH4)		0x24c3	32	hard	yes	no	no
>>  * 82801E (ICH5)		0x24d3	32	hard	yes	yes	yes
> 
> Any reason you skipped this patch in your latest series?
> 
Supporting I2C block read on all chip versions is part of patch 4 in the
series. I didn't remove feature flag FEATURE_I2C_BLOCK_READ yet to give users
the chance to disable the feature via module parameter in case of problems.
