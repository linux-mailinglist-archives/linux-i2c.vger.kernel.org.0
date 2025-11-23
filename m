Return-Path: <linux-i2c+bounces-14238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81410C7E073
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Nov 2025 12:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D7A3A198E
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Nov 2025 11:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD632C0262;
	Sun, 23 Nov 2025 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nG5TvK5H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95E84A35;
	Sun, 23 Nov 2025 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898392; cv=none; b=h+/79aRtVp1irJ3JvXRJ4hQZC9xkWRSNGamp19gFqaTBVgAYnbkCnWE7KoTgHMXFYJvF1XQBjyvmdleGukKMBjhRdfAKEzEHwBH4TSkaYVlYqvdnk3bitUdMTimfVzjlH5MUxzO98rCGm+BbJO7DOb6XsumWEiDird3AXkjSUUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898392; c=relaxed/simple;
	bh=J8EAdss3jxQXAxIWg06xtlDcArhBsRUopUAmrzE9AmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maq9kmzahK/UXBpKwwB02oepQHhnrtr1oe3Rfw4jjG1vUeuNpZzUIibm+00HU+VGBGieAyHEGtaqSU2KQcPqrd+nOU9O5zh2VrljtBjvpJtPh/YxvhcEfb1MeiHxnGyFHwwV/d/kxNWGS22M66rLQ/LNBB9duRUvDPswfv03t/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nG5TvK5H; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763898391; x=1795434391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J8EAdss3jxQXAxIWg06xtlDcArhBsRUopUAmrzE9AmU=;
  b=nG5TvK5Hyrys9ix4lq3D9iaXwBUaX+iZd+KWV99ur0Z3hJtvkGCbzI0l
   tJoeJ9QY1qhcVQNnwQG9tpNXxhGnAqrJP4lsm2BHH+DKFBx4g/wgl0tak
   d2yq1hr7IU/5zqarLaB1shvfd7MrPqb8Ne1zMDwiii2r5OD3ED74tjgIh
   feTrXrXVmFdX8aRkXZFUYffDaeVyaFHQhp9QD4ZFHoKBLwFY2zWKm/Ows
   fBf3nw5rTH1kX9U7LKtJWngGtGSo5+IdkTSQWXDH7n5qJxs14Ad35e6LU
   6jIqEYBas/n/clNQBsuT638oY+J0URFaavD11hzAo/4qk6es1JYCelVAC
   A==;
X-CSE-ConnectionGUID: 09KtdHytTNiU+QdH+3cOWw==
X-CSE-MsgGUID: 6RwOxXxKTwiqA/zHhWxjlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65964953"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="65964953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 03:46:30 -0800
X-CSE-ConnectionGUID: O7O16Z4qQTWuW6kIf+wemg==
X-CSE-MsgGUID: IBDF6bbkTd2shJNsWffjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="196252991"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Nov 2025 03:46:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN8Xv-0008FT-09;
	Sun, 23 Nov 2025 11:46:23 +0000
Date: Sun, 23 Nov 2025 19:46:10 +0800
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
	quic_shazhuss@quicinc.com
Subject: Re: [PATCH v1 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
Message-ID: <202511231944.MieDLdu8-lkp@intel.com>
References: <20251122050018.283669-13-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-13-praveen.talari@oss.qualcomm.com>

Hi Praveen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d724c6f85e80a23ed46b7ebc6e38b527c09d64f5]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Talari/soc-qcom-geni-se-Refactor-geni_icc_get-and-make-qup-memory-ICC-path-optional/20251122-130449
base:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
patch link:    https://lore.kernel.org/r/20251122050018.283669-13-praveen.talari%40oss.qualcomm.com
patch subject: [PATCH v1 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
config: loongarch-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231944.MieDLdu8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231944.MieDLdu8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231944.MieDLdu8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-qcom-geni.c:1176:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1176 |         if (gi2c->dev_data->power_state) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:1185:9: note: uninitialized use occurs here
    1185 |         return ret;
         |                ^~~
   drivers/i2c/busses/i2c-qcom-geni.c:1176:2: note: remove the 'if' if its condition is always true
    1176 |         if (gi2c->dev_data->power_state) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:1171:9: note: initialize the variable 'ret' to silence this warning
    1171 |         int ret;
         |                ^
         |                 = 0
   drivers/i2c/busses/i2c-qcom-geni.c:1193:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1193 |         if (gi2c->dev_data->power_state) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:1202:9: note: uninitialized use occurs here
    1202 |         return ret;
         |                ^~~
   drivers/i2c/busses/i2c-qcom-geni.c:1193:2: note: remove the 'if' if its condition is always true
    1193 |         if (gi2c->dev_data->power_state) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:1190:9: note: initialize the variable 'ret' to silence this warning
    1190 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +1176 drivers/i2c/busses/i2c-qcom-geni.c

  1168	
  1169	static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
  1170	{
  1171		int ret;
  1172		struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
  1173	
  1174		disable_irq(gi2c->irq);
  1175	
> 1176		if (gi2c->dev_data->power_state) {
  1177			ret = gi2c->dev_data->power_state(&gi2c->se, false);
  1178			if (ret) {
  1179				enable_irq(gi2c->irq);
  1180				return ret;
  1181			}
  1182		}
  1183	
  1184		gi2c->suspended = 1;
  1185		return ret;
  1186	}
  1187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

