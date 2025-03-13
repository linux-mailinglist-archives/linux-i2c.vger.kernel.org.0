Return-Path: <linux-i2c+bounces-9827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F3A5F91D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 15:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D25163BBCC8
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 14:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB39C268C7A;
	Thu, 13 Mar 2025 14:55:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186A268C62;
	Thu, 13 Mar 2025 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877708; cv=none; b=arxX4PCqFKxOdrsGkU8YRx8n1TY6eHg1/mowdUU7Pn6dNupMtGq21mZMpGkYc707BY+h5QJgz8D/HFS8DDqGCYT5+e/BOMbpRayeGKWleHiGmlIbX8tZWgOMI+TUY1z78Tm/wwLvOrDfWh4kL6Gv4KrkUZS9oR78lONn6YsMoRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877708; c=relaxed/simple;
	bh=aB/1xWCtge2A14D7gWkDYwClmMINQeE78a2chUdOCUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCzPASTVyitbEVBmR49jaHOdSmt1ed6yPwk8wrLoCUd3FMAkHL39Tx2PuVfRjn3CBPfNGLrvR3YZdFG9pg7AS6E6qb6MsXdSyhLT23XWfpp+PgzoEAoT2MzzIbLUPzH/+MGbM+JXcIImAhiIARUFGog0lHpgu83YWqtNktR1n4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Dk76XHy7Sj+r+SwRmPso7w==
X-CSE-MsgGUID: ZS4kWQVwTd6C/5p4wp3CAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54377760"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="54377760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:55:06 -0700
X-CSE-ConnectionGUID: mMDFGEiPRGy+NFppYP91sQ==
X-CSE-MsgGUID: j+rBMYUTS9m310XjyX3BCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121478821"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:55:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tsjxb-00000002D1f-2i6W;
	Thu, 13 Mar 2025 16:54:59 +0200
Date: Thu, 13 Mar 2025 16:54:59 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <Z9Lxw4qVApejzeAE@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313144331.70591-1-francesco@dolcini.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 13, 2025 at 03:43:29PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex Embedded Controller, currently used
> on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.

How many do you have that will come with like 99% guarantee?

> The EC provides board power-off, reset and GPIO expander functionalities.
> 
> Sending it as an RFC to gather initial feedback on it before investing more
> time in testing and adding the remaining functionalities, with that said both
> the code and the binding are in condition to be wholly reviewed.

This doesn't explain why you need a separate folder.

-- 
With Best Regards,
Andy Shevchenko



