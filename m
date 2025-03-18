Return-Path: <linux-i2c+bounces-9885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C38A67EF3
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 22:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2C742127D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 21:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8062063C0;
	Tue, 18 Mar 2025 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhGpH2I1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF740202C5C;
	Tue, 18 Mar 2025 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334077; cv=none; b=Zeg6lifYNurxzyxyfmrUA+b26jremXa+1jUG+tfxJ0mgt9j38SEXKW9NS+XAwwK9MTSc/woFm/kLD91raGT2iuKBQCg+ybusf7WbONQdVbNHJhAYXEkKR/pPa/ZwvYWgo61Thbzza5wkTgEcBocoPSkqMIUIaSe26OD5IHJimDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334077; c=relaxed/simple;
	bh=BEXxbDACahqR6NIWAUeOiMICou1IfERSdqow0dpWsxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcObVgDMaXlWqWMYut4FUVKyX/UuWQJycHoCRit2lU8EKM3Bzesr5My6iUX7wdMNd1XLWvdlSiI49NhXWdUUiRpjVe9e0gz0VUkxuVoKgBYC8roLO2O/OU0qxaoEA+JCvcRQMuQjt+hqcT9JDezlSrJ0A/oE7Y6ZEOngvyNbiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhGpH2I1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868E1C4CEDD;
	Tue, 18 Mar 2025 21:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742334076;
	bh=BEXxbDACahqR6NIWAUeOiMICou1IfERSdqow0dpWsxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhGpH2I1ueS9/GTixrWDP38+d0Hx2m1vLtecLXyqlvMmZ1TbxwTGgilNBv94gBEUd
	 nUvjB8hoqrISm3V37ui8Dwjx1L8VGwWGhQz4M9CrP5WfkGSj11uO5DrtVWizHnqKvW
	 tBArcC+K+Uru3mSPpcWyF+3rm8tDofMbnTDqFkjPfIRKWgrLr+aKyMQHHlVLHwFPTF
	 2g2UZNRHIflzb7WaMcsRtZxraIDvE5ABhFS/hxWkZxS5Lk6sVm3ldg4mUwZczdu/jn
	 gZ6Adoear+N0OB9HGDfn5E0bWPDVq3SVsmiHwzPGVAJ5cgtGZ8WXDjObIr69DM7SYc
	 v5w6lwSzIag+g==
Date: Tue, 18 Mar 2025 22:41:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@ieee.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <lvwiyxitkuzi57cbbcvuanqpvhaihafarwqhkflxbctzs6j4o7@ev45pe3yuzj3>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
 <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
 <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>

On Tue, Mar 18, 2025 at 07:04:19AM -0500, Alex Elder wrote:
> On 3/18/25 12:44 AM, Troy Mitchell wrote:
> > > I'll leave it up to the maintainer to decide whether these
> > > comments can just be ignored--my Reviewed-by is fine, even
> > > if you don't change these.
> > > 
> > >                      -Alex
> > I know it's right what you said.
> > But I don't know if it's worth to send v8?
> > Maybe I can fix it when I add FIFO function?
> > If I'm wrong, let me know.
> 
> Unless the maintainer wants you do do v8, please just
> address these suggestions later.  Thank you.

it's easier to just send it rather than asking for a v8 :-).

What I care more is if you would give an r-b if your last
comment was addressed. If so Troy still has time to send a v8 to
get the series in this cycle, otherwise I can change things
myself before merging.

Andi

