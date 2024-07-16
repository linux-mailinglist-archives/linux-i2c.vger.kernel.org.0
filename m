Return-Path: <linux-i2c+bounces-5002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A71932FAB
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 20:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B31411C2281E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 18:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99351A01BF;
	Tue, 16 Jul 2024 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hY5C4ziG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647471F171;
	Tue, 16 Jul 2024 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721153145; cv=none; b=gTyko9xXgv6eT3KMTxqmYZsCysbj3+51HPRezvWTk+TM1hd8dqtT83QzjB0nvwRx7Oq/KhCWJB0ocwxGKLBWKtMsvQzHS5wMLYsNtv54GkZgsb500fA3dqLAzqhDwWgIExdKwSoRdI5xyIvPCr6+ooufGBdW4bX5X+Bw4OH5EsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721153145; c=relaxed/simple;
	bh=HT+U1SUZjpnWe8Zswy5hdKqtal+Wsqa4Rt/sCxqDWqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZoKmC9seHzV+NPLV6BUxMjdI2j1xtEo3uWAAmm64h0GDNs3wBYb7MsA3Ph7vdGKoLPZKPpiSlhNRYagQoDvkXoYTsZ2oHThi3cGI7nPgVEMASPQVQyK8Y5cpdYfDMXCPYbaO3edAvawq7DZLM+ZH14X0OCuhuN25KIy2Pzs2Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hY5C4ziG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1E8C4AF0B;
	Tue, 16 Jul 2024 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721153144;
	bh=HT+U1SUZjpnWe8Zswy5hdKqtal+Wsqa4Rt/sCxqDWqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hY5C4ziGBlPVV/4+xcJ/w+BfmziEGjgHhV/EswIMkI567G1BAsLi/wwBb045Iyx2m
	 tpWtUF0swZ3F44EpM8lfX4jy716KhIoZifZN10F/cY4CnLJukT2Jm89419Z6dUi+s4
	 p770EbWSEQkSkD6MSeM524XeXDTXuhnegt6c2fqhWDK2XQI10wNgQ8dM651nCvnAyN
	 Z/hPwFqXIeVRADlDS1uE2DaNAiaAy/OALWRiWHAwg8GROVs/Q1RJXsktm7XTdixBEv
	 dWwIfSMnCS4K6jEycyYG9Gii4GcZtA6lqQMOEDz3rOTl+c13BqWMgdVMO891G/yTk2
	 0Q8y8AT7lNdfg==
Date: Tue, 16 Jul 2024 20:05:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: piix4: Register SPDs
Message-ID: <r4osnmgfghlbcuprc4stmrfw3aaz62icj3mbwszej3f5anmfma@spddijyna5xk>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
 <20240709-piix4-spd-v3-2-9d1daa204983@weissschuh.net>
 <ZpEnXaRYnPIr1vG3@shikoro>
 <i633av3v2a4chdh5a7yk6nv6y77ohvpajeozypjdroufikes6k@cmvpywjwj4df>
 <1c03bc1c-b1ad-40ee-8219-718455717966@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c03bc1c-b1ad-40ee-8219-718455717966@t-8ch.de>

On Tue, Jul 16, 2024 at 07:50:04PM GMT, Thomas Weißschuh wrote:
> On 2024-07-16 19:46:43+0000, Andi Shyti wrote:
> > On Fri, Jul 12, 2024 at 02:53:49PM GMT, Wolfram Sang wrote:
> > > > Only the first 8 slots are supported. If the system has more,
> > > > then these will not be visible.
> > > > 
> > > > The AUX bus can not be probed as on some platforms it reports all
> > > > devices present and all reads return "0".
> > > > This would allow the ee1004 to be probed incorrectly.
> > > 
> > > I think this information would also be helpful as a comment above the
> > > code. But to allow this series to be applied now, I think an incremental
> > > patch will do. With Heiner's ack, I think this can go in now.
> > 
> > I agree with Wolfram here. Are you up for a v4 or do you want me
> > to add the comment while pushing?
> 
> I also agree. My first interpretation of that message was that I would
> send the incremental patch during the 6.12 cycle.
> But if it's still fine for 6.11, even better.
> If you could add the comment, that would be great,
> but I'm also fine with resending.

That's why I'm pushing... Wolfram is allowing me a pull request
part 2 and I wanted this to go in.

I will fix the comment then.

Thanks,
Andi

