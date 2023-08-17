Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B03777F974
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 16:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352079AbjHQOna (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 10:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352242AbjHQOnY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 10:43:24 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB863AAA;
        Thu, 17 Aug 2023 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692283326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=StW2LDxyH40TlcLcB0Lq1knJ6HzAAX/KlHlswohd4nU=;
        b=0yV1ONiPwmFEp48pHzdDanBDBn3rVklcPtppLxnuyVttIi4aCTNGOdrPLTd9UtsDE9NVCy
        tavFtU5Nlfm25QoILiuqDcsxRRtZvit+0v+HQu5D8t8IaI46nbPOxtI2DPa55DriMG/yIO
        YM4eGCjdkJUcfKlbaNvKlvrnufgcT0Q=
Received: from [192.168.43.126] (hen56-1_migr-78-240-185-16.fbx.proxad.net [78.240.185.16])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 629ad783 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Aug 2023 14:42:06 +0000 (UTC)
Message-ID: <d493159f-8656-5777-8f77-c45504397c60@sionneau.net>
Date:   Thu, 17 Aug 2023 16:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] i2c: designware: abort the transfer if receiving byte
 count of 0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
References: <20230811124624.12792-1-yann@sionneau.net>
 <20230811124624.12792-2-yann@sionneau.net>
 <ZNY/OL4ZKiTL3lF3@smile.fi.intel.com>
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <ZNY/OL4ZKiTL3lF3@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Le 11/08/2023 à 16:01, Andy Shevchenko a écrit :
> On Fri, Aug 11, 2023 at 02:46:24PM +0200, Yann Sionneau wrote:
>> From: Yann Sionneau <ysionneau@kalray.eu>
>>
>> Context:
>> It's not clear whether Linux SMBus stack supports receiving 0
>> as byte count for SMBus read data block.
>>
>> Linux supports SMBus v2.0 spec, which says "The byte count may not be 0."
>> Which does not seem very clear to me, as a non-native speaker.
>> (Note that v3.0 of the spec says "The byte count may be 0.")
>>
>> Some drivers explicitly return -EPROTO in case of byte count 0.
>>
>> The issue:
>> Regardless of whether Linux supports byte count of 0, if this happens
>> the i2c-designware driver goes into an unrecoverable state holding
>> SCL low if the IP is synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
>> parameter.
>>
>> The fix proposed by this patch:
>> Abort the transfer by sending a STOP condition on the bus.
>>
>> Another approach would be to ignore the issue and let the driver
>> timeout and disable the IP. The IP disabling is fixed by the previous
>> patch in this patch series.
>> The current patch just makes the recovery faster since Abort is sent
>> directly without waiting for the timeout to happen. With this patch,
>> disabling the IP is not necessary anymore.
> ...
>
>> +				if ((tmp <= I2C_SMBUS_BLOCK_MAX) && (tmp != 0))
> 				if (tmp && tmp <= I2C_SMBUS_BLOCK_MAX)

I find the tmp != 0 "more obvious", I am more used to "just tmp" when 
it's a pointer or a boolean, but maybe it's just me!

I'll fix that in the V2 :)

>
>> +					len = i2c_dw_recv_len(dev, tmp);
>> +				else
>> +					i2c_dw_abort(dev);
Thanks!
