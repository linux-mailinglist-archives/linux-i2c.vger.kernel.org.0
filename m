Return-Path: <linux-i2c+bounces-4776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8704692AC05
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 00:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F6C6282259
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 22:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC9D14F9FA;
	Mon,  8 Jul 2024 22:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jly/SpBk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B43CF63;
	Mon,  8 Jul 2024 22:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720477603; cv=none; b=tm2yd9E01NIwglW6GIL0aAIQCZWVQuhzDrPffUxJo9s022je+Zh1OS7Z7wC9q9sSQy7e1g8JXScniy2axmes1Dfh9o+0tFOXDmUEee1boBAkVi/lyDNbhYDEvNhdZNsaHpLnddDrMbgXAQhp1ZgiGR4cyKcCSP4N6kNpHgm2a6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720477603; c=relaxed/simple;
	bh=cXOksX8i8kMxB3z6SFQbhz7mh95szg7WejnNbiRlTpg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPt7NL+pmHO+yKUFBHyq74VwF+ZJPk+GeAUwbOJFAbxtA8UEcLNa5aMMKe7QwEQzE/pnzAHZYTADhZe10wx/fILGvfcYPvRySUpTESBKcwv0NtCvR6kwqA3SKW3Oel/J1c34/t2CqHglr8FnDvkL/FniegEiJKPgl/DltOibCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jly/SpBk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005A3C116B1;
	Mon,  8 Jul 2024 22:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720477602;
	bh=cXOksX8i8kMxB3z6SFQbhz7mh95szg7WejnNbiRlTpg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Jly/SpBk8CZAZ4gHL252Cto104of5S2XaXCjviTe0PAsDmrwr/JIUpnAtrKrarEei
	 ELvHFEuAscaqppWfc2Ajjj3Gml3GmJonH4HJmoluEoLLyrC6pkak0+nIpLZrVBrPg7
	 auVMkF4RCtjWY1VyMFPiP53vZkZwAk2FhV4ertYqpjXqwSAJmc6Lcnwx6oi2e30Uiw
	 DaGMLtW0ccwhLvCExT/4PEqMEeblWnUEcygK1BMIm28NsyKzzG4hMlv6lSCxfI3SR+
	 V2zI531VIP3vz1fbZJZkCDU0WeZ4QbRhyQ7ejJRiDRavJU8+xHePjvq4QF1BDaIUt1
	 5nJYnSqLRhecw==
Date: Tue, 9 Jul 2024 00:26:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: rcar: minor changes to adhere to coding style
Message-ID: <5trq7ondxem43rfnckonywhrucvjvecc52pvyik2fsz64ivknv@r22caitz5y3s>
References: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
 <f93eda7e-e65f-42e9-b96d-e88290201ca0@web.de>
 <Zop2vNCrzDmEKKiO@shikoro>
 <Zou2g8nGBD7Pv8kR@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zou2g8nGBD7Pv8kR@shikoro>

Hi Wolfram,

On Mon, Jul 08, 2024 at 11:50:59AM GMT, Wolfram Sang wrote:
> 
> > > > -};
> > > > +}
> > > …
> > > 
> > > How do you think about to omit any blank lines at such source code places?
> > 
> > Oh yes, that newline should go as well. Thanks!
> 
> Andi, is it okay if I only resend this patch?

That's OK... if you want I can remove those blank lines before
applying them, it's just two cases in your patch.

Andi

