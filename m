Return-Path: <linux-i2c+bounces-4151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E578D9115F3
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 00:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73EAE28212C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 22:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4EA1422D6;
	Thu, 20 Jun 2024 22:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6SAYmsK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBEF8288F;
	Thu, 20 Jun 2024 22:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924076; cv=none; b=YpPlsT+V9jwJq/7OSmpYnmqObyAuLqkKO9nCKlWZyqWniDM2x+r3OwKIJgsPgKp1YfHUZ5VlCl7FFWKn25Fec5KnPdSW+Kr/gn5u3Ki0AyHbTvncrQ73cMonUM+idVu/VV4GgPKldT7RE4vEB6jrpD2FjxTFtTnY2Aaiv7dosbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924076; c=relaxed/simple;
	bh=jXdtOsUhVghD5MmyzdTFIIAxpmkvQ4thmfKjJV9QJ8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P62xlmkOJ+HcTlBpnU/tOHoCStFuLti2Q9nDybzL1eoAHXA04Gk58ehcUU1A8VrUowYH9poQNJLJyW6qACrV3AAFATcbalRrBZ0mhRABwJzId2TlTgVNG+JYcJm9M2XnSR8WGnl9hSBC4SGirFJTSlBGBd24TRYdBZD1KhIZWhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6SAYmsK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718924075; x=1750460075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jXdtOsUhVghD5MmyzdTFIIAxpmkvQ4thmfKjJV9QJ8E=;
  b=B6SAYmsKMQ/fhm3xvIIVob9dJNlafBWkxeVcPKwwZgioXZHoBRkg1hqv
   qpLeux1apJvbFXakzPGY2n49uYIpNX3DpO/7wXoWAjC1VC8Hu8GWQ2+gR
   POWMtBbeQ6wFZ2hv7XRZHNV0ytG81NB0en9hTcQFQakviaNy9r5EL8OM5
   Hf80VJcOja6EUWOnmdkwXSlbxt+alFYNIGVw5EJofsM48dfU3u8v8oco4
   EOlgzLn6R+GzBcsV124X7JQ7sztW24y7t69qFuPK/U5S70zPzXLln1J+N
   8FhZ4UNrAGuYSO77/UbRgz7AtELfab6hR0dK2ho1QVED+XHc7oSlg6Mgq
   Q==;
X-CSE-ConnectionGUID: SULTQFXUTGaAs3d6DIRiiA==
X-CSE-MsgGUID: OFOF19maSx6SBi2u0OHF0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26532781"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="26532781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 15:54:35 -0700
X-CSE-ConnectionGUID: u6Xm1W96SbmkfVZUOfFtOQ==
X-CSE-MsgGUID: icu+aSI0S5aUK8xt6KI6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="79904859"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2024 15:54:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKQfk-00080g-15;
	Thu, 20 Jun 2024 22:54:28 +0000
Date: Fri, 21 Jun 2024 06:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: carlos.song@nxp.com, aisheng.dong@nxp.com, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: oe-kbuild-all@lists.linux.dev, carlos.song@nxp.com, frank.li@nxp.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [Patch V3] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Message-ID: <202406210604.bil4fzu2-lkp@intel.com>
References: <20240614045616.1751784-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614045616.1751784-1-carlos.song@nxp.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.10-rc4 next-20240620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/carlos-song-nxp-com/i2c-imx-lpi2c-add-eDMA-mode-support-for-LPI2C/20240614-125044
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240614045616.1751784-1-carlos.song%40nxp.com
patch subject: [Patch V3] i2c: imx-lpi2c: add eDMA mode support for LPI2C
config: loongarch-randconfig-r071-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210604.bil4fzu2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210604.bil4fzu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210604.bil4fzu2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx-lpi2c.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

