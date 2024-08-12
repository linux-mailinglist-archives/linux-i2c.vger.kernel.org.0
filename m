Return-Path: <linux-i2c+bounces-5313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE594F590
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 19:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C286B21CB9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 17:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26039188CB2;
	Mon, 12 Aug 2024 17:03:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C4187860;
	Mon, 12 Aug 2024 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723482199; cv=none; b=rxHsUYEzGRt4qt/sK3wQMCKazMka0Kfnf792uCNo9fsNuF5faLi4ahuT2MQhehQnlv9fdfcqVxSJv0MchBopGU1V+M3r1fs++d9H5nJ/4PrlsDApKfTFm4EAjLeeLYz6BNuIL4qmp0Ag2Iop3ivPoibVjjCmUELmBN+X7baTtAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723482199; c=relaxed/simple;
	bh=JhRTp3NRHRjOw6zptJBbm9jny/skXEWjkzaVIAdIksY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsJwlAX1tOD/isBLfSFp0JrSl0vsNMFXsuNiJMlV335BnTXi7wD7OarK3Lwv0A5b4ZzAo10LppwdCu85/C3fuXl+OfdKMZTliwfe3dBuzqTs+9864578RDPnUdmWNU/55zlBHhAzznOnhTGx7QBRTSav9t4uxQIKB5XL5SGjICI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: oFbILWGISFiY2ysrCTEqig==
X-CSE-MsgGUID: F1ry5oOqTH+jVDFSHbQrkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="47008125"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="47008125"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:03:16 -0700
X-CSE-ConnectionGUID: DlJx2uTUTjSVo3oBlm+K4w==
X-CSE-MsgGUID: gn3wCSqVS9etxLzgjQb23w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63257245"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:03:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1sdYRq-0000000EQDO-17va;
	Mon, 12 Aug 2024 20:03:10 +0300
Date: Mon, 12 Aug 2024 20:03:09 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <ZrpATebaOpSJyBca@smile.fi.intel.com>
References: <20240805133708.160737-1-hdegoede@redhat.com>
 <20240805133708.160737-5-hdegoede@redhat.com>
 <CAHp75VeCVCqmG0Px8_EyztS6ZeBbhU0Nbtru5mkQxKNeR6pynQ@mail.gmail.com>
 <3a4f4c6c-3069-412e-9c71-b4e0308fccd4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a4f4c6c-3069-412e-9c71-b4e0308fccd4@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 12, 2024 at 06:00:20PM +0200, Hans de Goede wrote:
> On 8/5/24 10:48 PM, Andy Shevchenko wrote:
> > On Mon, Aug 5, 2024 at 3:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +       bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
> >> +       if (!adap)
> >> +               return;
> > 
> > May i2c_for_each_dev() be used here?
> 
> The main difference between i2c_for_each_dev() and
> bus_for_each_dev() is that i2c_for_each_dev() holds
> the i2c core mutex while it is calling the passed
> in callback.
> 
> And find_i801() calls i2c_get_adapter() which also
> takes the i2c core mutex, so i2c_for_each_dev()
> cannot be used here since then things deadlock.

+ A comment to prevent "clever" cleanupers from breaking the things?

-- 
With Best Regards,
Andy Shevchenko



