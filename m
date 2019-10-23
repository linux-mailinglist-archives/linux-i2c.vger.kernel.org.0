Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA4BEE261F
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 00:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436676AbfJWWKC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 18:10:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44818 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436658AbfJWWKC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 18:10:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id e10so12928747pgd.11;
        Wed, 23 Oct 2019 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZIL9BSAVqgpz8OwYv2/+zZmIbanFJ38CI5+af9Juk60=;
        b=P9Qg29LnTeDSeh0UuBCSyDb7Fumnm5L6mxI2XTdeT/LHEvAEKCKSu5s9S3AZymuYXM
         a+I6XwBldVEOysWDcFAGAbhGK5cKnjQaVBubaXBZsCy1+5SqcLVzhBQUewPdDUvEJ3CB
         XDWMEAZIHr+qc/h79rHlWBKJrEuv6qN6T6jwqgGPlacbp28l3UpWchv1uGMwA+e06yyq
         LNw0NPz4Q77/szvV47P2o1lpRbScO2GLJNNeRvm7MnthTapEYKLi9TGy084i35tEe527
         7negZyUrWCAvlLjlNG7XXJNGn1npUrrMuGmLGfu8LTPDu0lP45RG07RBAOUMn3TDSWoC
         7qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZIL9BSAVqgpz8OwYv2/+zZmIbanFJ38CI5+af9Juk60=;
        b=RLT+xgziLhUu9L0uT7MKz05eb5QXQMqAkehPUfTyWImF4ay3npvrMY8MgAtfIp7S1G
         B37CFCaewgwG8Gh1ZMwFCzAXF/PM3pUJXke8XK5ApXK/kAszp3M+eS/UJK85gLXVXeSO
         UdJjlssF284At/wOsBgggEqlVdi5xScMBu5nKZCx7yyXE5Fx71RTmqBl6dakTaX4a4s5
         1U0TJOQ5vcUZno7IjoaSlVVuHu85jxa9dwwg7YVO+OI4fhHa31LpDnPiOYvV/8PFCcHO
         BV2WxlAf4gU0GUgriySqZ/vxng8uHTfc7Z2qKgmFFclUrOyZLzjsB7dqLfNvcScdLOaN
         THog==
X-Gm-Message-State: APjAAAUwCZAJlwhowExI+k+g0PpEyHVcRh/WJ2faYOFLt7w0e5A/Ys8B
        TerUTfAHR3yuh8IZ5T6OYL0=
X-Google-Smtp-Source: APXvYqw83ax6Pg2vtSc567AWYZV0CNsDIri6TjQCKtyrSB37e8feykeLLqjP3M5G3ljLUJwNuHOlPw==
X-Received: by 2002:a17:90a:f311:: with SMTP id ca17mr2685914pjb.112.1571868600642;
        Wed, 23 Oct 2019 15:10:00 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::e65d])
        by smtp.gmail.com with ESMTPSA id m22sm24394768pgj.29.2019.10.23.15.09.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 15:09:59 -0700 (PDT)
Date:   Wed, 23 Oct 2019 15:09:50 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
Message-ID: <20191023220949.GA11139@taoren-ubuntu-R90MNF91>
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
 <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
 <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
 <b98827fa-462a-060b-efc7-27fe5d7742ff@axentia.se>
 <7806ece8-1d7c-7aa8-20af-6f5f964bec64@linux.intel.com>
 <6eba3e62-9215-0c39-258b-7abfb394bc48@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eba3e62-9215-0c39-258b-7abfb394bc48@axentia.se>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 23, 2019 at 09:17:16PM +0000, Peter Rosin wrote:
> On 2019-10-22 19:44, Jae Hyun Yoo wrote:
> > On 10/22/2019 1:45 AM, Peter Rosin wrote:
> >> On 2019-10-21 23:57, Jae Hyun Yoo wrote:
> >>> Hi Peter,
> >>>
> >>> On 10/21/2019 2:05 PM, Peter Rosin wrote:
> >>>> On 2019-10-21 22:24, Jae Hyun Yoo wrote:
> >>>>> Append a binding to support hardware timeout feature.
> >>>>>
> >>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >>>>> ---
> >>>>>    Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 2 ++
> >>>>>    1 file changed, 2 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> index b47f6ccb196a..133bfedf4cdd 100644
> >>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> @@ -17,6 +17,8 @@ Optional Properties:
> >>>>>    - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
> >>>>>    		  specified
> >>>>>    - multi-master	: states that there is another master active on this bus.
> >>>>> +- aspeed,hw-timeout-ms	: Hardware timeout in milliseconds. If it's not
> >>>>> +			  specified, the H/W timeout feature will be disabled.
> >>>>>    
> >>>>>    Example:
> >>>>>    
> >>>>>
> >>>>
> >>>> Some SMBus clients support a smbus-timeout-disable binding for disabling
> >>>> timeouts like this, for cases where the I2C adapter in question on occasion
> >>>> is unable to keep the pace. Adding that property thus avoids undesired
> >>>> timeouts when the client is SMBus conformant without it. Your new binding
> >>>> is the reverse situation, where you want to add a timeout where one is
> >>>> otherwise missing.
> >>>>
> >>>> Anyway, since I2C does not have a specified lowest possible frequency, this
> >>>> feels like something that is more in the SMBus arena. Should the property
> >>>> perhaps be a generic property named smbus-timeout-ms, or something like
> >>>> that?
> >>>
> >>> Well, I tried upstreaming of the generic timeout property a year ago but
> >>> I agreed that the generic bus timeout property can be set by an ioctl
> >>> command so it didn't need to be added into device tree at that time. Not
> >>> sure if any need has come recently but I haven't heard that. This driver
> >>> still uses the generic timeout property which is provided by i2c core
> >>> for handling command timeouts, and it's out of scope from this patch
> >>> series.
> >>>
> >>>> If the above is not wanted or appropriate, then I would personally prefer
> >>>> aspeed,bus-timeout-ms over aspeed,hw-timeout-ms. To me, hw-timeout-ms sounds
> >>>> like a (more serious) timeout between the CPU and the I2C peripheral unit
> >>>> or something like that. But I don't care deeply...
> >>>
> >>> Changes I submitted in this patch set is for a different purpose which
> >>> is very Aspeed H/W specific, and actually it's a more serious timeout
> >>> setting indeed. If this H/W is used in multi-master environment, it
> >>> could meet a H/W hang that freezes itself in slave mode and it can't
> >>> escape from the state. To resolve the specific case, this H/W provides
> >>> self-recovery feature which monitors abnormal state of SDA, SCL and its
> >>> H/W state machine using the timeout setting to determine the escape
> >>> condition.
> >>
> >> Are you saying that the aspeed HW is buggy and that this abnormal state
> >> is self inflicted by the aspeed HW even if other masters on the bus
> >> behave sanely? Because I didn't quite read it that way at all...
> > 
> > I don't think it's an Aspeed HW bug. Actually, this HW can be exposed to
> > very severe environments if it is used as a Baseboard Management
> > Controller which needs two or more multi-masters on a bus depends on
> > HW design. Also, it should expect unknown or buggy device attachment
> > on a bus through add-on card slots. Aspeed HW provides HW timeout
> > feature to support exceptional cases handling which comes from the
> > severe use cases.
> > 
> >> To me, it sounded *exactly* like the state I2C clients end up in when an
> >> I2C master "dies" and stops communicating in the middle of a transaction.
> >> I.e. the thing that the SMBus timeout is designed to prevent (and the
> >> state the I2C nine-clk-recovery sequence addresses). The only twist (that
> >> I saw) was that the aspeed HW is also a master and that the aspeed master
> >> driver is completely locked out from the bus while some obnoxious master
> >> fails to complete its transaction (or whatever it was up to).
> > 
> > If this HW runs on a single-master bus, any master dying issue will be
> > cured by recovery logic which this driver already has and the logic uses
> > the bus timeout setting you are saying.
> > 
> > This patch set is mainly focusing on a 'slave mode hang' issue on a
> > 'multi-master' bus which can't be covered by the recovery logic.
> > 
> >> If this can only be triggered when the HW is acting as a slave, and by
> >> aborted or otherwise funky master activity on the bus, then I wouldn't
> >> call it an HW issue. Then it would be a bus issue. I.e. something needing
> >> a bus-timeout instead of a hw-timeout.
> > 
> > Here is an example. In a multi-node BMC system, a peer master can be
> > shutdown in the middle of transaction, then this Aspeed HW keeps waiting
> > for a next event from the peer master but it can't happen because the
> > peer master was already shutdown. If we enable the 'slave inactive
> > timeout feature' using the HW timeout setting, the this HW can escape
> > from the waiting state. If we don't, this HW hangs forever in the
> > waiting state and it's the reason why I implemented this patch set.
> > 
> > The hw-timeout setting needs fine tuning depends on HW environment so
> > it should be different from the bus-timeout.
> 
> Yeah, ok, so you're basically confirming everything I said. I do
> sense some confusion though, as you come across as a bit
> defensive and seem to think that I am against the whole notion of
> the patches. And that's not the case at all! My only issue is
> with the naming. And I happen to think hw-timeout-ms is a really
> bad name. It's way too broad and can mean just about anything.
> When I read that, I think of some workaround for broken hardware,
> not normal things like the other masters on the bus doing
> confusing things. Funky bus activity from remote masters is
> simply not an HW issue in my book, at least not an HW issue on
> the local side of the bus. It's just something you *must expect*.
> 
> Let me list some scenarios, so that I can describe why I came up
> with my suggested alternate naming:
> 
> Suppose you have a simple setup with a bus featuring a single
> aspeed master and a single slave. If the slave is, say, a jc42
> temperature sensor, then it by default will follow the SMBus spec
> and implement a bus timeout. Meaning that if the master is
> stalling for too long, then the jc42 slave will timeout the
> transaction and make itself available to any potential other
> masters on the bus. The jc42 chip does not know that it is on a
> single master bus. But this is only the default, you can tell the
> jc42 driver to disable this timeout, which is sometimes crucial
> for reliable behavior, e.g. if the master is not always able to
> keep the deadlines for whatever reason.
> 
> Next scenario. Suppose you have a simple setup with a bus
> featuring a single remote master of some sort and the aspeed
> acting as slave only. Since there is only a single master, and
> there are no other slaves on the bus, there's no point for the
> aspeed to act as master. The aspeed without your patches behave
> as the jc42 chip above, when it has been instructed to /remove
> the timeout/. And that's fine in this scenario since there is
> only one master and the aspeed, as slave, can defer recovering
> the bus to that master. So, when aspeed is operating as
> slave-only, these patches enable the addition of the same timeout
> that was there by default in the first scenario.
> 
> Final scenario, some as last but with some other slave(s) on the
> bus. Now, it becomes interesting for the aspeed to act as master,
> and it becomes interesting indeed to have a timeout that "breaks
> out" when some remote master hogs the aspeed in slave mode.
> 
> I claim that the timeouts mentioned in all these scenarios are
> related. In the first scenario, you disable the timeout by adding
> smbus-timeout-disable to the relevant device tree node. I was
> merely suggesting that, since the timeouts are basically doing
> the same thing in all scenarios, the naming should perhaps be
> consistent and be something more specific than hw-timeout-ms. What
> popped up was bus-timeout-ms or smbus-timeout-ms. I suppose
> remote-timeout-ms, or something, would also work...
> 
> Note that the timeouts I'm talking about has nothing to do with
> the adapter timeout in the linux I2C core. This is all about
> timeouts when acting as I2C slave and the remote master fails to
> complete (or otherwise messes up) transfers.
> 
> I hope that clarifies my position!
> 
> Cheers,
> Peter

Let me share my findings on Facebook Minipack BMC, and hopefully it
helps with the topic.

Both AST2500 and BIC (Bridged IC) can be bus master on Minipack i2c-0,
and they send ipmi messages to each other. After several rounds of
message sharing, BIC becomes the master and starts to send bytes to
AST2500 BMC: BMC receives first a few bytes successfully but then BIC
stops sending bytes, and STOP pattern is not detected on the bus,
either.

Because of this, BMC gets stuck in slave-rx-done state (expecting more
bytes or STOP), and all the master transactions initiated from BMC side
would also fail with timeout even though both SDA/SCL lines are high.
So far I can find 2 ways to recover the apseed controller: a) reset the
controller explicitly, or b) enabling the slave mode inactive timeout
interrupt to bring aspped controller's state to idle automatically when
the controller stays in slave mode for "too long" time.


Cheers,

Tao
