Return-Path: <linux-i2c+bounces-2379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F987E536
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 09:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6468D1F2110B
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 08:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9622E28DA6;
	Mon, 18 Mar 2024 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUGNI7Ia"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA12C850
	for <linux-i2c@vger.kernel.org>; Mon, 18 Mar 2024 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751730; cv=none; b=F4nwQIeufvpanUGoG5RRKlSSjG36W0819SrL/gdNgwJrelcOieh5D+MvQ8sEm7TFhQNoMLZ1mOTVvkcq2iz8DZMBNeprcfhoIkrGRYjC2fVD06HCX4vlZn1IX3nCmKQEgTalYfGDUImsFCHkTPlnpnCRKM466CS8Lqpi36jS5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751730; c=relaxed/simple;
	bh=I6WE5uFJfI+mF0O/SMophwAGd+9TPPO7sZFDngDujI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqIMA9ZgKCpZJvCAPQLdT7PBMZiiaXJxK+CJUmpE31g9Jn7GARArQmzDN9J4Bbr/INaOoR/CDvxIzuqf6kEINSF0mnJ65uIaxSKY6S7HBPCniI+1yxwAyufqBeuDzIREU7NgmYhJJQSu9C3EuM363XCymwarrDk6SuubizbHPls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUGNI7Ia; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710751728; x=1742287728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I6WE5uFJfI+mF0O/SMophwAGd+9TPPO7sZFDngDujI0=;
  b=nUGNI7Iacxr1e032bYlhyWrfJ3OhjdojlZjMWX+LcogGSurdqLp2hCK8
   Mi6GLU/DtnRjgF3o1iygWbONDht87SQHLuDfefgAk88vJgSi8Bo/wLq0e
   oYFycHoEhcQfeJJbBlY028jy95wXDjFhrq6qCklzyIVI2x5do4AKapb/z
   1lCZY5JAcnrZpFOUDP6O1C5Lk9XOF+i5ZNuMN6S8usFrAkKeUc8iGHYNT
   OtULw30pr4gQ80+sZCNQlrbCq5jz/Gc5YJawIOtKrb3WfbCQpxmvb+fcg
   MjI3MOk3l7udFEZPpw0ZXvXvFfL8RCFqRb5Ffdps+tLRz3BSyzYAgvGd/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16100094"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="16100094"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 01:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937059982"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937059982"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2024 01:48:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 539B2192; Mon, 18 Mar 2024 10:48:45 +0200 (EET)
Date: Mon, 18 Mar 2024 10:48:45 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Youwan Wang <youwan@nfschina.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Add msgs is NULL check
Message-ID: <20240318084845.GO112498@black.fi.intel.com>
References: <20240318082446.459759-1-youwan@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318082446.459759-1-youwan@nfschina.com>

Hi,

On Mon, Mar 18, 2024 at 04:24:46PM +0800, Youwan Wang wrote:
> fix crash because of null pointers
> 
> [  190.538113] kernel NULL pointer dereference at virtual address 0000000000000000
> [  190.538115] Mem abort info:
> [  190.538116]   ESR = 0x96000004
> [  190.538118]   Exception class = DABT (current EL), IL = 32 bits
> [  190.538119]   SET = 0, FnV = 0
> [  190.538120]   EA = 0, S1PTW = 0
> [  190.538121] Data abort info:
> [  190.538122]   ISV = 0, ISS = 0x00000004
> [  190.538123]   CM = 0, WnR = 0
> [  190.538125] user pgtable: 4k pages, 48-bit VAs, pgdp = 00000000cf937cf2
> [  190.538126] [0000000000000000] pgd=0000000000000000
> [  190.538129] Internal error: Oops: 96000004 [#1] SMP
> [  190.538172] Process swapper/0 (pid: 0, stack limit = 0x000000000179ba77)
> [  190.538175] CPU: 0 PID: 0 Comm: swapper/0 Kdump: loaded Tainted: G
> [  190.538178] pstate: 40000085 (nZcv daIf -PAN -UAO)
> [  190.538183] pc : i2c_dw_isr+0x2e4/0x614 [i2c_designware_core]
> [  190.538185] lr : i2c_dw_isr+0x9c/0x614 [i2c_designware_core]
> [  190.538186] sp : ffff000008003e40
> [  190.538187] x29: ffff000008003e40 x28: ffffd9cfad997200
> [  190.538189] x27: ffff5f18a4f2c018 x26: 0000000000000000
> [  190.538191] x25: ffff5f18a52d9fe8 x24: 0000000000000010
> [  190.538193] x23: 0000000000000000 x22: 0000000000000000
> [  190.538194] x21: 0000000000000510 x20: 0000000000000000
> [  190.538196] x19: ffffd9cfa08d6080 x18: 00000000fffffffe
> [  190.538197] x17: 0000000000000000 x16: 0000000000000000
> [  190.538199] x15: 0000000000000000 x14: 0000000000000000
> [  190.538200] x13: 0000000000000000 x12: 000000000000028d
> [  190.538202] x11: 0000000000000040 x10: ffff5f18a52fe340
> [  190.538203] x9 : ffffd9cfaf4a28f0 x8 : 0000000000000000
> [  190.538205] x7 : ffffd9cfaf401b88 x6 : ffffd9cfaf401b60
> [  190.538206] x5 : 0000000000000000 x4 : 0000000000000000
> [  190.538208] x3 : 0000000000000000 x2 : ffff000008125000
> [  190.538209] x1 : 0000000000000000 x0 : 0000000000000000
> [  190.538211] Call trace:
> [  190.538213]  i2c_dw_isr+0x2e4/0x614 [i2c_designware_core]
> [  190.538218]  __handle_irq_event_percpu+0x68/0x230
> [  190.538219]  handle_irq_event+0x6c/0x130
> [  190.538222]  handle_fasteoi_irq+0xc0/0x220
> [  190.538223]  __handle_domain_irq+0x80/0xe0
> [  190.538226]  gic_handle_irq+0x84/0x188
> [  190.538227]  el1_irq+0xb0/0x140
> [  190.538229]  arch_cpu_idle+0x38/0x1c0
> [  190.538232]  do_idle+0x238/0x2a4
> [  190.538234]  cpu_startup_entry+0x2c/0x50
> [  190.538237]  rest_init+0xbc/0xc8
> [  190.538240]  start_kernel+0x4a8/0x4dc
> [  190.538242] Code: 937c7c80 b940727a 8b0002c1 f9403e77 (78606ac0)
> [  190.538248] SMP: stopping secondary CPUs
> [  190.538400] Starting crashdump kernel...
> [  190.538406] Bye!
> 
> Signed-off-by: Youwan Wang <youwan@nfschina.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index ca1035e010c7..849e8a3e85ed 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -429,12 +429,17 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  	struct i2c_msg *msgs = dev->msgs;
>  	u32 intr_mask;
>  	int tx_limit, rx_limit;
> -	u32 addr = msgs[dev->msg_write_idx].addr;
> +	u32 addr;
>  	u32 buf_len = dev->tx_buf_len;
>  	u8 *buf = dev->tx_buf;
>  	bool need_restart = false;
>  	unsigned int flr;
>  
> +	if (WARN_ON(!msgs))
> +		return;

Instead of treating the symptom, I suggest figuring out why this happens
in the first place. If the controller interrupt is enabled and triggered
it is expected that there is some transfer going on and dev->msgs !=
NULL.

