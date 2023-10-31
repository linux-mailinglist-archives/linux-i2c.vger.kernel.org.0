Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35BC77DC8A5
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 09:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbjJaIvZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 04:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjJaIvX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 04:51:23 -0400
X-Greylist: delayed 399 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 31 Oct 2023 01:51:19 PDT
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8151191;
        Tue, 31 Oct 2023 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1698741877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Va8ZiGCtt0xAH03151MXq0eeco7iyUe1VrYD9JP5SDQ=;
        b=ua2XkeTT9tyr1+7uDBj8Ijq9xaSrAcF2YBKrgXZnCpIu10lr2BV5j1YvRv9QHbEcrOZMVi
        ONlccuoFj8zCGv7wCAWV+1dFx2qhPwtzWuPOFAg20FGhTEDYRXilNxeCBnbMvS61vaIJcI
        7aER1yNzNfuyBShuQu3QqcfiNN5VWlE=
Received: from [192.168.1.18] (91-171-21-26.subs.proxad.net [91.171.21.26])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id a0fbea56 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Tue, 31 Oct 2023 08:44:37 +0000 (UTC)
Message-ID: <7ee0acbd-e332-4dc5-a6e6-0df58913ff71@sionneau.net>
Date:   Tue, 31 Oct 2023 09:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Jan Bottorff <janb@os.amperecomputing.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
 <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
 <ZTpLHZZYtd1WgBu6@ninjato>
 <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
Cc:     Julian Vetter <jvetter@kalrayinc.com>,
        Jonathan Borne <jborne@kalray.eu>
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Le 31/10/2023 à 01:12, Jan Bottorff a écrit :
> On 10/26/2023 4:18 AM, Wolfram Sang wrote:
>> So, someone wants to come up with a patch to move to non-relaxed io
>> accessors?
>>
> Is the current thinking to just make writes to DW_IC_INTR_MASK use the 
> non-relaxed variant or something more broad?
>
> From a safest functioning viewpoint, we talked about making all 
> accessors default to non-relaxed variants. A couple of pretty good 
> arguments from knowledgeable people favored this. I know there also 
> was some concerns about potential performance impact this might have 
> although the counter argument was this is a pretty low speed device so 
> some extra cpu cycles on register accesses were not likely to degrade 
> overall performance.
>
> I could make the patch if we have consensus (or maintainers decision) 
> on which way to go: 1) only writes to DW_IC_INTR_MASK are non-relaxed, 
> 2) make all read/write accessors use the non-relaxed version.
>
> I'm personally in camp #2, safety first, performance fine tuning later 
> if needed. Latent missing barrier bugs are difficult and time 
> consuming to find.

Fine with me, let's go for #2 :)

Regards,

-- 

Yann

