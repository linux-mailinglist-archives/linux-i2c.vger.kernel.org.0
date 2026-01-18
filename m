Return-Path: <linux-i2c+bounces-15258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C597D3954C
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 14:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2101E301E199
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 13:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65702331202;
	Sun, 18 Jan 2026 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H44YP80d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DB32ED40;
	Sun, 18 Jan 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768742945; cv=none; b=FiBveQedFpabRVVjo0z6kF9CzgSIMmR8GrAtCQzg9hdg5koJ+pauTk+3ZExQLpo7eq2rTSFPia6Kyvpw4XaiW2q8otgF2YG+pXdM3QaHBcGKoIoF+OySPag4WxnmrcL4DSP8/MQUXWu/4fzZ9iDZnFuDQpl6lh0L70nYi6oKGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768742945; c=relaxed/simple;
	bh=e7fwkEkvRZA+e1UcnvOlHV1EjWnkRjPkDqZNfuYPU0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/xSijw6PqrDnZs5RlvNM3x78AGH/Df78El2aHMnnEub1xJdPMRTzEJjIGhdpCtsVxVF6bGPsabUz1JMi+Z8EPgHCQIjrNcuT72xioGpQYS3dPiMveeqk84ujsn6C8jS66XuovxlXO4h5gn9peK3ep6qKVxttmf02/DfBfc9Zoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H44YP80d; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768742941; x=1800278941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e7fwkEkvRZA+e1UcnvOlHV1EjWnkRjPkDqZNfuYPU0E=;
  b=H44YP80dqz/g1SJQ3tvdKARg0YrslSSWPdMs58FxARykjrmElkDhncKx
   gCCWjYn2SRELATZKe7I8pM2IZGALxIGbDYO8VvgnU+j2lmn2X2lBeXBvd
   tZdl13FFycwp/1y82wuIcrOe9q/DzHqmhSMhThcCfBRwDH2cHGyvnxO8e
   Gz3hLkq7DS7heZWDRhxQ2aEttAZjnMAw5gmAmEF/GRScv7rTLC0XBm6ws
   JYvQfT7H27iZ/drUz6biTtBeCDrqzz9GGA8ipmdQdQ8gff3Rp0aD+vMas
   gUhO88HCkkyjKfI8FQdJ4minMF3YmgmdtxSG+NKOQDg9qk7qk1bXKZFjQ
   A==;
X-CSE-ConnectionGUID: /rQEoS5jSzGZMvB+TUOL7Q==
X-CSE-MsgGUID: EjgMmhZlTrSkOsr/NGWaug==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80614377"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="80614377"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 05:29:00 -0800
X-CSE-ConnectionGUID: YvUFySQ8SbaNrK3OxdOYww==
X-CSE-MsgGUID: sQO3EhDTQDePjuW+f0Jb7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="210506492"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jan 2026 05:28:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhSpn-00000000MyS-3TGd;
	Sun, 18 Jan 2026 13:28:51 +0000
Date: Sun, 18 Jan 2026 21:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/7] mux: Add helper functions for getting optional
 and selected mux-state
Message-ID: <202601182117.l2nFZ5OB-lkp@intel.com>
References: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-can-transceiver-rename-temporary-helper-function-to-avoid-conflict/20260118-183905
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260118-rz-sdio-mux-v5-2-3c37e8872683%40solid-run.com
patch subject: [PATCH v5 2/7] mux: Add helper functions for getting optional and selected mux-state
config: um-randconfig-r071-20260118 (https://download.01.org/0day-ci/archive/20260118/202601182117.l2nFZ5OB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182117.l2nFZ5OB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182117.l2nFZ5OB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/core.c:774:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     774 |         if (IS_ERR_OR_NULL(mstate))
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/core.c:793:17: note: uninitialized use occurs here
     793 |         return ERR_PTR(ret);
         |                        ^~~
   drivers/mux/core.c:774:2: note: remove the 'if' if its condition is always false
     774 |         if (IS_ERR_OR_NULL(mstate))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     775 |                 goto err_mux_state_get;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/core.c:767:9: note: initialize the variable 'ret' to silence this warning
     767 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +774 drivers/mux/core.c

   748	
   749	/**
   750	 * __devm_mux_state_get() - Get the optional mux-state for a device,
   751	 *			    with resource management.
   752	 * @dev: The device that needs a mux-state.
   753	 * @mux_name: The name identifying the mux-state.
   754	 * @optional: Whether to return NULL and silence errors when mux doesn't exist.
   755	 * @init: Optional function pointer for mux-state object initialisation.
   756	 * @exit: Optional function pointer for mux-state object cleanup on release.
   757	 *
   758	 * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
   759	 */
   760	static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
   761						      bool optional,
   762						      int (*init)(struct mux_state *mstate),
   763						      int (*exit)(struct mux_state *mstate))
   764	{
   765		struct devm_mux_state_state *devm_state;
   766		struct mux_state *mstate;
   767		int ret;
   768	
   769		devm_state = devres_alloc(devm_mux_state_release, sizeof(*devm_state), GFP_KERNEL);
   770		if (!devm_state)
   771			return ERR_PTR(-ENOMEM);
   772	
   773		mstate = mux_state_get(dev, mux_name, optional);
 > 774		if (IS_ERR_OR_NULL(mstate))
   775			goto err_mux_state_get;
   776	
   777		if (init) {
   778			ret = init(mstate);
   779			if (ret)
   780				goto err_mux_state_init;
   781		}
   782	
   783		devm_state->mstate = mstate;
   784		devm_state->exit = exit;
   785		devres_add(dev, devm_state);
   786	
   787		return mstate;
   788	
   789	err_mux_state_init:
   790		mux_state_put(mstate);
   791	err_mux_state_get:
   792		devres_free(devm_state);
   793		return ERR_PTR(ret);
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

