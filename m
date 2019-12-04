Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1D9112E18
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2019 16:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfLDPO2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Dec 2019 10:14:28 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44708 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfLDPO1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Dec 2019 10:14:27 -0500
Received: by mail-ot1-f67.google.com with SMTP id x3so6575165oto.11;
        Wed, 04 Dec 2019 07:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=o+hFN8IqKVNoUmQrkJu8TMIhc+FtW0Kt3XLH9BBCFME=;
        b=RC+VQrvdq6Fn2W/J4LSNsOim5dSVmWu9zfGe8uUuYd2PaD279V+zCLMJ1fgohT2726
         pk5MdA82NF9Alf5PsgB4kuLt2L6Z4X3o69D+PcBBB2Us+o0ZuDm5d1DfiB8uZzWvIqOU
         Ry2afhImrVRV7l2K4/mJnDySW9hPoEEdy8iFlRxg/pKICupbRBkvKGgSa7yhgjAM6ZoO
         Qh4PxZjebk9qKRLuxzCjtk8gmjFm7xQi6Y6Im+G0l1uBpHdan1m8RF1wYLwyXIh9d1PB
         xpRO6n4Ply4xoLWyhobTsqCvvkZ3/5q30eqcZsTvgg0Cc9nCzFW7udWqLUxVbI/d2eHw
         rR2Q==
X-Gm-Message-State: APjAAAVme4igybeYnlrVcSYCNZHuNTo9L38KxuKULrPwtb1pkfdX0qEL
        o/2bahStyJ+kyGFSji1oDxekvdE=
X-Google-Smtp-Source: APXvYqyDpd68LHA7Vc9YToHmwTS2jPtEct42aCrQlGcX6wCzwAM7xJgp3Zq+bIy220TGHyd0vLRcsg==
X-Received: by 2002:a9d:5c88:: with SMTP id a8mr992823oti.348.1575472466619;
        Wed, 04 Dec 2019 07:14:26 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm2372907oic.52.2019.12.04.07.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:14:25 -0800 (PST)
Date:   Wed, 4 Dec 2019 09:14:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: new optional property
 write-protect-gpios
Message-ID: <20191204151424.GA20683@bogus>
References: <20191120142038.30746-1-ktouil@baylibre.com>
 <20191120142038.30746-2-ktouil@baylibre.com>
 <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
 <CAMpxmJWSgYjcGdR7Zrj-=nA+H8cYfZUriHQPxN=8zgPDvD-wTA@mail.gmail.com>
 <CACRpkdaW82pgQivc0VVgqqVv4fgXxMyGD3Lo8YHcMK7aGPDKaw@mail.gmail.com>
 <CAMpxmJU_0MzroyD_ZF5WOxpZz3dkADLOmW7aKpWdJ7GCvo-RnA@mail.gmail.com>
 <CACRpkdaPQKxfC66yhG=xdmCOGGd9PjDVCwZquKb+4HmuS_=kNA@mail.gmail.com>
 <CALL1Z1xpcGyh_f3ooRT+gGApoAnS7YBMd2hUKqnt+pTcAFoeAg@mail.gmail.com>
 <CACRpkdYEEypRZOaO3Ta9aDgizNeLyUOSraBEhKaZcHaJV+o0gQ@mail.gmail.com>
 <CAMRc=MfVod5ODvsQbVBny1+Yvre1F971uR_DqsvoiYATvUfoXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfVod5ODvsQbVBny1+Yvre1F971uR_DqsvoiYATvUfoXw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 29, 2019 at 09:47:01AM +0100, Bartosz Golaszewski wrote:
> czw., 28 lis 2019 o 14:45 Linus Walleij <linus.walleij@linaro.org> napisał(a):
> >
> > On Tue, Nov 26, 2019 at 4:18 PM Khouloud Touil <ktouil@baylibre.com> wrote:
> >
> > > [Me]
> > >> 4. The code still need to be modified to set the value
> > >>    to "1" to assert the line since the gpiolib now handles
> > >>    the inversion semantics.
> >
> > > By saying "assert the wp" do you mean enable the write operation or
> > > block it ?
> >
> > Yeah one more layer of confusion, sorry :/
> >
> > By "asserting WP" I mean driving the line to a state where
> > writing to the EEPROM is enabled, i.e. the default state is
> > that the EEPROM is write protected and when you "assert"
> > WP it becomes writable.
> >
> > If you feel the inverse semantics are more intuitive (such that
> > WP comes up asserted and thus write protected), be my
> > guest :D
> >
> 
> Ha! I've always assumed that "to assert the write-protect pin" means
> to *protect* the EEPROM from writing. That's why it comes up as
> asserted (logical '1' in the driver) and we need to deassert it (drive
> it low, logical '0' in the driver) to enable writing. This is the
> current behavior and I'd say in this case it's just a matter of very
> explicit statement that this is how it works in the DT binding?
> 
> Rob: any thoughts on this?

I agree with you. If it was called write-enable-gpios, then assert would 
be to enable writing.

Rob
