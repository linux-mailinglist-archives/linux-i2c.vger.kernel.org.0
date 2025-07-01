Return-Path: <linux-i2c+bounces-11717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A99AEEFF9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 09:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A810F1BC5676
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 07:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467A325D1E6;
	Tue,  1 Jul 2025 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRxzGbs2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4436B;
	Tue,  1 Jul 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355946; cv=none; b=G2/2Ph9Eq264oGKR+zlgKFylhzZx43K7ZnsaD+8l05OgjlOXcFPgNTsCwZIEMecKFdhCz0pLOFAdUX+x7Y2Y3q4KDDn0zrIiigx0RshbnVFe+ul6/Pq9rJ1DxhMDvC+YdBrvXLv4qngrQtBXZeqGay/jJrmtPCRr6ZI2R+SgWzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355946; c=relaxed/simple;
	bh=WaOTPXDOyXamFIF5gpJvhYL4L6gdolAygZ+SPRNtOgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSq9EChEWb/ON3J9fzPJp4Ufw5v71tXdV6giJpE+gfYpO8OBd/Ky2/coU23PLmz5opLzcZAeYIR73wxrAM5N3cyLJJTYXNgn3IgL8zf6Bw2SpFdTptlmykHZob4hatTK/JrdNszdUKji8/M/FgYrGBC2gJf2Zu+QyCnHLO1klwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRxzGbs2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751355945; x=1782891945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WaOTPXDOyXamFIF5gpJvhYL4L6gdolAygZ+SPRNtOgc=;
  b=DRxzGbs2qbhNeltcqmpaMi7H3kOdFvXxXVYVqixZBMDAflG+JvW4hWAi
   Ev/rva4ey+7KNJ7iOaaggqHJpCsN4kby1GHKsz6yDzTQXqT1R5rJqI1MG
   x+fGoneDeKE+t3LOjKQvBwYyDem8iRRgL9ah/ohB4M0gmoNrSOguXtx9n
   Obs0uKM123K4qq/CC3zYaiT9ScyKZPOw7xHhl+RfLsscRWb/uU83Qnzan
   E9jJ/I0ijqEiH4YqmrI0CYaCGT2fPe2PaHfaYWhG+ZpVQ/Fd852lwBDBD
   8oZB/YONN6gnb7XAuyCOvEY9dTWNDjUzDIZAzFmlRtuJ59+F6pRLkyLbn
   Q==;
X-CSE-ConnectionGUID: FVBcygGkQJK0PnclmVZtyA==
X-CSE-MsgGUID: l3vuwHwcT/WZtSLXYkcZBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53469623"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53469623"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 00:45:43 -0700
X-CSE-ConnectionGUID: Zpkqcd5iTdm04AVh9hqdyg==
X-CSE-MsgGUID: 8cqIeScNSdiGEsZ+NLaUjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153083489"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa010.jf.intel.com with SMTP; 01 Jul 2025 00:45:38 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jul 2025 10:45:36 +0300
Date: Tue, 1 Jul 2025 10:45:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aGOSIB_H70IAWH3g@kuha.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <gljpd4foldjwairaca7ip2qqpdl7ipto77wsqwhbfamv6kdd3v@2doqwso7ccx3>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gljpd4foldjwairaca7ip2qqpdl7ipto77wsqwhbfamv6kdd3v@2doqwso7ccx3>

On Mon, Jun 30, 2025 at 08:28:12PM +0200, Andi Shyti wrote:
> Hi Heikki,
> 
> On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> > The regmap is coming from the parent also in case of Xe
> > GPUs. Reusing the Wangxun quirk for that.
> 
> What I don't like, though, is that there is no mention of the
> change in the probe in the commit log.
> 
> Besides, are these changes related? Can we have them split in two
> different patches? I guess this would also make Andy's point
> about the extra churn.

I think you are right about splitting the patch. I'll do just that.
Thanks for the review Andi.

-- 
heikki

