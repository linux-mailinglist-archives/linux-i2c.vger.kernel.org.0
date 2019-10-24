Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7A6E274A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 02:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392811AbfJXAKE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 20:10:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34217 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392810AbfJXAKE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 20:10:04 -0400
Received: by mail-pl1-f195.google.com with SMTP id k7so10930939pll.1
        for <linux-i2c@vger.kernel.org>; Wed, 23 Oct 2019 17:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tImeg5272b34Iznxl7Petu49srNSrEFj8p4qE+iFB8=;
        b=j21CTRG74DBey/56enrbYiNGRYUPHKf+Tt4cBnF1QjdGfWVCI7X7Rwoqt6cT7bOaRw
         7qZF93FyhuNm2QYaQ6kkpgf2uKDOo1xl5aqWPocz3W8JZY74y516CmEidWbXfhhi2u2l
         NDPWN5fI5tZn1g7oTRrN/OeBPyG2FvgyICzdB17Z5kQPH5mAyHyf3jrxg5HR5ObDd4fR
         i91ry+bfumEB7bzLIO07dvh9qvwOeEybFytCibn2Tlzcia5qTC+qbzosHR8IOHwafrnB
         PQRiR7tCXtAMfYdKXHEQadMwwox57seDQtLF1BJ86dBvf0oEvX00KLZ3Jy6KJCJ02W1a
         yMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tImeg5272b34Iznxl7Petu49srNSrEFj8p4qE+iFB8=;
        b=owU8ZvZhwX2c/cPkloIj6oSN5waGH1h1yh8JU9E9UYvByk+wfpGOyDEXRY2BAd3WNx
         HAE2W8MHAFTbGrg77bpAoaTcUEnp3fdfGK49oIe+jPM8EbN9d0DWbNqcgaC3FJi4rTjK
         qSv4hcFhP6lVNmVJU+Ja3JmK6Y+OHGEn881Pe5FZcqo3mMuDmThK4u1ytXO7rnbd+hsu
         Y3bx72lh+zf9x1m+LlzCknp7e376tQjYbWm4jnPzXueg8JvPsxpn9iDWNvun/ZV0QOtZ
         INkn4+ILJri+nTi63alsFb4w19eSojkbJZ+5sgKsQd5rA7n+CQkhTVWZBX+IRPtak797
         qZ9g==
X-Gm-Message-State: APjAAAXjKOKpZ0IfJ5DWlh+E03vLXx/XmO/ytehAtTf9VU5zqkH/XukH
        /G+XRzgkDtrrXvxjSILM+icG0UlHNJGJ87BdylTZXQ==
X-Google-Smtp-Source: APXvYqwVTdv5flgYg4yFFEBd0ungWO8pwYhfFAqkTY5/02eGxtUR/KpgK/9utcjmJ2eIkJGmMlBL+VCw2nZBAe+Eol0=
X-Received: by 2002:a17:902:b189:: with SMTP id s9mr6980823plr.325.1571875802336;
 Wed, 23 Oct 2019 17:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com> <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
 <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com> <b98827fa-462a-060b-efc7-27fe5d7742ff@axentia.se>
 <7806ece8-1d7c-7aa8-20af-6f5f964bec64@linux.intel.com> <6eba3e62-9215-0c39-258b-7abfb394bc48@axentia.se>
In-Reply-To: <6eba3e62-9215-0c39-258b-7abfb394bc48@axentia.se>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 23 Oct 2019 17:09:51 -0700
Message-ID: <CAFd5g46Zv6E=PcU6=aX65rg2TRY5y3nWB8CYjGJioU_zpfcOUw@mail.gmail.com>
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
To:     Peter Rosin <peda@axentia.se>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 23, 2019 at 2:17 PM Peter Rosin <peda@axentia.se> wrote:
>
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
> >>>>>    - bus-frequency        : frequency of the bus clock in Hz defaults to 100 kHz when not
> >>>>>                     specified
> >>>>>    - multi-master : states that there is another master active on this bus.
> >>>>> +- aspeed,hw-timeout-ms   : Hardware timeout in milliseconds. If it's not
> >>>>> +                   specified, the H/W timeout feature will be disabled.
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

Sorry for not jumping in earlier, but I agree with Peter.

I like the name bus-timeout-ms better. It was not immediately clear
from reading your commit descriptions what this was all about.

Cheers!
