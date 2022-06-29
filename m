Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49BBE56020D
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 16:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbiF2OFh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 10:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbiF2OFg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 10:05:36 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82AA25E84;
        Wed, 29 Jun 2022 07:05:33 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 18A3683E68;
        Wed, 29 Jun 2022 16:05:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656511531;
        bh=q4IDYnA9mxoplu3bplri3eeAY5ZA7+1eLbTSPgMevoI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aRJCyz0zDIey+e3ztF33FIuC3qX94K+rn93BEyCItkZvrX56uTpLdUEDZh9E7IXxr
         ++lZEHPnp/PdqPOF0Ss9iehlxcMAmkFI8934idqKKA9agj/6ercFLwnQp2n6RTFeW9
         pR3BSz2mhCv3aWRcRiylJA9m72RClfkP9028MNlr7MX+F6vkD1oYdtGfny1ukRgl0l
         zKgNiU3N7OBOjUWVAG7ED2iPPKM0zJPgU27vsuQNsfVLlcHu76S47WuK9JnD0lSUPr
         oAygKVccoGfq3cvDBBQIETE7LqLRwBobKmdBWUQ+b6FsSFrUpKhEXh0CpYsjQ8UMYU
         kRN/ulW6ar7iA==
Message-ID: <80c524c3-8c31-346d-2691-48f93fa6001f@denx.de>
Date:   Wed, 29 Jun 2022 16:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Content-Language: en-US
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, joe@perches.com
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
 <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/29/22 14:47, Krzysztof Adamski wrote:
> W dniu 26.06.2021 o 12:27, Raviteja Narayanam pisze:
>> Xilinx I2C IP has two modes of operation, both of which implement
>> I2C transactions. The only difference from sw perspective is the
>> programming sequence for these modes.
>> Dynamic mode  -> Simple to program, less number of steps in sequence.
>> Standard mode -> Gives flexibility, more number of steps in sequence.
>>
>> In dynamic mode, during the i2c-read transactions, if there is a
>> delay(> 200us) between the register writes (address & byte count),
>> read transaction fails. On a system with load, this scenario is
>> occurring frequently.
>> To avoid this, switch to standard mode if there is a read request.
>>
>> Added a quirk to identify the IP version effected by this and follow
>> the standard mode.
>>
>> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> 
> [...]
> 
> If those two modes only differ in software complexity but we are not
> able to support only the simpler one and we have support for the more
> complicated (standard mode) anyways, we know that standard mode
> can handle or the cases while dynamic mode cannot, we also know that
> dynamic mode is broken on some versions of the core, why do we actually
> keep support for dynamic mode?

If I recall it right, the dynamic mode was supposed to handle transfers 
longer than 255 Bytes, which the core cannot do in Standard mode. It is 
needed e.g. by Atmel MXT touch controller. I spent a lot of time 
debugging the race conditions in the XIIC, which I ultimately fixed (the 
patches are upstream), but the long transfers I rather fixed in the MXT 
driver instead.

I also recall there was supposed to be some update for the XIIC core 
coming with newer vivado, but I might be wrong about that.
