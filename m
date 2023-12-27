Return-Path: <linux-i2c+bounces-1019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEEF81EF21
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 14:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3C31C219AE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 13:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583BE44C8A;
	Wed, 27 Dec 2023 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIpnbf8n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175A944C82;
	Wed, 27 Dec 2023 13:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C74EC433C7;
	Wed, 27 Dec 2023 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703682892;
	bh=LJdf/Zm+9qivgtocQqT68NWc4E58i7lpCx5Mc3TGNyQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tIpnbf8ndpihqltS1QuncvIv2TGSev/pMKB7YxR07miBckiIni7LFIGN6mfY/1FeP
	 zhMSk2bPEveJHG67Pg7sH8h2u+e6kTQLig38lnNvd4IBynfRbeAf+sOEflSTNNxHob
	 JqB0DuAxqJG135mbFQE2DgHJZEFx9CxHud+uVXSlkYimiw2PbTABqNtkb7E5/7ZTPL
	 4u6ymEQHQBNMB25Gk9+aawx4O2YkmkDXud3B2ERK0YTQqhi4L+BZljRQxeh1vJU/Y+
	 hIE1hMcfHHKAnOqyVg2poCZqEKs2eM0BlxhyzpT7C7LCL01yrDGKEsaArogOViQF9Z
	 uEAWCyJmMvItQ==
Date: Wed, 27 Dec 2023 07:14:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Message-ID: <20231227131450.GA1499391@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u6v2mm6ncifgretsozi4kad2rlbz5zo3bdz4uexwkuvjyigbaf@betyniztbojq>

On Wed, Dec 27, 2023 at 01:09:03AM +0000, Shinichiro Kawasaki wrote:
> On Dec 26, 2023 / 18:34, Bjorn Helgaas wrote:
> > On Mon, Dec 25, 2023 at 06:26:56PM +0900, Shin'ichiro Kawasaki wrote:
> > > ...
> > 
> > > +static int p2sb_valid_resource(struct resource *res)
> > > +{
> > > +	return res->flags ? 0 : -ENOENT;
> > > +}
> > 
> > This got worse because it's *named* like a boolean, but the return
> > value can't be used like a boolean, which makes callers really hard to
> > read, e.g., this:
> > 
> >   if (p2sb_valid_resource(res))
> >     /* do something */
> > 
> > does exactly the opposite of what the reader expects.
> > 
> > I see that you want to use this -ENOENT return value in the callers:
> ... 

> I have to admit that the function name meaning is opposite... When I
> followed Andy's idea to make the function to return -ENOENT, I
> should have renamed the function to not cause the confusion.

Oh, sorry, I hadn't seen that idea.  But your v4 looks good to me (at
least this part; I didn't look carefully at the whole patch :) ).

Bjorn

