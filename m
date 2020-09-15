Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8000269A5A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 02:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgIOATe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 20:19:34 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41081 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726122AbgIOATd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 20:19:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4C44BD3B;
        Mon, 14 Sep 2020 20:19:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 14 Sep 2020 20:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=vX1pFnhbIBzXQa2l8jrntsGgk3Q5UmP
        7jCafClE7Hgo=; b=KH4N2pvdomgLPmSLP6DwsoQksbgjq+1HmS02GZw0PVlW7wJ
        7eRbnkXNQyjS1qp50xJTYJTJIiDxZR3Fb2AFB83jb9Y/ZtXm6mCxjtAUSTM5RG8x
        FecRyTX4NpASSe85SlpVjzgshFpklUCk8Q+BV+vQBRfMdKi9SkBggajLKcgUlzUd
        b0DNIderw3vssz5ettckkgR2Mnyc+lMEevsJy2VJXkTW0djlpt5O8EydxZrHP8TR
        kxkw/djIXGyUvTfF+4YEPKT9Vwubr3k+cFfjogCP3oMcuo6TO9Gw9orGJZ/lpgw6
        NO4Gy2AF54PyOiqHWfRWxgi00J/jCp/lrko/hVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vX1pFn
        hbIBzXQa2l8jrntsGgk3Q5UmP7jCafClE7Hgo=; b=VcUQJVy44hFI1unHR3BUM7
        lTy4QL+/Gh0k1KU4//AbOGucOx0l8HfD36WUAXGBE9lync5Kv+sj3rJ2NSkO3cvN
        JqZ0eygL1qb+xjO3mmjs0bX3tV48QeI4e/qMrzFzoK20qStPQDAuG3tgyfoLYU6s
        /M3mJMAj/0/B9BboFXKhy4cvXN+FnEmkVPCcFkJXTtSQsD4ofd90Bm63wy6Kln7g
        OIFZGYN9eLq1JVT1Qq8+iEv5x4IRBX7N27elmGhmsBpi1dmciyAdm0NxQPgLucSi
        5D82tlD+OEL/v8+/KBR8h1PdkRObPyPSpfikNtv0SBV2X/yWBxJhsYyM/0KmoVjg
        ==
X-ME-Sender: <xms:kghgX99dRYOfJmbIU2wka8w5UR-QK2UZO9ISUrp2D-fHbXsWGVUUZQ>
    <xme:kghgXxtuaWprmeB_Ss84dyvmN28exDTKl0eiQlGYpM6GGqxaXS706Xs5ho4KyqG4T
    jWldm9UPfNl_jH09Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeijedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:kghgX7B7FOq23585XEUK3AOBQ23I_YInMg7AZEXqF-JmlqFqskq-5Q>
    <xmx:kghgXxc2_PzR_vuX4nR6Az1AUZuEr3Mxq4uwtc4Vk_HUgLNoExHqWA>
    <xmx:kghgXyN2c1sUoodgZY9ri5HDAvH6kRLec65WjgXc7IOYAdbX6FhsHA>
    <xmx:kwhgX_ob7dhTXLjy5nNTDphiY4DdtnGlWLpw8cnuyuf2o4r5UFNRjw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 56C88E00BF; Mon, 14 Sep 2020 20:19:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <6e14e75f-f9c1-4d33-b95d-0c7dd7131a9f@www.fastmail.com>
In-Reply-To: <e7a64983-fe1d-1ba2-b0c3-ae4a791f7a75@roeck-us.net>
References: <20200914122811.3295678-1-andrew@aj.id.au>
 <e7a64983-fe1d-1ba2-b0c3-ae4a791f7a75@roeck-us.net>
Date:   Tue, 15 Sep 2020 09:49:10 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     "Jean Delvare" <jdelvare@suse.com>, wsa@kernel.org,
        "Joel Stanley" <joel@jms.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Throttle I2C transfers to UCD9000 devices
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Tue, 15 Sep 2020, at 02:13, Guenter Roeck wrote:
> On 9/14/20 5:28 AM, Andrew Jeffery wrote:
> > Hello,
> > 
> > While working with system designs making use of TI's UCD90320 Power
> > Sequencer we've found that communication with the device isn't terribly
> > reliable.
> > 
> > It appears that back-to-back transfers where commands addressed to the
> > device are put onto the bus with intervals between STOP and START in the
> > neighbourhood of 250us or less can cause bad behaviour. This primarily
> > happens during driver probe while scanning the device to determine its
> > capabilities.
> > 
> > We have observed the device causing excessive clock stretches and bus
> > lockups, and also corruption of the device's volatile state (requiring it
> > to be reset).  The latter is particularly disruptive in that the controlled
> > rails are brought down either by:
> > 
> > 1. The corruption causing a fault condition, or
> > 2. Asserting the device's reset line to recover
> > 
> > A further observation is that pacing transfers to the device appears to
> > mitigate the bad behaviour. We're in discussion with TI to better
> > understand the limitations and at least get the behaviour documented.
> > 
> > This short series implements the mitigation in terms of a throttle in the
> > i2c_client associated with the device's driver. Before the first
> > communication with the device in the probe() of ucd9000 we configure the
> > i2c_client to throttle transfers with a minimum of a 1ms delay (with the
> > delay exposed as a module parameter).
> > 
> > The series is RFC for several reasons:
> > 
> > The first is to sus out feelings on the general direction. The problem is
> > pretty unfortunate - are there better ways to implement the mitigation?
> > 
> > If there aren't, then:
> > 
> > I'd like thoughts on whether we want to account for i2c-dev clients.
> > Implementing throttling in i2c_client feels like a solution-by-proxy as the
> > throttling is really a property of the targeted device, but we don't have a
> > coherent representation between platform devices and devices associated
> > with i2c-dev clients. At the moment we'd have to resort to address-based
> > lookups for platform data stashed in the transfer functions.
> > 
> > Next is that I've only implemented throttling for SMBus devices. I don't
> > yet have a use-case for throttling non-SMBus devices so I'm not sure it's
> > worth poking at it, but would appreciate thoughts there.
> > 
> > Further, I've had a bit of a stab at dealing with atomic transfers that's
> > not been tested. Hopefully it makes sense.
> > 
> > Finally I'm also interested in feedback on exposing the control in a little
> > more general manner than having to implement a module parameter in all
> > drivers that want to take advantage of throttling. This isn't a big problem
> > at the moment, but if anyone has thoughts there then I'm happy to poke at
> > those too.
> > 
> 
> As mentioned in patch 2/2, I don't think a module parameter is a good idea.
> I think this should be implemented on driver level, similar to zl6100.c,
> it should be limited to affected devices and not be user controllable.

Yep. I will look at zl6100.c.

> 
> In respect to implementation in the i2c core vs in drivers: So far we
> encountered this problem for some Zilker labs devices and for some LTC
> devices. While the solution needed here looks similar to the solution
> implemented for Zilker labs devices, the solution for LTC devices is
> different. I am not sure if an implementation in the i2c core is
> desirable. It looks quite invasive to me, and it won't solve the problem
> for all devices since it isn't always a simple "wait <n> microseconds
> between accesses". For example, some devices may require a wait after
> a write but not after a read, or a wait only after certain commands (such
> as commands writing to an EEPROM). Other devices may require a mechanism
> different to "wait a certain period of time". It seems all but impossible
> to implement a generic mechanism on i2c level.

Yep, that's fair. I went this route to avoid implementing two sets of handlers 
providing the pacing in the driver (for before and after we register with the 
pmbus core), but it is invasive as you point out. Let me look at your suggested 
alternatives and get back to you.

Andrew
