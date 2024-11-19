Return-Path: <linux-i2c+bounces-8043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066A9D2740
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C14BBB27B79
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 13:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000D21CCEF7;
	Tue, 19 Nov 2024 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AebHnbAQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B142A1CCEE4;
	Tue, 19 Nov 2024 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732023351; cv=none; b=hAktflcW7zb5MNi1wHW1Hs2KD4l/SwhNO8W1EC4Rpqbq4KN+6MKgFF6YcV65UCOAqx34UPLHAYKaZeFZ06b2YtgtsQJmepIYXSmaLN+Q9cGbCsBE3/1jaSyEN0NurBgzO8RK6SMUQomzneIdaDOFgzwjQtTzZqju+dfkTJgCVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732023351; c=relaxed/simple;
	bh=oLpoc2WvoUsUhrS1aPvboIlqwN760aHoq0UZupZxYjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czTawuqjSZrZBj9h0RdICitk6q2cWwsafGkLlaQZETcC0PN02riSBwO72eaeQXvOxfwUb4LT0bE4t/ahYB9tIRdYEgcS113LVtDm2p3OR0hpy7dhrvmOd0FUW78QBUMJqkY9o0UPq5+lhHupPFkJbAXICCZyguCc3jL2th5tyGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AebHnbAQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392E8C4CECF;
	Tue, 19 Nov 2024 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732023351;
	bh=oLpoc2WvoUsUhrS1aPvboIlqwN760aHoq0UZupZxYjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AebHnbAQkG2N53GlUQn1JKbPsQYgSuLJ3rIaWjBB1+Cz/TCXT/sTExaoTfk1RdkaX
	 qptk0tFf5g5zglEsN0RoWn1letpAIHLW/3okldSWHABXmTBHP4uUm/XkvCfqliWsbM
	 cVFTfMGunVzFG9oVsnGg7/hkneH5HGDpv1hq0GnfFZLJI8yzx/D75zVTUivGmlX4/H
	 gM3kIpPHrPmhAVlpdxt6jPUvkVHzBSi1uCac2FIAyEG9N/HqkD9of+N7nf1Kaec2o+
	 TZskTdPA3hLcTCm2WHYwZ1cNLKRDgNEI0qVNVgW2Yd9BUV32McmtVAZlv262Nx8X4R
	 8GZ/c0vgqwXyA==
Date: Tue, 19 Nov 2024 14:35:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Brendan Higgins <brendanhiggins@google.com>, Tommy Huang <tommy_huang@aspeedtech.com>, 
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, "wsa@kernel.org" <wsa@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	BMC-SW <BMC-SW@aspeedtech.com>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>
Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Message-ID: <x2rt6k5hw2km2vm4wjnqihop3xcy3uirhxs5wvhnesxc2athgb@c2ra7a62mfve>
References: <20241115044303.50877-1-brendanhiggins@google.com>
 <ZzcPJ9sweqxLZOGf@ninjato>
 <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>

Hi Ryan,

On Mon, Nov 18, 2024 at 12:25:56AM +0000, Ryan Chen wrote:
> > Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
> > Brendan to Ryan
> > 
> > On Fri, Nov 15, 2024 at 04:43:03AM +0000, Brendan Higgins wrote:
> > > Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed
> > > entry and replace with Ryan Chen <ryan_chen@aspeedtech.com>.
> > >
> > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > ---
> > > I am leaving Google and am going through and cleaning up my
> > > @google.com
> > 
> > Thanks for your work on this driver.
> > 
> > > address in the relevant places. I was just going to remove myself from
> > > the ASPEED I2C DRIVER since I haven't been paying attention to it, but
> > > then I saw Ryan is adding a file for the I2C functions on 2600, which
> > > made my think: Should I replace myself with Ryan as the maintainer?
> > >
> > > I see that I am the only person actually listed as the maintainer at
> > > the moment, and I don't want to leave this in an unmaintained state.
> > > What does everyone think? Are we cool with Ryan as the new maintainer?
> > 
> > I am fine, depends on Ryan as far as I am concerned.
> Thanks a lot, Brendan.
> I am ok to be a maintainer.

can I take this as an a-b by you?

Andi

