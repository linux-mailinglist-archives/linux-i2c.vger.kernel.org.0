Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1664AD079
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2019 21:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfIHTlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Sep 2019 15:41:09 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:42452 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726080AbfIHTlJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Sep 2019 15:41:09 -0400
Received: from [37.161.91.50] (port=52536 helo=[192.168.42.162])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1i733V-006HQN-QX; Sun, 08 Sep 2019 21:41:02 +0200
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
To:     Peter Rosin <peda@axentia.se>, jacopo mondi <jacopo@jmondi.org>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <20bac324-c4d3-270c-5175-0a7f261fd760@lucaceresoli.net>
 <51dede3c-545b-b66a-5e89-9e889d784eb9@axentia.se>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2d770b36-9521-820d-726a-bc9b52048ef8@lucaceresoli.net>
Date:   Sun, 8 Sep 2019 21:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <51dede3c-545b-b66a-5e89-9e889d784eb9@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On 04/09/19 10:09, Peter Rosin wrote:> Hi!
>
> [ Sorry about my absence. I've been meaning to comment on this series
>   for a long time, but work and family keep interfering... ]

No problem, thanks for your comments. See below my reply.

>
> On 2019-09-03 09:31, Luca Ceresoli wrote:
>> Hi Jacopo,
>>
>> thanks for your feedback.
>>
>> On 01/09/19 16:31, jacopo mondi wrote:
>>> Hi Luca,
>>>    thanks for keep pushing this series! I hope we can use part of this
>>> for the (long time) on-going GMSL work...
>>>
>>> I hope you will be patient enough to provide (another :) overview
>>> of this work during the BoF Wolfram has organized at LPC for the next
>>> week.
>>
>> Sure!
>>
>>> In the meantime I would have some comments after having a read at the
>>> series and trying to apply its concept to GMSL
>>>
>>> On Tue, Jul 23, 2019 at 10:37:19PM +0200, Luca Ceresoli wrote:
>>>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>>>> slave "upstream" port and N master "downstream" ports, and forwards
>>>> transactions from upstream to the appropriate downstream port. But is
>>>> is different in that the forwarded transaction has a different slave
>>>> address. The address used on the upstream bus is called the "alias"
>>>> and is (potentially) different from the physical slave address of the
>>>> downstream chip.
>>>>
>>>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>>>> implementing ATR features in a device driver. The helper takes care or
>>>> adapter creation/destruction and translates addresses at each
transaction.
>>>>
>>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>>>
>>>> ---
>>>>
>>>> Changes RFCv1 -> RFCv2:
>>>>
>>>>  RFCv1 was implemented inside i2c-mux.c and added yet more complexity
>>>>  there. RFCv2 creates a new file on its own, i2c-atr.c. Since many ATR
>>>>  features are not in a MUX and vice versa, the overlapping is low.
This was
>>>>  almost a complete rewrite, but for the records here are the main
>>>>  differences from the old implementation:
>>>
>>> I'm not an i2c expert, but this looks very similar to me to an
>>> augmented i2c-mux with the following additional features:
>>> - automatic selection of the i2c address to use for the children
>>>   behind the mux
>>> - automatic translation of the addresses the logical aliases to
>>>   the actual physical addresses of the slaves (with the help of the
>>>   deserializer address translation feature in this case).
>>
>> A notable difference in the hardware is that a mux needs an explicit
>> procedure to select a port. That's why the select() op is mandatory for
>> muxes. The ATR, at least in the DS90UB9xx case, selects the port
>> automatically based on the slave address. So I added an optional
>> select() op in the atr, but I suspect it's useless for "real" ATRs.
>>
>> More differences derive from how Linux implements muxes. The i2c-mux
>> code has several flags for different locking schemes, and it has a
>
> It's two locking schemes if you count them carefully, so several is
> a bit of an exaggeration. But agreed, two is more than I prefer.

Right, sorry for the exaggeration. Actually the most annoying part of
the mux code to me was not quite the two locking schemes, but rather the
DT parsing, which had some backward-compatibility to maintain.

>> fairly complex DT parsing scheme. These are mostly a historical burden.
>> Adding the ATR features to i2c-mux.c was very tricky and error-prone due
>> to all of this code, that's why I have moved ATR to its own file in
RFCv2.
>
> Anyway, the locking in i2c-mux may be complex, but it does solve real
> problems. The way I read this series, these problems are not dealt with
> and therefore the ATR code will not function in all surroundings.
>
> Some things to think about:
> - What happens when you put a mux behind an ATR?
> - What happens when you put an ATR behind a mux?
> - What happens when you put an ATR between two muxes?
> - Does it make a difference if the mux is parent-locked or mux-locked?
> - What happens if client drivers lock the adapter in order to silence the
>   bus for some reason or to keep two xfers together or something, and
>   then do unlocked xfers?
> - Can you put an ATR behind another ATR?
> etc

I still have to examine in depth all of the problems in the i2c-mux
documented in Documentation/i2c/i2c-topology (thanks for having written
those docs!), but at first sight it looks like the ATR is not going to
introduce big problems because of how it works.

An I2C mux works by electrically connecting the parent bus to one of the
child busses. But this implies any transactions happening on the parent
bus can leak through the mux and cause the problems you documented. The
Maxim GMSL serdes chips work de facto in the same way, even though there
is no simple electrical connection between the busses.

An ATR, at least the one in the TI serdes chips, uses a store-and-forward
technique:

 1. when a transaction starts on the parent bus, it waits for the first
    8 bits
 2. it checks if the slave address matches one of the aliases assigned
    to the remote chips; if it doesn't, it does not drive the child bus
    wires at all and ignores the rest of the transaction
 3. if there's a match it stretches the parent bus SCL and issues a
    {start + chip address + R/W} on the child bus, but replacing the
    alias with the physical chip address
 4. it then waits for an the ack on the child bus, then issues an ack on
    the parent bus
 5. for write transactions, it repeats until a stop condition or an
    error is seen: wait for an entire byte on parent bus, clock
    stretching on the parent bus, send the byte on the child bus, wait
    for ack on the child bus, send ack on the parent bus
 6. for read transactions it does the same as point 5 but with "parent
    bus" and "child bus" swapped

This technique does not leak any transaction to a child bus unless it's
directed to it. So it should have many less problems than the muxes, if any.

> I'm not saying that these things must be handled, and maybe they are
> handled already, and maybe some of the combinations are not valid at
> all. But the possibilities and limitations should be understood. And
> preferably documented.
>
> My gut feeling (without spending much time on it) is that ATR as
> implemented in this series behave approximately like mux-locked muxes,
> meaning that it is not obviously safe to put a parent-locked mux behind
> an ATR and making it impossible for client devices behind an ATR to force
> xfers to happen back-to-back from the root adapter.

For what I described above I don't expect the ATR + parent-locked mux
would have the same problems as the mux-locked mux + parent-locked mux.
The ATR will not let transaction on the root adapter leak through and
reach the mux, unless they are targeted at the child bus where the mux is.

Do you think this is correct? As I said, I still have to analyse all the
possible combinations.

-- 
Luca
