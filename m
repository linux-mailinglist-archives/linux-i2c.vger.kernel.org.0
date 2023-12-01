Return-Path: <linux-i2c+bounces-578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E6800D94
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 15:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 844FA281B98
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1882BB11;
	Fri,  1 Dec 2023 14:44:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771F410FA
	for <linux-i2c@vger.kernel.org>; Fri,  1 Dec 2023 06:44:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r94l0-0007sC-5O; Fri, 01 Dec 2023 15:44:42 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1r94kz-00CsJd-4O; Fri, 01 Dec 2023 15:44:41 +0100
Received: from mfe by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r94kz-004lis-1Q; Fri, 01 Dec 2023 15:44:41 +0100
Date: Fri, 1 Dec 2023 15:44:41 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.de>
Subject: Re: [RFC PATCH] mtd: devices: add AT24 eeprom support
Message-ID: <20231201144441.imk7rrjnv2dugo7p@pengutronix.de>
References: <20231127164623.1008176-1-m.felsch@pengutronix.de>
 <CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
 <20231129174722.7d4e768c@xps-13>
 <0cb00798-6510-4456-81fd-90131b97fdb8@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cb00798-6510-4456-81fd-90131b97fdb8@app.fastmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi all,

On 23-11-29, Arnd Bergmann wrote:
> On Wed, Nov 29, 2023, at 17:47, Miquel Raynal wrote:
> > brgl@bgdev.pl wrote on Wed, 29 Nov 2023 10:10:28 +0100:
> >> Though if I'm being honest - I would prefer a single driver with
> >> backwards compatibility. Have you estimated the effort it would take
> >> to abstract both nvmem and mtd?
> >
> > Also agreed :-)
> 
> +1

Thank you very much for the input :) Of course having a single driver
would be better. Before spending to much effort for this I went the
simple way to gather some input in case of you don't like the approach
at all. I also hoped that we could deprecate the non MTD variant later
on. That beeinng said, MTD does not mean that we don't have access to
NVMEM since NVMEM is already supported by MTD as well. It's just not
under the same name and the backward/compatibility config is not set.
Therefore it's not a drop-in replacement right now.

> I think this particularly makes sense in the light the other
> at24 driver that was recently removed in commit 0113a99b8a75
> ("eeprom: Remove deprecated legacy eeprom driver").
> 
> The other problem with having two drivers is the need to
> arbitrate between them, e.g. when you have a machine with
> two at24 devices but want to use one of each for the two
> subsystems. This does not really work with our DT probing
> logic at the moment.

Yes this is not possible, but I also can't imagine such use-case. You
can use the MTD version for both since NVMEM is supported for the MTD
version as well.

Let me check how I can keep the backward compatiblity e.g. by guessing
which in case can be error prone as well.

Regards,
  Marco

