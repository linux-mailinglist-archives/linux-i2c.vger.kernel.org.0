Return-Path: <linux-i2c+bounces-823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A081430A
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 08:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A127B1C223C5
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 07:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B421094D;
	Fri, 15 Dec 2023 07:58:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D516418;
	Fri, 15 Dec 2023 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 41C1E1002A0A9;
	Fri, 15 Dec 2023 08:52:11 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id EF6571CD09; Fri, 15 Dec 2023 08:52:10 +0100 (CET)
Date: Fri, 15 Dec 2023 08:52:10 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <20231215075210.GA15884@wunner.de>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Dec 14, 2023 at 06:38:41PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
> > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> > +#define NR_P2SB_RES_CACHE 8
> 
> This is fifth or so definition for the same, isn't it a good time to create
> a treewide definition in pci.h?

This isn't something defined in the PCI spec but rather an x86-specific
constant, so should preferrably live somewhere in arch/x86/include/asm/.

If you have a "maximum number of PCI functions per device" constant in mind
then include/uapi/linux/pci.h might be a good fit.

Thanks,

Lukas

