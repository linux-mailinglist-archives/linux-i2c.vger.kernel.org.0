Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106B419EE49
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Apr 2020 23:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgDEVlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Apr 2020 17:41:09 -0400
Received: from mout.gmx.net ([212.227.15.19]:44335 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726887AbgDEVlI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Apr 2020 17:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1586122863;
        bh=zHDc8GRgLA5wNlFBNah8ScqLeFFv9wstN0o9j5Fv2xg=;
        h=X-UI-Sender-Class:From:To:CC:In-reply-to:Subject:Reply-to:
         References:Date;
        b=Cfer6HJRxL8d+OQo67Je8s0XpIyOKL1ybIgom5CENqaKFWgrXLNJ2kycVLku8enea
         Qsttzpet3waw7BprwyS7VeqsU9tMltkRBihC9lTumMQZ8Lmg34TcLgUlO6VEhjFx7G
         neirg8QK0fjaQPr/gauA662hxAJ3n9Sb5MmcTJYE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.188]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MvbFs-1j4Een0HQs-00sfU3; Sun, 05 Apr 2020 23:41:03 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
        id 91F97899799; Sun,  5 Apr 2020 14:40:59 -0700 (PDT)
From:   Stefan Schaeckeler <schaecsn@gmx.net>
To:     wsa@the-dreams.de
CC:     luto@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com
In-reply-to: <20200405180510.GD6313@kunai> (message from Wolfram Sang on Sun,
        5 Apr 2020 20:05:10 +0200)
Subject: Re: [PATCH 0/1] i2c: imc: Add support for Intel iMC SMBus host
 controller.
Content-Type: text/plain
Reply-to: schaecsn@gmx.net
References: <1582498270-50674-1-git-send-email-schaecsn@gmx.net>
 <CALCETrXcFrR9V_yjPRh9eJ1=1efo_DCCwGTeusmo2CQXpFFdrw@mail.gmail.com> <20200405180510.GD6313@kunai>
Message-Id: <20200405214059.91F97899799@corona.crabdance.com>
Date:   Sun,  5 Apr 2020 14:40:59 -0700 (PDT)
X-Provags-ID: V03:K1:jOepkKGAFfNVxHEsj5xp1TFnupuc2G80nKz/gExucwfUDwNtjzs
 o+NT55lyU9naIUsafOv1rmHLLqJEba1SFMbknPuWFX8Ei2U6aQeYhiduQfr47YdVl+YEWMQ
 aevlayL3i58crcEBCp6Jpiz7JmWPQgZFMajbA5Dy3IblNz3sW9PUBs7xg5laqHKlrcIfrTK
 SMxuejQeBQe8jm7ntUvZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gecnlN20pCc=:k9Yv3QBWiiquqkwCkimDMA
 vZDht91Z1sEyA819JQwFoXmVr/iE8GKEGmxinWff2mPJXZjhUkeWqJzjjKUymRYku6sxEwKkU
 b0HDoS+CXTSj5QcHU9i3VMNwew0I9P8ihCH5UH0zU3riIReJUpbkHXYczKmzC5DUaHviyoQw3
 mMc5P+vugSldH8UdkONBRALekGn4xrtf81RIVB8J63eQ+wbmCkeD6AKOllXZVBxR133O5lSIX
 Xo5O03PHQMeIWtdWjYO1KXo9QUfT7sVWuknmOpHXN1gsF2TZwSEUSh8xgOBn7OgdiHJuMXdyf
 aTGCTSFeIcIFS0X78TzacP0+saEoUlaUPqokdHz+2SBt6thJTTgauz6HfxxbzkUZNAzfAcPhK
 WJF9xVGH/qL6siN+M6jYIrjeFRSNEiIAnanQsckw2+vF+Yb4zuabN5yEDwI1qSFS3qvl55gIa
 0Fw7YUVmWG8HUVOHfLYRVDbaO1UQ1zmM+1adRT8HeRPPTyALK3gyP18/IxugkB4OcfjkeYn2p
 j57GmzF+3AQwmuzO/KA/wnaoll/vmnDiBAEyKuSiQcDUPO5BwgHQSMrs3Y9CWp+oxeKWOlg2t
 usenekvgl51YzBPjmiFU+oonfSBeDZ4FV0sC649nO/BU/HEFXwm239WnAFo1tQa9jCq8VY2mk
 bPyJ7LJ3B2EDEYsZ6OWGmacB3v/4QXXZivz+IB0AvK7cG4Rt3uPzChZh4csMZ9orkrVWn/2+s
 cQKKJCWuSCumtTRiGpuy6BN56CYzyxW7VSRqeC8YJcF4MeqtRNBxKqybBEs6c0LUXz0LVQF/h
 VkwHjMuiSAzV6v7JJrbDcZ7NT2hfsukcfYP07JrsZZsDTOsh77dJvl0GT/I+vCKnOgTbkEEZL
 8o8j3Jtd+svJg9nlri8trps0XE0D7RQ7DfyxKuGG86Qo4d2xYLJmSWv3A3tOJjfsv2vEhDl0g
 HPSGVWhwLnTeD4h+uYF1z073jgsA4Pg29P7X40gBnlQ3XF8tswQSLLOiNsiMk/aaboo4C+psY
 LQSJjhhD/b8Q6/fcib8I4FU5EKMIY2KTXR6XBuB6alENDeO0jFzMkKQZUpfpq+bDPhJHFkV7+
 7G/ORvMPzyTeTNNcvn7ymsMGom0BEM8l0MjOR7h3fQumhjV+qq7aX/jXTBtyCRjbbNBpbi9Ch
 KzJMwMBeB3olFxeAGejswdDr/ZCoIDCd9BrsRKI0hWjxBjtyJy043k3iZfPcbWM8slvyzMfwh
 VEgUVJ51RYNWqTbbP
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram,

> > > This patch is based on Andy Lutomirski's iMC SMBus driver patch-set
> > > https://lkml.org/lkml/2016/4/28/926. It never made it into the kerne=
l. I hope
> > > this rewrite will:
> > >
> > >
> > > Overview
> > >
> > > Modern Intel memory controllers host an SMBus controller and connect=
ion to
> > > DIMMs and their thermal sensors. The memory controller firmware has =
three modes
> > > of operation: Closed Loop Thermal Throttling (CLTT), Open Loop Therm=
al
> > > Throttling (OLTT) and none.
> > >
> > > - CLTT: The memory controller firmware is periodically accessing the=
 DIMM
> > >   temperature sensor over the SMBus.
> > >
> >
> >
> > I think this is great!  One question, though: what happens if the
> > system is in CLTT mode but you disable CLTT and claim the bus for too
> > long?  For example, if there's an infinite loop or other lockup which
> > you have the tsod polling interval set to 0?  Does the system catch
> > fire or does the system do something intelligent like temporarily
> > switching to open loop?
>
> Any news on this question?

Thank you for your interest in this patch. You can read my reply here
https://lkml.org/lkml/2020/3/1/216

 Stefan
