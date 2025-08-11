Return-Path: <linux-i2c+bounces-12253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D6B21682
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 22:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD541A22F2D
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 20:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0203D2DA75A;
	Mon, 11 Aug 2025 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsnITh2E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B28A2139CE;
	Mon, 11 Aug 2025 20:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944293; cv=none; b=f9WXyk00/y53ZNqSW/OR6X3txtKodzB1z/otWR3GfQglaLZINT0khJOmIYW6GoMQtADdhUBIL1WqoyUdm7PQwRHcgoe59IXw0zUyuQO49jkHjMQsdzUtrPkHJwiEQglp/O2fubapZgsF33t6kXSpshfDin78euGXXBdsL2glBvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944293; c=relaxed/simple;
	bh=WAVSplizknoBUN8PWM1qGthGcY9wzNFmieVn3H5fMP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0WiEI+jmjhg8zwUTBFQA2j8Kv3w1CGWUtU6iHG5eIymGkfXIEtudmtKuZkrP6Qp0hR2JbTSmxyVpRvCt/+2Scq/C7/CGOP8QoGL+i9fYhZOwbgpcnvpHjaO1nQg55iH4Sw7jeCgqiPz48cU2zrHA6LV344jL5fc+PMdEhe/N7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsnITh2E; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754944293; x=1786480293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAVSplizknoBUN8PWM1qGthGcY9wzNFmieVn3H5fMP0=;
  b=OsnITh2E0T2DgCVT/NjBiWhfGHRbkq0xIn3zuoeODO0lMz1JC7adi90w
   xFcX0thARYr/krpQXFm+cLuKkaDhD02Rh6tDPBVP7YBbqC67P0zO9k2Mz
   81z0vzyIlOTUwV77XZy9nvayuLzWrkCDSWYeKNHnTzrAzd28UKPtx09WF
   A1I4BXZw98akrGIQX0iMk38CnlwBOdXQuIebaInM6v3GkQOJScyOQHX5/
   afsQWEJ1y38iwl9fQlSuPPNxDX4V5sDEmIzVPVP4RyqGEZiCMVfqplH81
   RPNX0wl2oe9f/GLTI5V4piKZRiwTutvjqkQQQ2GkOQpOou4yfZ9rH2m3O
   Q==;
X-CSE-ConnectionGUID: lH2QPxT8SMWvXqNmK2UCvw==
X-CSE-MsgGUID: mS9Wlj7BS0aGzK/kkl4tsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57353668"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57353668"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:31:32 -0700
X-CSE-ConnectionGUID: HY3ftl14RnWPgtKSiQRgoA==
X-CSE-MsgGUID: hkJYL8CmRfelQVDTPhceDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170452077"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:31:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulZAy-000000056h0-1aOL;
	Mon, 11 Aug 2025 23:31:24 +0300
Date: Mon, 11 Aug 2025 23:31:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
Message-ID: <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 09:49:57PM +0200, Gabor Juhos wrote:
> Under some circumstances I2C recovery fails on Armada 3700. At least
> on the Methode uDPU board, removing and replugging an SFP module fails
> often, like this:
> 
>   [   36.953127] sfp sfp-eth1: module removed
>   [   38.468549] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>   [   38.486960] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
>   [   38.496867] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
>   [   38.521448] hwmon hwmon2: temp1_input not attached to any thermal zone
>   [   39.249196] sfp sfp-eth1: module removed
>   ...
>   [  292.568799] sfp sfp-eth1: please wait, module slow to respond
>   ...
>   [  625.208814] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
> 
> Note that the 'unsupported SFP module' messages are not relevant. The
> module is used only for testing the I2C recovery funcionality, because
> the error can be triggered easily with this specific one.
> 
> Enabling debug in the i2c-pxa driver reveals the following:
> 
>   [   82.034678] sfp sfp-eth1: module removed
>   [   90.008654] i2c i2c-1: slave_0x50 error: timeout with active message
>   [   90.015112] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>   [   90.020464] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
>   [   90.027906] i2c i2c-1: log:
>   [   90.030787]
> 
> This continues until the retries are exhausted ...
> 
>   [  110.192489] i2c i2c-1: slave_0x50 error: exhausted retries
>   [  110.198012] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>   [  110.203323] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
>   [  110.210810] i2c i2c-1: log:
>   [  110.213633]
> 
> ... then the whole sequence starts again ...
> 
>   [  115.368641] i2c i2c-1: slave_0x50 error: timeout with active message
> 
> ... while finally the SFP core gives up:
> 
>   [  671.975258] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
> 
> When we analyze the log, it can be seen that bit 1 and 11 is set in the
> ISR (Interface Status Register). Bit 1 indicates the ACK/NACK status, but
> the purpose of bit 11 is not documented in the driver code unfortunately.
> 
> The 'Functional Specification' document of the Armada 3700 SoCs family
> however says that this bit indicates an 'Early Bus Busy' condition. The
> document also notes that whenever this bit is set, it is not possible to
> initiate a transaction on the I2C bus. The observed behaviour corresponds
> to this statement.
> 
> Unfortunately, I2C recovery does not help as it never runs in this
> special case. Although the driver checks the busyness of the bus at
> several places, but since it does not consider the A3700 specific bit
> in these checks it can't determine the actual status of the bus correctly
> which results in the errors above.
> 
> In order to fix the problem, add a new member to struct 'i2c_pxa' to
> store a controller specific bitmask containing the bits indicating the
> busy status, and use that in the code while checking the actual status
> of the bus. This ensures that the correct status can be determined on
> the Armada 3700 based devices without causing functional changes on
> devices based on other SoCs.
> 
> With the change applied, the driver detects the busy condition, and runs
> the recovery process:
> 
>   [  742.617312] i2c i2c-1: state:i2c_pxa_wait_bus_not_busy:449: ISR=00000802, ICR=000007e0, IBMR=03
>   [  742.626099] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>   [  742.631933] i2c i2c-1: recovery: resetting controller, ISR=0x00000802
>   [  742.638421] i2c i2c-1: recovery: IBMR 0x00000003 ISR 0x00000000
> 
> This clears the EBB bit in the ISR register, so it makes it possible to
> initiate transactions on the I2C bus again.
> 
> After this patch, the SFP module used for testing can be removed and
> replugged numerous times without causing the error described at the
> beginning. Previously, the error happened after a few such attempts.
> 
> The patch has been tested also with the following kernel versions:
> 5.10.237, 5.15.182, 6.1.138, 6.6.90, 6.12.28, 6.14.6. It improves
> recoverabilty on all of them.

...

> Note: the patch is included in this series for completeness however
> it can be applied independently from the preceding patches. On kernels
> 6.3+, it restores I2C functionality even in itself because it recovers
> the controller from the bad state described in the previous patch.

Sounds to me like this one should be applied first independently on the
discussion / conclusion on the patch 1.

...

Code wise it looks reasonable to me, but I haven't reviewed it properly
and wouldn't probably have a time, that's why no tags.

-- 
With Best Regards,
Andy Shevchenko



