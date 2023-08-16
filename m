Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A6677DC49
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 10:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237054AbjHPI3U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 04:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242953AbjHPI1u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 04:27:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F712D67;
        Wed, 16 Aug 2023 01:27:29 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FCBA223;
        Wed, 16 Aug 2023 10:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692174375;
        bh=6vLJ6J6C7qrhkbCridJ4HszzL8WYr6/NBF++yrKGGks=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PCeLMO6b92wPVWBVbaB1SLjszu+jWwfya8wfWe956e/nkytvyyCh6o8gSyYdp+kgl
         RFiK0ZZBtaLgEphsR27MqWFz3WQsru0qTxxZtjXzrEMwyMkFTj0fhI+s/n/n0ZKnbX
         JVIbx+0BJtgRWCQPLTp69ULHwZk5MGe0b6a3F36g=
Message-ID: <8ffa4f28-0753-2ae1-4857-d6c87d717a42@ideasonboard.com>
Date:   Wed, 16 Aug 2023 11:27:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] i2c: Make I2C_ATR invisible
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
 <94dd2237-2a4a-fb45-ceb1-f224fafd4e36@ideasonboard.com>
 <CAMuHMdWkqQ0v0k4a-JDo+nqC4=t9jRmjFCmo=og64e8hJ4iHmQ@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAMuHMdWkqQ0v0k4a-JDo+nqC4=t9jRmjFCmo=og64e8hJ4iHmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On 16/08/2023 11:17, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Tue, Aug 15, 2023 at 6:00 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> On 15/08/2023 18:29, Geert Uytterhoeven wrote:
>>> I2C Address Translator (ATR) support is not a stand-alone driver, but a
>>> library.  All of its users select I2C_ATR.  Hence there is no need for
>>> the user to enable this symbol manually, except when compile-testing.
>>>
>>> Fixes: a076a860acae77bb ("media: i2c: add I2C Address Translator (ATR) support")
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Do we care yet about out-of-tree drivers that need this functionality?
>>> ---
>>>    drivers/i2c/Kconfig | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
>>> index c6d1a345ea6d8aee..9388823bb0bb960c 100644
>>> --- a/drivers/i2c/Kconfig
>>> +++ b/drivers/i2c/Kconfig
>>> @@ -72,7 +72,7 @@ config I2C_MUX
>>>    source "drivers/i2c/muxes/Kconfig"
>>>
>>>    config I2C_ATR
>>> -     tristate "I2C Address Translator (ATR) support"
>>> +     tristate "I2C Address Translator (ATR) support" if COMPILE_TEST
>>>        help
>>>          Enable support for I2C Address Translator (ATR) chips.
>>>
>>
>> Isn't this normally done with just "tristate", without the text? Is
>> there a need to make configs manually selectable when compile-test is
>> enabled?
> 
> "tristate" without the text would make the symbol invisible, too.
> However, then the user has no way to enable it for compile-testing
> (unless also enabling one of the symbols that select it, which may
>   not be possible due to other dependencies).

Yes. My point/question is, i2c-atr isn't different than any other 
selectable kconfig (afaics), like, say, DRM_KMS_HELPER. So is the 
"official" way (if there is such a thing) to add selectable kconfigs 
with just "tristate", or tristate with "if COMPILE_TEST". I thought it 
was the former, but I can see value with the latter too.

  Tomi

