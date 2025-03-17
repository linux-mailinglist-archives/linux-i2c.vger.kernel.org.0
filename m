Return-Path: <linux-i2c+bounces-9865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611FA64DDD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 13:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 008F53AAF62
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 12:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4B72376F7;
	Mon, 17 Mar 2025 12:06:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5378B2E3373;
	Mon, 17 Mar 2025 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213177; cv=none; b=pbVAvpoGyYBbp3qVqGPk05WaozBlq3GY7jDlvEXjvtDwhS8+HOjLrhOnfSKu4k8KGEoGiRnBwkSdSVkx17O2TDb+AfheyuOE0hB2ecS6cpIQ1h+9aDiuAjsqHvw7CxwM1m+jbIWIQm0AVTipDtOFD9SoWew58bzGst+wTKGomxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213177; c=relaxed/simple;
	bh=3isjYC6z21qtIysFBqMQ/1DQBe0JOMXTX/9T1M/PL54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7S7s0LvAv+PrRpDgAISkXpzwu1bVdKuRDZLqVTHIKrtubS1cIDt5VEcEFxxzZEQmf8DMiwDwC0AkkPb90ifEBPc0f4wnV1fcXYaEl50wKX1G8QLUkuxs49cC7FH6jcrSzDe/8WXstoFO6F2fhlzohAPGufhHJ/YWiF0hlaus+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: msY5yHa2T7iGsERFEjtnCg==
X-CSE-MsgGUID: IN1WL6myRnyurxc+fuX+EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="46070439"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="46070439"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 05:06:14 -0700
X-CSE-ConnectionGUID: ORlBzQfaR02LBabS5x8ZCA==
X-CSE-MsgGUID: AjTMDPT9RGu39HVM1pOi1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="145091378"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 05:06:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tu9EO-00000003Id9-1gT8;
	Mon, 17 Mar 2025 14:06:08 +0200
Date: Mon, 17 Mar 2025 14:06:08 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <Z9gQMPjjCt9Rn4lH@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>
 <20250317100856.GC17428@francesco-nb>
 <bc3144b7-23c8-4b47-bdd8-c482b1a6d81d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3144b7-23c8-4b47-bdd8-c482b1a6d81d@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 11:39:14AM +0100, Hans de Goede wrote:
> On 17-Mar-25 11:08, Francesco Dolcini wrote:

...

> But if Andy and Ilpo are happy to take this as a more monolithic
> driver under drivers/platform/aarch64 I'm not going to nack that
> approach.

I'm okay with the choice as long as it's suffice the purpose.
I agree that aarch64 maybe not a good choice after all, but
we should start from somewhere. Later on we can move to agnostic
folder if needed. The question here is more about MFD/not-MFD.
If the former becomes the case, it would need to be under drivers/mfd
as Lee asked for that (or even required).

-- 
With Best Regards,
Andy Shevchenko



