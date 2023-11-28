Return-Path: <linux-i2c+bounces-487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC57FB1C6
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 07:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 365B0B21150
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 06:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7680011705;
	Tue, 28 Nov 2023 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLrc41qb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F93F4;
	Mon, 27 Nov 2023 22:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701151797; x=1732687797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IRN2FBvfG4UmIrpbn+1fyxG1V+3UWAxbM9pS4wJWHuQ=;
  b=eLrc41qbp10tqwUz3ZtG9iGIx/BXccXTs/3zHT8ngeIiAY2Jp7JN7IIb
   4AV8DyrmyURSmZCogCXtxiOViStvYPCbdlItLRZdVb4PGx7Qlhh5ILqvG
   VS76ndXISMFb9qnrElYvCxiP8QtcEyBWiQYX+nk4j/IZ0+8AoqJy6MOY3
   ndr6Xdcoy2f3EYyEzD7+Pas/mSUkHCbKAy3qpUimvdivAD0KUK5lTvgni
   VU09d9li88i8vJMwXHVJCyjAdVu82D9tRp7WNalXY05IYBUUM/P20wfGp
   aXEvrExOB85FIqKkOBWa3rQQsUbb7eJBtmx+Gaifn0NUsQ6tVQTHmD0BC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377886177"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="377886177"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 22:09:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015815328"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1015815328"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2023 22:09:51 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7rI5-00076p-15;
	Tue, 28 Nov 2023 06:09:49 +0000
Date: Tue, 28 Nov 2023 14:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Roland Hieber <rhi@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Roland Hieber <rhi@pengutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 5/5] ARM: dts: add support for Gossen Metrawatt Profitest
Message-ID: <202311281104.L7nehCxj-lkp@intel.com>
References: <20231127-b4-imx7-var-som-gome-v1-5-f26f88f2d0bc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127-b4-imx7-var-som-gome-v1-5-f26f88f2d0bc@pengutronix.de>

Hi Roland,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Roland-Hieber/dt-bindings-at24-add-ROHM-BR24G04/20231128-051542
base:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
patch link:    https://lore.kernel.org/r/20231127-b4-imx7-var-som-gome-v1-5-f26f88f2d0bc%40pengutronix.de
patch subject: [PATCH 5/5] ARM: dts: add support for Gossen Metrawatt Profitest
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231128/202311281104.L7nehCxj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311281104.L7nehCxj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311281104.L7nehCxj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts:387.1-10 Label or path mipi_dsi not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

