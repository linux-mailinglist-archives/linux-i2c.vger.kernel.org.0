Return-Path: <linux-i2c+bounces-13677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C232BF1720
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 15:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 784E94F6912
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 13:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E99731282A;
	Mon, 20 Oct 2025 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZ4QFW6p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6473002D8;
	Mon, 20 Oct 2025 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965634; cv=none; b=QqyZZRJppGr1C8nfS9CGkeL89uSZOCQKKzNZJF/HqvTYpRCBq7Kc5oKa0KYpbQYBz0OFJc8b+iLODL8vQoZY3spgMCpsQEpQS0VLlmpBxNlSB7T3FZKqqsHa6zhAsClveQFcS0BaIUEpyaoXTsyKt9Iov5/3Vva1zwiS0kmB6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965634; c=relaxed/simple;
	bh=sDt9bY6IJ8VZ0anxq/fNuLEICPIosHo7v/dxSN30r+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuiVb5S7atdxBvryi5k+Y9n8VlsNfkAw3UZCrDh3p3QZret7eX/fpo2+bDKuqqPRdymqyTByCTLglXvnMYCg8QrS64KUYEJCxdlm9tjAGThCc8fOxLiajTzTRMelyPD4+JiVOckadtpZVrO5S2T43JEnIKPIeKm9UuocyKIYc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZ4QFW6p; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760965632; x=1792501632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sDt9bY6IJ8VZ0anxq/fNuLEICPIosHo7v/dxSN30r+I=;
  b=QZ4QFW6pmv2KAfcqQRuxt6hdb1wS5RfOb7rVyj1pi6j3uSDb+AAh3n26
   4fbDI5+oNS/y2YC+vIcYZ89k3uyUrLyGKEPU3XcI9YF4XdJKmjzzMD6wa
   oUWRKDAldZAFvEa3wNvODqzwzFUh7Tl+O1MoiEVBs7kATloQ4DxFDHmi9
   vq3XZ6j5h3sdoDCTBCNLa43gz43FuYxVmZQoF8LlZ95YviTGe7fJS1zZ5
   a6fmNZKY/aHQTVgn2DXO1W1lrTL+3LtwcOUav92r84vb78qG5De5lCNEd
   a6mtGfDQuEFkzMCey1tp9tY2jkVXI/390oWA/YfIzUKmK1bVcMenPw24R
   A==;
X-CSE-ConnectionGUID: NyC1IEZRQGeM7aWQ4IlrAw==
X-CSE-MsgGUID: YYIGcMwNT+yt9tfP3o3nEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62780692"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62780692"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 06:07:02 -0700
X-CSE-ConnectionGUID: gKz2po1ETZSS4NqhrWmrCg==
X-CSE-MsgGUID: OPyi6ZnHTvyc7ZcVEH1Ftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="188423419"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 20 Oct 2025 06:07:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 889D895; Mon, 20 Oct 2025 15:06:58 +0200 (CEST)
Date: Mon, 20 Oct 2025 15:06:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Jan Dabros <jsd@semihalf.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Anand Moon <linux.amoon@gmail.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] i2c: designware: Omit a variable reassignment in
 dw_i2c_plat_probe()
Message-ID: <20251020130658.GO2912318@black.igk.intel.com>
References: <bec52694-c755-4d88-aa36-1d96f6d146e4@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bec52694-c755-4d88-aa36-1d96f6d146e4@web.de>

On Mon, Oct 20, 2025 at 01:08:53PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 20 Oct 2025 12:56:39 +0200
> Subject: [PATCH] i2c: designware: Omit a variable reassignment in dw_i2c_plat_probe()
> 
> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete a redundant variable reassignment.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

