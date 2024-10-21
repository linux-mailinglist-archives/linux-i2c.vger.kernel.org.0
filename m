Return-Path: <linux-i2c+bounces-7495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096289A7215
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 20:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81145B24C58
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 18:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D171F8EEC;
	Mon, 21 Oct 2024 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKU136QW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965601991DB;
	Mon, 21 Oct 2024 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534457; cv=none; b=RlEtSP7XPjnjIDuVy+lcGNh49XZnwwv/53mCEnzfBPNewLBMbozzeu6KZTgBivFvuwJJnP7kUvyktzbuaanWXPXIG6bRiCEKvz5VCX180No213+mDY55zM0GN9utS2pZca4Np/hQb7237ueQmdI76FxegNcvIs5NtJtSgbJR1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534457; c=relaxed/simple;
	bh=6mdzQzHRWIZ7e/NGbWzVAFm3R4ztY9x43onKwrhnKgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtGV8n/UUYMi5LxSjeSJBAo1fdprpE9GnvgIb7aFyuhfDFRYmVs5uwEdzuz64GGUOBtTPc9EBilfFrlXn0qfGsqmrU8k0OzSWS7gJe/bXYgJy+XXIlLInWExbKQlciTs/DhzQK+VMukFFQgyX3bBbroUGqBmUdSb/LsWOo4w03o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKU136QW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECBAC4CEC3;
	Mon, 21 Oct 2024 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729534454;
	bh=6mdzQzHRWIZ7e/NGbWzVAFm3R4ztY9x43onKwrhnKgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKU136QW4s9amLSb5SPHuIHW8ZnFGAQjoIKpw3dOntSCZI0l2kZ+wbIiNAQApDyh9
	 /yZZamRWx61MByztKcNjczZpysskr77E+PExVakVIClqJXTGShyEzXTmuoH/HKC7pb
	 yonOTns4UoaqXel3Xf+h/cgh1o4lDwUJyaYJNi65PV65MxsG1J2JjShGvstU881Px1
	 +fGW9Z4fA6NAa/wkOTTdP6qcu6QlcuFqyR6FsQH+MhU8/4iBwx+r+zyN54ngfsMcz5
	 H8C0pq8syCfZV75wVrLf9A/sMP+aIDfj2XJQ8zqSpJGrqq7Bter1qsQC+gl3WJcKBt
	 Qt6Z+fRFbfIRQ==
Date: Mon, 21 Oct 2024 13:14:13 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-i2c@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write
 lockable page support
Message-ID: <20241021181413.GA816269-robh@kernel.org>
References: <20241017184152.128395-1-marex@denx.de>
 <20241018132754.GA54765-robh@kernel.org>
 <3aa9e2f4-b1ad-46bf-a8c3-0d57cd3a7075@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aa9e2f4-b1ad-46bf-a8c3-0d57cd3a7075@denx.de>

On Sun, Oct 20, 2024 at 06:29:13AM +0200, Marek Vasut wrote:
> On 10/18/24 3:27 PM, Rob Herring wrote:
> > On Thu, Oct 17, 2024 at 08:41:25PM +0200, Marek Vasut wrote:
> > > The ST M24256E behaves as a regular M24C256, except for the E variant
> > > which uses up another I2C address for Additional Write lockable page.
> > > This page is 64 Bytes long and can contain additional data. Add entry
> > > for it, so users can describe that page in DT. Note that users still
> > > have to describe the main M24C256 area separately as that is on separate
> > > I2C address from this page.
> > 
> > I think this should be modelled as 1 node having 2 addresses, not 2
> > nodes.
> We had the exact same discussion regarding M24C32D, see:
> 
> https://lore.kernel.org/all/CAMRc=MdTu1gagX-L4_cHmN9aUCoKhN-b5i7yEeszKSdr+BuROg@mail.gmail.com/

Seems like kernel implementation details dictating the binding to me. 
Won't be a problem until there are shared resources on "both" devices.

I guess since it is inline with what we already have:

Reviewed-by: Rob Herring <robh@kernel.org>


