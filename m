Return-Path: <linux-i2c+bounces-14887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F797CEC0FD
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Dec 2025 15:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98F4930184CE
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Dec 2025 14:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A5622655B;
	Wed, 31 Dec 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+EmtpG4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A21F30A9;
	Wed, 31 Dec 2025 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767189831; cv=none; b=gCCSon1NVv1Hwu31N25ss/ON2ZfH8Vnkvhl9KQK93DdaPreLPvNd8rsWwPWwQ/0Apgb4HUr2/HClIBL2S1be+gDLYtb5MTz/n/mzZXeVEBsYkWWYcd79FDdGYYM2Iz91m7ej+aTcKBzGbwjMZWvZ/GgMjkwMmE36CvBdTbH/5gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767189831; c=relaxed/simple;
	bh=jnQkKIwZDjNBxeL34AvoYX5R4WnuoCfY/GJg3yFjgSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eq/tW0MuQ7ZzijCPD4n9SP4OtQwHGM1VSGzi9jWDk2d+kxzw+CoeHtdFWJwGDJWOGDPPZ+WKliD1psIC50iIH5RzFiem8kPWEnqQPMKCRKVoUctHPNAgjr34J/dA536IFxYF7HqczbbqqXRxE/Ki9zZtm+vjgioitr5C3yx0FSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+EmtpG4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767189830; x=1798725830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jnQkKIwZDjNBxeL34AvoYX5R4WnuoCfY/GJg3yFjgSU=;
  b=O+EmtpG4FLstPlAZAFSzefPdf/qYA+PY4hMoFR2In5TLze1ypMJd/nme
   UBxTvREKfaZovcXyiV/6ak0Q9evupphY4XWfjhaAovQlTFaaNYFQ3xtJr
   dbkiOfdeXq2/zneJsyN9d/wcpmVjn5A5Uhp7OWYIjkyXIcAqpWitMhDa7
   xygKTKlbqJAOBaNCPIlWMwiWZuYQ6CXZ97406WbWKH1azvvgAP6B48+Tn
   Ars24cHbgwF9/rzIwCkShUzk9nk2vk4AQbAcWYK3UwEso+XiU8JhnhDJU
   N4LZBxIJWp0Ly/Gn7/1TqGwSHkp0hnWvclEA6/tv59R2gAC9QUmbqrc5O
   Q==;
X-CSE-ConnectionGUID: UL/L04u2TZCh3OsRasyGQA==
X-CSE-MsgGUID: F81pJKseRimLcyLnTo9r6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67953861"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="67953861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 06:03:49 -0800
X-CSE-ConnectionGUID: GuICIzfFQ+yDY2FNoo17mA==
X-CSE-MsgGUID: UyFiTYE1SQuD+s9ZfbKLrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="232524686"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Dec 2025 06:03:43 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vawnc-000000001Fl-1Dt3;
	Wed, 31 Dec 2025 14:03:40 +0000
Date: Wed, 31 Dec 2025 22:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org, bryan.odonoghue@linaro.org,
	jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
	quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v2 10/12] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
Message-ID: <202512311900.mG1XHHI2-lkp@intel.com>
References: <20251229045446.3227667-11-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229045446.3227667-11-praveen.talari@oss.qualcomm.com>

Hi Praveen,

kernel test robot noticed the following build errors:

[auto build test ERROR on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Talari/soc-qcom-geni-se-Refactor-geni_icc_get-and-make-qup-memory-ICC-path-optional/20251229-130932
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251229045446.3227667-11-praveen.talari%40oss.qualcomm.com
patch subject: [PATCH v2 10/12] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251231/202512311900.mG1XHHI2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311900.mG1XHHI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311900.mG1XHHI2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "geni_se_resources_deactivate" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
>> ERROR: modpost: "geni_se_resources_activate" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

