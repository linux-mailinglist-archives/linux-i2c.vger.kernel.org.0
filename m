Return-Path: <linux-i2c+bounces-9950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39FA6A792
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 14:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 151E7188F4F3
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 13:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A7120C01C;
	Thu, 20 Mar 2025 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBG6TVAw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D6D1ADC93
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742477959; cv=none; b=PnbrgtB85oeHJQnXofelcbl9XUAGORxZsmxbX5TW892fQ+tgVRK/qYy/H7yrmgRuVBWUfdXOvNnHcsivyWKXbTaOns9YrxM1h1jhArycqvrjlvXw55FFhV6Kph9KYFYgCYo1c5T2Sco6KTT7jxvPFDONbHrPuqP6PK5hflxLxwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742477959; c=relaxed/simple;
	bh=JXLWlfAP7L3mtpJYl1gbMko7SNkHSQGwMVykuFX+qP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRR13TY+ZSkbZk36E3NUu3W6BnaHY/NPwVNtKu9ueAEyL+8S+LJoZcP0Zy84ZPVn/9vc6N352mZleQpaFI/mYOR9JaxVBGTiTgVhu/BwP2NVdNL4d3dVgQcdI07OHZ/stOPDD+Mr4i0Lfva/N3/wWliXLXZWlAE+bUnSH24A0VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBG6TVAw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E09C4CEDD;
	Thu, 20 Mar 2025 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742477958;
	bh=JXLWlfAP7L3mtpJYl1gbMko7SNkHSQGwMVykuFX+qP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBG6TVAwGyXHIlU+pUU8fD2go+m23crfAOaoPip0+aCgPB5XaEal2o0vbi9ggt8Np
	 YIei96kjjXr1bg+yYf4ZCgeN7+QTHKEwuPRDkWLRydxga1ULtuKGc+111z3PkMiAKA
	 8Sgfj1Hk8Ejn3k0WCHm8X47glhYnT+psEiPc8dP1k+440EHP9ELyMbwYvBw/OFKDdu
	 wcobyDp3ptn52sUdNcCWq4t+B9ZUueaYxFRwhWZfO227KEmt7rtL2VrAroG0VKh8kQ
	 CRve8EBCmT1zVNabVYaLBEmkzmjHYtHsLFDbwvUVlvln4FTNO/p16By3GMMpUKJliS
	 DRcZzNbUDWNYQ==
Date: Thu, 20 Mar 2025 14:39:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>, linux-i2c@vger.kernel.org, 
	syniurge@gmail.com, Raju.Rangoju@amd.com, basavaraj.natikar@amd.com, wsa@kernel.org
Subject: Re: [PATCH -next] i2c: amd-mp2: drop free_irq() of
 devm_request_irq() allocated irq
Message-ID: <che6egtxsygph3naz5gnyblmeesk2oixtcfjyvpjyvfnlicti3@qjqexfj2w7ki>
References: <20221103121146.99836-1-yangyingliang@huawei.com>
 <2mlgmmld4kih7fvt3bv2fzy2mgkbierbmtmzfbdy2cqweu7txh@tosw5go7mksd>
 <301f186b-a558-4242-b2f6-164b56fef56c@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <301f186b-a558-4242-b2f6-164b56fef56c@amd.com>

Hi Shyam,

On Thu, Mar 20, 2025 at 05:12:34PM +0530, Shyam Sundar S K wrote:
> On 3/20/2025 16:46, Andi Shyti wrote:
> > On Thu, Nov 03, 2022 at 08:11:46PM +0800, Yang Yingliang wrote:
> >> irq allocated with devm_request_irq() will be freed in devm_irq_release(),
> >> using free_irq() in ->remove() will causes a dangling pointer, and a
> >> subsequent double free. So remove the free_irq() in the error path and
> >> remove path.
> >>
> >> Fixes: 969864efae78 ("i2c: amd-mp2: use msix/msi if the hardware supports")
> >> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > 
> > No ack from Ellie and Shyam have come for this patch in almost
> > two years. It still applies and it still looks correct to me.
> > 
> > I'm merging it into i2c/i2c-host-fixes in order to have it in
> > time for the tests before the pull requests. If Ellie and/or
> > Shyam will have concerns, we are still in time to take it off.
> > 
> 
> Sorry, I missed this.
> 
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, appreciated! I added your ack.

Andi

