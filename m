Return-Path: <linux-i2c+bounces-834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D31F814C09
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 16:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DB0D1C211F4
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 15:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F27381D5;
	Fri, 15 Dec 2023 15:45:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599B2DF67;
	Fri, 15 Dec 2023 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 9BEA728015144;
	Fri, 15 Dec 2023 16:45:07 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7C4A836F87; Fri, 15 Dec 2023 16:45:07 +0100 (CET)
Date: Fri, 15 Dec 2023 16:45:07 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <20231215154507.GB20902@wunner.de>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
 <20231215075210.GA15884@wunner.de>
 <ZXxynbIS8kd3KQuy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXxynbIS8kd3KQuy@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Dec 15, 2023 at 05:37:01PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 15, 2023 at 08:52:10AM +0100, Lukas Wunner wrote:
> > On Thu, Dec 14, 2023 at 06:38:41PM +0200, Andy Shevchenko wrote:
> > > On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
> > > > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> > > > +#define NR_P2SB_RES_CACHE 8
> > > 
> > > This is fifth or so definition for the same, isn't it a good time to create
> > > a treewide definition in pci.h?
> > 
> > This isn't something defined in the PCI spec but rather an x86-specific
> > constant, so should preferrably live somewhere in arch/x86/include/asm/.
> 
> I'm not sure I am following both paragraphs.
> 
> > If you have a "maximum number of PCI functions per device" constant in mind
> > then include/uapi/linux/pci.h might be a good fit.
> 
> This is indeed what I have had in mind, but why is this x86 specific?
> I didn't get...

If you look at it from the angle that you want to cache the
BAR of function 0 of the P2SB and of up to 7 additional functions,
it's an x86 thing.

If you look at it from the angle "how many functions can a PCIe
device have (absent ARI)", it's a PCIe thing.

It depends on the way you look at it. ;)

Lukas

