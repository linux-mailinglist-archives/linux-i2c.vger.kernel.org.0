Return-Path: <linux-i2c+bounces-6777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E7F979EF7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189C1283F03
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7D314BF92;
	Mon, 16 Sep 2024 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+0KzIPN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0383E41C62;
	Mon, 16 Sep 2024 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726481439; cv=none; b=QmSZT2srw4ont9ARpL34tbpipb4efk29Jo6qiKWFCo7MmyQGMSafD9lPfyXqhWVXc5xpu3C0+jAu6LfTDWEVhyRc+zRN00Oeovqt/CUCCn4X3YJb34Gz6lfhdF67QNPDrQqMwK19LZtBcX7IEVr1YoSCJ+3jJkPEeUKRYYSZ8aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726481439; c=relaxed/simple;
	bh=LI7wZuh42fAwju0tPspJd7QzbD5no/IBHZKeuX8sJGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYIuYf2zx10wETXxQcyKSctpKihDcA1vRssnl1IroBb5jsg4Oy6fqTm32+u2DTWqxy+xPFz2LBFBYRhLN0fbYOs+AYZUmm1lb8k8PpOlh8l5R1jxcKx+q9q1nNPrbDbslZ9VzVW9xtpuhBzQYecBbgKMtCNAeH5ZW01oA0JZYwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+0KzIPN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EC6C4CEC4;
	Mon, 16 Sep 2024 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726481438;
	bh=LI7wZuh42fAwju0tPspJd7QzbD5no/IBHZKeuX8sJGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+0KzIPNMFWWT42nmOAxkuJsfva0INihi25v2TlJnUqFmX5Y6A0MS6txJL08ZH7Ac
	 FlqGKeLhKG0v046i9TH30NMiFReg1OhAK6y6z0JwKMByYkKpv7Rs+Dbp1RViWQvJfo
	 8aQuClQxbBbOOYjvVZwABKqbKjWw7dKLt/nw6JogY4r5NBu0cWcvZIL5ipQEee7Nsp
	 R5Lf+9tGGqBqhiPv4XCGE6TVpQYwD0LdMjkQcfdWldK5yKJjnVtzMvbfHg2F/+BXze
	 TgwFLqbOvnk4RY0bDik3KiW/c6l3S950iGvACCs1QkC7gwVy/JYCiNPC6IgdU+vBO8
	 zCx9K/xYCRJcA==
Date: Mon, 16 Sep 2024 12:10:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <leoyop42s4qmaytvwhwhpgfwfrkpm2xxabskz645r337jdjfml@zg5ql73tqidk>
References: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
 <202409141436.QFCDQrRF-lkp@intel.com>
 <Zuf1UJ6K_8hL5x5U@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zuf1UJ6K_8hL5x5U@smile.fi.intel.com>

Hi Andy,

On Mon, Sep 16, 2024 at 12:07:28PM GMT, Andy Shevchenko wrote:
> On Sat, Sep 14, 2024 at 02:56:19PM +0800, kernel test robot wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on andi-shyti/i2c/i2c-host]
> > [also build test WARNING on linus/master v6.11-rc7]
> > [cannot apply to next-20240913]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-isch-Add-missed-else/20240912-002224
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> > patch link:    https://lore.kernel.org/r/20240911154820.2846187-5-andriy.shevchenko%40linux.intel.com
> > patch subject: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
> > config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 13.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141436.QFCDQrRF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409141436.QFCDQrRF-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/i2c/busses/i2c-isch.c: In function 'smbus_sch_probe':
> > >> drivers/i2c/busses/i2c-isch.c:296:42: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
> >      296 |                 "SMBus SCH adapter at %04x", res->start);
> >          |                                       ~~~^   ~~~~~~~~~~
> >          |                                          |      |
> >          |                                          |      resource_size_t {aka long long unsigned int}
> >          |                                          unsigned int
> >          |                                       %04llx
> 
> Yeah, this should be something like %pa, but the problem with that that it
> always uses the same, fixed-width format with a prefix. We don't want this. But
> to make sure we have proper specifier we need to introduce a temporary variable
> and assign the resource start address to it and then use that variable in here.
> I'll update this in v2 and send it after we have v6.12-rc1 is out.

Feel free to send it, I will apply it in i2c/i2c-host-for-6.12,
that's where I'm collecting the next patches.

Andi

