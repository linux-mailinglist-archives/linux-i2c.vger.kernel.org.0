Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F8FADBDA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2019 17:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733201AbfIIPKt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Sep 2019 11:10:49 -0400
Received: from mleia.com ([178.79.152.223]:43654 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbfIIPKs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Sep 2019 11:10:48 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id C66E339CB18;
        Mon,  9 Sep 2019 15:10:45 +0000 (UTC)
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
To:     Wolfram Sang <wsa@the-dreams.de>, jacopo mondi <jacopo@jmondi.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <aedad45b-16d6-d189-b045-329727440ca5@mleia.com> <20190909072232.GA990@kunai>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <8af9a049-06b9-dbe8-827b-5134d20e9435@mleia.com>
Date:   Mon, 9 Sep 2019 18:10:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190909072232.GA990@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20190909_151045_839705_75E56B8F 
X-CRM114-Status: GOOD (  22.12  )
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 09/09/2019 10:22 AM, Wolfram Sang wrote:
> Hi Vladimir,
> 
>> I won't attend the LPC, however I would appreciate if you book some
> 
> A pity. I would have liked to have you in the room. Let's see if we can
> get enough input from you via mail here.
> 

if it might help, I'll attend the Embedded Recipes and ELCE conferences
this year.

>> time to review my original / alternative implementation of the TI
>> DS90Ux9xx I2C bridge device driver.
> 
> We have only 45 minutes, this will not allow to review specific
> implementations. I want to give an overview of existing implementations
> with pros/cons...
> 

Sure! Any shared summary/opinions are greatly welcome.

>> The reasons why my driver is better/more flexible/more functional are
>> discussed earlier, please let me know, if you expect anything else
>> from me to add, also I would be happy to get a summary of your offline
>> discussion.
> 
> ... and I'd appreciate support here from you, like your summary of the
> back then discussion (from where I can dive deeper if needed).
> 
> Also, with Luca's new series we discussed some scenarios which can
> happen WRT to I2C address conflicts. Maybe you could comment on them,
> too?

I do remember I've commented on the Luca's suggestion of using dynamic
I2C addresses from a pool (the introduced "i2c-alias-pool" property).

I have to scrutinize it in Luca's v2, but then it might happen that the
userspace won't know to which IC on the remote side it communicates to.

> As I read the old thread, you have a hardcoded aliases using
> "ti,i2c-bridge-maps". This means you can't have own DTSI files for e.g.
> add-on modules, do I get this correctly?
> 

Basically hardcoding of aliases completely resolves the highlighted
above problem. Still it is possible to have own DTSI files for the FPD
link detachable PCBs, and this is an exceptionally important scenario,
however some limitations shall be applied:
* dt overlays for "local" derializer/deserializer ICs, it's a generic
  and universal solution, it is successfully used in the field,
* only "compatible" PCBs are supposed to be connected (same set of I2C
  devices/addresses on every such PCB), this is imperfect for sure,
* "ti,i2c-bridge-maps" list is excessive to cover "almost compatible"
  (in the sense from above) PCBs, some of the missed alias matches
  just won't instantiate a driver, this is of course also imperfect.

In general nothing critical should happen, if some I2C device on the
remote side is simply not probed in runtime, in opposite you can imagine
that writing for instance to another EEPROM of two on the remote side
could be harmful.

Any technically better solution to the two given approaches (from Luca
and from me) is more than appreciated. For non-dynamic/fixed local and
remote PCBs the fixed mapping is better, the dynamic case is covered
by the dt overlays, why not?

As a side note please do remember that the I2C bridging on Maxim GMSL
and TI DS90Ux9xx are different, the former one is a real mux, and the
latter one is not, I'm uncertain if it's reasonable to think of a
generalized solution which covers both IC series, so likely we
have to review the developed solutions for them separately instead
of trying to work out a combined one.

--
Best wishes,
Vladimir
