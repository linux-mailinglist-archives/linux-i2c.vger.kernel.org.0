Return-Path: <linux-i2c+bounces-1400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8585835E6C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 10:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6B1286E4F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 09:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4763139FD4;
	Mon, 22 Jan 2024 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PM50PtRT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAF639FCB;
	Mon, 22 Jan 2024 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705916668; cv=none; b=tikItKhOrEjRExjlLJvqxLJMQi3yvgbK4kmrATWAeM3lu11iW2R0HNn2YOs93cI8VmvfoUX3oJwLqdhCrQyx250dBgnCff2mH7DpornY/FITI4NUGt4VL/MtwlQtjTGGOSaD+T3/R1388o3Gzxwv5WeQKArTxM48EDmg9AtHq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705916668; c=relaxed/simple;
	bh=Ohr+Vouf7XGi+Wqm8IrXkgBSGkSJpYLg67JTzZnLkyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNwz2kQ+BL8v88908ohC2+WKeH47as2Ehp+9L6zVjgf75mfMZad8L2hKKYLcGt4tlvGoASis1ZzJmBBiX55xKGG5pHlgQ4KHdtnKr0I2fokfywLlhycLOxrfXEdiWyC1/7YXTEWyRJ+oDEjAF8si36SsTTh3Fy5giFn+45Exp7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PM50PtRT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705916666; x=1737452666;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ohr+Vouf7XGi+Wqm8IrXkgBSGkSJpYLg67JTzZnLkyU=;
  b=PM50PtRT34bEtk0pAGfX9w0ZzKlg1YfH0JDTAPmk9EvTRhVztXLfGbQf
   8LoN8A+oaOXQZlFXVqAgjFfII33qcK4hcnIMi651egFUElgfqCcFLkGl6
   mLdlxJ+nLsgnVMNw7Idvz3TLnQLYUIFCZMI7HuesqWSodGuat4OgWyWo5
   zlyiQkkH8OA9ZJ2QA4r/frk9PDsNMB1L1UYDnH3kLkb6jwlMgoN3ptoqa
   yp5wW5+7qJPpCvUNQR0nikIw82I0AC1L/dvkNR440gJv987oEMeiTRxLD
   67A3ay5W6FEH/S0QMonsIrjfjcP052qNs46hEoVjdnWYRTTBa9dREBka1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7907987"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7907987"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904795273"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904795273"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2024 01:44:23 -0800
Message-ID: <2caa903b-e5a6-499c-84ea-b8f85e4d1c71@linux.intel.com>
Date: Mon, 22 Jan 2024 11:44:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] i2c: designware: constify regmap_config
To: Raag Jadav <raag.jadav@intel.com>, mika.westerberg@linux.intel.com,
 andriy.shevchenko@linux.intel.com, jsd@semihalf.com, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240122033108.31053-1-raag.jadav@intel.com>
 <20240122033108.31053-2-raag.jadav@intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240122033108.31053-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/24 05:31, Raag Jadav wrote:
> We never modify regmap_config, mark it as const.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Both:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

