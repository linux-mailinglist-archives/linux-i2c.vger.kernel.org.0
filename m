Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A63D4AC15C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 15:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiBGOgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 09:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387226AbiBGOIC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:08:02 -0500
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BF4C043181;
        Mon,  7 Feb 2022 06:08:00 -0800 (PST)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:55412 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nH4gQ-0003Xg-Pg; Mon, 07 Feb 2022 15:07:58 +0100
Message-ID: <74bacec6-35e5-346a-fb05-09ae44fc5592@lucaceresoli.net>
Date:   Mon, 7 Feb 2022 15:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Content-Language: en-US
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
 <5aa3e282-3056-2088-9741-6d17273701b4@fi.rohmeurope.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <5aa3e282-3056-2088-9741-6d17273701b4@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matti,

On 07/02/22 14:21, Vaittinen, Matti wrote:
> Hi dee Ho peeps,
> 
> On 2/7/22 14:06, Tomi Valkeinen wrote:
>> Hi Luca,
>>
>> On 06/02/2022 13:59, Luca Ceresoli wrote:
>>> this RFCv3, codename "FOSDEM Fries", of RFC patches to support the TI
>>> DS90UB9xx serializer/deserializer chipsets with I2C address translation.
> 
> ..snip
> 
>>> Even with the above limitations I felt I'd send this v3 anyway since
>>> several people have contacted me since v2 asking whether this
>>> implementation has made progress towards mainline. Some even improved on
>>> top of my code it their own forks. As I cannot afford to work on this 
>>> topic
>>> in the near future, here is the latest and greatest version I can 
>>> produce,
>>> with all the improvements I made so far.
>>
>> I've discussed with Luca in private emails, but I'll add a short status 
>> about my work in this thread:
> 
> Thanks for CC:ing me Luca. We had a small chat during the FOSDEM.
> 
>> About a year ago I took Luca's then-latest-patches and started working 
>> on them. The aim was to get full multiplexed streams support to v4l2 so 
>> that we could support CSI-2 bus with multiple virtual channels and 
>> embedded data, and after that, add support for fpdlink devices.
>>
>> Since then I have sent multiple versions of the v4l2 work (no drivers 
>> yet, only the framework changes) to upstream lists. Some pieces have 
>> already been merged to upstream (e.g. subdev state), but most of it is 
>> still under work. Here's a link to v10 of the streams series:
>>
>> https://lore.kernel.org/all/20211130141536.891878-1-tomi.valkeinen@ideasonboard.com/ 
>>
>>
>> It has a link to my (now slightly outdated) git branch which contains 
>> the driver work too.
> 
> I have fetched this tree from Tomi and done some experimenting on 
> another SERDES. That SERDES in not from TI or Maxim, some of you may 
> guess the company though :) Unfortunately I can't publish the details or 
> the code for now - I am discussing what I am allowed to publish. My 
> personal goal is to see if I could write a Linux driver for this 
> yet-another-Video-SERDES and see if it can one day get merged to 
> upstream for anyone interested to play with.
> 
>> The fpdlink drivers have diverged from Luca's version quite a bit. The 
>> most obvious difference is the support for multiplexed streams, of 
>> course, but there are lots of other changes too. The drivers support 
>> DS90UB960 (no UB954 at the moment), DS90UB953 and DS90UB913. UB960 
>> supports all the inputs and outputs.
> 
> For the record, the SERDES I am working with does also support 
> connecting 4 cameras (4 SERs) to one DES which provides two CSI-2 
> outputs. As far as I understand the virtual channel support is also 
> there (in the HW).
> 
>   I have also dropped some code which
>> I did not need and which I wasn't sure if it's correctly implemented, to 
>> make it easier to work on the multiplexed streams version. Some of that 
>> code may need to be added back.
>>
>> I have not changed the i2c-atr driver, and my fpdlink driver uses  it 
>> more or less the same way as in Luca's version.
>>
> 
> I have also used the ATR driver as is. The SERDES I am working with does 
> also the I2C address translation.
> 
>> Considering that you're not able to work on this, my suggestion is to 
>> review the i2c-atr patches here (or perhaps send those patches in a 
>> separate series?),
> 
> It would be _really_ cool to get the ATR upstream.
> 
>   but afaics the fpdlink drivers without multiplexed
>> streams is a dead-end, as they can only support a single camera (and no 
>> embedded data), so I don't see much point in properly reviewing them.
>>
>> However, I will go through the fpdlink drivers in this series and 
>> cherry-pick the changes that make sense. I was about to start working on 
>> proper fpdlink-clock-rate and clkout support, but I see you've already 
>> done that work =).
> 
> I am not sure if I am poking in the nest of the wasps - but there's one 
> major difference with the work I've done and with Toni's / Luca's work.

You are. ;)

> The TI DES drivers (like ub960 driver) packs pretty much everything 
> under single driver at media/i2c - which (in my opinion) makes the 
> driver pretty large one.
> 
> My approach is/was to utilize MFD - and prepare the regmap + IRQs in the 
> MFD (as is pretty usual) - and parse that much of the device-tree that 
> we see how many SER devices are there - and that I get the non I2C 
> related DES<=>SER link parameters set. After that I do kick alive the 
> separate MFD cells for ATR, pinctrl/GPIO and media.
> 
> The ATR driver instantiates the SER I2C devices like Toni's ub960 does. 
> The SER compatible is once again matched in MFD (for SER) - which again 
> provides regmap for SER, does initial I2C writes so SER starts 
> responding to I2C reads and then kicks cells for media and pinctrl/gpio.
> 
> I believe splitting the functionality to MFD subdevices makes drivers 
> slightly clearer. You'll get GPIOs/pinctrl under pinctrl as usual, 
> regmaps/IRQ-chips under MFD and only media/v4l2 related parts under media.

There has been quite a fiery discussion about this in the past, you can
grab some popcorn and read
https://lore.kernel.org/linux-media/20181008211205.2900-1-vz@mleia.com/T/#m9b01af81665ac956af3c6d57810239420c3f8cee

TL;DR: there have been strong opposition the the MFD idea.

I personally don't have a super strong opinion: I wrote this as a
monolithic driver because it looked like the most natural implementation
and found it was working fine for me, I never really explored the MFD idea.

> Anyways - I opened the mail client to just say that the ATR has worked 
> nicely for me and seems pretty stable - so to me it sounds like a goof 
> idea to get ATR reviewed/merged even before the drivers have been finalized.

Sounds like a... what...? A "good idea"? Or a "goofy idea"? :-D

-- 
Luca
