Return-Path: <linux-i2c+bounces-1135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE98250F1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 10:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5521F22B9B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D262420A;
	Fri,  5 Jan 2024 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MkjD5d9g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CBD24201
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 09:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B89C433C7;
	Fri,  5 Jan 2024 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704447468;
	bh=0qUNWcbeidvtM2mXPzICv14D2IvpBcRS7BJ0wSPDCpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkjD5d9gqeXhmkbgh/H0HxXi+VOCyB8qA4mguXOLHSkXwWu+RbV0R1d4PjJaN/g5z
	 gz0Jfq4tPpxBz0CWOJ9G3NwZ+Fsd1+7oLFoopG6+Ot0gQQAk+1gKObfIdnkNW++w/i
	 nzrshQ0q88zvv0NtrBnGG5keXn4GSxWjYZtBU+Y4=
Date: Fri, 5 Jan 2024 10:37:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] eeprom: at24: Use pm_runtime_resume_and_get to simplify
 the code
Message-ID: <2024010512-dancing-multiply-26d1@gregkh>
References: <c3045427-da42-4f7c-8a96-3c4756646cd0@gmail.com>
 <CAMRc=MeKEVFFE6Pw3KBXTVgA3Y0sUswBKAWqEOSDyZk_QLhQQA@mail.gmail.com>
 <a1e908ce-9d5b-4d0e-8002-b25d4b6a7172@gmail.com>
 <CAMRc=MetjCb-42uPBEU53RFD1_CcwJ9d22eGHbX1HESOdp1nig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MetjCb-42uPBEU53RFD1_CcwJ9d22eGHbX1HESOdp1nig@mail.gmail.com>

On Fri, Jan 05, 2024 at 10:35:18AM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 5, 2024 at 10:32 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >
> > On 05.01.2024 10:22, Bartosz Golaszewski wrote:
> > > On Wed, Dec 20, 2023 at 4:11 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> > >>
> > >> Use helper pm_runtime_resume_and_get() to simplify the code.
> > >>
> > >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > >> ---
> > >
> > > This looks good, but I had already sent out my PR to Wolfram when you
> > > sent it, so I'll queue it for v6.9.
> > >
> > I just received an automated note from Greg that he applied this patch
> > via the char-misc tree. The same applies to "eeprom: at24: Probe for
> > DDR3 thermal sensor in the SPD case"
> >
> > > Bart
> > Heiner
> >
> 
> Huh? Greg, I typically pick up patches for at24 and send them through
> the I2C tree (as per the MAINTAINERS file).

Sorry about that, I caught this in my sweep of patches sent to me.  As
you wanted it applied anyway, all should be good, git can handle the
merge just fine.

thanks,

greg k-h

