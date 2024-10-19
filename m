Return-Path: <linux-i2c+bounces-7481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2549A4B10
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Oct 2024 05:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DD3F2841F5
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Oct 2024 03:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E8D1D2F62;
	Sat, 19 Oct 2024 03:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+9WOhEF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC041D0E34;
	Sat, 19 Oct 2024 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729307607; cv=none; b=VyWKeJT1UPirMnzEPP6ytvOjSWgZl7blCo2ZL9AfJ7PtvzlDA03DisunEp00CV2c8PFgHhYazsYkWrcJ8LtEC991rpnc7xfxZ8ONzPwMhny2NT0dHhr+fkgRhUligAqgyh4BamLDlcvPnHULqbT6LzTtDYqlntM8J0CIfyQtf38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729307607; c=relaxed/simple;
	bh=Nw3ZARuhUlLWhZ7CyTkiVyEjbUt6Fu7cg8I9r+R5VI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjZvrRXt2n2csO6AxOesSQafKhNhah8KizF9R3nYXq0qynt6pC3AtnlU1H7DDc/xiYmmXWlX8O11WqyVtoArskonC9HG3qPds2BF0OfD2/gkfqBmMCTi+JZFX2HoKiv5xsbD4KUUtC3Z40GTVHeO5slHGNW8LW5H7AEwrpqZ6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+9WOhEF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729307605; x=1760843605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nw3ZARuhUlLWhZ7CyTkiVyEjbUt6Fu7cg8I9r+R5VI0=;
  b=F+9WOhEF7JE9AptVUqGeoy2WJoM9Q/E2EhdyalWYxePsRv7dNNPolg9M
   1U/PwD0i1pJJnei2+xUkEw1r9xZYU3BC5UgCe+/f9KKhuH8VqmdhakC2q
   d/xLxhUgNcGecKdQh0nrocodg3MV7jLiv6dkThj4aokvfefAKwpu/vcVe
   xi64ciM0DwckAeBFqjjjuIsJH5WUjmm0Mqik76xHqp+r0hdIdB7y24gsK
   3kxFpJOH/ZyMwhUsJe/pzvQqTIbVWd5gUlbisPVG4ZmJCszwSVLIEXc37
   aQZDiPBL7lr4q8hJo0IpT8m+Xzx2uxmq0Fvg/YS9trGRlHPsY552XYVev
   g==;
X-CSE-ConnectionGUID: 9/gI0+d8QACzS423nS358Q==
X-CSE-MsgGUID: 491QVfXdSIuklZhhNPT6iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39407541"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39407541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 20:13:25 -0700
X-CSE-ConnectionGUID: zU/2lXNsSzONR+XlL9WhmA==
X-CSE-MsgGUID: Qo61ij+pQxybXMvAQ6hbMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="83827604"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Oct 2024 20:13:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1zu1-000Ode-1s;
	Sat, 19 Oct 2024 03:13:17 +0000
Date: Sat, 19 Oct 2024 11:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <202410191055.bi1pWTAY-lkp@intel.com>
References: <20241015120750.21217-6-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015120750.21217-6-quic_jseerapu@quicinc.com>

Hi Jyothi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 55bcd2e0d04c1171d382badef1def1fd04ef66c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Jyothi-Kumar-Seerapu/dt-bindings-dmaengine-qcom-gpi-Add-additional-arg-to-dma-cell-property/20241015-202637
base:   55bcd2e0d04c1171d382badef1def1fd04ef66c5
patch link:    https://lore.kernel.org/r/20241015120750.21217-6-quic_jseerapu%40quicinc.com
patch subject: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241019/202410191055.bi1pWTAY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191055.bi1pWTAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191055.bi1pWTAY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

