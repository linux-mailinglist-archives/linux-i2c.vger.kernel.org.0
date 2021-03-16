Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF90D33CE97
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 08:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhCPHZa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 03:25:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231405AbhCPHZS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Mar 2021 03:25:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0091664FAB;
        Tue, 16 Mar 2021 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615879518;
        bh=vnkoBWfDOdEgGTTsde3x1q52ycFZlax19/yrDHOJ7QY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZVdU0S5FPfuZSgrrlGP31EVw4qx3xpwK6iLzZ/bNI6B+dLp+9Y9+d/LRIRK2CtCVB
         92W8zJHCByv8Q6M5UYTulBCl/jcE/jzm06GGdqdpVGdvcwgP13ACPE0TmotYV4e+bQ
         698p0T5pj2LDSPFuwitbJIyWjy/d/BpxmRcG94ISxrMZjjH2c5y5Xat14hxjtx1Nf1
         3GpERhrNLsPhI9VM01z6fCVXfSWmpJcTEZZ/YWF70VTdd6/KgiG2IxOMVaPiBPyt+a
         ToFx2eWde3W5SXUooz+/6b8BYvwZpUJKDdTHPy9lLt47oBeHoS1AM/JDLBjXecLWWd
         aGB8NnOF8hYJw==
Date:   Tue, 16 Mar 2021 08:25:14 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Michael Zaidman <michael.zaidman@gmail.com>
cc:     Aaron Jones <aaron.jones@ftdichip.com>,
        benjamin.tissoires@redhat.com, wsa@kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCHv2 1/1] HID: ft260: add usb hid to i2c host bridge
 driver
In-Reply-To: <20210304124633.GA23038@michael-VirtualBox>
Message-ID: <nycvar.YFH.7.76.2103160824440.12405@cbobk.fhfr.pm>
References: <20210219163644.2811-2-michael.zaidman@gmail.com> <20210304111406.3482-1-aaron.jones@ftdichip.com> <20210304124633.GA23038@michael-VirtualBox>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 4 Mar 2021, Michael Zaidman wrote:

> > > The FTDI FT260 chip implements USB to I2C/UART bridges through two
> > > USB HID class interfaces. The first - for I2C, and the second for UART.
> > > Each interface is independent, and the kernel detects it as a separate
> > > USB hidraw device.
> > >
> > > This commit adds I2C host adapter support.
> > >
> > > Signed-off-by:Michael Zaidman <michael.zaidman@gmail.com>
> > 
> > I've applied the patch, ran some tests with a UMFT260EV1A evaluation board,
> > and found no issues with the functionality it provides.
> > 
> > Tested-by: Aaron Jones (FTDI-UK) <aaron.jones@ftdichip.com>
> 
> Aaron, thanks for giving it a try - much appreciated!

I have now queued the driver in hid.git#for-5.13/ft260. Thanks,

-- 
Jiri Kosina
SUSE Labs

