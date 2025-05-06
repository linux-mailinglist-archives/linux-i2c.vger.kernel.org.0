Return-Path: <linux-i2c+bounces-10828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DE1AAC358
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 14:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7859E3A3D14
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC3E27E7CC;
	Tue,  6 May 2025 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDZgC0ls"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F327CB2E;
	Tue,  6 May 2025 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533099; cv=none; b=YtRfU3RA12h7z2Aff+WkUdK6fTAfRoPvmSUgEKG2PcD1CcC9RxegGcyrjlw733zQtHLi4NgyTSSFthgnzmZvIvMS5/P2oXfwTrufiNLWub6beabUXBt8Cc1A8pNz+L6hmZrDi8QZb+n4eWbcntmx8uclb5x8PYJ1q+XtocP9sRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533099; c=relaxed/simple;
	bh=38N7dD0e4+KYfV/czsKShRXlNWz07SRSUqANCpL8X6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9b7lrDsr3Mgh57k8N7xcrC5xjmvFrRyNqDcjPZOnQVIs29zr+KKP6W0th1+iQrdqYhOMZL7WqRCxX4/isdQw/gYTAOe356b82H/f5Tkp0ypmeCPFfB9Fk2/79YE2WJoZe0SaUsebu7KzPNhEA8EOSS6B5j16FTKXDZKrk5SlaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDZgC0ls; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3407C4CEE4;
	Tue,  6 May 2025 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746533099;
	bh=38N7dD0e4+KYfV/czsKShRXlNWz07SRSUqANCpL8X6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDZgC0ls5X/S/0kA71uGcJA87m1+q1jpiBT1uryX+zKkkY5dMdls7PLaZFwChqzVk
	 h2imYWYElJ1K+/A9QjLNFeKcr7h/HiCssQSENBU60w7YFY8nyUfczuz8n518w4S7Vs
	 BpXxKkPQOLiCtEZH5WTVq3sBlzcr3BG0seCzdxIbQqvTilGQshxcFUaEbeZEEX4QFZ
	 pnl0Qg79Raw0jWj9KgwwBNA4MZeaGR1z5mAHKoRQvXTtM+g1xdF/7w3IsvQ3b+Xy0d
	 Ae/y1NpQE9rjP8GjzEovfXrzxdHWQmDb1yjfVw0fFBNCJI7dJQIrcQvsTQ1DEbfOxs
	 xGEIwjrFVcaLg==
Date: Tue, 6 May 2025 14:04:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	linux-i2c@vger.kernel.org, 
	prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-corei2c: add smbus support
Message-ID: <4xyehpobtsyj2k5xlhupq7x6z7es7bvzek4zsf4roramy5h7kn@duxhfxd4gxsq>
References: <20250430-preview-dormitory-85191523283d@spud>
 <3421bf4a-afa1-4b4c-8421-bad7187d3d8e@quicinc.com>
 <7q4gdh3jcbnsptmdv6fywnwqta5nekof4wtut35apw5wphhkio@veeu4ogcm44h>
 <20250506-bunny-puma-996aafbf3f56@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506-bunny-puma-996aafbf3f56@spud>

Hi Conor,

On Tue, May 06, 2025 at 11:56:19AM +0100, Conor Dooley wrote:
> On Mon, May 05, 2025 at 10:04:27PM +0200, Andi Shyti wrote:
> > On Wed, Apr 30, 2025 at 05:06:09PM +0530, Mukesh Kumar Savaliya wrote:
> > > On 4/30/2025 4:53 PM, Conor Dooley wrote:
> > > > From: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>

Do we want to keep lower case for names and surnames? Can I use
upper cases?

> > > > In this driver the supported SMBUS commands are smbus_quick,
> > > > smbus_byte, smbus_byte_data, smbus_word_data and smbus_block_data.
> > > > 
> > > Write completely in imperative mood. something like :
> > > 
> > > Add support for SMBUS commands in driver
> > > 
> > > Add support for SMBUS commands: smbus_quick, smbus_byte, smbus_byte_data,
> > > smbus_word_data, and smbus_block_data.
> > 
> > yes, I agree that the original commit log is a bit lazy written :-)
> 
> I don't personally think the suggested wording makes any meaningful
> difference, but I can rework it if required.

The point of using the imperative form is to clearly state what
the patch does. Saying "the supported commands are..." feels a
bit lazy, in my opinion, and requires a peek into the change to
fully understand what the patch introduces.

To be honest, I wouldn't reject the patch over this, but it
doesn't hurt to expand the log a little.

(No need to resend—you can just reply to this mail with your
updated commit log.)

> > > Also mention below limitations here .
> 
> I actually removed them from the commit message, since they're not
> limitations just what was and was not tested. I can put them back too
> if that's needed.
> 
> > > SMBUS block read is supported by the controller but has not been tested due
> > > to lack of hardware. However, SMBUS I2C block read has been tested.
> > 
> > Smbus i2c block has not been tested? If so, can we leave it out?
> > What is the interest to keep it in?
> 
> What's the interest in adding any feature? Someone might want to use it.

What's the point of adding a feature that no one uses? :-)

> We did not have a piece of hardware that uses it, so didn't do testing
> of that specific command, but a customer may well want to so we included
> it. Again, if you think removing it is the play, I can do that.

No worries, please leave it as it is if you think it will be
useful in the future. I just wanted to clarify.

Thanks,
Andi

