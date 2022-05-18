Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E342F52C0D7
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 19:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240069AbiERQ0c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 12:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240118AbiERQ0K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 12:26:10 -0400
X-Greylist: delayed 965 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 18 May 2022 09:26:05 PDT
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D8A1D0E6;
        Wed, 18 May 2022 09:26:04 -0700 (PDT)
Received: from [77.244.183.192] (port=64666 helo=[192.168.178.75])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nrMFJ-000DgX-8b; Wed, 18 May 2022 18:09:57 +0200
Message-ID: <806462b6-e85e-f5e8-9ffb-cffa5dae72c2@lucaceresoli.net>
Date:   Wed, 18 May 2022 18:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
 <Yn+8CJ3j2SY2+Mq+@shikoro> <7ab1f387-3670-4b49-211d-3ff9a7c3d40b@axentia.se>
 <758ebcab-b0a2-29bd-d79c-1fbdc95212ae@axentia.se>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <758ebcab-b0a2-29bd-d79c-1fbdc95212ae@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter, all,

On 16/05/22 10:07, Peter Rosin wrote:
> [Now with the proper email to Luca, sorry about that...]
> 
> 2022-05-16 at 09:57, Peter Rosin wrote:
>> 2022-05-14 at 16:26, Wolfram Sang wrote:
>>> On Tue, Apr 12, 2022 at 10:50:45AM +0200, Vincent Whitchurch wrote:
>>>> When drivers with ->detect callbacks are loaded, the I2C core does a
>>>> bunch of transactions to try to probe for these devices, regardless of
>>>> whether they are specified in the devicetree or not.  (This only happens
>>>> on I2C controllers whose drivers enable the I2C_CLASS* flags, but this
>>>> is the case for generic drivers like i2c-gpio.)
>>>>
>>>> These kinds of transactions are unnecessary on systems where the
>>>> devicetree specifies all the devices on the I2C bus, so add a property
>>>> to indicate that the devicetree description of the hardware is complete
>>>> and thus allow this discovery to be disabled.
>>> Hmm, I don't think the name is fitting. "no-detect" is the desired
>>> behaviour but a proper description is more like "bus-complete" or
>>> something?
>>>
>>> That aside, I am not sure we should handle this at DT level. Maybe we
>>> should better change the GPIO driver to not populate a class if we have
>>> a firmware node?
>> We also have the somewhat related address translation case (which I
>> still need to look at). [Adding Luca to Cc]
>>
>> https://lore.kernel.org/lkml/20220206115939.3091265-1-luca@lucaceresoli.net/
>>
>> If a bus is "bus-complete", then address translation could use
>> any unused address instead of from an explicit list of addresses.
>> I.e. the "i2c-alias-pool" in the binding in patch 4/6 of that
>> series could be made optional if the bus is "bus-complete".

Indeed the alias pool is meant to completely disappear from the ATR
implementation. The i2c core should evolve to know which addresses
correspond to a device (no matter if it has a driver or not) and use any
other addresses as aliases. This was the outcome of discussion on this
topic with Wolfram, even though I AFAIK any implementation effort is
idle since a long time.

-- 
Luca
