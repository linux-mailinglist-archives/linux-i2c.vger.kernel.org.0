Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D05F5A14C4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 16:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbiHYOqs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 10:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241414AbiHYOqr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 10:46:47 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D1BB274B;
        Thu, 25 Aug 2022 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1661438748;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=TGjpNc9Iuyfn98dr3RH7hoDzKwuTCfRh4C04vBts5Fg=;
    b=dtZq+0iKVkD6TINHagtmuY0Xt7XGDXBcC07Ws3w6KwMSuhBIch7u07xyjVOPrzftki
    bEGma4xfVi3495mJITB6dNpH8hsS2ThJC2+seu3ewKmEVSoNV/0sNl2EJnRO4oP+jVlL
    4zvpYjjfSO/J4+H2tjmWYaS2SfwLM13hDoAnABwGOklfxPH8H+1vWcgN0eznKvFY0c2W
    2hNQjuvaSPBEEyZ2dV5ACpSKIM+Vc95E46lkInsu5i9tI8oEW5xb+nYzCzHMiwY+4I6T
    R3rz9zUWwryNRdg67isdNzS7/uA0J1w85EN6QrDVOjan1+5vESxMwsHzHHNpp/AlK7kS
    pEkA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0Gngadwjc4Jbqft7lQCs4naYEQyjFZmg7Rw=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:9977:7bf7:b1d0:60a2]
    by smtp.strato.de (RZmta 47.47.0 AUTH)
    with ESMTPSA id f01469y7PEjjWeZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 25 Aug 2022 16:45:45 +0200 (CEST)
Message-ID: <d0ecd68c-e786-625e-47ac-cee3e13e6bec@xenosoft.de>
Date:   Thu, 25 Aug 2022 16:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Darren Stevens <darren@stevens-zone.net>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Christian Zigotzky <info@xenosoft.de>
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
 <87h723lodh.fsf@mpe.ellerman.id.au>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <87h723lodh.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23 August 2022 at 03:50 am, Michael Ellerman wrote:
> Arminder Singh <arminders208@outlook.com> writes:
>> This is the first time I'm interacting with the Linux mailing lists, so
>> please don't eviscerate me *too much* if I get the formatting wrong.
>> Of course I'm always willing to take criticism and improve my formatting
>> in the future.
>>
>> This patch adds support for IRQs to the PASemi I2C controller driver.
>> This will allow for faster performing I2C transactions on Apple Silicon
>> hardware, as previously, the driver was forced to poll the SMSTA register
>> for a set amount of time.
>>
>> With this patchset the driver on Apple silicon hardware will instead wait
>> for an interrupt which will signal the completion of the I2C transaction.
>> The timeout value for this completion will be the same as the current
>> amount of time the I2C driver polls for.
>>
>> This will result in some performance improvement since the driver will be
>> waiting for less time than it does right now on Apple Silicon hardware.
>>
>> The patch right now will only enable IRQs for Apple Silicon I2C chips,
>> and only if it's able to successfully request the IRQ from the kernel.
>>
>> === Testing ===
>>
>> This patch has been tested on both the mainline Linux kernel tree and
>> the Asahi branch (https://github.com/AsahiLinux/linux.git) on both an
>> M1 and M2 MacBook Air, and it compiles successfully as both a module and
>> built-in to the kernel itself. The patch in both trees successfully boots
>> to userspace without any hitch.
>>
>> I do not have PASemi hardware on hand unfortunately, so I'm unable to test
>> the impact of this patch on old PASemi hardware. This is also why I've
>> elected to do the IRQ request and enablement on the Apple platform driver
>> and not in the common file, as I'm not sure if PASemi hardware supports
>> IRQs.
> I've added Darren and Christian to Cc, they have helped with PASemi
> development and testing in the past, and may be able to help test this
> series on PASemi hardware.
>
> cheers

Tested-by: Christian Zigotzky <chzigotzky at xenosoft.de>

on an A-EON AmigaOne X1000 with a PASemi PWRficient PA6T-1682 processor.
