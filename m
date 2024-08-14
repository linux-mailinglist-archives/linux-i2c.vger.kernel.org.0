Return-Path: <linux-i2c+bounces-5405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E32952227
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96D19281E46
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2B11BD504;
	Wed, 14 Aug 2024 18:43:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98591B3F2F;
	Wed, 14 Aug 2024 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723661033; cv=none; b=PiCcZAN//+D2yzfg2uOvmxtrF/Fak+IiqvIf/nT7DrA52/AZbRVzae71BC/gpNAb1cyIWs3wbQ6MoTMOF/tcBEAICtRkih7if3UIMB9LLQVcTi29Q5n9zE7syrTpMrag7a0HSuE3niGV5ub0z9uq9Dl2Orxpj+8hWd1FZk13Duo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723661033; c=relaxed/simple;
	bh=Q7y+EYHMxenljDDXr3U0/xCiEvToUpKClZ4sv8pGMIQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMj7we7JP2X+v91vafmzjjKRidiC3bS3VauGAMYmWgmhiBa57mn/y8H6wzd81HlHL0eKAGE/bE1PGeR4JWHwtxH5cvoXwj637fnwM4s+2OHRDlcpt8G0dftcapFV2UySF3cyzeDCxw6/byJdc/dj3HXUlaP0pR5WP+FtPyaYfDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: K3I6p9IOT1GuK/zCQpWTXA==
X-CSE-MsgGUID: I1I6WkxrTRGz6CvLKvXwuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21543086"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21543086"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:43:51 -0700
X-CSE-ConnectionGUID: PXDdOxYjQTe3yzdEExCdQw==
X-CSE-MsgGUID: 0K72o4VzR7K7X8IV6S6TCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="58773014"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:43:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1seIyG-0000000FI46-249E;
	Wed, 14 Aug 2024 21:43:44 +0300
Date: Wed, 14 Aug 2024 21:43:44 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <Zrz64Fo17mmekJIH@smile.fi.intel.com>
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-3-hdegoede@redhat.com>
 <c35b6mawhhbhjioan6hvrlthtcoc6dqivwihhwz5ftvv6jcohs@ovctm27nnd2n>
 <Zrz43Qb62EB6o39e@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrz43Qb62EB6o39e@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 14, 2024 at 08:35:09PM +0200, Wolfram Sang wrote:
> Hi Andi, Hans, all,
> 
> > > +	/*
> > > +	 * adapter.name is used by platform code to find the main I801 adapter
> > > +	 * to instantiante i2c_clients, do not change.
> > > +	 */
> > >  	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> > > -		"SMBus I801 adapter at %04lx", priv->smba);
> > > +		 "SMBus %s adapter at %04lx",
> > > +		 (priv->features & FEATURE_IDF) ? "I801 IDF" : "I801",
> > > +		 priv->smba);
> > > +
> > 
> > do you have any comment here?
> 
> I have been scratching my head about this patch for a while. I still
> think that it is quite fragile to base features on this naming. The
> comment above helps, but I still have a bad feeling about it.
> 
> I noticed now that the i801 driver does not use the algo_data field so
> far. Has it been considered to put a flag there?

Hmm... algo_data by the naming seems has to be related to the algorithm,
but AFAIU here we have simply more than one _identical_ adapters. How
is this semantically related?

-- 
With Best Regards,
Andy Shevchenko



