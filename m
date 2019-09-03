Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45844A66FD
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 13:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfICLDd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 07:03:33 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:58973 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727639AbfICLDc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 07:03:32 -0400
Received: from [109.168.11.45] (port=42494 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1i56at-003rql-Gm; Tue, 03 Sep 2019 13:03:27 +0200
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net> <20190902204841.GB7253@kunai>
 <63d99d6d-ecdd-7dd8-0dcb-126bfd89b258@lucaceresoli.net>
 <20190903093455.GD1020@kunai>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <f3640020-0291-f837-8639-c3ba39800ead@lucaceresoli.net>
Date:   Tue, 3 Sep 2019 13:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903093455.GD1020@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 03/09/19 11:34, Wolfram Sang wrote:
> 
>> Not if you define enough addresses in the pool. E.g. the DS90UB954
>> hardware can have 8 aliases per port, so if you have (n_ports * 8)
>> addresses in the pool the problem is solved.
> 
> And then you plug-in somewhere another board with another need for ATR
> and you are out of addresses.

Now I got what you mean: the aliases in a pool are reserved to an ATR
and not available to another ATR. What about hoisting the pool one level
up in DT, to the adapter where the ATRs are connected?

>>> And another add-on module with
>>> non-repogrammable devices may occupy addresses from the defined pool
>>> above.
>>
>> You mean a new device on the local (SoC-to-ATR) bus? Well, it could as
>> well occupy a non-described address that the ATR has already picked as
>> an alias.
> 
> Nope, I mean a seperate add-on which has a hardcoded I2C address on the
> bus of the ATR parent. Then this hardcoded address needs to be removed
> from the pool if it is in the wrong range.

As I understand it, we are referring to the same use case:

.---------------.       .-----.   .-------------------.
| adapter (SoC) |---+---| ATR |---| remote slave 0x10 |
'---------------'   |   '-----'   '-------------------'
                    |
              .----------.
              | device X |
              '----------'

Here device X with hard-coded address 0x20 is plugged in at runtime.

As you say it, if 0x20 is in the ATR pool we have a problem.

But even without an explicit pool, initially 0x20 is unused and the ATR
can use it for remote slave 0x10. Then at some point device X is
connected, and suddenly 0x20 conflicts.

To a limited extend the explicit pool could help if the list of possible
addons is known: one can put in the pool only address that will never
appear in addons.

Hey, wait, the no-pool solution could have a way to handle this
conflict. When device X is connected, the adapter can look for a new
alias (0x21), call the i2c_atr_deconfigure_hw() and i2c_atr_setup_hw()
callbacks to stop using 0x20 and start using 0x21. Doesn't look very
lovely, but may be worth considering.

>>> I am not perfectly happy with the assumption that all undescribed
>>> addresses are automatically free. That also might need DTS updates to
>>> describe all clients properly. But this change only needs to be done
>>> once, and it will improve the description of the hardware.
>>
>> Right, but I still suspect some users won't do their homework and
>> discover address conflicts at runtime, maybe months later, in a painful
>> way. Also a chip might be undocumented on a given board, so they could
>> do their homework and still have problems.
> 
> Yes, we probably need a binding to mark an address as used even though
> we don't know the device or don't have a driver for it.
> 
> Don't get me wrong, I know what you mean. One of my boards has a client
> soldered in a way so that it is still in debug mode. That means it
> listens to addresses 0x03-0x07 to provide debug information. Took me a
> while to find out what is happening there.
> 
> But still, 'i2cdetect' showed all of these.
> 
>> Despite my comments, I'm not strongly against your proposal. To me it
>> doesn't seem to solve any problem, while it does introduce some degree
>> of risk. Could you elaborate more on but what benefit it introduces?
> 
> I'd think the risk of running out of defined addresses is somewhere
> equal to running into (after a while) an unexpectedly used address.
> I like the fix for the latter better because describing what is on the
> bus is more helpful and generic than updating the pool-property every
> time you need it. Plus, as mentioned above, other add-on hardware may
> disturb your pool allocation.
> 
> I expect this topic to be one of the discussion points of the BoF.

Definitely.  And having a list of use cases would help a lot IMO. I had
never considered the use case described above, for example.

Thanks,
-- 
Luca
